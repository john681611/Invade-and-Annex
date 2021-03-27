params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
for "_i" from 1 to (random 3) do {
	private _veh = [_AOMarker,([_faction, selectRandom ["car","AAA","IFV","MBT","Arty"]] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
	_veh forceFlagTexture "\A3\Data_F\Flags\Flag_red_CO.paa";
	_spawnedUnits pushBack _veh;
};
[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];
[west, [format["%1-veh",_AOMark], format["%1-main",_AOMark]], ["Destroy the prototype units they have improved systems. They're marked by red flags.", "Destroy Special Units"], (getMarkerPos _AOMarker) ,1, 2, true, "car"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  {alive _x} count _spawnedUnits == 0};

[format["%1-veh",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
