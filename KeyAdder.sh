#!/bin/sh
# wget "--no-check-certificate" https://raw.githubusercontent.com/Shr776/PomLinux/main/KeyAdder.sh -Oq - | /bin/sh
sleep 1
echo "Old Version Deleting..."
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/KeyAdder
rm -rf /tmp/KeyAdder.tar.gz
sleep 1
wget https://raw.githubusercontent.com/Shr776/PomLinux/main/KeyAdder.tar.gz -P /tmp
echo "New Version Downloaded"
sleep 1
if [ -f /tmp/KeyAdder.tar.gz ]; then
  mkdir /usr/lib/enigma2/python/Plugins/Extensions/KeyAdder
  tar -xzf /tmp/AutoBiss.tar.gz -C /usr/lib/enigma2/python/Plugins/Extensions/KeyAdder
fi
sleep 2
if [ -d /usr/lib/enigma2/python/Plugins/Extensions/KeyAdder ]; then
  echo "New Version Installed"
  rm -rf /tmp/KeyAdder.tar.gz
  sleep 2
  init 4
  echo "Restarting Your Enigma2 Gui..."
  init 3
else
  echo "New Version Failed To Load"
fi
exit 0
