_cam = createTrigger ["EmptyDetector", getPos player, true];
_cam setTriggerText "Gcam";
_cam setTriggerActivation ["ALPHA", "NOT PRESENT", true];
_cam setTriggerStatements ["this", "[] execVM 'gcam\gcam.sqf'",""];