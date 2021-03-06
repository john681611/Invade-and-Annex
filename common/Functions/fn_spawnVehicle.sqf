params ["_AOMarker", "_vehType"];

private _veh = [_AOMarker, _vehType] call IA_fnc_spawnUnit;
private _grp = createGroup east;
createVehicleCrew _veh;
(crew _veh) join _grp;
_veh allowCrewInImmobile true;

_veh;