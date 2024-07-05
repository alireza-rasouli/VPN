
{
  "outbounds": 
  [
    {
      "type": "wireguard",
      "tag": "Warp-IR",
      "server": "188.114.97.215",
      "server_port": 955,

      "local_address": [
        "172.16.0.2/32",
        "2606:4700:110:8f1e:9dbd:94d2:dcf2:bf0/12"
      ],
      "private_key": "EJUyzKaKYwHrlE+NgjrMXEy+qPdtxsg0/U6o/KLqcE0=",
      "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
      "reserved": "nZ4q",

      "mtu": 1280,
      "fake_packets": "5-10"
    },
    {
      "type": "wireguard",
      "tag": "Warp-Main",
      "detour": "Warp-IR",
      "server": "188.114.97.180",
      "server_port": 1387,
      
      "local_address": [
          "172.16.0.2/32",
          "2606:4700:110:8c70:3022:5217:1309:dc1f/128"
      ],
      "private_key": "4JXoR3zU/a6ulauOcrS2+d1YitN0+9hFQxCtf4Xgl04=",
      "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
      "reserved": [ 178, 239, 88 ],  

      "mtu": 1120,
      "fake_packets": "5-10"
    }
  ]
}
