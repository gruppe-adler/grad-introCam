#include "script_component.hpp"

["CBA_loadingScreenDone", {
    if (isNull (getAssignedCuratorLogic ace_player)) then {
        private _waitCondition = {time > (_this + 3)};

        [_waitCondition,{
            [] remoteExec ["GRAD_introCam_fnc_play", [0,-2] select isDedicated, false];
        },time] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_addEventHandler;
