#!/usr/bin/bash

sudo systemctl disable noMoreWrongRestoreForFirefox.service
sudo rm -r /usr/share/noMoreWrongRestoreForFirefox
sudo rm /etc/systemd/system/noMoreWrongRestoreForFirefox.service

