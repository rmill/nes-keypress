#!/bin/bash

# Add Init Scripts
sudo cp nes-keypress /etc/init.d/nes-keypress
sudo chmod 775 /etc/init.d/nes-keypress
sudo update-rc.d nes-keypress defaults

# Setup NES controller driver
sudo cp nes-keypress.py /usr/bin/nes-keypress.py
sudo mkdir /.nes-keypress
sudo cp configs/controller1.json /.nes-keypress/controller1.json
sudo cp configs/controller2.json /.nes-keypress/controller2.json

# Install the uinput library
cd lib/python-uinput-0.9
sudo python setup.py install --prefix=/usr/local
sudo python modprobe uinput

# Reboot the Pi
echo "******** INSTALLATION COMPLETE ********"
echo "******* PRESS ANY KEY TO REBOOT *******"
read ANY_KEY
sudo reboot
