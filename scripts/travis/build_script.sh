#!/bin/sh

if [ $TRAVIS_PULL_REQUEST = "true" ]; then
	mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.branch.name=${TRAVIS_PULL_REQUEST_BRANCH} /d:sonar.branch.target=${TRAVIS_BRANCH}
elif [ $TRAVIS_BRANCH = "develop" ]; then
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.branch.name=${TRAVIS_PULL_REQUEST_BRANCH} /d:sonar.branch.target="master"
elif [ $TRAVIS_BRANCH = "master" ]; then
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx"
fi

dotnet build -c Release ./PeselValidator.sln
dotnet test ./tests/PeselValidatorTests/PeselValidatorTests.csproj --logger:trx

if [ $TRAVIS_PULL_REQUEST = "true" ] || [$TRAVIS_BRANCH = "develop"] || [$TRAVIS_BRANCH = "master"]; then
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=${SONAR_TOKEN}
fi
