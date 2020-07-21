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
            [] ExecVM "functions\fn_loadout_a.sqf";
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
            [] ExecVM "functions\fn_loadout_w.sqf";
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
            [] ExecVM "functions\fn_loadout_d.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_Snow", 
    "CHECKBOX", 
    "Snow", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_s.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_Vehicles", 
    "CHECKBOX", 
    "Vehicle Crew and Pilots", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_v.sqf";
            };
        };
    }, 
    false
],
[
    "JSDF_Loadout_custom", 
    "CHECKBOX", 
    "Custom Loadouts", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_c.sqf";
            };
        }
    }, 
    false
]
];
{
_x call CBA_fnc_addSetting;
} forEach _settings; 