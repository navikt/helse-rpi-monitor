# PO Helse raspberry pi monitoring

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
Make sure `inventory.yaml` is up to date.
```
ansible-playbook playbook.yml -b -i inventory.yaml --ask-pass
```

## Map host to Grafana board
Make sure `screenMap.json` is up to date.

## Ugly hack to get Azure token
SSH to each host (or use xpanes)
- Open new browser: `chromium-browser https://portal.office.com/`
- Log in using any valid AD user:
  - `xdotool type my-username`
  - `xdotool key Return`
  - `xdotool type my-password`
  - `xdotool key Tab`
  - `xdotool key space`
  - `xdotool key Return`    
- Close all browsers (forces browser restart): `killall chromium-browse`