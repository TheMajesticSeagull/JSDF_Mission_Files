/*
 * Author: JoramD
 * Vehicle server script.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [(thisList select 0)] call JSDF_Mission_fnc_serviceVehicle
 */
#include "..\script_component.hpp"

if (isNil "inSafezone") then {
    inSafezone = false;
};
while {
    true
}
do {
    private["_safeZoneDamageEH", "_safeZoneFiredEH"];
    waitUntil {
        inSafeZone
    };
    player allowDamage false;
_safeZoneDamageEH = player addEventhandler["HandleDamage",{false}];
    _safeZoneFiredEH = player addEventHandler ["Fired", {
   deleteVehicle (_this select 6);
systemChat ("You can not fire your weapon in a safe zone.");
    }];
    waitUntil {
        !inSafeZone
    };
    player allowDamage true;
    player removeEventhandler["HandleDamage", _safeZoneDamageEH];
    player removeEventHandler["Fired", _safeZoneFiredEH];
};
