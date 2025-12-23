import requests
import yaml

# Configuration
SOURCE_URL = "https://cdn.akaere.online/snowy-dew-50ba.latefirefly.workers.dev/0f48c62b-7e0d-43ee-9c15-8a5b8f77b82d?clash"
INPUT_FILE = "LL.yaml"   # Your original "Master" file
OUTPUT_FILE = "test.yaml" # The new automated file

def main():
    print(f"Fetching fresh nodes from source...")
    try:
        response = requests.get(SOURCE_URL)
        source_data = yaml.safe_load(response.text)
        
        new_proxies = source_data.get('proxies', [])
        new_names = [p['name'] for p in new_proxies]

        print(f"Loading template from {INPUT_FILE}...")
        with open(INPUT_FILE, 'r', encoding='utf-8') as f:
            my_config = yaml.safe_load(f)

        # 1. Replace global proxies section
        my_config['proxies'] = new_proxies

        # 2. Update Group memberships
        # This keeps your custom groups and rules intact
        if 'proxy-groups' in my_config:
            # Get names of all groups to avoid filtering out nested groups
            group_names = [g['name'] for g in my_config['proxy-groups']]
            special_tags = ['DIRECT', 'REJECT', 'GLOBAL']
            valid_static = special_tags + group_names

            for group in my_config['proxy-groups']:
                if 'proxies' in group:
                    # Keep only the static/group names, then append new node names
                    preserved = [p for p in group['proxies'] if p in valid_static]
                    group['proxies'] = preserved + new_names

        # 3. Save to the new test.yaml file
        with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
            yaml.dump(my_config, f, allow_unicode=True, sort_keys=False, default_flow_style=False)
        
        print(f"Success! Created {OUTPUT_FILE} with {len(new_proxies)} nodes.")

    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
