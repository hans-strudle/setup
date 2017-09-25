:: Hans Strausl's Personal config.cmd to run when opening cmd.exe
@echo off

set /a rand1=%random% %% 11
set /a rand2=%random% %% 2
set HEX=234578BCDEF
set HEX2=0F
call set hexcolors=%%HEX:~%rand1%,1%%%%HEX2:~%rand2%,1%%
color %hexcolors%
title %hexcolors%
set PROMPT=$P$_$G$S

set DIRCMD=

doskey reload = %HOMEDRIVE%\config.cmd
doskey start = start %HOMEDRIVE%\config.cmd

doskey np = notepad++ $*
doskey . = pushd ..
doskey .. = pushd ..
doskey cd = pushd $* $T dir
doskey back = popd 
doskey ls = dir /W $*
doskey la = dir /A $*
doskey d = cd %HOMEDRIVE%%HOMEPATH%\DESKTOP
doskey exp = explorer.exe .

:: Needs bash on win10 enabled
doskey vim = bash -c "vim $(echo '$*' | sed 's/\\/\//g')"
doskey ssh = bash -c "ssh $*"

:: doskey hg = hg branch $G %SYSTEMROOT%\branch.txt $T set /p HGB= $L %SYSTEMROOT%\branch.txt $T hg $*
doskey hg = echo off $T FOR /F "delims=" %%i IN ('hg branch') DO set HGB=%%i $G nul $T hg $* $T echo on
doskey git = echo off $T FOR /F "tokens=2" %%i IN ('git branch') DO set GITB=%%i $G nul $T git $* $T echo on

doskey grep = bash -c "grep $*"

doskey ex = node -p "$*"
