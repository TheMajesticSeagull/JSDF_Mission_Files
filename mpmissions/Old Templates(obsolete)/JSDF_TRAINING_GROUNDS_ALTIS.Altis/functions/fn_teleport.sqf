/*
┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ 
│ PARAMETERS:                                                                          
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│   
│   [OBJECT, "STRING", "STRING", NUMBER] call JSDF_Mission_fnc_teleport;
│ 
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ USAGE:
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ To use the script, paste this function in the init field og the object you want the teleport
│ action to appear on:
│
│ [this, "Mountain Base", "marker_23", 5] call JSDF_Mission_fnc_teleport;
│
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ DETAILED INFO:
├───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ Parameter 1: this = the object the code is pasted in, can also refer to a objects variable name
│ 
│ Parameter 2: Is the namee that will appear in the scroll menu (Teleport to will be added to the start of this word automatically)
│ 
| Parameter 3: The variable name of the marker you want to teleport to (Be sure to get the variable name and not the display name)
|
| Parameter 4: How close you have to be to the object to make the teleport option appear
└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ 
*/

params ["_object", "_name", "_marker", "_range"];


_object addaction ["Teleport to " + _name,{(_this select 1) setpos (markerpos (_this select 3))}, [_marker], 1.5, true, true, "", "true", _range, false, "", ""];
