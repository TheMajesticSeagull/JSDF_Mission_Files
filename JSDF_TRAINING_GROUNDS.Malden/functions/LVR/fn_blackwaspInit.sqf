// Basic stuff
_this setVehicleAmmo 1;
_this setDammage 0;

// Set plyon settings
private _pylonLoadout = [
//  ["pylon", "ammotype"]
  ["pylon1", "PylonRack_Missile_AMRAAM_D_x1"],
  ["pylon2", "PylonRack_Missile_AMRAAM_D_x1"],
  ["pylon3", "PylonRack_Missile_AGM_02_x1"],
  ["pylon4", "PylonRack_Missile_AGM_02_x1"],
  ["pylon5", "PylonMissile_Missile_BIM9X_x1"],
  ["pylon6", "PylonMissile_Missile_BIM9X_x1"],
  ["pylon7", "PylonMissile_Missile_AMRAAM_D_INT_x1"],
  ["pylon8", "PylonMissile_Missile_AMRAAM_D_INT_x1"],
  ["pylon9", "PylonMissile_Missile_AMRAAM_D_INT_x1"],
  ["pylon10", "PylonMissile_Missile_AMRAAM_D_INT_x1"],
  ["pylon11", "PylonMissile_Bomb_GBU12_x1"],
  ["pylon12", "PylonMissile_Bomb_GBU12_x1"]
];
{
  _x params ["_pylon", "_ammo"];

  _this setPylonLoadOut [_pylon, _ammo];
} forEach _pylonLoadout;

// Fold wings
_this animate ["wing_fold_l", 1, true];
_this animate ["wing_fold_r", 1, true];
