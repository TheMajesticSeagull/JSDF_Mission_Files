/*
 * Author: JoramD
 * Allows spawning of vehicle supply box.
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

private _crate = createVehicle ["Box_NATO_AmmoVeh_F", _spawnLocation, [], 0, "NONE"];

_crate addItemCargoGlobal ["ToolKit", 1];
[_crate, 4] call ace_cargo_fnc_setSpace;
["ACE_Wheel", _crate] call ace_cargo_fnc_loadItem;
["ACE_Wheel", _crate] call ace_cargo_fnc_loadItem;
["ACE_Wheel", _crate] call ace_cargo_fnc_loadItem;
["ACE_Wheel", _crate] call ace_cargo_fnc_loadItem;

["Vehicle Supply Box Spawned!"] call ace_common_fnc_displayTextStructured;
[QGVAR(setDragable), [_crate]] call CBA_fnc_globalEvent;
[QGVAR(addToCurator), [_crate]] call CBA_fnc_globalEvent;
