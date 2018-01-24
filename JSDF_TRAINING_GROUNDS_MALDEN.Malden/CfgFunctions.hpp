class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class vehInitFncs
        {
            file = "functions\LVR";
            class vehRespawn      	  {};
            class hunterInit          {};
            class littlebirdInit      {};
            class blackwaspInit       {};
            class buzzardInit         {};
            class wipeoutInit         {};
            class UAVInit             {};
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
