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
      params ["_crate"];

      [_crate, ace_player, true] call ace_arsenal_fnc_openBox;
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
      [true, true, false, true, true] call LT_fnc_mainMenuLoad;
    },
    {true}
] call ace_interact_menu_fnc_createAction;

[_crate, 0, ["ACE_MainActions"], _loadoutTransferAction] call ace_interact_menu_fnc_addActionToObject;
