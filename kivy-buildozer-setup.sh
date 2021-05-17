#!/bin/bash

echo "Checking For required dependencies"
req_dependencies
clear

req_dependencies(){

	sudo apt install -y \
		python3 \
		python3-pip \
		python3-dev \
		python3-distutils \
		python2 \
		python2-dev
}

kivy_install(){
	sudo pip3 install kivy
	echo -e "\n\nKivy is successfully installed"
}

buildozer_setup(){
	sudo pip3 install buildozer cython
	echo -e "\n\nBuildozer is successfully installed"
}

buildozer_dependencies(){

	echo "cython3 $@" > /tmp/cython && chmod +x /tmp/cython && sudo mv /tmp/cython /bin/
	
	sudo apt install -y \
	curl \
	build-essential \
	git \
	ffmpeg \
	lld \
	libsdl2-dev \
	libsdl2-image-dev \
	libsdl2-mixer-dev \
	libsdl2-ttf-dev \
	libportmidi-dev \
	libswscale-dev \
	libavformat-dev \
	libavcodec-dev \
	zlib1g-dev \
	autoconf \
	cmake \
	autotools-dev
	
	sudo apt install -y \
	libsqlite3-dev \
	sqlite3 \
	libbz2-dev \
	libssl-dev \
	openssl \
	libgdbm-dev \
	libgdbm-compat-dev \
	liblzma-dev \
	libreadline-dev \
	libncursesw5-dev \
	libffi-dev \
	uuid-dev \
	libffi-dev \
	libltdl-dev \
	default-jdk \
	ccache \
	bzip2 \
	unzip
	
	echo -e "\n\nBuildozer Dependencies are successfully installed"
}

setup_android_env(){

	mkdir /tmp/kivy-test-hello-world-script && cd /tmp/kivy-test-hello-world-script && wget https://github.com/sys41x4/kivy-buildozer-setup/blob/main/kivy-test-hello-world-script/main.py
	buildozer init
	buildozer android debug deploy
	cd ../ && rm -rf ./kivy-test-hello-world-script && cd ~/
	
	echo -e "\n\nAndroid Debuging Environment for buildozer has been successfully installed"
}

additional_support_env(){

	sudo apt update && sudo apt update --fix-missing
	sudo updatedb
	sudo apt upgrade && sudo apt dist-upgrade
	
	sudo apt install -y \
		nano \
		virtualenv
		
	echo "\n\nYou System is updated, and all development dependencies are installed"
}
exit_prog(){

	echo -e "\n\nThankyou For Using\n \
Do support Me if you want to at : https://sys41x4.github.io/support/sys41x4"
	exit
}

while :
do
echo -e -n "Script by Arijit-Bhowmick aka sys41x4\n \
twitter : @sys41x4\n \
github : @sys41x4\n \
instagram : @sys41x4\n\n \

Repository : https://github.com/sys41x4/kivy-buildozer-setup\n \
Documentation : https://sys41x4.github.io/kivy-buildozer-setup\n\n \

Please Select Anyone option to continue :\n \
[1] Install Kivy\n \
[2] Install buildozer & Setup buildozer dependencies\n \
[3] Install buildozer, Buildozer dependencies & setup Android debugging environment\n \
[4] Update system and Automatically install the required support\n \
[5] Exit\n\n \

>> "
read user_decision

if [[ $user_decision -eq 1 ]]
then
	kivy_install
	exit_prog
	
elif [[ $user_decision -eq 2 ]]
then
	buildozer_setup
	buildozer_dependencies
	exit_prog
	
elif [[ $user_decision -eq 3 ]]
then
	buildozer_setup
	buildozer_dependencies
	setup_android_env
	exit_prog
	
elif [[ $user_decision -eq 4 ]]
then
	buildozer_setup
	buildozer_dependencies
	setup_android_env
	additional_support_env
	exit_prog
	
elif [[ $user_decision -eq 5 ]]
then
	exit_prog
else

clear
echo -e "You have entered an incorrect option\n \
Please Try Again\n"

fi
done
