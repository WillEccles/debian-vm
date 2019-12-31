#! /bin/bash

if command -v apt; then
    APT='apt -y'
else
    APT='apt-get -y'
fi

echo "Installing stuff..."
$APT install sudo curl gcc make cmake vim vifm

echo "Adding user cactus to sudoers..."
echo "cactus    ALL=(ALL:ALL) ALL" >> /etc/sudoers

rm -f /home/cactus/.bashrc /home/cactus/.bash_profile /home/cactus/.profile

echo "Downloading user profiles/configs..."
curl "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.profile" > /home/cactus/.profile
curl "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.bash_profile" > /home/cactus/.bash_profile
curl "https://raw.githubusercontent.com/WillEccles/debian-vm/master/.bashrc" > /home/cactus/.bashrc

chown cactus /home/cactus/.profile
chown cactus /home/cactus/.bash_profile
chown cactus /home/cactus/.bashrc
