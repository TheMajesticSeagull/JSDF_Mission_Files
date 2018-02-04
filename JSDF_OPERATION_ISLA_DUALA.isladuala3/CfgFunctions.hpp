class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class vehInitFncs
        {
            file = "functions\LVR";
            class vehRespawn      	  {};
            class hunterInit          {};
            class littlebirdInit      {};
        };
        class functions {
            file = "functions";
            class supplyBoxAmmo;
            class supplyBoxMedical;
            class supplyBoxVehicle;
            class supplyBoxController;
            class arsenalBoxInit;
            class infoBriefing;
        };
    };
};
