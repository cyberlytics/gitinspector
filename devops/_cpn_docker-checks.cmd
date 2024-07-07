@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

choco install dive -y
echo.
echo == IMAGE sizes: docker system df -v ==
docker system df -v
echo.
echo == CONTAINER sizes: docker ps --size ==
docker ps --size
echo.
echo == LAYERS: docker image HISTORY cyberlytics/gitinspector:0.5.0dev ==
docker image history cyberlytics/gitinspector:0.5.0dev
rem echo.
rem echo == LAYERS: docker image INSPECT cyberlytics/gitinspector:0.5.0dev ==
rem docker image inspect cyberlytics/gitinspector:0.5.0dev
echo.
echo == SNYK: docker scan ==
echo ^> Logging into dockerhub as: cyberlytics
docker login --username=cyberlytics
echo ^> Logging into SNYK...
snyk auth
docker scan cyberlytics/gitinspector:0.5.0dev
echo.
echo == DIVE cyberlytics/gitinspector:0.5.0dev ==
echo Press RETURN to continue...
pause
cmd /D/C dive cyberlytics/gitinspector:0.5.0dev
rem pause
