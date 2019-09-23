#!/usr/bin/env bash
export DISPLAY=:0.0

import -window root screen.png
convert screen.png -crop 32x32+0+0 crop.png
comparison=$(compare -metric rmse grafana_logo.png crop.png null: 2>&1)
if [[ "$comparison" = "0 (0)" ]]; then
  echo "Top-left corner of screen looks liks grafana logo, killing chromium. $comparison"
  killall chromium-browser-v7
  exit 0
fi

high_limit=740 # Normally around 100, white screen is ~750
low_limit=50
sum=`convert screen.png -resize 1x1 txt:- | grep -o "srgb\(.*\)" | grep -oP "\d+,\d+,\d+" | sed 's/,/+/g' | bc`
if [[ ${sum} -gt ${high_limit} || ${sum} -lt ${low_limit} ]]; then
	echo "Screen too bright color (sum of rgb channels: ${sum}), something is probablt wrong. Pressing F5."
	killall chromium-browser-v7
  exit 0
fi
