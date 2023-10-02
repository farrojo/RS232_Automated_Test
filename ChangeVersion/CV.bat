Echo off
title Cambio de Version - DL Script
SET PROD_ID=Nicaragua V2019
SET CLIENT_ID=Cambio Version
REM SET FOLDER="C:\FWare\Nicaragua\RTU F2\MODEM EHS8\ECCEL"
SET FOLDER="C:\FWare\Nicaragua\RTU F2\MODEM EHS8\P1\ECCEL"
SET DLFOLDER="C:\Program Files (x86)\FuH\Docklight Scripting V2.0\Docklight_Scripting.exe"
REM SET DLSCRIPT="C:\Users\Eccel-Fabian\Desktop\Eccel Serial Tools\prog-script.pts"
SET DLSCRIPT="C:\Users\Eccel-Fabian\Desktop\Eccel Serial Tools\camv-script.pts"
REM :ava
REM     mode com46>nul
REM     if not %errorlevel% == 0 (
REM         CLS
REM         Echo %CLIENT_ID%
REM         ECHO %PROD_ID%
REM         Echo=
REM         Echo Buscando modem...
REM         TIMEOUT 2 /NOBREAK>NUL
REM         goto AVA
REM         )
REM :end

:LOAD
REM call %DLFOLDER% -r %DLSCRIPT%
    CLS
    Echo %CLIENT_ID%
    ECHO %PROD_ID%
    Echo=
    Echo Copiar
    MESXCopy %FOLDER% mod:A:\ECCEL
    if not %errorlevel% == 0 (
        REM CLS
        Echo %CLIENT_ID%
        ECHO %PROD_ID%
        Echo=
        Echo Error!!!
        PAUSE
        goto CARGAR
        )
    Echo Listo!
    Echo=
    Echo Firmware update finished!
:END

%DLFOLDER% -r %DLSCRIPT%

CLS
    Echo %CLIENT_ID%
    ECHO %PROD_ID%
    Echo=
    Echo Modem Ready!
REM :fin
REM     mode com46>nul
REM     if %errorlevel% == 0 (
REM         TIMEOUT 1 /NOBREAK>NUL
REM         goto fin
REM         )
REM :end
pause
GOto LOAD
REM GOTO ava
echo on
