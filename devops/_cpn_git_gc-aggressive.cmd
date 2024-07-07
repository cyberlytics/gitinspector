@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

git fsck
git reflog expire --expire=now --all
git gc --prune=now --aggressive

pause