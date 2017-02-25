@echo off
:Start
Cls
color 07
echo. |----------------------------------------------|
echo. |----------------------------------------------|
echo. |  USB Enable\Disable - By: Hossam Hassan Sakr |
echo. |----------------3 May 2016--------------------|
echo. |----------------------------------------------|
echo.
echo.
echo 1- Enable USB 
echo 2- Disable USB 
echo 3- Exit
echo.
echo.


Set /P _CHOSE=Select your operation: || Set _CHOSE=NothingChosen
IF "%_CHOSE%"=="NothingChosen" goto sub_error

IF /i "%_CHOSE%"=="1" goto Enable
IF /i "%_CHOSE%"=="2" goto Disable
IF /i "%_CHOSE%"=="3" goto END


:sub_error
echo Nothing was chosen 
Pause
goto Start


:Enable 
reg delete HKLM\SYSTEM\CurrentControlSet\Services\UsbStor /v "Start" /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\UsbStor /v "Start" /t REG_DWORD /d "3" /f
Pause
goto Start

:Disable
reg add HKLM\SYSTEM\CurrentControlSet\Services\UsbStor /v "Start" /t REG_DWORD /d "4" /f

Pause
goto Start

:END
exit