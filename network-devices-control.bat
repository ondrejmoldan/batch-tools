@ECHO OFF

echo #####################################################
echo #                                                   #
echo #    Utility for enable/disable network adapters.   #
echo #                                                   #
echo #####################################################
echo.
echo Please, run this script as a administrator. Otherwise, the script will not work properly.
echo.
echo ## Parameters:
echo 1. Disable Ethernet network adapter	[1]
echo 2. Enable Ethernet network adapter	[2]
echo 3. Disable Wi-Fi network adapter	[3]
echo 4. Enable Wi-Fi network adapter		[4]
echo 5. Disable Ethernet and Wi-Fi adapters	[5]
echo 6. Enable Ethernet and Wi-Fi adapters	[6]
echo 7. Exit					[7]

:loop
echo.
SET /P A="## Choose a parameter for an action (enter number in brackets): "

2>NUL CALL :CASE_%A%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

:CASE_1
echo Disabling Ethernet adapter...
netsh interface set interface "Ethernet" disable
echo Done...
GOTO END_CASE

:CASE_2
echo Enabling Ethernet adapter...
netsh interface set interface "Ethernet" enable
echo Done...
GOTO END_CASE

:CASE_3
echo Disabling Wi-Fi adapter...
netsh interface set interface "Wi-Fi" disable
echo Done...
GOTO END_CASE

:CASE_4
echo Enabling Wi-Fi adapter...
netsh interface set interface "Wi-Fi" enable
echo Done...
GOTO END_CASE

:CASE_5
echo Disabling Ethernet and Wi-Fi adapters...
netsh interface set interface "Ethernet" disable
netsh interface set interface "Wi-Fi" disable
echo Done...
GOTO END_CASE

:CASE_6
echo Enabling Ethernet and Wi-Fi adapters...
netsh interface set interface "Ethernet" enable
netsh interface set interface "Wi-Fi" enable
echo Done...

GOTO END_CASE

:CASE_7
echo Exiting
pause
exit

:DEFAULT_CASE
echo %A% - This parameter does not exist. Try it again...
GOTO END_CASE


:END_CASE
VER > NUL # reset ERRORLEVEL
GOTO :loop
