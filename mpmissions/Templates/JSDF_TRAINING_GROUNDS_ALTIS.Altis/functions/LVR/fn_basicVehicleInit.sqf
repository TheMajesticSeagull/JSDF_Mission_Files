// Basic stuff
_this setVehicleAmmo 1;
_this setDammage 0;
// Remove all items
clearItemCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearBackpackCargoGlobal _this;
clearMagazineCargoGlobal _this;
// Add new items
_this addItemCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 10];
_this addItemCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch_coyote", 2];
_this addItemCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 5];
_this addItemCargoGlobal ["rhsusf_mag_17Rnd_9x19_FMJ", 5];
_this addItemCargoGlobal ["ACE_elasticBandage20", 20];
_this addItemCargoGlobal ["ACE_EarPlugs", 5];
_this addItemCargoGlobal ["ACE_CableTie", 5];
_this addItemCargoGlobal ["ACE_epinephrine", 10];
_this addItemCargoGlobal ["ACE_morphine", 10];
_this addItemCargoGlobal ["ACE_tourniquet", 5];
_this addItemCargoGlobal ["ACE_splint", 5];
_this addItemCargoGlobal ["tf_anprc152", 3];