if ( ! ( isServer ) ) exitWith {};

params ["_veh","_abandonDelay","_destroyedDelay","_vehInit","_adaptive","_vehName","_vehDir","_vehPos","_vehtype","_abandoned","_dead"];

_veh = 			 param [0, objNull, []];
_abandonDelay =  	 param [1, 60, [0]];
_destroyedDelay =	 param [2, 60, [0]];
_vehInit =        param [3, {}, [{}] ];
_adaptive = 	param [4, false, [true, false] ];
_vehName =        vehicleVarName _veh;
_vehDir = 		 getDir _veh;
_vehPos = 		 getPos _veh;
_vehtype = 		 typeOf _veh;

_offset = _vehPos select 2;
	if (isNil "_offset") then {_offset = 0};

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

			if (_adaptive) then {
				_vehPos set [2, worldSize]; 
				_veh setPosASL _vehPos;
				_vehPos set [2, vectorMagnitude (_vehPos vectorDiff getPosVisual _veh) + _offset];
				_veh setPosASL _vehPos;
			} else {
				_veh setVehiclePosition [_vehPos, [], 0, "CAN_COLLIDE"];
			};

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
			if (_adaptive) then {
				_vehPos set [2, worldSize]; 
				_veh setPosASL _vehPos;
				_vehPos set [2, vectorMagnitude (_vehPos vectorDiff getPosVisual _veh) + _offset];
				_veh setPosASL _vehPos;
			} else {
				_veh setVehiclePosition [_vehPos, [], 0, "CAN_COLLIDE"];
			};
			_veh call _vehInit;
			if (_vehName != "") then {
				missionNamespace setVariable [_vehName, _veh];
				publicVariable _vehName;
			};

		};
	};
};


	