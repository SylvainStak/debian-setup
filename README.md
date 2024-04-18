# Debian setup & dotfiles

1. Minimal Debian install.

2. Add user to sudoers

```
su -
apt install sudo
echo "stacker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoer_stacker
exit
```

3. Check that everything is fine:

```
sudo systemctl --failed
sudo journalctl -p 3 -xb
ip addr
```

4. Fetch and run automated script

```
cd
sudo apt install git
git clone https://github.com/SylvainStak/debian-setup
cd debian-setup
./setup.sh
```

5. Post script.
```
[Add extra sources:]
sudo add-apt-repository contrib -y
sudo add-apt-repository non-free -y

[NVIDIA drivers:]
sudo apt install nvidia-detect nvidia-driver -y

sudo reboot
```

6. Setup SSH stuff.

```
mkdir ~/.ssh
(copy id_rsa and id_rsa.pub to this folder)

chmod u+rwx,go-rwx ~/.ssh
chmod u+rw,go-rwx ~/.ssh/id_rsa
chmod u+rw,go-rwx ~/.ssh/id_rsa.pub

(go to ~/.bash_profile and uncomment the keychain commands)
```
