#!/bin/bash
cd ~
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget libappindicator1 fonts-liberation
mkdir -p Android/sdk
export ANDROID_SDK_ROOT=/home/workspace/Android/sdk
mkdir -p .android && touch .android/repositories.cfg
wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools.zip && rm sdk-tools.zip
mv tools Android/sdk/tools
cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
cd ~
git clone https://github.com/flutter/flutter.git
$OLDPWD/sdkmanager --install "cmdline-tools;latest"
flutter doctor --android-licenses
sudo apt-get install -y libappindicator1 fonts-liberation
sudo apt-get install -f
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome*.deb
sudo apt-get -y --fix-broken install
