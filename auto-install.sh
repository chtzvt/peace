#/bin/sh
sudo apt update -y
sudo apt upgrade -y 
sudo apt install -y libcap-dev pkg-config libssl-dev python3 python3-pip ninja-build
pip3 install meson
git clone https://github.com/ctrezevant/peace.git
cd peace 
./configure
make
cd builddir
chmod u+x ping
sudo chown root:root ping
sudo chmod +s ping # Add the setuid bit
sudo mv ping `which ping`

