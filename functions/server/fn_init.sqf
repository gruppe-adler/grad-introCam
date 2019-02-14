#include "script_component.hpp"

[] call GRAD_introCam_fnc_shotDefinitions;

if (([(missionConfigFile >> "IntroCam" >> "playOnStart"), "Number", 1] call CBA_fnc_getConfigEntry) == 1) then {
    ["CBA_loadingScreenDone", {
        if (isNull (getAssignedCuratorLogic ace_player)) then {
            private _waitCondition = {time > (_this + 3)};

            [_waitCondition,{
                [] remoteExec ["GRAD_introCam_fnc_play", [0,-2] select isDedicated, false];
            },time] call CBA_fnc_waitUntilAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};
