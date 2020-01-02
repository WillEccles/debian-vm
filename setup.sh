#! /bin/bash

set -e

if command -v apt > /dev/null; then
    APT='apt -y -qq'
elif command -v apt-get > /dev/null; then
    APT='apt-get -y -qq'
else
    echo "Cannot find package manager!"
    exit 1
fi

echo "Installing stuff..."
$APT install sudo build-essential curl cmake vim vifm

echo "Adding user cactus to sudoers..."
echo "cactus    ALL=(ALL:ALL) ALL" >> /etc/sudoers

rm -f /home/cactus/.bashrc /home/cactus/.bash_profile /home/cactus/.profile

echo "Downloading keymap..."
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/fixescape.map" > /usr/local/share/keymaps/fixescape.map

echo "Enabling keymap..."
echo 'KMAP="/usr/local/share/keymaps/fixescape.map"' >> /etc/default/keyboard

echo "Downloading user profiles/configs..."
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.profile" > /home/cactus/.profile
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.bash_profile" > /home/cactus/.bash_profile
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.bashrc" > /home/cactus/.bashrc

chown cactus /home/cactus/.profile
chown cactus /home/cactus/.bash_profile
chown cactus /home/cactus/.bashrc
