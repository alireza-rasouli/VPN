port: 7890
socks-port: 7891
allow-lan: false
ipv6: true
mode: rule
log-level: silent
unified-delay: true
tcp-concurrent: true
geo-auto-update: true
geo-update-interval: 168
external-controller: 127.0.0.1:9090
external-controller-cors:
  allow-origins:
  - '*'
  allow-private-network: true
external-ui: ui
external-ui-url: <https://github.com/MetaCubeX/metacubexd/archive/refs/heads/gh-pages.zip>
profile:
  store-selected: true
  store-fake-ip: true
dns:
  enable: true
  ipv6: true
  listen: 127.0.0.1:1053
  use-system-hosts: false
  respect-rules: true
  enhanced-mode: redir-host
  namesaver:
  - https://8.8.8.8/dns-query
  proxy-server-nameserver:
  - 8.8.8.8#DIRECT
  direct-nameserver:
  - 8.8.8.8#DIRECT
  direct-nameserver-follow-policy: true
  nameserver-policy:
    rule-set:ir:
    - 8.8.8.8#DIRECT
tun:
  enable: true
  stack: mixed
  auto-route: true
  strict-route: true
  auto-detect-interface: true
  dns-hijack:
  - any:53
  - tcp://any:53
sniffer:
  enable: true
  force-dns-mapping: true
  parse-pure-ip: true
  override-destination: true
  sniff:
    HTTP:
      ports:
      - 80
      - 8080
      - 8880
      - 2052
      - 2082
      - 2086
      - 2095
    TLS:
      ports:
      - 443
      - 8443
      - 2053
      - 2083
      - 2087
      - 2096

rule-providers:
  ir:
    type: http
    format: text
    behavior: domain
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/ir.txt
    path: ./ruleset/ir.txt
    interval: 86400
  ads:
    type: http
    format: text
    behavior: domain
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/ads.txt
    path: ./ruleset/ads.txt
    interval: 86400
  malware:
    type: http
    format: text
    behavior: domain
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/malware.txt
    path: ./ruleset/malware.txt
    interval: 86400
  phishing:
    type: http
    format: text
    behavior: domain
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/phishing.txt
    path: ./ruleset/phishing.txt
    interval: 86400
  cryptominers:
    type: http
    format: text
    behavior: domain
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/cryptominers.txt
    path: ./ruleset/cryptominers.txt
    interval: 86400
  apps:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/apps.txt
    path: ./ruleset/apps.txt
    interval: 86400
  ircidr:
    type: http
    format: text
    behavior: ipcidr
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/ircidr.txt
    path: ./ruleset/ircidr.txt
    interval: 86400
  private:
    type: http
    format: text
    behavior: ipcidr
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/private.txt
    path: ./ruleset/private.txt
    interval: 86400
  irasn:
    type: http
    format: text
    behavior: classical
    url: https://raw.githubusercontent.com/Chocolate4U/Iran-clash-rules/release/irasn.txt
    path: ./ruleset/irasn.txt
    interval: 86400
proxies: []
proxy-groups: []
rules: []
