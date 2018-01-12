private _zeusUsers = [
	// [CuratorModuleName]
	[Teal],
	[Buda],
	[Steel],
	[Arrow],
	[Joram],
	[Seagull],
	[Tub]
];

{
		_x params ["_CuratorModuleName"];

		if (isServer) then
		{
			[_CuratorModuleName, true] execVM "scripts\ADV_zeus\ADV_zeus.sqf";
		};
} forEach _zeusUsers;
