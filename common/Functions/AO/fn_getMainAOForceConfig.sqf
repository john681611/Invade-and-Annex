private _forceConfig = createHashMapFromArray [
		["MBT", 2],
		["AAA", 1],
		["IFV", 3],
		["AAGroup",1],
		["ATGroup",2],
		["reconGroup",1],
		["mainGroup", 8],
		["Car", 4]];
private _playerCount = count allPlayers;

switch true do {
    case (_playerCount < 3): { _forceConfig = createHashMapFromArray [
		["IFV", ([0,1] call BIS_fnc_randomInt)],
		["ATGroup", ([0,1] call BIS_fnc_randomInt)],
		["mainGroup", 5],
		["Car", 3]];};
    case (_playerCount < 5): { _forceConfig = createHashMapFromArray [
		["IFV", ([1,2] call BIS_fnc_randomInt)],
		["ATGroup", ([1,2] call BIS_fnc_randomInt)],
		["AAGroup", ([0,1] call BIS_fnc_randomInt)],
		["mainGroup", 7],
		["Car", 4]];};
};

_forceConfig;
