Echo off
SET DIR_DOCKLIGHT="pathtodocklightinstallationfolder\Docklight_Scripting.exe"
SET DIR_SCRIPT="pathtotestfolder\RS485Test.pts"
title=RS485 TEST

cd
mode 70,30
:Test
CLS
Echo Executing . . .
START "" /WAIT %DIR_DOCKLIGHT% -r %DIR_SCRIPT%
TYPE _error_log.txt
Echo=
Powershell.exe -ExecutionPolicy Bypass -File "%cd%\voicestart.ps1"
:End

FC _error_log.txt Texto1.txt >NUL && goto Test || Echo=
:: Pause used to make operator press any key to start (or continue with next device)
pause
goto Test

