#!/bin/bash

## Sunshine ##
# unlock os
frzr-unlock
# get install latest sunshine
wget https://github.com/LizardByte/Sunshine/releases/latest/download/sunshine.pkg.tar.zst
pacman -U --noconfirm sunshine.pkg.tar.zst
# setup services
cp sunshine.service /home/gamer/.config/systemd/user/
cp sunshine-restart.service /home/gamer/.config/systemd/user/
cp suspend@.service /etc/systemd/system
cp suspend.target /home/gamer/.config/systemd/user/
cp uptime-check.sh /home/gamer/.config/systemd/user/
chmod +x /home/gamer/.config/systemd/user/uptime-check.sh
systemctl daemon-reload && sudo systemctl enable suspend@$(whoami)
machinectl shell gamer@ /bin/bash -c 'systemctl --user daemon-reload'
machinectl shell gamer@ /bin/bash -c 'systemctl --user enable sunshine'
machinectl shell gamer@ /bin/bash -c 'systemctl --user enable sunshine-restart'
setcap cap_sys_admin+p $(readlink -f $(which sunshine))
# start sunshine
machinectl shell gamer@ /bin/bash -c 'systemctl --user start sunshine'

## Fan control ##
cp fan_control.yaml /etc/hhfc/
cp hhfc-resume.service /etc/systemd/system/
systemctl enable hhfc.service
systemctl start hhfc.service
systemctl enable hhfc-resume.service
