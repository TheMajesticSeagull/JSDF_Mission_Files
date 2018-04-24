#include "script_component.hpp"

params ["_player"];

[_player, specScreen] call FUNC(baseSpectator);

[] call FUNC(infoBriefing);