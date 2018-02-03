/*
 * Author: JoramD
 * Initialized arsenal and loadout transfer on a object.
 *
 * Arguments:
 * 0: Crate <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call JSDF_Mission_fnc_arsenalBoxInit
 */
#include "..\script_component.hpp"

params ["_crate"];

// Add loadout transfer interaction
private _arsenalAction = [
    QGVAR(arsenal),
    "Arsenal",
    "",
    {
      ["AmmoboxInit",[_crate,true]] spawn BIS_fnc_arsenal;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _arsenalAction] call ace_interact_menu_fnc_addActionToObject;

// Add loadout transfer interaction
private _loadoutTransferAction = [
    QGVAR(arsenal),
    "Loadout Transfer",
    "",
    {
      [_crate, true, true, false, true, true] call LT_fnc_mainMenuLoad;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _loadoutTransferAction] call ace_interact_menu_fnc_addActionToObject;
