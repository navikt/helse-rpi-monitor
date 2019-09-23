#!/bin/bash -e

sed -i 's/#Port 22/Port 80/' /etc/ssh/sshd_config
systemctl enable ssh

cat >/etc/rc.local <<EOF
#!/bin/sh
echo
echo "*** Welcome to the Raspberry Pi monitor ***"
echo
echo "Your IP addresses are shown below. SSH is enabled on port 80 on all interfaces."
echo
ip addr
echo
EOF

chmod 755 /etc/rc.local
systemctl enable rc-local

rm /boot/firstboot.sh

reboot
