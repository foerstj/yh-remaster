# Yh remaster

The original Yesterhaven map, remastered.

## What I did

This map is re-buildable and editable. I opened & saved every region in Siege Editor v1.7. The dsmap & dsres files can be rebuilt using the batch scripts, provided you have installations of Dungeon Siege, TankCreator and GasPy.
- Converted the map to use node mesh index
- Assigned sensible mesh ranges & scid ranges
- SE saves the "required_level" attributes for multiplayer start positions with an "i" in front, which however breaks the level requirement.\
  This is fixed during build by a gaspy script.
- Renamed the map so there are no conflicts with the original map.\
  The internal name is *world/maps/yesterhaven-re*.\
  The generated file name is *Dungeon Siege/Maps/Yesterhaven Remaster.dsmap*.\
  The ingame name is *Yesterhaven (remastered)*.

## What I did (revisit)

The "revisited" map variant is based on the remaster, with these changes applied:
- Renamed map ingame to *Yesterhaven (revisited)*, generated file names to *Yesterhaven Revisited.dsmap*.
- Fixed order of multiplayer start positions.
- Fixed compatibility issue with LoA (Lich King Gas Pillar turret spell, second PackLightning$ parameter), works with both vanilla and LoA.
- Brushed up plants that had default scale multiplier or orientation.
- Added translations to German & Spanish.
- Added single-player mode (making player-world-location triggers multi-player only).
- Added Veteran & Elite world levels.
- Small fixes like making e.g. stalagmites not camera-blocking.
- Fixed player-world-location trigger at entrance of Ancient Passage
- Added support for Thrillvilled's voices mod
- Fixed invisible attacker when starting multiplayer in Chapter 2
- Fixed Qwendolyn quest not completable when started in wrong order

## Installation

Put the dsmap file into Maps and the dsres file into Resources.

### Compatibility
Works with both vanilla and LoA.\
Has compatibility issue with DSMod though.

Supports Thrillvilled's voices mod.

## How to build

- Provide environment variables:
  - %DungeonSiege% - path to DS installation
  - %TankCreator% - path to TC installation
  - %GasPy% - path to GasPy repo
- Run the build.bat in the repo root

GasPy repo: https://github.com/foerstj/gaspy

## Attribution

- Spanish translations by Nekurrot

This map was created by Gas-Powered Games, not me. I'm just doing minor changes here.
