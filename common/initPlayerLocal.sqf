addMissionEventHandler ["PreloadFinished", {preloadFinished = true;}];
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
[player, supportRequester] call BIS_fnc_addSupportLink;
[] spawn IA_fnc_runMarker;
[] execVM "Client\earplugs.sqf";

player createDiaryRecord ["Diary", ["Settings & Keybinds", "
<br/>Click <execute expression = '[] spawn CHVD_fnc_openDialog;'>View Distance Settings.</execute>
<br/>Click <execute expression = '[] call outlw_MR_createDialog;'>Mag Repack</execute> (Ctrl+R)
<br/>Click <execute expression = '[] call toggle_earplugs;'>Toggle Earplugs</execute> (Pause/Break)
"]];
