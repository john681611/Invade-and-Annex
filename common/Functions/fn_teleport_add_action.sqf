_act = _this addAction ["Teleport",IA_fnc_teleport, nil, 1.5, true, true, '', "alive _target && speed _target < 3", 10];
_this setUserActionText [_act,"Teleport","<img size='2' image='Media/Teleport.paa'/>"];
