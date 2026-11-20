@echo off
setlocal enabledelayedexpansion
cls
color f0

echo -----------------------------
echo - Update tool ESP32 TEF6686 -
echo -       Development         -
echo -----------------------------
echo.

:selectCOM
echo Available COM-ports:
set "_key=HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM"

for /f "tokens=3 delims= " %%c in ('reg query "!_key!" ^| find /v "HKEY"') do (
    set "_com_N=%%c"
    echo/!_com_N:~3! = !_com_N!
)

echo.
set /p "COM=Enter radio's COM-port number (example: 3): "

set "validCOM="
for /f "tokens=3 delims= " %%c in ('reg query "!_key!" ^| find /v "HKEY"') do (
    set "_com_N=%%c"
    if /i "!_com_N:~3!"=="%COM%" set "validCOM=1"
)

if not defined validCOM (
    echo.
    echo Invalid COM-port!
    echo Please enter a valid COM-port number from the list.
    echo.
    goto selectCOM
)

:inputLoop
echo.
set "validInput="
set /p "tempInput=Does your radio have a BOOT-button to flash the radio? (Y/n): "
if not defined tempInput set "tempInput=y"

set "userInput=!tempInput:~0,1!"
if /i "!userInput!" neq "Y" if /i "!userInput!" neq "N" (
    echo Incorrect input. Please enter 'y' or 'n'.
    goto inputLoop
)

echo.
if /i "!userInput!"=="Y" (
    echo Switch ON the radio while holding the BOOT-button and press any key.
    pause >NUL
)

echo.
echo Uploading software...
powershell -NoProfile -ExecutionPolicy Bypass -Command "& { $labels = 'bootloader', 'partitions', 'boot_app0', 'firmware', 'coredump'; $i = 0; $last = ''; $done = $false; & '.\esptool.exe' --chip esp32 --port COM%COM% --baud 921600 --before default-reset --after hard-reset write-flash -z 0x1000 bootloader.bin 0x8000 partitions.bin 0xE000 boot_app0.bin 0x10000 firmware.bin 0x3C0000 coredump_blank.bin | ForEach-Object { if ($_ -match 'Writing at .*?(\d+\.\d)%% \S+/(\S+)') { $p = [double]$matches[1]; if ($matches[2] -ne $last) { $last = $matches[2]; $done = $false; $label = if ($i -lt $labels.Count) { $labels[$i] } else { 'data' }; $i++ }; if ($done) { return }; $n = [int][math]::Round($p * 30 / 100); Write-Host -NoNewline ([char]13 + '  ' + $label.PadRight(12) + '[' + ('=' * $n).PadRight(30) + '] ' + $matches[1] + '%%'); if ($p -ge 100) { Write-Host ''; $done = $true } } elseif ($_ -match 'error|fatal|failed') { Write-Host ''; Write-Host $_ } }; exit $LASTEXITCODE }"

if !ERRORLEVEL! neq 0 (
    echo.
    echo Error uploading! Please check the COM-port and radio for download state.
    echo Press any key to exit the update tool.
    pause >NUL
    exit /b !ERRORLEVEL!
)

echo.
echo Update completed, press any key to close this program.
pause >NUL
endlocal