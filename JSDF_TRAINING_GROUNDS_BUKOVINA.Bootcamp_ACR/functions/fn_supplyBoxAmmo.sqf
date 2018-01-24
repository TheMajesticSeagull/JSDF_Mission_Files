/*
 * Author: JoramD
 * Allows spawning of ammo box.
 *
 * Arguments:
 * 0: Spawn Location <POSITION>
 *
 * Return Value:
 * None
 *
 * Example:
 * [spawnLocation] call JSDF_Mission_fnc_supplyBoxAmmo
 */
#include "..\script_component.hpp"

params ["_spawnLocation"];

private _crate = createVehicle ["B_supplyCrate_F", _spawnLocation, [], 0, "NONE"];
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate, 3] call ace_cargo_fnc_setSize;

private _ammoItems = [
  // ["item", amount],
  ["SMA_30Rnd_556x45_M855A1", 50],
  ["SMA_150Rnd_762_M80A1", 8],
  ["SMA_20Rnd_762x51mm_M80A1_EPR", 5],
  ["rhsusf_mag_17Rnd_9x19_JHP", 16],
  ["rhs_mag_smaw_HEAA", 2],
  ["1Rnd_HE_Grenade_shell", 10],
  ["1Rnd_Smoke_Grenade_shell", 10],
  ["UGL_FlareWhite_F", 2],
  ["ACE_EarPlugs", 20],
  ["rhs_weap_M136", 2],
  ["DemoCharge_Remote_Mag", 8]
  ];

{
  _x params ["_item", "_amount"];

  _crate addItemCargoGlobal [_item, _amount];
} forEach _ammoItems;

["Ammo Supply Box Spawned!"] call ace_common_fnc_displayTextStructured;
[QGVAR(setDragable), [_crate]] call CBA_fnc_globalEvent;
[QGVAR(addToCurator), [_crate]] call CBA_fnc_globalEvent;
