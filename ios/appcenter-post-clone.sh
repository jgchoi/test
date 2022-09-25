#!/usr/bin/env bash
#Place this script in project/ios/

cd ..
git clone -b https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel master
flutter doctor
flutter pub get

echo "Installed flutter to `pwd`/flutter"

flutter build ios --release --no-codesign