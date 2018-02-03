/*
 * Author: JoramD
 * Allows spawning of supply boxes.
 *
 * Arguments:
 * 0: Controller <OBJECT>
 * 1: Spawn Location <POSITION>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, spawnLocation] call JSDF_Mission_fnc_supplyBoxController
 */
#include "..\script_component.hpp"

params ["_controller", "_spawnLocation"];

_controller addAction [
  "Spawn Ammo Supply Box",
  {
    [(_this select 3)] call JSDF_Mission_fnc_supplyBoxAmmo;
  },
  _spawnLocation,
  1.5,
  true,
  true,
  "",
  "true",
  2.5
];

_controller addAction [
  "Spawn Medical Supply Box",
  {
    [(_this select 3)] call JSDF_Mission_fnc_supplyBoxMedical;
  },
  _spawnLocation,
  1.5,
  true,
  true,
  "",
  "true",
  2.5
];

_controller addAction [
  "Spawn Vehicle Supply Box",
  {
    [(_this select 3)] call JSDF_Mission_fnc_supplyBoxVehicle;
  },
  _spawnLocation,
  1.5,
  true,
  true,
  "",
  "true",
  2.5
];
