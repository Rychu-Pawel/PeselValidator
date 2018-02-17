#!/bin/sh

echo ${TRAVIS_PULL_REQUEST_BRANCH}
  echo ${TRAVIS_BRANCH}
  echo ${TRAVIS_REPO_SLUG}
  echo ${TRAVIS_PULL_REQUEST}

if [ $TRAVIS_PULL_REQUEST = "true" ]; then
  echo "STARTING SONAR IN PULL REQUEST MODE"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.branch.name=${TRAVIS_PULL_REQUEST_BRANCH} /d:sonar.branch.target=${TRAVIS_BRANCH} /d:sonar.analysis.mode=preview /d:sonar.verbose=true /d:sonar.github.oauth=${GitHubPullRequestToken} /d:sonar.github.repository=${TRAVIS_REPO_SLUG} /d:sonar.github.pullRequest=${TRAVIS_PULL_REQUEST} /d:sonar.pullrequest.endpoint="https://api.github.com" /d:sonar.pullrequest.repository="Rychu-Pawel/PeselValidator"
elif [ $TRAVIS_BRANCH = "develop" ]; then
  echo "STARTING SONAR IN DEVELOP MODE"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx" /d:sonar.branch.name=${TRAVIS_PULL_REQUEST_BRANCH} /d:sonar.branch.target="master"
elif [ $TRAVIS_BRANCH = "master" ]; then
  echo "STARTING SONAR IN MASTER MODE"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe begin /d:sonar.organization="rychu-pawel-github" /k:PeselValidator /d:sonar.login=${SONAR_TOKEN} /d:sonar.host.url="https://sonarcloud.io" /d:sonar.cs.vstest.reportsPaths="**/*.trx"
fi

dotnet build -c Release ./PeselValidator.sln
dotnet test ./tests/PeselValidatorTests/PeselValidatorTests.csproj --logger:trx

if [ $TRAVIS_PULL_REQUEST = "true" ] || [ $TRAVIS_BRANCH = "develop" ] || [ $TRAVIS_BRANCH = "master" ]; then
  echo "STOPPING SONAR"
  mono ./tools/sonar-scanner-msbuild/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=${SONAR_TOKEN}
  echo "SONAR STOPPED"
fi
