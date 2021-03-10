private _AOMark = [] call IA_fnc_getSideAO;
private _faction = "OPF_F";
[_AOMark, _faction] call SIDE_fnc_officer;// TODO Select random

//TODO CLeanup Func
[] spawn IA_fnc_newSideAO;