# Yh remaster

The original Yesterhaven map, remastered.

## What I did

This map is re-buildable and editable. I opened & saved every region in Siege Editor v1.7. The dsmap & dsres files can be rebuilt using the batch scripts, provided you have installations of Dungeon Siege, TankCreator and GasPy.
- Converted the map to use node mesh index
- Assigned sensible mesh ranges & scid ranges
- SE saves the "required_level" attributes for multiplayer start positions with an "i" in front, which however breaks the level requirement.\
  This is fixed during build by a gaspy script.
- Renamed the ingame name of the map to *Yesterhaven (remastered)*.

## What I did (revisit)

The "revisited" map variant is based on the remaster, with these changes applied:
- Renamed map ingame to *Yesterhaven (revisited)*.
- Fixed order of multiplayer start positions.

## How to build

- Provide environment variables:
  - %DungeonSiege% - path to DS installation
  - %TankCreator% - path to TC installation
  - %GasPy% - path to GasPy repo
- Run the build.bat in the repo root

## Attribution

This map was created by Gas-Powered Games, not me. I'm just doing minor changes here.
