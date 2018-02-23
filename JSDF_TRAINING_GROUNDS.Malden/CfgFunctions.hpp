class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class vehInitFncs
        {
            file = "functions\LVR";
            class vehRespawn {};
            class basicVehicleInit {};
            class blackwaspInit {};
            class UAVInit {};
        };
        class functions {
            file = "functions";
            class supplyBoxAmmo;
            class supplyBoxMedical;
            class supplyBoxVehicle;
            class supplyBoxController;
            class serviceVehicle;
            class safezone;
            class arsenalBoxInit;
            class infoBriefing;
        };
    };
};
