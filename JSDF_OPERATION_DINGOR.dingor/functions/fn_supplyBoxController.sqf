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

// Add ammo box action
private _ammoBoxAction = [
    QGVAR(ammoBoxInteraction),
    "Spawn Ammo Supply Box",
    "",
    {
    params ["_spawnLocation"];

    [_spawnLocation] call JSDF_Mission_fnc_supplyBoxAmmo;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _ammoBoxAction] call ace_interact_menu_fnc_addActionToObject;

// Add medical box action
private _medicalBoxAction = [
    QGVAR(medicalBoxInteraction),
    "Spawn Medical Supply Box",
    "",
    {
    params ["_spawnLocation"];

    [_spawnLocation] call JSDF_Mission_fnc_supplyBoxMedical;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _medicalBoxAction] call ace_interact_menu_fnc_addActionToObject;

// Add vehicle box action
private _vehicleBoxAction = [
    QGVAR(vehicleBoxInteraction),
    "Spawn Vehicle Supply Box",
    "",
    {
    params ["_spawnLocation"];

    [_spawnLocation] call JSDF_Mission_fnc_supplyBoxVehicle;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_controller, 0, ["ACE_MainActions"], _vehicleBoxAction] call ace_interact_menu_fnc_addActionToObject;
