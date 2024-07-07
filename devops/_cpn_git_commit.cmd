@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

cmd /D/C eolConverter crlf "**/.gitattributes"
cmd /D/C eolConverter crlf "**/.gitignore"
cmd /D/C eolConverter crlf "**/.dockerignore"
cmd /D/C eolConverter crlf "**/LICENSE"
cmd /D/C eolConverter crlf "**/Dockerfile"
cmd /D/C eolConverter crlf "**/Makefile"
cmd /D/C eolConverter crlf "**/*.{cls,tex,bib,bbl,cmd,ps1,lst,cfg,txt,post,pre,ins,dtx,md}"

cmd /D/C eolConverter crlf "**/.coveragerc"

git add --all
git status
git commit -m "improvements"

pause