# BATCH GUI BUTTONS INSTALL
Installation batch function with GUI Buttons into system folder.
This program installing this function: https://github.com/Psi505/Batch-GUI-Button

# Parameters:
`-nogui` - launch minimized
`-remove` - remove this function
## Example
1. Start cmd.exe
2. cd "location of install app"
3. `GUI_BUTTONS.exe -nogui -remove`

## In script example
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

# Tutorial
[![Tutorial](https://img.youtube.com/vi/XGORhz3z3Dg/0.jpg)](https://www.youtube.com/watch?v=XGORhz3z3Dg)
