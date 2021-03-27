private _forceConfig = createHashMapFromArray [
		["reconGroup",2],
		["mainGroup", 1],
		["Car", 2]];
private _playerCount = count allPlayers;

switch true do {
    case (_playerCount < 3): { _forceConfig = createHashMapFromArray [
		["reconGroup",1],
		["Car", 1]];};
    case (_playerCount < 5): { _forceConfig = createHashMapFromArray [
		["reconGroup",2],
		["Car", 1]];};
};

_forceConfig;
