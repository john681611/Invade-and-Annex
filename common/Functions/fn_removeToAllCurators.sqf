/*
author: stanhope, AW community member.
description: Adds given param as an editable object to all curators
*/

if (!isServer) exitWith {
    _this remoteExec ["IA_fnc_removeToAllCurators", 2];
};

params ["_toAdd"];
    
{_x removeCuratorEditableObjects [_toAdd, true];} forEach allCurators;
