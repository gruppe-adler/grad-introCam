//#include "script_component.hpp"

/*

	SHOT TYPES:

	["MOVE", duration, pos, target, fov (optional), offset (optional), commitTime (optional)],
	["ATTACH", duration, pos1, pos2, target1, target2, duration, fov1, fov2, offset (optional)],
	["ROTATE", duration, target, startingAngle, endAngle, "", duration, "", "", "", "", "", "", radius, clockwise (optional), rise (optional)]

* CAM PARAMETERS:
* Positions <OBJECT / POSITION>
* Target <OBJECT / POSITION>
* Zoom Factor <NUMBER> (default: 1)
* Show Borders <BOOLEAN> (default: true)
* Fade <STRING> (default: "")
* Fade Time <NUMBER> (default: 1)
* Fade Text <STRING> (default: "")
* Camera Effect <STRING> (default: "internal")
* Camera Effect Type <STRING> (default: "BACK")
*/

private _shotDefinitions = [(missionConfigFile >> "introCam" >> "shotDefinitions"), "Array", []] call CBA_fnc_getConfigEntry;

if (_shotDefinitions isEqualTo []) exitWith {};

[_shotDefinitions] call GRAD_introCam_fnc_addShot;

if (([(missionConfigFile >> "introCam" >> "playOnStart"), "Number", 1] call CBA_fnc_getConfigEntry) == 1) then {
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
