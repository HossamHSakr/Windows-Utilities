@echo off
:Start
Cls
color 07
echo. ----------------------------------------------
echo. ----------------------------------------------
echo.   Add Firewall Rules - By: Hossam Hassan Sakr 
echo. ----------------11 April 2016-----------------
echo. ----------------------------------------------
echo.
echo ----------------------------------------------------------
echo This will help you to change your firewall settings fast.
echo what do you want to do?
echo ----------------------------------------------------------
echo.
echo 1- Add new firewall rule
echo 2- Change existing firewall rule
echo 3- delete new firewall rule
echo 4- show new firewall rule
echo  - Dump new firewall rule Underdevelop
echo 5- Exit
echo.
echo.

Set /P _rule=Select your operation: || Set _rule=NothingChosen
IF "%_rule%"=="NothingChosen" goto sub_error 
IF /i %_rule% LEQ 1 Set _rule=Add
IF /i %_rule% LEQ 2 Set _rule=Change
IF /i %_rule% LEQ 3 Set _rule=delete
IF /i %_rule% LEQ 4 Set _rule=show
IF /i "%_rule"=="TestDump" Set _rule=Dump
IF /i %_rule% LEQ 5  Set goto END


Set /P _PortNumper=What port number: || Set _PortNumper=NothingChosen
IF "%_PortNumper%"=="NothingChosen" goto sub_error

echo.
echo 1- %_rule% Inbound rule
echo 2- %_rule% Outbound rule
echo.

Set /P _InOut=Select your operation: || Set _InOut=NothingChosen
IF "%_InOut%"=="NothingChosen" goto sub_error
IF /i "%_InOut%" LEQ 1 Set _InOut=In || IF /i "%_InOut" LEQ 2 Set _InOut=Out

echo.
echo 1- Allow Action rule	2- Block Action rule
echo 3- Bypass Action rule
echo.

Set /P _Action=Select you protocol: || Set _Action=NothingChosen
IF "%_Action%"=="NothingChosen" goto sub_error
IF /i "%_Action%" LEQ 1 Set _Action=allow
IF /i "%_Action%" LEQ 2 Set _Action=block
IF /i "%_Action%" LEQ 3 Set _Action=bypass

echo.
echo 1- TCP Protocol		2- UDP Protocol 
echo 3- ICMPV4 Protocol 	4- ICMPV6 Protocol
echo 5- Any Protocol 
echo.

Set /P _protocol=Select your operation: || Set _protocol=NothingChosen
IF "%_protocol%"=="NothingChosen" goto sub_error
IF /i "%_protocol%" LEQ 1 Set _protocol="TCP"
IF /i "%_protocol%" LEQ 2 Set _protocol=UDP
IF /i "%_protocol%" LEQ 3 Set _protocol=ICMPV4
IF /i "%_protocol%" LEQ 4 Set _protocol=ICMPV6
IF /i "%_protocol%" LEQ 5 Set _protocol=any

echo netsh advfirewall firewall %_rule% rule name=FWADV_%_PortNumper% dir=%_InOut% action=%_Action% protocol=%_protocol% localport=%_PortNumper%

pause
:sub_error
echo Nothing was chosen !!
goto Start

:END
exit
