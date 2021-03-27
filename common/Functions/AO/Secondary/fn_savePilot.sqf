params ["_AOMarker", "_faction"]; 
private _unitList = [
	"B_Fighter_Pilot_F",
	"B_Helipilot_F",
	"B_Pilot_F",
	"B_T_Helipilot_F",
	"B_T_Pilot_F",
	"B_W_Helipilot_F"
]; //TODO move to getUnit
private _wreck = [_AOMarker,selectRandom [
	"Land_Wreck_Heli_Attack_01_F",
	"Land_Wreck_Heli_02_Wreck_01_F"
]] call IA_fnc_spawnVehicle;
private _localMarker = createMarker ["side", getPos _wreck];
_localMarker setMarkerSize [50,50];
_localMarker setMarkerShape "ELLIPSE";
_localMarker setMarkerBrush "Border";
_localMarker setMarkerColor "ColorRed";
private _kia = [_localMarker, selectRandom _unitList] call IA_fnc_spawnUnit;
_kia setDamage 1;
private _pilot = [_localMarker, selectRandom _unitList] call IA_fnc_spawnUnit;
removeallweapons _pilot;
_pilot setcaptive true;
_pilot disableAI "ALL";
_pilot switchMove "AinjPpneMstpSnonWrflDnon";
_pilot addAction ["Rescue", "(_this select 0) switchmove """"; (_this select 0) enableAI ""all""; [(_this select 0)] join group player;"];
[[_pilot, _kia, _wreck]] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-pilot",_AOMark], format["%1-main",_AOMark]], ["Rescue Downed Pilot", "Rescue Downed Pilot"], (getPos _pilot) ,1, 2, true, "heal"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  _pilot distance (getMarkerPos _AOMarker) > 1000 || !alive _pilot};

if(!alive _pilot) then {
	[format["%1-pilot",_AOMark],"FAILED"] call BIS_fnc_taskSetState;
} else {
	[format["%1-pilot",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
};
deleteMarker _localMarker;
deleteVehicle _pilot;
