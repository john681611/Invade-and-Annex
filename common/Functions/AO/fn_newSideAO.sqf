private _AOMark = [] call IA_fnc_getSideAO;
private _faction = "OPF_F";
//TODO SEE if as laggy on server
[SideTable, _AOMark, 30, 0.95, true] spawn BT_fnc_createTable;
[_AOMark, _faction] call SIDE_fnc_officer;// TODO Select random

//TODO CLeanup Func
[] spawn IA_fnc_newSideAO;