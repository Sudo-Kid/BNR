@echo off 

set server_path = %~dp0

REG ADD "HKCU\Control Panel\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 0 /f
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True

cd %USERPROFILE%\Desktop
echo. 2>setup.bat
echo. 2>setup.log
echo @echo off>>setup.bat

echo.
echo -------------------------------------------------------------------------
echo  Type help to get a list of the software supported by BNR.
echo  Type exit to start installing software.
echo -------------------------------------------------------------------------
echo.

:start

	set /P software=Enter What software do you need?
	echo %software%>>setup.log

	if "%software%" == "exit" (
		echo Thank you for using BNR have and have a nice day.
		echo call %server_path%\BNR_files\shutdown.bat>>setup.bat
		choice /d y /t 1 > nul
		%USERPROFILE%\Desktop\setup.bat
		exit
	) 
	if "%software%" == "help" (
		%server_path%\BNR_files\help.log|more
		goto start
	)
	if "%software%" == "update" (
		call %server_path%\update_help.bat
	)
	if "%software%" == "add" (
		call %server_path%\add_to_BNR.bat
	) else (

		echo call %server_path%\%software%.bat>>setup.bat
		call %server_path%\update_help.bat
		goto start
	)
