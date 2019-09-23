# Aura's raspberry pi monitoring

This provisioner will format your SD card with Raspbian, deploy a `wpa_supplicant.conf` file, and modify its `/etc/rc.local` so that the script `firstboot.sh` runs (on every boot).

## Setting up

```
make
```

## Usage

```
./provision \
    -v \
    -board raspberrypi \
    -wifi-ssid <SSID> \
    -wifi-psk <PSK>
```

## Bootstrap
Make sure inventory is up to date.
```
ansible-playbook playbook.yml -b -i inventory.yaml
```
