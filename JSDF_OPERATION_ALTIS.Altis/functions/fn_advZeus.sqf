/*
 * Author: JoramD
 * ADV_Zeus script converted to a function.
 *
 * Arguments:
 * 0: Curator <MODULE>
 * 1: Add Civilians <ARGUMENT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [curatorModule, addCivilians] call JSDF_Mission_fnc_advZeus
 */
#include "..\script_component.hpp"

// Function you pasted to me on Slack
params ["_curator", "_addCivilians"];

_curator addCuratorEditableObjects [vehicles, true];
_curator addCuratorEditableObjects [allMissionObjects "Man", false];
_curator addCuratorEditableObjects [allMissionObjects "Air", true];
_curator addCuratorEditableObjects [allMissionObjects "Ammo", false];

// Call the function for the first time (without delay)
// _this call JSDF_Mission_fnc_advZeus; // _this because exactly the same arguments, could also do: [_curator, _addCivilians]



// New function (which calls itself at the end)
params ["_curator", "_addCivilians"];

// then {true} else {false} (or the other way around) is pointless, you want a boolean anyways
private _toAdd = !(!_addCivilians && {side _x == civilian}); // You should fix this, _x is undefined
{
    if (_toAdd) then {_curator addCuratorEditableObjects [[_x], true]};
} forEach allUnits;
_curator addCuratorEditableObjects [vehicles, true];

[JSDF_Mission_fnc_advZeus, _this, 10] call CBA_fnc_waitAndExecute; // _this because exactly the same arguments, could also do: [_curator, _addCivilians]
