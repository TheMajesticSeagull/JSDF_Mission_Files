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
    localize "str_jsdf_versionTitle",
    format [localize "str_jsdf_versionText", MAJOR, MINOR, PATCHLVL]
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    localize "str_jsdf_supplyTitle",
    format [localize "str_jsdf_supplyText"]
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    localize "str_jsdf_serviceTitle",
    format [localize "str_jsdf_serviceText"]
  ]
];

player createDiaryRecord [
  "infoDiary",
  [
    localize "str_jsdf_arsenalTitle",
    format [localize "str_jsdf_arsenalText"]
  ]
];
