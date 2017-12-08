if (!isServer) exitWith {};

#define COMPONENT repetitiveCleanup
#define DOUBLES(A,B) ##A##_##B
#define TRIPLES(A,B,C) ##A##_##B##_##C
#define QUOTE(A) #A
#define GVAR(A) DOUBLES(COMPONENT,A)
#define QGVAR(A) QUOTE(GVAR(A))


if (!isNil{GVAR(isRunning)} && {GVAR(isRunning)}) then {
	GVAR(isRunning)=false;
	waitUntil{isNil{GVAR(isRunning)}};
};
GVAR(isRunning)=true;

//cfg start
#define M 1

private _ttdBodies = M* 1*60; // seconds to delete dead bodies (0 means don't delete)
private _ttdVehiclesDead = M* 2*60; // seconds to delete dead vehicles (0 means don't delete)
private _ttdVehiclesImmobile = M* 3*60; // seconds to delete immobile vehicles (0 means don't delete)

GVAR(deleteClassesConfig) = [
	// player placed or created objects that you probably want to delete once they are far enough
	[M* 30*60, ["TimeBombCore"]],
	[M* 10*60, ["CraterLong_small","CraterLong","SmokeShell"]],
	[M* 5*60, ["AGM_FastRoping_Helper","#dynamicsound","#destructioneffects","#track","#particlesource"]],
	[M* 60, ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"]]
];

GVAR(resetTimeIfPlayerIsWithin) = 300; // how far away from object player needs to be so it can delete
// cfg end

private _excludedMissionObjects = allMissionObjects ""


GVAR(objectsToCleanup)=[];
GVAR(timesWhenToCleanup)=[];
GVAR(originalCleanupDelays)=[];
GVAR(resetTimeIfPlayerNearby)=[];

GVAR(deleteThoseIndexes)=[];


private ["_markArraysForCleanupAt", "_deleteMarkedIndexes"];

#define IS_SANE(OBJECT) ((!isNil{OBJECT}) && ({!isNull(OBJECT)}))

_markArraysForCleanupAt = {
	params [
		"_index"
	];
	GVAR(deleteThoseIndexes) pushBack _index;
};

_deleteMarkedIndexes = {
	GVAR(deleteThoseIndexes) sort false;
	{
		GVAR(objectsToCleanup) deleteAt _x;
		GVAR(timesWhenToCleanup) deleteAt _x;
		GVAR(originalCleanupDelays) deleteAt _x;
		GVAR(resetTimeIfPlayerNearby) deleteAt _x;
	} forEach GVAR(deleteThoseIndexes);
	GVAR(deleteThoseIndexes) = [];
};



GVAR(addToCleanup) = {
	params [
		"_object",
		["_delay", 60, [0]],
		["_resetTimerIfPlayerNearby", true, [true,false]],
		["_resetValuesIfObjectAlreadyPresent", false, [true,false]]
	];
	private ["_newTime", "_index", "_currentTime"];
	if(IS_SANE(_object) && {!(_object getVariable["persistent",false])}) then {
		_newTime = _delay + time;
		_index = GVAR(objectsToCleanup) find _object;
		if(_index == -1) then {
			GVAR(objectsToCleanup) pushBack _object;
			GVAR(timesWhenToCleanup) pushBack _newTime;
			GVAR(originalCleanupDelays) pushBack _delay;
			GVAR(resetTimeIfPlayerNearby) pushBack _resetTimerIfPlayerNearby;
		} else {
			if(_resetValuesIfObjectAlreadyPresent) then {
				GVAR(timesWhenToCleanup) set[_index, _newTime];
				GVAR(originalCleanupDelays) set[_index, _delay];
				GVAR(resetTimeIfPlayerNearby) set[_index, _resetTimerIfPlayerNearby];
			};
		};
	};
};

GVAR(removeFromCleanup) = {
	params [
		"_object"
	];
	if(IS_SANE(_object)) then {
		_index = GVAR(objectsToCleanup) find _object;
		if(_index!=-1) then {
			[_index] call _markArraysForCleanupAt;
		};
	};
};


private ["_playerPositions", "_unit", "_myPos", "_delay", "_newTime", "_object", "_objectIndex"];

while{GVAR(isRunning)} do {

    sleep 10;
    if(count(GVAR(objectsToCleanup)) > 200) then {
    	GVAR(resetTimeIfPlayerIsWithin_multiplicator) = GVAR(resetTimeIfPlayerIsWithin_multiplicator) - 0.01;
    	if(GVAR(resetTimeIfPlayerIsWithin_multiplicator) < 0.1) then {
    		GVAR(resetTimeIfPlayerIsWithin_multiplicator) = 0.1;
    	};
    } else {
		GVAR(resetTimeIfPlayerIsWithin_multiplicator) = 1;
	};

    {
    	_object = _x;
		{
	    	_timeToDelete = _x select 0;
	    	_clasesToDelete = _x select 1;
	    	if(_timeToDelete>0) then {
		    	{
					if( (typeof _object == _x) || {(_object isKindOf _x)} ) then {
						[_object, _timeToDelete, true, false] call GVAR(addToCleanup);
					};
				} forEach _clasesToDelete;
			};
	    } forEach GVAR(deleteClassesConfig);
	} forEach (allMissionObjects "" - _excludedMissionObjects);
	if (_ttdBodies>0) then {
		{
			[_x, _ttdBodies, true, false] call GVAR(addToCleanup);
		} forEach (allDeadMen - _excludedMissionObjects);
	};

	if (_ttdVehiclesDead>0) then {
		{
			if(_x == vehicle _x) then {
				[_x, _ttdVehiclesDead, true, false] call GVAR(addToCleanup);
			};
		} forEach (allDead - allDeadMen - _excludedMissionObjects);
	};

	if (_ttdVehiclesImmobile>0) then {
		{
			if(!canMove _x && {alive _x} count crew _x==0) then {
				[_x, _ttdVehiclesImmobile, true, false] call GVAR(addToCleanup);
			} else {
				[_x] call GVAR(removeFromCleanup);
			};
		} forEach (vehicles - _excludedMissionObjects);
	};

	_playerPositions = [];
	{
		_playerPositions pushBack (getPosATL _x);
	} forEach allPlayers;


	GVAR(resetTimeIfPlayerIsWithin)Sqr = GVAR(resetTimeIfPlayerIsWithin) * GVAR(resetTimeIfPlayerIsWithin) * GVAR(resetTimeIfPlayerIsWithin_multiplicator);

	call _deleteMarkedIndexes;
	{
		_object = _x;
		_objectIndex = _forEachIndex;
		if(IS_SANE(_object)) then {
			if(GVAR(resetTimeIfPlayerNearby) select _objectIndex) then {
				_myPos = getPosATL _object;
				{
					if(GVAR(resetTimeIfPlayerIsWithin)Sqr == 0 || {(_myPos distanceSqr _x) < GVAR(resetTimeIfPlayerIsWithin)Sqr}) exitWith {
						_delay = GVAR(originalCleanupDelays) select _objectIndex;
						_newTime = _delay + time;
						GVAR(timesWhenToCleanup) set[_objectIndex, _newTime];
					};
				} forEach _playerPositions;
			};
			if((GVAR(timesWhenToCleanup) select _objectIndex) < time) then {
				[_objectIndex] call _markArraysForCleanupAt;
				deleteVehicle _object;
			};
		} else {
			[_objectIndex] call _markArraysForCleanupAt;
		};
	} forEach GVAR(objectsToCleanup);
	call _deleteMarkedIndexes;

};

GVAR(isRunning) = nil;
