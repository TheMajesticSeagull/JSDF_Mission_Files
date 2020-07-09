// Basic stuff
_this setVehicleAmmo 1;
_this setDammage 0;
// Remove all items
clearItemCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearBackpackCargoGlobal _this;
clearMagazineCargoGlobal _this;
// Add new items
_this addItemCargoGlobal ["ACE_morphine", 5];
_this addItemCargoGlobal ["ACE_epinephrine", 5];
_this addItemCargoGlobal ["ACE_EarPlugs", 5];
_this addItemCargoGlobal ["ACE_elasticBandage", 20];
_this addItemCargoGlobal ["tf_anprc152", 3];
_this addItemCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 10];
