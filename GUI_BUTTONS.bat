@echo off
if "%1" == "-nogui" goto nogui
if "%2" == "-nogui" goto nogui
:: Check for administrative permissions
net session >nul 2>&1
if %errorlevel% neq 0 (
    goto runAsAdmin
) else (
    goto :main
)

:runAsAdmin
:: Create a temporary VBScript to invoke the UAC prompt
set "vbsFile=%temp%\getadmin.vbs"
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsFile%"
echo UAC.ShellExecute "cmd.exe", "/c ""%~f0"" %*", "", "runas", 1 >> "%vbsFile%"
:: Run the temporary VBScript
cscript "%vbsFile%" //nologo
del "%vbsFile%"
exit /b

:main
if "%~1" == "-remove" goto remove
if "%~2" == "-remove" goto remove
if exist "%systemroot%\System32\Button.bat" (
    echo Button.bat         -       ALREADY INSTALLED 
) else (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Psi505/Batch-GUI-Button/main/Button.bat' -UseBasicParsing -OutFile '%temp%\Button.bat'"
    copy "%temp%\Button.bat" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        echo Button.bat         -       FAILED
    ) else (
        echo Button.bat         -       INSTALLED
    )
    del %temp%\Button.bat
)
if exist "%systemroot%\System32\batbox.exe" (
    echo batbox.exe         -       ALREADY INSTALLED 
) else (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Psi505/Batch-GUI-Button/main/batbox.exe' -UseBasicParsing -OutFile '%temp%\batbox.exe'"
    copy "%temp%\batbox.exe" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        echo batbox.exe         -       FAILED
    ) else (
        echo batbox.exe         -       INSTALLED
    )
    del %temp%\batbox.exe
)
if exist "%systemroot%\System32\GetInput.exe" (
    echo GetInput.exe         -       ALREADY INSTALLED 
) else (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Psi505/Batch-GUI-Button/main/GetInput.exe' -UseBasicParsing -OutFile '%temp%\GetInput.exe'"
    copy "%temp%\GetInput.exe" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        echo GetInput.exe         -       FAILED
    ) else (
        echo GetInput.exe         -       INSTALLED
    )
    del %temp%\GetInput.exe
)
echo.
echo Installation done. See results up
echo.
echo Exiting in 5 seconds...
timeout /t 5 >nul
exit /b 0

:remove
if exist "%systemroot%\System32\Button.bat" (
    del %systemroot%\System32\Button.bat
    echo Button.bat         -       REMOVED
) else (
    if NOT exist "%systemroot%\System32\Button.bat" (
        echo Button.bat         -       NOT EXIST
    ) else (
        echo Button.bat         -       ERROR
    )
)
if exist "%systemroot%\System32\batbox.exe" (
    del %systemroot%\System32\batbox.exe
    echo batbox.exe         -       REMOVED
) else (
    if NOT exist "%systemroot%\System32\batbox.exe" (
        echo batbox.exe         -       NOT EXIST
    ) else (
        echo batbox.exe         -       ERROR
    )
)
if exist "%systemroot%\System32\GetInput.exe" (
    del %systemroot%\System32\GetInput.exe
    echo GetInput.exe         -       REMOVED
) else (
    if NOT exist "%systemroot%\System32\GetInput.exe" (
        echo GetInput.exe         -       NOT EXIST
    ) else (
        echo GetInput.exe         -       ERROR
    )
)
echo.
echo Removing done. See results up
echo.
echo Exiting in 5 seconds...
timeout /t 5 >nul
exit /b 0

:nogui
PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://cdn.discordapp.com/attachments/1200876917528731747/1259591092479721583/NOGUI_BUTTONS.exe?ex=668c3d1e&is=668aeb9e&hm=b51cbd2e3bbddf71626a0726348a876e9bf0a47dfa8afe676a475e9686505008&' -UseBasicParsing -OutFile '%temp%\nogui.exe'"
if "%~1" == "-remove" start %temp%\nogui.exe -remove
if "%~2" == "-remove" start %temp%\nogui.exe -remove
if NOT "%~1" == "-remove" if NOT "%~2" == "-remove" start %temp%\nogui.exe
exit