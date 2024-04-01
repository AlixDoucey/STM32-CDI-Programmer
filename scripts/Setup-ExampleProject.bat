@echo off

pushd ..
vendor\bin\premake\Windows\premake5.exe --file=Build-Walnut-ExampleProject.lua clion
popd
pause