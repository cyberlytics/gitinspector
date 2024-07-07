@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

docker build --progress=plain -t cyberlytics/gitinspector:0.5.0dev .
pause
