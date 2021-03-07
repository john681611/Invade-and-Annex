private _AOMark = [] call IA_fnc_getMainAO;
//TODO Task Create
private _faction = "OPF_F";
[_AOMark, createHashMapFromArray [["mainGroup", 5], ["Car", 3], ["turret", 2]], _faction] call IA_fnc_spawnAO;
[_AOMark, _faction] call SEC_fnc_officer;
_AOMark call IA_fnc_setupMainAOTrig;