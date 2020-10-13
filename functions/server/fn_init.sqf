//#include "script_component.hpp"

if !(isServer) exitWith {};

private _shotDefinitions = [(missionConfigFile >> "missionSettings" >> "userIntro" >> "shotDefinitions"), "Array", []] call CBA_fnc_getConfigEntry;

if (_shotDefinitions isEqualTo []) exitWith {};

[_shotDefinitions] call GRAD_introCam_fnc_addShot;

if (([(missionConfigFile >> "missionSettings" >> "userIntro" >> "playOnStart"), "Number", 1] call CBA_fnc_getConfigEntry) == 1) then {
    ["CBA_loadingScreenDone", {
        if (isNull (getAssignedCuratorLogic ace_player)) then {
            [
                {time > _this},
                {
                    [] remoteExec ["GRAD_introCam_fnc_play", [0,-2] select isDedicated, false];
                },
                (time + 3)
                ] call CBA_fnc_waitUntilAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};
