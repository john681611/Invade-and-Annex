params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _spawnedIntel = [];
private _veh = [_AOMarker, selectRandom ["Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V4_F"]] call IA_fnc_spawnVehicle;
_spawnedUnits pushBack _veh;
private _localMarker = createMarker ["side", getPos _veh];
_localMarker setMarkerSize [50,50];
_localMarker setMarkerShape "ELLIPSE";
_localMarker setMarkerBrush "Border";
_localMarker setMarkerColor "ColorRed";
intelFoundCount = 0;
//TODO Add intel to find in the in the in
private _intelOptions =  ["Intel_File1_F",
"Leaflet_05_F",
"Leaflet_05_New_F",
"Leaflet_05_Old_F",
"Leaflet_05_Stack_F",
"Intel_Photos_F",
"Intel_File2_F",
"Land_Wallet_01_F"];
for "_i" from 1 to (random 3) do {
	private _intel = [_localMarker, selectRandom _intelOptions] call IA_fnc_spawnVehicle;
	[getMarkerPos _localMarker, 50, [_intel]] call IA_fnc_hideInBuilding;
	[_intel] call BIS_fnc_initIntelObject;
	[
		_intel,
		"IntelObjectFound",
		{
			params ["", "_foundBy"];
			private _msg = format ["Intel found by %1", name _foundBy];
			_msg remoteExec ["systemChat", 0];
			intelFoundCount = intelFoundCount + 1;
		}
	] call BIS_fnc_addScriptedEventHandler;
	_spawnedUnits pushBack _intel;
	_spawnedIntel pushBack _intel;
};

private _group = [_localMarker,([_faction, "mainGroup"] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
		[_group, getMarkerPos _localMarker , 50, 1, 0, 0.8, true] call CBAEXT_fnc_taskDefend;
{
	_spawnedUnits pushBack _x;
} forEach (units _group);
[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-hq",_AOMark], format["%1-main",_AOMark]], ["Gather Intel from HQ", "Gather Intel"], (getPos _veh) ,1, 2, true, "search"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  intelFoundCount == count _spawnedIntel};
deleteMarker _localMarker;

[format["%1-hq",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
