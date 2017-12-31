[] spawn
{
_box = createVehicle ["C_IDAP_supplycrate_F", position SpawnPad1, [], 0, "NONE"];
clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
[_box, 3] call ace_cargo_fnc_setSize;
//Add All The Items!
_box addItemCargoGlobal ["ACE_bloodIV", 20];
_box addItemCargoGlobal ["ACE_morphine", 60];
_box addItemCargoGlobal ["ACE_epinephrine", 40];
_box addItemCargoGlobal ["ACE_fieldDressing", 120];
_box addItemCargoGlobal ["ACE_bodyBag", 10];
_box addItemCargoGlobal ["ACE_EarPlugs", 20];
hint "Medical Box Spawned!";

};
