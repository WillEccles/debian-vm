#! /bin/bash

if command -v apt > /dev/null; then
    APT='apt -y -qq'
elif command -v apt-get > /dev/null; then
    APT='apt-get -y -qq'
else
    echo "Cannot find package manager!"
    exit 1
fi

echo "Installing stuff..."
$APT install sudo curl gcc make cmake vim vifm

echo "Adding user cactus to sudoers..."
echo "cactus    ALL=(ALL:ALL) ALL" >> /etc/sudoers

rm -f /home/cactus/.bashrc /home/cactus/.bash_profile /home/cactus/.profile

echo "Downloading user profiles/configs..."
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.profile" > /home/cactus/.profile
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.bash_profile" > /home/cactus/.bash_profile
curl -sS "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.bashrc" > /home/cactus/.bashrc

chown cactus /home/cactus/.profile
chown cactus /home/cactus/.bash_profile
chown cactus /home/cactus/.bashrc
