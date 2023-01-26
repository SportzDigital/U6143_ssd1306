#!/bin/bash
sudo apt -y install make gcc
sudo mkdir -p /opt/lcd
sudo cp -r ./U6143_ssd1306 /opt/lcd/U6143_ssd1306
sudo cat <<EOF >> /lib/systemd/system/rc-local.service

[Install]
WantedBy=multi-user.target
Alias=rc-local.service
EOF

sudo cat <<EOF >> /etc/rc.local
#!/bin/sh -e
cd /opt/lcd/U6143_ssd1306/C
sudo make clean
sudo make
sudo ./display &
exit 0
EOF

sudo sudo chmod +x /etc/rc.local
sudo systemctl daemon-reload
sudo systemctl enable rc-local
sudo systemctl start rc-local.service
sudo systemctl status rc-local.service
exit
