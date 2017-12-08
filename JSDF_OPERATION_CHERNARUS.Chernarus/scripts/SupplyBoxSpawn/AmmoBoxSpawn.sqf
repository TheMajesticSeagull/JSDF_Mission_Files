[] spawn
{
_box = createVehicle ["B_supplyCrate_F", position SpawnPad1, [], 0, "NONE"];
clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
[_box, 3] call ace_cargo_fnc_setSize;
//Add All The Items!
_box addItemCargoGlobal ["SMA_30Rnd_556x45_M855A1", 50];
_box addItemCargoGlobal ["SMA_150Rnd_762_M80A1", 8];
_box addItemCargoGlobal ["SMA_20Rnd_762x51mm_M80A1_EPR", 5];
_box addItemCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP", 16];
_box addItemCargoGlobal ["rhs_mag_smaw_HEAA", 2];
_box addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
_box addItemCargoGlobal ["1Rnd_Smoke_Grenade_shell", 10];
_box addItemCargoGlobal ["UGL_FlareWhite_F", 2];
_box addItemCargoGlobal ["ACE_EarPlugs", 20];
_box addItemCargoGlobal ["rhs_weap_M136", 2];
hint "Ammo Box Spawned!";
};
