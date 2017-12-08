_curator = _this select 0;
_addCivilians = _this select 1;

_curator addCuratorEditableObjects [vehicles,true];
_curator addCuratorEditableObjects [(allMissionObjects "Man"),false];
_curator addCuratorEditableObjects [(allMissionObjects "Air"),true];
_curator addCuratorEditableObjects [(allMissionObjects "Ammo"),false];

while {true} do {
	_toAdd = if (!_addCivilians && {(side _x) == civilian}) then {false} else {true};
	{
		if (_toAdd) then {_curator addCuratorEditableObjects [[_x], true]};
	} forEach allUnits;
	_curator addCuratorEditableObjects [vehicles, true];
	sleep 10;
};

if (true) exitWith {};
