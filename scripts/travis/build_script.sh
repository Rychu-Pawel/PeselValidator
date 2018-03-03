#!/bin/sh

dotnet build -c Release ./PeselValidator.sln
dotnet test ./tests/PeselValidatorTests/PeselValidatorTests.csproj --logger:trx
