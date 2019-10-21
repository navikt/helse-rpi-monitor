# PO Helse raspberry pi monitoring

## Setting up

```
make
```

## Provisioning SD card
This provisioner will format your SD card with Raspbian, deploy a `wpa_supplicant.conf` file, 
and modify its `/etc/rc.local` so that the script `firstboot.sh` runs (on every boot).

Insert SD card, then:
```
./provision \
    -v \
    -board raspberrypi \
    -wifi-ssid <SSID> \
    -wifi-psk <PSK>
```

## Bootstrap
Make sure `inventory.yaml` is up to date. (To add a new host, boot up the raspberry pi, then add the IP adress
displayed on screen to the `inventory.yaml` file and give it a hostname before continuing.)
```
ansible-playbook playbook.yml -b -i inventory.yaml --ask-pass
```
(Using the password for the pi user on the hosts.)

## Map host to Grafana board
Make sure `screenMap.json` is up to date and pushed to github. This maps which website (grafana board usually) 
each host will display. Each host fetches the screenmap from github, so changes 
must be pushed to github to take effect.

## Get token to access grafana
SSH to each host (or use xpanes)
- Open new browser: `chromium-browser https://portal.office.com/`
- Log in using any valid Azure AD user that has access to the Grafana 
Application (defined under "Applications" in Azure AD):
  - `xdotool type my-username`
  - `xdotool key Return`
  - `xdotool type my-password`
  - `xdotool key Return`
  - (if navigation is required, use `xdotool key Tab` and `xdotool key space`)   
- Close all browsers (forces browser restart): `killall chromium-browse`