{
    "log": {
        "level": "warn",
        "timestamp": true
    },
    "dns": {
        "servers": [
            {
                "tag": "dns-remote",
                "address": "https://8.8.8.8/dns-query",
                "address_resolver": "dns-direct"
            },
            {
                "tag": "dns-direct",
                "address": "8.8.8.8",
                "address_resolver": "dns-local",
                "detour": "direct"
            },
            {
                "tag": "dns-local",
                "address": "local",
                "detour": "direct"
            },
            {
                "tag": "dns-block",
                "address": "rcode://success"
            }
        ],
        "rules": [
            {
                "domain_suffix": [
                    ".ir"
                ],
                "server": "dns-direct"
            },
            {
                "outbound": "direct",
                "server": "dns-direct"
            }
        ],
        "independent_cache": true
    },
    "inbounds": [
        {
            "type": "direct",
            "tag": "dns-in",
            "listen": "127.0.0.1",
            "listen_port": 6450,
            "override_address": "8.8.8.8",
            "override_port": 53
        },
        {
            "type": "tun",
            "tag": "tun-in",
            "mtu": 9000,
            "inet4_address": "172.19.0.1/28",
            "auto_route": true,
            "strict_route": true,
            "endpoint_independent_nat": true,
            "stack": "mixed",
            "sniff": true,
            "sniff_override_destination": true
        },
        {
            "type": "mixed",
            "tag": "mixed-in",
            "listen": "127.0.0.1",
            "listen_port": 2080,
            "sniff": true,
            "sniff_override_destination": true
        }
    ],
    "outbounds": [
        {
            "type": "selector",
            "tag": "proxy",
            "outbounds": [
                "💦 Warp Best Ping 🚀",
                "💦 Warp 1 🇮🇷",
                "💦 Warp 2 🇮🇷",
                "💦 Warp 3 🇮🇷",
                "💦 WoW 1 🌍",
                "💦 WoW 2 🌍"
            ]
        },
        {
            "type": "urltest",
            "tag": "💦 Warp Best Ping 🚀",
            "outbounds": [
                "💦 Warp 1 🇮🇷",
                "💦 Warp 2 🇮🇷",
                "💦 Warp 3 🇮🇷"
            ],
            "url": "https://www.gstatic.com/generate_204",
            "interval": "30s",
            "tolerance": 50
        },
        {
            "type": "direct",
            "tag": "direct"
        },
        {
            "type": "block",
            "tag": "block"
        },
        {
            "type": "dns",
            "tag": "dns-out"
        },
        {
            "type": "wireguard",
            "tag": "💦 Warp 1 🇮🇷",
            "server": "188.114.97.180",
            "server_port": 2408,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8f1e:9dbd:94d2:dcf2:bf0/128"
            ],
            "private_key": "EJUyzKaKYwHrlE+NgjrMXEy+qPdtxsg0/U6o/KLqcE0=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "nZ4q",
            "mtu": 1280,
            "domain_strategy": "prefer_ipv6"
        },
        {
            "type": "wireguard",
            "tag": "💦 Warp 2 🇮🇷",
            "server": "188.114.97.215",
            "server_port": 955,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8f1e:9dbd:94d2:dcf2:bf0/128"
            ],
            "private_key": "EJUyzKaKYwHrlE+NgjrMXEy+qPdtxsg0/U6o/KLqcE0=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "nZ4q",
            "mtu": 1280,
            "domain_strategy": "prefer_ipv6"
        },
        {
            "type": "wireguard",
            "tag": "💦 Warp 3 🇮🇷",
            "server": "188.114.99.181",
            "server_port": 854,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8f1e:9dbd:94d2:dcf2:bf0/128"
            ],
            "private_key": "EJUyzKaKYwHrlE+NgjrMXEy+qPdtxsg0/U6o/KLqcE0=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "nZ4q",
            "mtu": 1280,
            "domain_strategy": "prefer_ipv6"
        },
        {
            "type": "wireguard",
            "tag": "💦 WoW 1 🌍",
            "server": "188.114.97.109",
            "server_port": 3476,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8d13:12e1:40b3:4ef6:cbf4/128"
            ],
            "private_key": "AC66Hv3bs2bVVZ5PgQpJWygpeJVuD+4ZKTuKJ9D65GM=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "97h0",
            "mtu": 1280,
            "detour": "warp-ir_1",
            "domain_strategy": "prefer_ipv6"
        },
        {
            "type": "wireguard",
            "tag": "warp-ir_1",
            "server": "188.114.97.109",
            "server_port": 3476,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8539:c148:523:3c9d:ca02/128"
            ],
            "private_key": "GMxEdVu5jhzzkTNoVGX+/1r32Nv1Bh2b7Y6Y0BQjZGU=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "Oref",
            "mtu": 1280,
            "domain_strategy": "prefer_ipv6"
        },
        {
            "type": "wireguard",
            "tag": "💦 WoW 2 🌍",
            "server": "188.114.98.59",
            "server_port": 945,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8d13:12e1:40b3:4ef6:cbf4/128"
            ],
            "private_key": "AC66Hv3bs2bVVZ5PgQpJWygpeJVuD+4ZKTuKJ9D65GM=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "97h0",
            "mtu": 1280,
            "detour": "warp-ir_2",
            "domain_strategy": "prefer_ipv6"
        },
        {
            "type": "wireguard",
            "tag": "warp-ir_2",
            "server": "188.114.98.59",
            "server_port": 945,
            "local_address": [
                "172.16.0.2/32",
                "2606:4700:110:8539:c148:523:3c9d:ca02/128"
            ],
            "private_key": "GMxEdVu5jhzzkTNoVGX+/1r32Nv1Bh2b7Y6Y0BQjZGU=",
            "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
            "pre_shared_key": "",
            "reserved": "Oref",
            "mtu": 1280,
            "domain_strategy": "prefer_ipv6"
        }
    ],
    "route": {
        "rules": [
            {
                "port": 53,
                "outbound": "dns-out"
            },
            {
                "inbound": "dns-in",
                "outbound": "dns-out"
            },
            {
                "network": "udp",
                "port": 443,
                "port_range": [],
                "outbound": "block"
            },
            {
                "ip_is_private": true,
                "outbound": "direct"
            },
            {
                "rule_set": [
                    "geosite-category-ads-all",
                    "geosite-malware",
                    "geosite-phishing",
                    "geosite-cryptominers",
                    "geoip-malware",
                    "geoip-phishing"
                ],
                "outbound": "block"
            },
            {
                "rule_set": [
                    "geosite-ir",
                    "geoip-ir"
                ],
                "outbound": "direct"
            },
            {
                "ip_cidr": [
                    "224.0.0.0/3",
                    "ff00::/8"
                ],
                "source_ip_cidr": [
                    "224.0.0.0/3",
                    "ff00::/8"
                ],
                "outbound": "block"
            }
        ],
    "experimental": {
        "clash_api": {
            "external_controller": "0.0.0.0:9090",
            "external_ui": "yacd",
            "external_ui_download_url": "https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip",
            "external_ui_download_detour": "direct",
            "secret": "",
            "default_mode": "rule"
        }
    }
}
