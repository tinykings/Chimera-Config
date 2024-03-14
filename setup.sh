# Fan control
cp fan_control.yaml /etc/hhfc/
cp hhfc-resume.service /etc/systemd/system/
systemctl enable hhfc.service
systemctl enable hhfc-resume.service

#Sunshine
frzr-unlock
wget https://github.com/LizardByte/Sunshine/releases/latest/download/sunshine.pkg.tar.zst
pacman -U --noconfirm sunshine.pkg.tar.zst
cp sunshine.service ~/.config/systemd/user/
systemctl --user enable sunshine
setcap cap_sys_admin+p $(readlink -f $(which sunshine))