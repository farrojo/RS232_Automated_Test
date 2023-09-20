Echo off
SET PROD_ID=EXAMPLE MODEM EHS6
SET CLIENT_ID=Modem Under Process
SET FOLDER="whereeveritis\FirmFolder"
SET DLFOLDER="whereeveritis\Docklight_Scripting.exe"
SET DLSCRIPT="whereeveritis\prog-script.pts"

:: ava routine looks for availability of anydevice in serial ports
:: in this case i'm looking for device on COM12 port
:AVA
    mode com12>nul
    if not %errorlevel% == 0 (
        CLS
        Echo %CLIENT_ID%
        ECHO %PROD_ID%
        Echo=
        Echo Searching modem...
        TIMEOUT 2 /NOBREAK>NUL
        goto AVA
        )
:end

:: Using MES Commands, we can make bulk load
:LOAD
    CLS
    Echo %CLIENT_ID%
    ECHO %PROD_ID%
    Echo=
    Echo Loading
    MESXCopy %FOLDER% mod:A:\FirmFolder
    if not %errorlevel% == 0 (
        CLS
        Echo %CLIENT_ID%
        ECHO %PROD_ID%
        Echo=
        Echo Error!!!
        PAUSE
        goto LOAD
        )
    Echo Ready!
    Echo=
    Echo Folder load finished!
:END
:: Next command calls Docklight folder and loads script file
:: more details on docklight scripting documentation
:COMM
%DLFOLDER% -r %DLSCRIPT%
:END
CLS
    Echo %CLIENT_ID%
    ECHO %PROD_ID%
    Echo=
    Echo Modem ready!
:FINISH
    mode com12>nul
    if %errorlevel% == 0 (
        TIMEOUT 1 /NOBREAK>NUL
        goto FINISH
        )
:end
:: Next command makes all process to repeat undefinitely
GOTO ava
echo on
