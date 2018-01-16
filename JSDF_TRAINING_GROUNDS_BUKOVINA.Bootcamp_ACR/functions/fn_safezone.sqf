/*
 * Author: JoramD
 * Safezone function.
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call JSDF_Mission_fnc_safezone
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
