class IA
{
	tag = "IA";
	class script
	{
		file = "Functions";
		
		class getUnits {};
		class getUnitsFromConfigGroup {};
		class spawnUnit {};
		class spawnVehicle {};
		class spawnGroup {};
		class addToAllCurators {};
	};

	class AO 
	{
		file = "Functions\AO";
		class getMainAO {};
		class spawnAO {};
		class setupMainAOTrig {};
		class newMainAO;
	};
};

class CBAEXT
{
	tag = "CBAEXT";
	class script
	{
		file = "Functions\CBAEXT";
		class taskDefend {};
		class taskPatrol{};
		class addWaypoint{};

	};
};

class SEC
{
	tag = "SEC";
	class script
	{
		file = "Functions\AO\Secondary";
		class officer {};

	};
};