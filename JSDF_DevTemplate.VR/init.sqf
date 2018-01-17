#include "script_component.hpp"

// Sitting Fix
["ace_satDown", {
    {
        _x attachTo [_this select 0];
    } forEach allMissionObjects "babe_helper";
}] call CBA_fnc_addEventHandler;

["ace_stoodUp", {
    {
        detach _x;
    } forEach allMissionObjects "babe_helper";
}] call CBA_fnc_addEventHandler;

// Set max drag/carry weight
ACE_maxWeightDrag = 1600;
ACE_maxWeightCarry = 600;

// Custom event handlers
[QGVAR(setDragable), {
    [(_this select 0), true, [0, 1.5, 0], 90] call ace_dragging_fnc_setDraggable;
}] call CBA_fnc_addEventHandler;

[QGVAR(addToCurator), {
  private _zeusUsers = [
  	// [CuratorModuleName]
  	[Teal],
  	[Buda],
  	[Steel],
  	[Arrow],
  	[Joram],
  	[Seagull],
  	[Tub]
  ];
  {
  		_x params ["_curatorModuleName"];

      _curatorModuleName addCuratorEditableObjects [[(_this select 0)], false]
  } forEach _zeusUsers;
}] call CBA_fnc_addEventHandler;

[] call JSDF_Mission_fnc_infoBriefing;
