@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

rem Wrap in pwsh for PWD mount point being cross-platform compatible with Linux, for copy-pasting
pwsh.exe -command "docker run --rm -it -v ${PWD}/:/repo --rm cyberlytics/gitinspector:0.5.0dev"
pause
