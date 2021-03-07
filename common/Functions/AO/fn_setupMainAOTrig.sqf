params ["_AOMarker"];

private _radi = ((getMarkerSize _AOMarker) select 0) + 20;
mainMissionTreshold = createTrigger ["EmptyDetector", getMarkerPos _AOMarker];
mainMissionTreshold setTriggerArea [_radi, _radi, 0, false];
mainMissionTreshold setTriggerActivation ["EAST", "PRESENT", false];
mainMissionTreshold setTriggerStatements ["this","",""];


//TODO Side Triggers?
waitUntil { sleep 10;  (count list mainMissionTreshold) < 9;};

_AOMarker setMarkerAlpha 0.25;
_AOMarker setMarkerColor "colorGreen";

[format["%1-main",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;

sleep 10;
{
	_x setDamage 1;	
} forEach list mainMissionTreshold;
deleteVehicle mainMissionTreshold;

[] spawn IA_fnc_newMainAO;
