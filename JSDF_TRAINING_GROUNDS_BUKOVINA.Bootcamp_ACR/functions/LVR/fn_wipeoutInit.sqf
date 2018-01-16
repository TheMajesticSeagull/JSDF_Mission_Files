// Basic stuff
_this setVehicleAmmo 1;
_this setDammage 0;

// Set plyon settings
private _pylonLoadout = [
//  ["pylon", "ammotype"]
  ["pylon1", "PylonRack_1Rnd_Missile_AA_04_F"],
  ["pylon2", "PylonRack_7Rnd_Rocket_04_HE_F"],
  ["pylon3", "PylonRack_1Rnd_Missile_AGM_02_F"],
  ["pylon4", "PylonMissile_1Rnd_Bomb_04_F"],
  ["pylon5", "PylonMissile_1Rnd_Bomb_04_F"],
  ["pylon6", "PylonMissile_1Rnd_Bomb_04_F"],
  ["pylon7", "PylonMissile_1Rnd_Bomb_04_F"],
  ["pylon8", "PylonRack_1Rnd_Missile_AGM_02_F"],
  ["pylon9", "PylonRack_7Rnd_Rocket_04_HE_F"],
  ["pylon10", "PylonRack_1Rnd_Missile_AA_04_F"]
];
{
  _x params ["_pylon", "_ammo"];

  _this setPylonLoadOut [_pylon, _ammo];
} forEach _pylonLoadout;
