@echo off
:Start
Cls
color 07
echo. |----------------------------------------------|
echo. |----------------------------------------------|
echo. |WIFI Hotspot Creator - By: Hossam Hassan Sakr |
echo. |-----------------1 April 2016-----------------|
echo. |----------------------------------------------|
echo.
echo 1- Create a Hotspot
echo 2- Start the hotspot 
echo 3- Stop the hotspot 
echo 4- Check the wirelss card capability
echo 5- Check the hotspot status
echo 6- Exit
echo.
echo.
Set /P _CHOSE=Select your operation: || Set _CHOSE=NothingChosen
IF "%_CHOSE%"=="NothingChosen" goto sub_error
IF /i "%_CHOSE%"=="1" goto Hotspot_Create
IF /i "%_CHOSE%"=="2" goto Hotspot_Start
IF /i "%_CHOSE%"=="3" goto Hotspot_Stop
IF /i "%_CHOSE%"=="4" goto Hotspot_Capability
IF /i "%_CHOSE%"=="5" goto Hotspot_check
IF /i "%_CHOSE%"=="6" goto ND

Pause
:sub_error
echo Nothing was chosen 
goto Start

:Hotspot_Capability
color 04
echo.
echo  ----------------------------------------
echo	showing NIC hotspot capability
echo  ----------------------------------------
echo.
echo.
netsh wlan show drivers
Pause
goto Start

:Hotspot_Create
color 09
echo.
echo  ----------------------------------------
echo 	This will create a Hotspot
echo  ----------------------------------------
echo.
Echo Enter your Hotspot Name:
set /P Hotspotname=%Hotspotname%
Echo Enter your Hotspot Password:
set /P password=%password%
echo.
echo.
netsh wlan set hostednetwork mode=allow ssid=%Hotspotname% key=%password%
Pause
goto Start

:Hotspot_Start
color 02
echo.
echo ---------------------------------------- 
echo	Start the hotspot you just created. 
echo ---------------------------------------- 
echo.
echo. 
netsh wlan start hostednetwork 
Pause
goto Start

:Hotspot_Stop
color 04
echo.
echo ---------------------------------------- 
echo	Stop the hotspot you just created. 
echo ---------------------------------------- 
echo.
echo.
netsh wlan Stop hostednetwork 
Pause
goto Start

:Hotspot_check
color 06
echo.
echo  ----------------------------------------
echo  	check the hotspot status. 
echo  ----------------------------------------
echo.
echo.
netsh wlan show hostednetwork 
echo.
echo.
Pause
goto Start

:END
exit