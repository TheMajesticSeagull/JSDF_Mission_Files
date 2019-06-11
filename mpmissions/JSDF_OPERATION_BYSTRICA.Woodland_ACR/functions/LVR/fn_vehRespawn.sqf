if ( ! ( isServer ) ) exitWith {};

private ["_veh","_abandonDelay","_destroyedDelay","_vehInit","_vehName","_vehDir","_vehPos","_vehtype","_abandoned","_dead"];

_veh = 			 [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_abandonDelay =  	 [_this, 1, 60, [0]] call BIS_fnc_param;
_destroyedDelay =	 [_this, 2, 60, [0]] call BIS_fnc_param;
_vehInit =        [_this, 3, {}, [{}] ] call BIS_fnc_param;

_vehName =        vehicleVarName _veh;
_vehDir = 		 getDir _veh;
_vehPos = 		 getPos _veh;
_vehtype = 		 typeOf _veh;

while { true } Do {

	sleep 1;

	if ( ( alive _veh ) && { ( canMove _veh ) && { { ( alive _x ) } count ( crew _veh ) == 0 } } ) then {

		_abandoned = true;

			for "_i" from 0 to _abandonDelay do {

				if ( { ( alive _x ) } count (crew _veh) > 0 || { !( alive _veh ) || { !( canMove _veh ) } } ) exitWith { _abandoned = false; };
				sleep 1;

			};

		if ( ( _abandoned ) && { _veh distance _vehPos > 10 } ) then {

			deleteVehicle _veh;
			sleep 1;
			_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
			_veh setDir _vehDir;
			_veh setPos [ ( _vehPos select 0 ), ( _vehPos select 1 ), 0 ];
			_veh call _vehInit;
			if (_vehName != "") then {
				missionNamespace setVariable [_vehName, _veh];
				publicVariable _vehName;
			};
		};
	};

	if ( !( alive _veh ) || { !( canMove _veh ) } ) then {

		_dead = true;

			for "_i" from 0 to _destroyedDelay do {

				if ( { ( alive _x ) } count ( crew _veh ) > 0 || { ( canMove _veh ) } ) exitWith { _dead = false; };
				sleep 1;

			};
		 
		if ( _dead ) then {

			deleteVehicle _veh;
			sleep 1;
			_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
			_veh setDir _vehDir;
			_veh setPos [ ( _vehPos select 0 ), (_vehPos select 1 ), 0 ];
			_veh call _vehInit;
			if (_vehName != "") then {
				missionNamespace setVariable [_vehName, _veh];
				publicVariable _vehName;
			};

		};
	};
};
