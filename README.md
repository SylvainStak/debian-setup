# debian-setupp

first do a minimal debian install, then:
```
su -
apt install sudo
echo "stacker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoer_stacker
exit

cd
sudo apt install git
git clone https://github.com/SylvainStak/debian-setup
cd debian-setup
./setup.sh
```
