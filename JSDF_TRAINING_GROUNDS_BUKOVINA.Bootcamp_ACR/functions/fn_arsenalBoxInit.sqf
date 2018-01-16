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

["AmmoboxInit",[_crate,true]] spawn BIS_fnc_arsenal;
[_crate, true, true, false, true, true] call LT_fnc_addAction;
