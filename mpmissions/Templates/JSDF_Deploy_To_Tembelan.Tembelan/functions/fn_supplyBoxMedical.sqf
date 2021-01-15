/*
 * Author: JoramD
 * Allows spawning of medical box.
 *
 * Arguments:
 * 0: Spawn Location <POSITION>
 *
 * Return Value:
 * None
 *
 * Example:
 * [spawnLocation] call JSDF_Mission_fnc_supplyBoxMedical
 */
#include "..\script_component.hpp"

params ["_spawnLocation"];

private _crate = createVehicle ["C_IDAP_supplycrate_F", _spawnLocation, [], 0, "NONE"];
clearItemCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate, 3] call ace_cargo_fnc_setSize;

private _ammoItems = [
  // ["item", amount],
	["ACE_elasticBandage", 500],
	["ACE_morphine", 250],
	["ACE_epinephrine", 250],
	["ACE_tourniquet", 100],
	["ACE_bloodIV", 100],
	["ACE_bloodIV_500", 100],
	["ACE_splint", 100],
	["G_Respirator_white_F", 10],
	["H_HeadBandage_clean_F", 10],
	["H_HeadBandage_stained_F", 10],
	["H_HeadBandage_bloody_F", 10],
	["SmokeShellPurple", 10],
	["SmokeShellBlue", 10],
	["SmokeShellGreen", 10],
	["ACE_bodyBag", 50]
  ];

{
  _x params ["_item", "_amount"];

  _crate addItemCargoGlobal [_item, _amount];
} forEach _ammoItems;

[localize "str_jsdf_medicalSupplySpawned"] call ace_common_fnc_displayTextStructured;
[QGVAR(setDragable), [_crate]] call CBA_fnc_globalEvent;
[QGVAR(addToCurator), [_crate]] call CBA_fnc_globalEvent;
