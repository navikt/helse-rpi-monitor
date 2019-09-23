#!/usr/bin/env bash
i3-msg -s /run/user/"$(id -u)"/i3/ipc-socket."$(pidof i3)" fullscreen disable
