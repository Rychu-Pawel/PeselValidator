# Master branch status
Tool  | Status
-------- | :------------:
AppVeyor | [![Build status](https://ci.appveyor.com/api/projects/status/8jdf8c2wpuhqvpcn/branch/master?svg=true)](https://ci.appveyor.com/project/Rychu-Pawel/peselvalidator/branch/master)
Nuget | [![Nuget](https://img.shields.io/nuget/v/rychusoft.validators.peselvalidator.svg?style=flat)](https://www.nuget.org/packages/Rychusoft.Validators.PeselValidator/)

# PeselValidator
Polish PESEL number validator

# Easy to use library for validating Polish PESEL numbers:
```csharp
string pesel = "44051401458";
bool isValid = Rychusoft.Validators.PeselValidator.IsValid(pesel);
```

