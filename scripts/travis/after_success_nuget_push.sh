#!/bin/sh

if [ $TRAVIS_BRANCH = "master" ]; then
	dotnet nuget push ./src/PeselValidator/bin/Release/Rychusoft.Validators.PeselValidator.*.nupkg -k $NugetApiKey -s https://api.nuget.org/v3/index.json
fi