#!/bin/bash

echo "Checking For required dependencies"
req_dependencies
clear

while :
do
echo "Script by Arijit-Bhowmick aka sys41x4\n \
twitter : @sys41x4 \
github : @sys41x4 \
instagram : @sys41x4 \

Repository : https://github.com/sys41x4/kivy-buildozer-setup \
Documentation : https://sys41x4.github.io/kivy-buildozer-setup \

Please Select Anyone option to continue :\n \
[1] Install Kivy \
[2] Install buildozer & Setup buildozer dependencies \
[3] Install buildozer, Buildozer dependencies & setup Android debugging environment \
[4] Update system and Automatically install the required support environment for development of Kivy Programs \
[5] Exit"

read user_decision

if [[$user_decision == 1]]
then
	kivy_install
	exit_prog
	
elif [[$user_decision == 2]]
then
	buildozer_setup
	buildozer_dependencies
	exit_prog
	
elif [[$user_decision == 3]]
then
	buildozer_setup
	buildozer_dependencies
	setup_android_env
	exit_prog
	
elif [[$user_decision == 4]]
then
	buildozer_setup
	buildozer_dependencies
	setup_android_env
	additional_support_env
	exit_prog
	
elif [[$user_decision == 5]]
then
	exit_prog
fi
done

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
	echo "\n\nKivy is successfully installed"
}

buildozer_setup(){
	sudo pip3 install buildozer cython
	echo "\n\nBuildozer is successfully installed"
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
	
	echo "\n\nBuildozer Dependencies are successfully installed"
}

setup_android_env(){

	mkdir /tmp/kivy-test-hello-world-script && cd /tmp/kivy-test-hello-world-script && wget https://github.com/sys41x4/kivy-buildozer-setup/blob/main/kivy-test-hello-world-script/main.py
	buildozer init
	buildozer android debug deploy
	cd ../ && rm -rf ./kivy-test-hello-world-script
	
	echo "\n\nAndroid Debuging Environment for buildozer has been successfully installed"
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

	echo "\n\nThankyou For Using\n \
	Do support Me if you want to at : https://sys41x4.github.io/support/sys41x4"
	exit
}
