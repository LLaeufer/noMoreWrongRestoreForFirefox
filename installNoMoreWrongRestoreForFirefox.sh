#!/usr/bin/bash

sudo mkdir /usr/share/noMoreWrongRestoreForFirefox
sudo cp noMoreWrongRestoreForFirefox.sh /usr/share/noMoreWrongRestoreForFirefox/noMoreWrongRestoreForFirefox.sh
sudo cp sessionCheckpoints.json /usr/share/noMoreWrongRestoreForFirefox/sessionCheckpoints.json
sudo cp noMoreWrongRestoreForFirefox.service /etc/systemd/system/noMoreWrongRestoreForFirefox.service
sudo systemctl enable noMoreWrongRestoreForFirefox.service
