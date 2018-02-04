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
    "Make sure the vehicle service pad is clear of any objects or personnel.<br />Next, position your vehicle on the service pad, it will then start to repair, refuel and rearm your vehicle.<br />This process should take around 40 seconds."
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    "Arsenal",
    "Access the arsenal box via the ACE interactions menu. Please note that there is an instruction sign above the Arsenal box.<br />Face wear customization is allowed according to your personal preference.<br />Aside from the default scope you may use the M68 CCO as well as the EOTech 552 (base version)."
  ]
];
