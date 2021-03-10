# Side Objectives

## Params Given Params

     params ["_AOMarker", "_faction"];       
    
## Returns

When Secondary objective is complete use something like this:

    waitUntil { sleep 10;  (count list mainMissionTreshold) < 9;};

## Spawning

* Don't write your own custom spawning functions use the ones given. For a general force to defend the area use:
        [_AOMark, _forceConfig, _faction] call IA_fnc_spawnForce;
* Unless its a specific unit pull groups or units from:

        [_faction, "Car"] call IA_fnc_getUnits;
* If you need a array of infanty units not a group config **DON'T HARD CODE IT** use this:

        (([_faction, "mainGroup"] call IA_fnc_getUnits) call IA_fnc_getUnitsFromConfigGroup;