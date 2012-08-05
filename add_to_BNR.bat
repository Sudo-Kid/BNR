@echo off 

echo. 
echo -----------------------------------------------------
echo  Please Make sure you have the Install Path and the 
echo  Executable path before running this script
echo -----------------------------------------------------
echo. 

set server_path = %~dp0

set /P software_name=Enter What software would you like to add?

cd "%server_path%\BNR_files"

echo. 2>%software_name%.bat
echo @echo off>>%software_name%.bat
echo echo Installing "%software_name%"

set /P software_path=Enter What is the path to the softwares install file? 
set /P exe_path=Enter Pick a link from the Text document please: 



echo rem if Exist exe_path GOTO noinstall>>%software_name%.bat

:start
	
	if "%software%" == "exit" (
		echo Thank you for using Add To BNR have and have a nice day.
		choice /d y /t 1 > nul
		exit
	) else (
		echo %software_path% \s>>%software_name%.bat
		echo.
		echo :noinstall>>%software_name%.bat
		echo rem exe_path>>%software_name%.bat
		goto exit
	)
