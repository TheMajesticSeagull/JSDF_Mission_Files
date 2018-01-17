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
    "Open the scroll action menu to spawn an ammo supply box or a medical supply box. It will then spawn on the vehicle service pad.<br /> In order to move/drag crates, press the windows key while the container is in focus, highlight: Interactions and then Drag."
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    "Vehicle Service Pad",
    "Make sure the vehicle service pad is clear of any objects or personnel. Then position your vehicle on the service pad, it will then start to repair, refuel and rearm your vehicle.<br />This process should take around 40 seconds."
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    "Arsenal",
    "Access the arsenal box via the scroll wheel interactions menu. Please note that there is an instruction sign above the Arsenal box.<br />Face wear customization is allowed according to your personal preference.<br />Aside from the default scope you may use the M68 CCO as well as the EOTech 552 (base version)."
  ]
];
