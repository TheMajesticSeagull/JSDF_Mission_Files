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
            class supplyBoxSpawn;
            class serviceVehicle;
            class safezone;
            class arsenalBoxInit;
        };
    };
};
