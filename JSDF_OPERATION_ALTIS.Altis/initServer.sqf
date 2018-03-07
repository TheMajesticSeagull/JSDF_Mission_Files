//removes corpse after disconnect.

addMissionEventHandler ["HandleDisconnect", {
    deleteVehicle (_this select 0);
}];

hint "ThisShitShouldBreak"
