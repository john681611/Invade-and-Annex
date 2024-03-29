class IA
{
	tag = "IA";
	class script
	{
		file = "Functions";
		
		class addToAllCurators {};
		class removeToAllCurators {};
		class clearState{};
		class enableFOB{};
		class getUnits {};
		class getUnitsFromConfigGroup {};
		class hideInBuilding {};
		class retreatToNextAO{};
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
		class getSideAOForceConfig{};
		class getSideAO{};
		class newMainAO{};
		class newSideAO{};
		class setupMainAOTrig {};
	};

	class PLAYER
	{
		file = "Functions\player";
		class runMarker{};
		class vehicleMarker{};
	}
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

class SEC
{
	tag = "SEC";
	class script
	{
		file = "Functions\AO\Secondary";
		class officer {};
		class cache {};
		class ewDestroy {};
		class hq {};
		class radioTower {};
		class vehicles {};
		class minefield{};
		class freeHostages{};
		class capOfficer{};
		class savePilot{};
	};
};

class COMP
{
	tag = "COMP"
	class script
	{
		file = "Compositions";
		class minefield{}
	}
}