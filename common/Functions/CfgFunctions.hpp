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
		class spawnForce{};
		class enableFOB{};
		class teleport{};
		class teleport_add_action{};
	};

	class AO 
	{
		file = "Functions\AO";
		class getMainAO {};
		class getSideAO{};
		class setupMainAOTrig {};
		class newMainAO{};
		class newSideAO{};
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

class BT
{
	tag = "BT";
	class script
	{
		file = "Functions\Briefingtable";
		class clearTable {};
		class createTable {};
		class createBlock {};
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

class SIDE
{
	tag = "SIDE";
	class script
	{
		file = "Functions\AO\Side";
		class officer {};

	};
};