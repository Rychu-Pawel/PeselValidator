# Master branch status
Tool  | Status
-------- | :------------:
Travis | [![Build Status](https://travis-ci.org/Rychu-Pawel/PeselValidator.svg?branch=master)](https://travis-ci.org/Rychu-Pawel/PeselValidator)
AppVeyor | [![Build status](https://ci.appveyor.com/api/projects/status/8jdf8c2wpuhqvpcn/branch/master?svg=true)](https://ci.appveyor.com/project/Rychu-Pawel/peselvalidator/branch/master)
SonarCloud | [![reliability](https://sonarcloud.io/api/project_badges/measure?project=PeselValidator&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=PeselValidator) [![security](https://sonarcloud.io/api/project_badges/measure?project=PeselValidator&metric=security_rating)](https://sonarcloud.io/dashboard?id=PeselValidator) [![vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=PeselValidator&metric=vulnerabilities)](https://sonarcloud.io/dashboard?id=PeselValidator)
Nuget | [![Nuget](https://img.shields.io/nuget/v/rychusoft.validators.peselvalidator.svg?style=flat)](https://www.nuget.org/packages/Rychusoft.Validators.PeselValidator/)

# PeselValidator
Polish PESEL number validator

# Easy to use library for validating Polish PESEL numbers:
string pesel = "44051401458"; <br />
bool isValid = Rychusoft.Validators.PeselValidator.IsValid(pesel);

