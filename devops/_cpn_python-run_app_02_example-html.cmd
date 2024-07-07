@echo off
rem ***************************************************************************
rem * author: Christoph P. Neumann
rem ***************************************************************************
cd /D "%~dp0.."

del "%~dp0.\%~n0.html" 2> nul
python gitinspector.py --format=html -lmrTw -L --file-types=java,cs,c,cc,cpp,h,hh,hpp,glsl,php,py,pl,scala,rb,js,jsx,cjs,mjs,svelte,ts,tsx,vue,jade,proto,ml,mli,hs,po,pot,sql,gql,html,htm,cshtml,css,scss,sass,xml,jsp,jspx,doc,docx,xls,xlsx,txt,md,tex,bib,^*,Dockerfile,marker,yml,cmd,bat,sh,csh,fish,ps1,sln,csproj,dcproj,runsettings,conf,webmanifest,iml,yaml,toml,template,plantuml,puml,env > "%~dp0.\%~n0.html"
pause
