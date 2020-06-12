/*
┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ 
│ PARAMETERS:                                                                          
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│   
│   [OBJECT, "STRING", "STRING", NUMBER] call JSDF_Mission_fnc_teleport;
│ 
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ USAGE:
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ To use the script, paste this function in the init field og the object you want the teleport
│ action to appear on:
│
│ [this, "Mountain Base", "mountain", false, 0, 5] call JSDF_Mission_fnc_teleport;
│
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ DETAILED INFO:
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ 
│ Parameter 1: this = the object the code is pasted in, can also refer to a objects variable name
│ 
│ Parameter 2: Is the name that will appear in the scroll menu (Teleport to will be added to the start of this word automatically)
│ 
| Parameter 3: The variable name of the object you want to teleport to (Be sure to get the variable name and not the display name)
|
| Parameter 4: Toggle adaptive height placement, when set to true you will be placed at the closest surface (needed when teleporting to objects on water)
|
| Parameter 5: Height offset
|
| Parameter 6: How close you have to be to the object to make the teleport option appear
└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ 
*/

params ["_object", "_name", "_target", "_adaptive", "_offset", "_range"];


_object addAction ["Teleport to " + _name,
{
	_args = (_this select 3);
	_player = (_this select 1);
	_obj = missionNamespace getVariable (_args select 0);
	_adaptive = (_args select 1);
	_dir = getDir _obj;
	_posZ = getPos _obj;
	_posXY = _obj getPos [3, _dir];
	_pos = [(_posXY select 0), (_posXY select 1), (_posZ select 2)];
	_offset = (_pos select 2) + (_args select 2);
	if (isNil "_offset") then {_offset = 0};

	if (_adaptive) then {
		_pos set [2, worldSize]; 
		_player setPosASL _pos;
		_pos set [2, vectorMagnitude (_pos vectorDiff getPosVisual _player) + _offset];
		_player setPosASL _pos;
		_player setDir _dir - 180;
	} else {
		_player setVehiclePosition [[_pos select 0, _pos select 1, _pos select 2 + _offset], [], 0, "CAN_COLLIDE"];
		_player setDir _dir - 180;
	};
},
[_target, _adaptive, _offset],
1.5,
true,
true,
"",
"true",
_range,
false,
"",
""
];
