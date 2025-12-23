import requests
import yaml

# 1. Add all your subscription links here
SOURCE_URLS = [
    "https://cdn.akaere.online/snowy-dew-50ba.latefirefly.workers.dev/0f48c62b-7e0d-43ee-9c15-8a5b8f77b82d?clash",
    # "https://another-link.com/clash",  <-- Add more links like this
]

INPUT_FILE = "LL.yaml"
OUTPUT_FILE = "test.yaml"

def main():
    all_new_proxies = []
    seen_names = set()

    # 2. Fetch from every link in the list
    for url in SOURCE_URLS:
        print(f"Fetching nodes from: {url}")
        try:
            response = requests.get(url, timeout=10)
            source_data = yaml.safe_load(response.text)
            proxies = source_data.get('proxies', [])
            
            for p in proxies:
                if p['name'] not in seen_names:
                    all_new_proxies.append(p)
                    seen_names.add(p['name'])
        except Exception as e:
            print(f"Error fetching {url}: {e}")

    if not all_new_proxies:
        print("No proxies found. Skipping update.")
        return

    # 3. Load your template
    with open(INPUT_FILE, 'r', encoding='utf-8') as f:
        my_config = yaml.safe_load(f)

    # 4. Inject all gathered proxies
    my_config['proxies'] = all_new_proxies
    new_names = list(seen_names)

    # 5. Update Groups
    if 'proxy-groups' in my_config:
        group_names = [g['name'] for g in my_config['proxy-groups']]
        special_tags = ['DIRECT', 'REJECT', 'GLOBAL']
        valid_static = special_tags + group_names

        for group in my_config['proxy-groups']:
            if 'proxies' in group:
                preserved = [p for p in group['proxies'] if p in valid_static]
                group['proxies'] = preserved + new_names

    # 6. Save result
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        yaml.dump(my_config, f, allow_unicode=True, sort_keys=False, default_flow_style=False)
    
    print(f"Done! Combined {len(all_new_proxies)} unique nodes into {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
