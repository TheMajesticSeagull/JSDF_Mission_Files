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

params ["_veh"];

[_veh] spawn {
  if ((_this select 0) isKindOf "ParachuteBase" || !alive (_this select 0)) exitWith {};

  (_this select 0) vehicleChat "Servicing vehicle, please wait ...";

  (_this select 0) setFuel 0;

  sleep 10;

  (_this select 0) vehicleChat "Re-arming ...";

  sleep 10;

  (_this select 0) vehicleChat "Repairing ...";

  sleep 10;

  (_this select 0) vehicleChat "Refueling ...";

  sleep 10;

  (_this select 0) setDamage 0;
  (_this select 0) vehicleChat "Repaired (100%).";

  (_this select 0) setVehicleAmmo 1;
  (_this select 0) vehicleChat "Re-armed (100%).";

  (_this select 0) setFuel 1;
  (_this select 0) vehicleChat "Refuelled (100%).";

  sleep 2;

  (_this select 0) vehicleChat "Service complete.";
};
