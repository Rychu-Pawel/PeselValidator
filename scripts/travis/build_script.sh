#!/bin/sh

if [[ $TRAVIS_PULL_REQUEST != "false" ]]; then
  echo "STARTING SONAR IN PULL REQUEST MODE"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.analysis.mode=preview /d:sonar.github.oauth="${GitHubPullRequestToken}" /d:sonar.github.repository="${TRAVIS_REPO_SLUG}" /d:sonar.github.pullRequest=${TRAVIS_PULL_REQUEST}
elif [[ $TRAVIS_BRANCH = "develop" ]]; then
  echo "STARTING SONAR IN DEVELOP MODE"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.branch.name="develop" /d:sonar.branch.target="master"
elif [[ $TRAVIS_BRANCH = "master" ]]; then
  echo "STARTING SONAR IN MASTER MODE"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx"
fi

dotnet build -c Release ./PeselValidator.sln
dotnet test ./tests/PeselValidatorTests/PeselValidatorTests.csproj --logger:trx

if [[ $TRAVIS_PULL_REQUEST != "false"  || $TRAVIS_BRANCH = "develop" || $TRAVIS_BRANCH = "master" ]]; then
  echo "STOPPING SONAR"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=${SONAR_TOKEN}
  echo "SONAR STOPPED"
fi
