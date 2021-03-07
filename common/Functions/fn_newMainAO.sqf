private _AOMark = [] call IA_fnc_getMainAO;
[_AOMark, createHashMapFromArray [["mainGroup", 5], ["Car", 3], ["turret", 2]]] call IA_fnc_spawnAO;
_AOMark call IA_fnc_setupMainAOTrig;