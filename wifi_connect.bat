@echo off

rem This batch file checks if internet connected and if not tries to reconnect
rem Author - Asmit Basu
rem Author github - https://github.com/asmi24886
rem Author hackathon name - honeybadger555

:START

echo "Starting diagnostics. Checking internet connection. Please wait....."

ping www.google.co.in -n 3 -w 3000 >nul

if %errorlevel% == 1 (
  echo "Internet offline, trying to reconnect!"

  netsh wlan disconnect
  netsh wlan connect name=DIGISOL

) else (
  echo "Internet is connected. Sweeping memory, errorlevels and waiting for 10 seconds before re-diagnosis."
)

Timeout /t 10
@set errorlevel = 0

GOTO START
