_settings = [
    [
    "JSDF_Loadout_Arid", 
    "CHECKBOX", 
    "Arid", 
    "JSDF Loadouts", 
    true, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_main_arid.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_Desert", 
    "CHECKBOX", 
    "Desert", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_main_desert.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_Woodland", 
    "CHECKBOX", 
    "Woodland", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_main_woodland.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_Air_Vehicles", 
    "CHECKBOX", 
    "Air vehicles", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_main_air_vehicle.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_Air_Vehicles", 
    "CHECKBOX", 
    "Air vehicles", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_main_air_vehicle.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_custom", 
    "CHECKBOX", 
    "Custom", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_custom.sqf";
            };
        }
    }, 
    false
]
];
{
_x call CBA_fnc_addSetting;
} forEach _settings; 