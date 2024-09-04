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
set "bold=false"
set "corner=false"
set "remove=false"
for %%i in (%*) do (
    if "%%i"=="-remove" set "remove=true"
    if "%%i"=="-bold" set "bold=true"
    if "%%i"=="-corner" set "corner=true"
)
if "%remove%"=="true" goto remove

setlocal

if not exist "%APP_DIR%" (
    mkdir "%APP_DIR%"
)

PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/main/uninstall.exe' -UseBasicParsing -OutFile '%temp%\uninstall.exe'"
move "%temp%\%UNINSTALL_EXE%" "%APP_DIR%\" >nul

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "DisplayName" /d "%APP_NAME%" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "UninstallString" /d "\"%APP_DIR%\%UNINSTALL_EXE%\"" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "DisplayIcon" /d "\"%APP_DIR%\%UNINSTALL_EXE%\"" /f >nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /v "DisplayVersion" /d "4.0" /f >nul
endlocal
if exist "%systemroot%\System32\Button.bat" (
    set "Button.bat=ALREADY INSTALLED"
)
if NOT "%Button.bat%" == "ALREADY INSTALLED" if NOT "%corner%" == "true" if "%bold%" == "true" (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://github.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/raw/main/Styles/Bold/Button.bat' -UseBasicParsing -OutFile '%temp%\Button.bat'"
    copy "%temp%\Button.bat" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        set "Button.bat=FAILED"
    ) else (
    set "Button.bat=INSTALLED"
    )
    del %temp%\Button.bat
)
if NOT "%Button.bat%" == "ALREADY INSTALLED" if NOT "%bold%" == "true" if "%corner%" == "true" (
    PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://github.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/raw/main/Styles/Corner/Button.bat' -UseBasicParsing -OutFile '%temp%\Button.bat'"
    copy "%temp%\Button.bat" "%systemroot%\System32" >nul
    if %errorlevel% == 1 (
        set "Button.bat=FAILED"
    ) else (
    set "Button.bat=INSTALLED"
    )
    del %temp%\Button.bat
)
if NOT "%Button.bat%" == "ALREADY INSTALLED" if NOT "%bold%" == "true" if NOT "%corner%" == "true" (
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
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\%APP_NAME%" /f
timeout /t 2 /nobreak >nul
del %0
if "%Button.bat%" == "REMOVED" if "%batbox.exe%" == "REMOVED" if "%GetInput.exe%" == "REMOVED" exit /b 0
if "%Button.bat%" == "NOT EXIST" if "%batbox.exe%" == "NOT EXIST" if "%GetInput.exe%" == "NOT EXIST" exit /b 0
exit /b 1
