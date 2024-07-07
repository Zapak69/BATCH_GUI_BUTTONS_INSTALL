@echo off
:main
if "%1" == "-remove" goto remove
if "%2" == "-remove" goto remove
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
timeout /t 2 /nobreak >nul
del %0
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
timeout /t 2 /nobreak >nul
del %0
exit /b 0