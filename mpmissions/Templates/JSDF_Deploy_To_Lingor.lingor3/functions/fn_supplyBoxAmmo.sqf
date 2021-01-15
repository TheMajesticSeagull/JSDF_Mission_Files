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
	["rhs_mag_30Rnd_556x45_M855A1_Stanag", 50],
	["rhsusf_200Rnd_556x45_soft_pouch_coyote", 10],
	["rhsusf_20Rnd_762x51_m118_special_Mag", 10],
	["MRAWS_HEAT55_F", 5],
	["MRAWS_HE_F", 5],
	["rhsusf_mag_17Rnd_9x19_FMJ", 15],
	["rhs_mag_m67", 15],
	["SmokeShell", 10],
	["SmokeShellBlue", 5],
	["SmokeShellRed", 5],
	["tf_anprc152", 5],
	["NVGoggles_INDEP", 5],
	["ItemGPS", 5],
	["ACE_EarPlugs", 5],
	["ACE_EntrenchingTool", 5],
	["ACE_DefusalKit", 5],
	["ACE_Flashlight_XL50", 5],
	["ACE_MapTools", 5],
	["MineDetector", 5],
	["ACE_wirecutter", 5],
	["ACE_M26_Clacker", 5],
	["ACE_CableTie", 10],
	["DemoCharge_Remote_Mag", 5]
  ];

{
  _x params ["_item", "_amount"];

  _crate addItemCargoGlobal [_item, _amount];
} forEach _ammoItems;

[localize "str_jsdf_ammoSupplySpawned"] call ace_common_fnc_displayTextStructured;
[QGVAR(setDragable), [_crate]] call CBA_fnc_globalEvent;
[QGVAR(addToCurator), [_crate]] call CBA_fnc_globalEvent;
