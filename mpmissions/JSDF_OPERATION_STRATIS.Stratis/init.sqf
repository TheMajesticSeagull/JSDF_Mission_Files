#include "script_component.hpp"

// Default Loadouts

if (isMultiplayer) then {
/////////////////////////////////////////////////////////////////////////////////////////////////////
// To select what loadouts that will be loaded,                                                    //
// you need to set the corresponding parameter do either true or false.                            //
// True will enable the loadout and false will desable it.                                         //
// Here is a array showing the order of the loadouts:                                              //
// [Woodland, Desert, Arid, Snow, Urban, Crew/Driver/Pilot, Custom/Extra]                          //
//                                                                                                 //
// Example of how the values down bellow would be set if Desert and Crew loadouts where enabled:   //
// [false, true, false, false, false, true, false]                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////// 



// ||||||| Edit these values |||||||||| //
// vvvvvvv                   vvvvvvvvvv //

[false, true, false, false, false, false, false] call {

//////////////////////////////////////| DON'T EDIT ANYTHING BELLOW THIS LINE |//////////////////////////////////////

if (_this select 0) then {
    [] ExecVM "functions\fn_loadout_w.sqf";
};

if (_this select 1) then {
    [] ExecVM "functions\fn_loadout_d.sqf";
};

if (_this select 2) then {
    [] ExecVM "functions\fn_loadout_a.sqf";
};

if (_this select 3) then {
    [] ExecVM "functions\fn_loadout_s.sqf";
};

if (_this select 4) then {
    [] ExecVM "functions\fn_loadout_u.sqf";
};

if (_this select 5) then {
    [] ExecVM "functions\fn_loadout_v.sqf";
};

if (_this select 6) then {
    [] ExecVM "functions\fn_loadout_c1.sqf";
};

}

}

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
  	[mrg],
  	[Arrow],
  	[Seagull],
  	[Tub],
    [Gil],
    [Rambi],
    [Kenny],
    [Sage],
    [Lime]
  ];
  {
  		_x params ["_curatorModuleName"];

      _curatorModuleName addCuratorEditableObjects [[(_this select 0)], false]
  } forEach _zeusUsers;
}] call CBA_fnc_addEventHandler;

[QGVAR(setCamoCoef), {
    (_this select 0) setUnitTrait ["camouflageCoef", 0.3];
}] call CBA_fnc_addEventHandler;

// SupplyBoxSpawn zeus actions
private _supplyBoxSpawnBase = [
  QGVAR(supplyBoxSpawnBase),
  localize "str_jsdf_baseSupplyBoxAction",
  "",
  {},
  {true}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _supplyBoxSpawnBase] call ace_interact_menu_fnc_addActionToZeus;

private _supplyBoxSpawnAmmo = [
  QGVAR(supplyBoxSpawnAmmo),
  localize "str_jsdf_spawnAmmoSupply",
  "",
  {
    [SpawnPad1] call JSDF_Mission_fnc_supplyBoxAmmo;
  },
  {true}
] call ace_interact_menu_fnc_createAction;

private _supplyBoxSpawnMedical = [
  QGVAR(supplyBoxSpawnMedical),
  localize "str_jsdf_spawnMedicalSupply",
  "",
  {
    [SpawnPad1] call JSDF_Mission_fnc_supplyBoxMedical;
  },
  {true}
] call ace_interact_menu_fnc_createAction;

private _supplyBoxSpawnVehicle = [
  QGVAR(supplyBoxSpawnVehicle),
  localize "str_jsdf_spawnVehicleSupply",
  "",
  {
    [SpawnPad1] call JSDF_Mission_fnc_supplyBoxVehicle;
  },
  {true}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", QGVAR(supplyBoxSpawnBase)], _supplyBoxSpawnAmmo] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", QGVAR(supplyBoxSpawnBase)], _supplyBoxSpawnMedical] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", QGVAR(supplyBoxSpawnBase)], _supplyBoxSpawnVehicle] call ace_interact_menu_fnc_addActionToZeus;

[] call JSDF_Mission_fnc_safezone;
