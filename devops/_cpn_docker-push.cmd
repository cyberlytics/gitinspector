@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

echo > Logging into dockerhub as: cyberlytics
docker login --username=cyberlytics
rem docker tag <lokale-ImageID> cyberlytics/gitinspector:0.5.0dev
cyberlytics/gitinspector:0.5.0dev docker tag cyberlytics/gitinspector:latest
docker push cyberlytics/gitinspector
pause
