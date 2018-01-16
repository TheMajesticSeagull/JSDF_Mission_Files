// Basic stuff
_this setVehicleAmmo 1;
_this setDammage 0;
// Set plyon settings
private _pylonLoadout = [
//  ["pylon", "ammotype"]
  ["pylon1", "rhsusf_mag_gau19_melb_left"],
  ["pylon2", ""],
  ["pylon3", ""],
  ["pylon4", "rhs_mag_M151_19"]
];
{
  _x params ["_pylon", "_ammo"];

  _this setPylonLoadOut [_pylon, _ammo];
} forEach _pylonLoadout;
