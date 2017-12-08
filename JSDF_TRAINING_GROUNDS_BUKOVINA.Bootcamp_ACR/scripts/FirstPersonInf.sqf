// 3rd person script start //

if ((difficultyOption "thirdPersonView") == 1) then {
    0 spawn {
        while {(("drivers" != "everyone")&&!(player in tp_allowed_units))} do {
            _veh = (vehicle player);
            _inVeh = (_veh != player);
            _isTP = (cameraView == "EXTERNAL");
            _isDriving = (((player == commander _veh) || (player == driver _veh)) && (_inVeh));

            if (_isTP) then {
                if ("drivers" == "disabled") then {
                    _veh switchCamera "INTERNAL";
                } else {
                    if (!(_isDriving)) then {
                        _veh switchCamera "INTERNAL";
                    };
                };
            };
            sleep 0.01;
        };
    };
};

// 3rd person script end //

// allowed_units variable start	//

if (isNil "tp_allowed_units") then { tp_allowed_units = [] };

// allowed_units variable end	//