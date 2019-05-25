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
  ["rhs_mag_30Rnd_556x45_m855_stanag", 50],
  ["rhs_200rnd_556x45_M_SAW", 8],
  ["20rnd_762x51_Mag", 5],
  ["rhsusf_mag_17Rnd_9x19_JHP", 16],
  ["MRAWS_HEAT_F", 2],
  ["1Rnd_HE_Grenade_shell", 10],
  ["rhs_mag_m714_White", 10],
  ["UGL_FlareWhite_F", 2],
  ["ACE_EarPlugs", 20],
  ["SatchelCharge_Remote_Ammo", 8]
  ];

{
  _x params ["_item", "_amount"];

  _crate addItemCargoGlobal [_item, _amount];
} forEach _ammoItems;

[localize "str_jsdf_ammoSupplySpawned"] call ace_common_fnc_displayTextStructured;
[QGVAR(setDragable), [_crate]] call CBA_fnc_globalEvent;
[QGVAR(addToCurator), [_crate]] call CBA_fnc_globalEvent;
