_fnc_makeDraggable = {
    params ["_object"];
    diag_log text format ["Making %1 [%2] Draggable", _object, typeOf _object];
    [_object, true, [0, 1.5, 0], 90] call ace_dragging_fnc_setDraggable;
};
["B_supplyCrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
["C_IDAP_supplycrate_F", "init", _fnc_makeDraggable, true, [], true] call CBA_fnc_addClassEventHandler;
// Set max weight
ACE_maxWeightDrag = 1600;
