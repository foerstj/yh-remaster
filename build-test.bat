:: name of map
set map=yesterhaven-test
:: name of map, case-sensitive
set map_cs=Yesterhaven Test
:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

set copyright=GPG 2002
set author=Gas Powered Games
set title=%map_cs%

:: param
set mode=%1
echo %mode%

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art" "%tmp%\Bits\art" /E
robocopy "%bits%\sound" "%tmp%\Bits\sound" /E
robocopy "%bits%\ui" "%tmp%\Bits\ui" /E
robocopy "%bits%\world\ai" "%tmp%\Bits\world\ai" /E
robocopy "%bits%\world\contentdb" "%tmp%\Bits\world\contentdb" /E /xd gitignore
robocopy "%bits%\world\global" "%tmp%\Bits\world\global" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

set copyright=CC-BY-SA 2026
set author=Johannes Förstner

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Maps\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
