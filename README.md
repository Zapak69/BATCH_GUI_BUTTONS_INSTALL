<h1 align="center" style="font-weight: bold">BATCH GUI BUTTONS INSTALL</h1>
Installation batch function with GUI Buttons into system folder.
This program installing this function: https://github.com/Psi505/Batch-GUI-Button

# Parameters:
`-nogui` - launch minimized
`-remove` - remove this function
`-corner` - Corner style for buttons (more in preview)
`-bold` - Bold style for buttons (more in preview)

## Example
1. Start cmd.exe
2. cd "location of install app"
3. `GUI_BUTTONS.exe -nogui -remove`

<h1 align="center" style="font-weight: bold">Script import</h1>
```bat
PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/main/NOGUI_BUTTONS.exe' -UseBasicParsing -OutFile '%temp%\bdownload.exe'"
start %temp%\bdownload.exe
:checkprocess
tasklist /FI "IMAGENAME eq bdownload.exe" 2>NUL | find /I /N "bdownload.exe">NUL
if "%ERRORLEVEL%"=="0" (
    timeout /t 3 /nobreak > nul
    goto checkprocess
)
```

## Advanced script import
```bat
if exist "%systemroot%\System32\Button.bat" if exist "%systemroot%\System32\GetInput.exe" if exist "%systemroot%\System32\batbox.exe" goto skip
echo.
echo Installing BATCH_GUI_BUTTONS.
PowerShell.exe -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/main/NOGUI_BUTTONS.exe' -UseBasicParsing -OutFile '%temp%\bdownload.exe'"
start %temp%\bdownload.exe
:checkprocess
tasklist /FI "IMAGENAME eq bdownload.exe" 2>NUL | find /I /N "bdownload.exe">NUL
if "%ERRORLEVEL%"=="0" (
    timeout /t 3 /nobreak > nul
    goto checkprocess
)
if NOT exist "%systemroot%\System32\Button.bat" if NOT exist "%systemroot%\System32\GetInput.exe" if NOT exist "%systemroot%\System32\batbox.exe" (
	cls
	echo.
	echo Installation skipped or not completed!
	echo.
	echo Try again
	pause >nul
	exit
)
:skip
```

<h1 align="center" style="font-weight: bold">Previews</h1>
## Corner:
[![Corner](https://github.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/blob/main/Images/corner.png?raw=true)

## Bold:
[![Bold](https://github.com/Zapak69/BATCH_GUI_BUTTONS_INSTALL/blob/main/Images/bold.png?raw=true)

<h1 align="center" style="font-weight: bold">Video tutorial</h1>
[![Tutorial](https://img.youtube.com/vi/XGORhz3z3Dg/0.jpg)](https://www.youtube.com/watch?v=XGORhz3z3Dg)
