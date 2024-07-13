::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGmW+0UiKRZNcCajCEiSRpcp3NzUwdnHi2MuYMMTVLP19ZO7Cd8x33HQWrgemH9Cnas=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
::MIT License
::Copyright (c) 2024 Zapak69
::Permission is hereby granted, free of charge, to any person obtaining a copy
::of this software and associated documentation files (the "Software"), to deal
::in the Software without restriction, including without limitation the rights
::to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
::copies of the Software, and to permit persons to whom the Software is
::furnished to do so, subject to the following conditions:
::The above copyright notice and this permission notice shall be included in all
::copies or substantial portions of the Software.
::THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
::IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
::FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
::AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
::LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
::OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
:main
set "APP_NAME=Batch Gui Buttons"
set "APP_DIR=%ProgramFiles%\%APP_NAME%"
set "UNINSTALL_EXE=uninstall.exe"
if "%1" == "-remove" goto remove
if "%2" == "-remove" goto remove
setlocal

if not exist "%APP_DIR%" (
    mkdir "%APP_DIR%"
)

PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/main/uninstall.exe' -UseBasicParsing -OutFile '%temp%\uninstall.exe'"
move "%temp%\%UNINSTALL_EXE%" "%APP_DIR%\" >nul

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "DisplayName" /d "%APP_NAME%" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "UninstallString" /d "\"%APP_DIR%\%UNINSTALL_EXE%\"" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "DisplayIcon" /d "\"%APP_DIR%\%UNINSTALL_EXE%\"" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "DisplayVersion" /d "1.0" /f >nul
endlocal
if exist "%systemroot%\System32\Button.bat" (
    set "Button.bat=ALREADY INSTALLED"
) else (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Psi505/Batch-GUI-Button/main/Button.bat' -UseBasicParsing -OutFile '%temp%\Button.bat'"
    copy "%temp%\Button.bat" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        set "Button.bat=FAILED"
    ) else (
        set "Button.bat=INSTALLED"
    )
    del %temp%\Button.bat
)
if exist "%systemroot%\System32\batbox.exe" (
    set "batbox.exe=ALREADY INSTALLED"
) else (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Psi505/Batch-GUI-Button/main/batbox.exe' -UseBasicParsing -OutFile '%temp%\batbox.exe'"
    copy "%temp%\batbox.exe" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        set "batbox.exe=FAILED"
    ) else (
        set "batbox.exe=INSTALLED"
    )
    del %temp%\batbox.exe
)
if exist "%systemroot%\System32\GetInput.exe" (
    set "GetInput.exe=ALREADY INSTALLED"
) else (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Psi505/Batch-GUI-Button/main/GetInput.exe' -UseBasicParsing -OutFile '%temp%\GetInput.exe'"
    copy "%temp%\GetInput.exe" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        set "GetInput.exe=FAILED"
    ) else (
        set "GetInput.exe=INSTALLED"
    )
    del %temp%\GetInput.exe
)
timeout /t 2 /nobreak >nul
del %0
if "%Button.bat%" == "INSTALLED" if "%batbox.exe%" == "INSTALLED" if "%GetInput.exe%" == "INSTALLED" exit /b 0
if "%Button.bat%" == "ALREADY INSTALLED" if "%batbox.exe%" == "ALREADY INSTALLED" if "%GetInput.exe%" == "ALREADY INSTALLED" exit /b 0
exit /b 1

:remove
rmdir /s /q "%APP_DIR%"
if exist "%systemroot%\System32\Button.bat" (
    del %systemroot%\System32\Button.bat
    set "Button.bat=REMOVED"
) else (
    if NOT exist "%systemroot%\System32\Button.bat" (
        set "Button.bat=NOT EXIST"
    ) else (
        set "Button.bat=ERROR"
    )
)
if exist "%systemroot%\System32\batbox.exe" (
    del %systemroot%\System32\batbox.exe
    set "batbox.exe=REMOVED"
) else (
    if NOT exist "%systemroot%\System32\batbox.exe" (
        set "batbox.exe=NOT EXIST"
    ) else (
        set "batbox.exe=ERROR"
    )
)
if exist "%systemroot%\System32\GetInput.exe" (
    del %systemroot%\System32\GetInput.exe
    set "GetInput.exe=REMOVED"
) else (
    if NOT exist "%systemroot%\System32\GetInput.exe" (
        set "GetInput.exe=NOT EXIST"
    ) else (
        set "GetInput.exe=ERROR"
    )
)
timeout /t 2 /nobreak >nul
del %0
if "%Button.bat%" == "REMOVED" if "%batbox.exe%" == "REMOVED" if "%GetInput.exe%" == "REMOVED" exit /b 0
if "%Button.bat%" == "NOT EXIST" if "%batbox.exe%" == "NOT EXIST" if "%GetInput.exe%" == "NOT EXIST" exit /b 0
exit /b 1
