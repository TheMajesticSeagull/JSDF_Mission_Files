[] spawn
{
  private _crate = createVehicle ["B_supplyCrate_F", position SpawnPad1, [], 0, "NONE"];
  clearItemCargoGlobal _crate;
  clearWeaponCargoGlobal _crate;
  clearBackpackCargoGlobal _crate;
  clearMagazineCargoGlobal _crate;
  [_crate, 3] call ace_cargo_fnc_setSize;
  //Add All The Items!
  _crate addItemCargoGlobal ["SMA_30Rnd_556x45_M855A1", 50];
  _crate addItemCargoGlobal ["SMA_150Rnd_762_M80A1", 8];
  _crate addItemCargoGlobal ["SMA_20Rnd_762x51mm_M80A1_EPR", 5];
  _crate addItemCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP", 16];
  _crate addItemCargoGlobal ["rhs_mag_smaw_HEAA", 2];
  _crate addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
  _crate addItemCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
  _crate addItemCargoGlobal ["UGL_FlareWhite_F", 2];
  _crate addItemCargoGlobal ["ACE_EarPlugs", 20];
  _crate addItemCargoGlobal ["rhs_weap_M136", 2];
  _crate addItemCargoGlobal ["DemoCharge_Remote_Mag", 8];
  hint "Ammo Box Spawned!";
  [_crate, true, [0, 1.5, 0], 90] call ace_dragging_fnc_setDraggable;
};
