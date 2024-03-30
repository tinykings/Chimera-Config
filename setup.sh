#!/bin/bash

# Sunshine
sudo frzr-unlock
wget https://github.com/LizardByte/Sunshine/releases/latest/download/sunshine.pkg.tar.zst
sudo pacman -U --noconfirm sunshine.pkg.tar.zst
sudo setcap cap_sys_admin+p $(readlink -f $(which sunshine))
cp sunshine.service ~/.config/systemd/user/
systemctl --user enable sunshine
sudo setcap cap_sys_admin+p $(readlink -f $(which sunshine))
systemctl --user start sunshine

# Fan control
sudo cp fan_control.yaml /etc/hhfc/
sudo cp hhfc-resume.service /etc/systemd/system/
sudo systemctl enable hhfc.service
sudo systemctl start hhfc.service
sudo systemctl enable hhfc-resume.service
