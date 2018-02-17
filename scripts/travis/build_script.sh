#!/bin/sh

mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.branch.name="${$TRAVIS_BRANCH}" /d:sonar.branch.target="master"

dotnet build -c Release ./PeselValidator.sln
dotnet test ./tests/PeselValidatorTests/PeselValidatorTests.csproj --logger:trx

mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=${SONAR_TOKEN}