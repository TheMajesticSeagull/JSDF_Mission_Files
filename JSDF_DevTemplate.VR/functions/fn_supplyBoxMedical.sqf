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
  ["ACE_bloodIV", 20],
  ["ACE_morphine", 60],
  ["ACE_epinephrine", 40],
  ["ACE_fieldDressing", 120],
  ["ACE_bodyBag", 10],
  ["ACE_EarPlugs", 20]
  ];

{
  _x params ["_item", "_amount"];

  _crate addItemCargoGlobal [_item, _amount];
} forEach _ammoItems;

["Medical Supply Box Spawned!"] call ace_common_fnc_displayTextStructured;
[QGVAR(setDragable), [_crate]] call CBA_fnc_globalEvent;
[QGVAR(addToCurator), [_crate]] call CBA_fnc_globalEvent;
