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
Make sure `screenMap.json` is up to date and pushed to github.

## Ugly hack to get Azure token
SSH to each host (or use xpanes)
- Open new browser: `chromium-browser https://portal.office.com/`
- Log in using any valid Azure AD user that has access to the Grafana Application (defined under "Applications" in Azure AD):
  - `xdotool type my-username`
  - `xdotool key Return`
  - `xdotool type my-password`
  - `xdotool key Return`
  - (if navigation is required, use `xdotool key Tab` and `xdotool key space`)   
- Close all browsers (forces browser restart): `killall chromium-browse`