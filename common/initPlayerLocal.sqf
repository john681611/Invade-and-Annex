addMissionEventHandler ["PreloadFinished", {preloadFinished = true;}];
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
[player, supportRequester] call BIS_fnc_addSupportLink;
[] spawn IA_fnc_runMarker;
[] execVM "Client\earplugs.sqf";	
