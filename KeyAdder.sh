#!/bin/sh
#########################################################
version=5.9
description="KeyAdder for Biss Key" !!!

#########################################################

#########################################################
PACKAGE_DIR='KeyAdder/main'
MY_FILE="KeyAdder.tar.gz"
#########################################################

MY_MAIN_URL="https://raw.githubusercontent.com/Shr776/"
MY_URL=$MY_MAIN_URL$PACKAGE_DIR'/'$MY_FILE
MY_TMP_FILE="/tmp/"$MY_FILE

rm -f $MY_TMP_FILE > /dev/null 2>&1

MY_SEP='============================================================='
echo $MY_SEP
echo 'Downloading '$MY_FILE' ...'
echo $MY_SEP
echo ''
wget -T 2 $MY_URL -P "/tmp/"

if [ -f $MY_TMP_FILE ]; then

	echo ''
	echo $MY_SEP
	echo 'Extracting ...'
	echo $MY_SEP
	echo ''
	tar -xf $MY_TMP_FILE -C /
	MY_RESULT=$?

	rm -f $MY_TMP_FILE > /dev/null 2>&1

	echo ''
	echo ''
	if [ $MY_RESULT -eq 0 ]; then
        echo "#########################################################"
        echo "#  KeyAdder Plugins $version INSTALLED SUCCESSFULLY      #"
        echo "#                BY Shr776 - support on                   #"
        echo "#   https://t.me/VuSolo      #"
        echo "#########################################################"
        echo "#           your Device will RESTART Now                #"
        echo "#########################################################"		
		if which systemctl > /dev/null 2>&1; then
			sleep 2; systemctl restart enigma2
		else
			init 4; sleep 4; init 3;
		fi
	else
		echo "   >>>>   INSTALLATION FAILED !   <<<<"
	fi;
	echo ''
	echo '**************************************************'
	echo '**                   FINISHED                   **'
	echo '**************************************************'
	echo ''
	exit 0
else
	echo ''
	echo "Download failed !"
	exit 1
fi
# ------------------------------------------------------------------------------------------------------------
