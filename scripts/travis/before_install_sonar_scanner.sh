#!/bin/sh

mkdir ./tools/sonar-scanner-msbuild

wget -O  ./tools/downloads/sonar-scanner-msbuild.zip https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/4.0.2.892/sonar-scanner-msbuild-4.0.2.892.zip
unzip -qq ./tools/downloads/sonar-scanner-msbuild.zip -d ./tools/sonar-scanner-msbuild
chmod +x ./tools/sonar-scanner-msbuild/sonar-scanner-3.0.3.778/bin/sonar-scanner