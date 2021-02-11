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
  	[Admin_1],
    [Teal],
  	[Buda],
  	[Arrow],
  	[Seagull],
  	[Zeno],
	[Rambi],
	[Sage],
	[Huggins],
	[Reserve_Zeus_1],
	[Reserve_Zeus_2],
	[Reserve_Zeus_3]
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

//end of init
