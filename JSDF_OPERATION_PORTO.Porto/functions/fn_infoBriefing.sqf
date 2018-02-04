/*
 * Author: JoramD
 * in-game info text.
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call JSDF_Mission_fnc_infoBriefing
 */
#include "..\script_component.hpp"

player createDiarySubject ["infoDiary", "Info / Help"];

player createDiaryRecord [
  "infoDiary",
  [
    "Version",
    format ["This mission is on version: %1.%2.%3 <br />To see our changelogs go to our github: <br />https://github.com/JoramD0/JSDF_Mission_Files/releases", MAJOR, MINOR, PATCHLVL]
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    "Supply Box Spawn",
    "Use the ACE interaction menu to spawn an ammo supply box, vehicle supply box or a medical supply box. It will then spawn on the vehicle service pad.<br />In order to move/drag crates, use the ACE interaction menu on the container, then select Interactions and then Drag.<br />The vehicle supply box will spawn with four spare wheels in its cargo, one toolkit to repair a broken vehicle and if the vehicle is low on ammo it will also have an option to rearm it."
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    "Vehicle Service Pad",
    "Make sure the vehicle service pad is clear of any objects or personnel. Then position your vehicle on the service pad.<br /><br />To refuel go to the right most container and use the ACE interactions menu, select refuel and then take fuel nozzle, walk over to the vehicle and press left mouse button to attach the nozzle to the vehicle. To start refueling use the ACE interactions menu and select start refueling, once the refueling is done you will get a pop up saying “Refueling complete”. Walk up to the nozzle and with the ACE interactions menu disconnect the nozzle and walk back with it and return it to the container.<br /><br />To rearm the vehicle walk over to the middle container and with the ACE interactions menu select rearm and then the vehicle that you wish to rearm. Note that the vehicle needs to be pretty close to the container for this to work.<br /><br />In order to repair the vehicle walk over to the left most container and open up its inventory in it you will find 10 toolkits and 10 backpacks, equip a backpack then put a toolkit into the backpack, once you have the toolkit walk over to the vehicle and while using the ACE interaction menu select interactions and then full repair."
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    "Arsenal",
    "Access the arsenal box via the ACE interactions menu. Please note that there is an instruction sign above the Arsenal box.<br />Face wear customization is allowed according to your personal preference.<br />Aside from the default scope you may use the M68 CCO as well as the EOTech 552 (base version)."
  ]
];
