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
            class supplyBoxSpawn;
            class serviceVehicle;
            class arsenalBoxInit;
        };
    };
};
