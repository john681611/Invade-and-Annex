class IA
{
	tag = "IA";
	class script
	{
		file = "Functions";
		
		class addToAllCurators {};
		class clearState{};
		class enableFOB{};
		class getUnits {};
		class getUnitsFromConfigGroup {};
		class spawnForce{};
		class spawnGroup {};
		class spawnUnit {};
		class spawnVehicle {};
		class teleport{};
		class teleport_add_action{};
	};

	class AO 
	{
		file = "Functions\AO";
		class getMainAO {};
		class getMainAOForceConfig{};
		class getSideAO{};
		class newMainAO{};
		class newSideAO{};
		class setupMainAOTrig {};
	};
};

class CBAEXT
{
	tag = "CBAEXT";
	class script
	{
		file = "Functions\CBAEXT";
		class addWaypoint{};
		class taskDefend {};
		class taskPatrol{};

	};
};

class BT
{
	tag = "BT";
	class script
	{
		file = "Functions\Briefingtable";
		class clearTable {};
		class createBlock {};
		class createTable {};
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