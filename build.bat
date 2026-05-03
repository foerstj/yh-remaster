:: name of map
set map=yesterhaven-re
:: name of map, case-sensitive
set map_cs=Yesterhaven Revisited
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

:: pre-build checks
setlocal EnableDelayedExpansion
if not "%mode%"=="light" (
  robocopy "%bits%\world\contentdb\gitignore" "%bits%\world\contentdb\templates\original" /S
  pushd %gaspy%
  set checks=standard
  if "%mode%"=="release" (
    set checks=all
  )
  venv\Scripts\python -m build.pre_build_checks %map% --check !checks! --bits "%bits%"
  set pre_build_checks_errorlevel=!errorlevel!
  rmdir /S /Q "%bits%\world\contentdb\templates\original"
  if !pre_build_checks_errorlevel! neq 0 pause
  popd
)
endlocal

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /E
pushd %gaspy%
venv\Scripts\python -m build.fix_start_positions_required_levels %map% --bits "%tmp%\Bits"
if %errorlevel% neq 0 pause
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  robocopy "%bits%\world\contentdb\gitignore" "%bits%\world\contentdb\templates\original" /S
  venv\Scripts\python -m build.add_world_levels %map% --bits "%tmp%\Bits" --template-bits "%bits%" --template-base original
  set add_world_levels_errorlevel=!errorlevel!
  rmdir /S /Q "%bits%\world\contentdb\templates\original"
  if !add_world_levels_errorlevel! neq 0 pause
)
endlocal
popd
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Maps\%map_cs%.dsmap" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

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

:: Compile German language resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\language" "%tmp%\Bits\language" *.de.gas /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.de.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
:: Compile Spanish language resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\language" "%tmp%\Bits\language" *.es.gas /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\Resources\%map_cs%.es.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
