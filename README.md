# Debian setup & dotfiles

1. Minimal Debian install.

2. Check that everything is fine:

```
sudo systemctl --failed
sudo journalctl -p 3 -xb
ip addr
```

3. Add user to sudoers

```
su -
apt install sudo
echo "stacker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoer_stacker
exit
```

4. Fetch and run fully automated script

```
cd
sudo apt install git
git clone https://github.com/SylvainStak/debian-setup
cd debian-setup
./setup.sh
```
