params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker,([_faction, selectRandom ["car","AAA","IFV","MBT","Arty"]] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
_veh forceFlagTexture "\A3\Data_F\Flags\Flag_red_CO.paa";
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];
private _name = getText (configFile >> "cfgVehicles" >> typeOf _veh >> "displayName");
//TODO Something Special Armour?/Skill?
[west, [format["%1-veh",_AOMark], format["%1-main",_AOMark]], [format["Destroy the prototype %1 is has improved systems. It's marked by a red flag.",_name], "Destroy Special Units"], (getPos _veh) ,1, 2, true, "car"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  !alive _veh};

[format["%1-veh",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
