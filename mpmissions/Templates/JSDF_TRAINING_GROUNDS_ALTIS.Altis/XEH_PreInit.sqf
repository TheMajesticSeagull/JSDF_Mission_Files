_settings = [
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
    "JSDF_Loadout_Urban", 
    "CHECKBOX", 
    "Urban", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_u.sqf";
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
    "Crew/Vehicles", 
    "JSDF Loadouts", 
    true, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
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
    "JSDF_Loadout_Arid", 
    "CHECKBOX", 
    "Arid", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
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
    "JSDF_Loadout_custom1", 
    "CHECKBOX", 
    "Custom1", 
    "JSDF Loadouts", 
    false, //Change this value to ture or false to toggle if its activated on startup (false = off, true = on)
    1, 
    {  
        if (isMultiplayer) then {
            params ["_value"];
            if (_value) then {
            [] ExecVM "functions\fn_loadout_c1.sqf";
            };
        }
    }, 
    false
]
];
{
_x call CBA_fnc_addSetting;
} forEach _settings; 