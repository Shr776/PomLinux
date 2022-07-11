#!/bin/bash
# ###########################################
# SCRIPT : DOWNLOAD AND INSTALL KeyAdder
# ###########################################
#
# Command: wget https://raw.githubusercontent.com/Shr776/PomLinux/KeyAdder/main/installer.sh -qO - | /bin/sh
#
# ###########################################

######### Only These two lines to edit with new version ######
version=5.9
description=What is NEW:\n-Update VirtualKeyBoard\n\n*************************\n:?? ?? ??????\n-VirtualKeyBoardopen ?????
##############################################################

###########################################
# Configure where we can find things here #
TMPDIR='/tmp'
PLUGINDIR='/usr/lib/enigma2/python/Plugins/Extensions'

#######################
# Remove Old Version #
rm -rf $PLUGINDIR/AddKey
rm -rf $PLUGINDIR/KeyAdder
rm -rf $PLUGINDIR/Biscotto
rm -rf $TMPDIR/*main*

#########################
if [ -f /etc/opkg/opkg.conf ]; then
    STATUS='/var/lib/opkg/status'
    OSTYPE='Opensource'
    OPKG='opkg update'
    OPKGINSTAL='opkg install'
elif [ -f /etc/apt/apt.conf ]; then
    STATUS='/var/lib/dpkg/status'
    OSTYPE='DreamOS'
    OPKG='apt-get update'
    OPKGINSTAL='apt-get install'
fi

#########################
install() {
    if grep -qs "Package: $1" $STATUS; then
        echo
    else
        $OPKG >/dev/null 2>&1
        echo "   >>>>   Need to install $1   <<<<"
        echo
        if [ $OSTYPE = "Opensource" ]; then
            $OPKGINSTAL "$1"
            sleep 1
            clear
        elif [ $OSTYPE = "DreamOS" ]; then
            $OPKGINSTAL "$1" -y
            sleep 1
            clear
        fi
    fi
}

#########################
if [ "${PYTHON_VERSION}" == 3 ]; then
    echo ":You have Python3 image ..."
    sleep 1
    Packagesix=python3-six
else
    echo ":You have Python2 image ..."
    sleep 1
    Packagesix=python-six
fi

install $Packagesix

#########################
cd $TMPDIR
set -e
echo "Downloading And Insallling KeyAdder plugin Please Wait ......"
echo
wget --show-progress https://github.com/Shr776/PomLinux/KeyAdder.tar.gz -qP $TMPDIR
tar -xzf main.tar.gz
cp -r KeyAdder-main/usr /
rm -rf *main*
set +e
cd ..
#########################

sleep 1
clear
echo "#########################################################"
echo "#          KeyAdder INSTALLED SUCCESSFULLY              #"
echo "#                 Raed  &  mfaraj57                     #"
echo "#                     support                           #"
echo "#   https://t.me/VuSolo #"
echo "#########################################################"
echo "#           your Device will RESTART Now                #"
echo "#########################################################"

if [ $OSTYPE = "Opensource" ]; then
    killall -9 enigma2
else
    systemctl restart enigma2
fi

exit 0