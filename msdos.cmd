@echo off
reg query HKU\S-1-5-19 1>nul 2>nul
if not %errorlevel%==0 goto askforadmin
goto start
:start
choice /m "Would you like to restart Windows into MS-DOS Mode"
if %errorlevel%==1 goto setup else exit /b 0
:askforadmin
echo The script needs to be run as administrator.
pause
exit /b -1
:setup
copy "%~dp0\*" "%systemroot%\System32"
reg import "%~dp0\msdos.reg"
shutdown /r /t 60 /c "Windows needs to restart into MS-DOS Mode. Please save your unsaved work. System will restart in one minute."
exit /b 0