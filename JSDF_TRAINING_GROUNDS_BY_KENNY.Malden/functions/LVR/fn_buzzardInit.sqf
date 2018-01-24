// Basic stuff
_this setVehicleAmmo 1;
_this setDammage 0;
// Set texture
_this setObjectTextureGlobal [0,"\JSDF_Resources\img\vehicles\buzzard_tex_1.paa"];
_this setObjectTextureGlobal [1,"\JSDF_Resources\img\vehicles\buzzard_tex_2.paa"];
// Remove all items
clearItemCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearBackpackCargoGlobal _this;
clearMagazineCargoGlobal _this;
// Add new items
_this addItemCargoGlobal ["ACE_morphine", 5];
_this addItemCargoGlobal ["ACE_EarPlugs", 5];
_this addItemCargoGlobal ["ACE_fieldDressing", 10];
