#include "script_component.hpp"
/*

	SHOT TYPES:

	["MOVE", pos1, pos2, target1, target2, duration, fov1, fov2, offset (optional)],
	["ATTACH", pos1, pos2, target1, target2, duration, fov1, fov2, offset (optional)],
	["ROTATE", startingAngle, endAngle, target, "", duration, "", "", "", "", "", "", radius, clockwise (optional), rise (optional)]

* CAM PARAMETERS:
* Positions <OBJECT / POSITION>
* Target <OBJECT / POSITION>
* Zoom Factor <NUMBER> (default: 1)
* Show Borders <BOOLEAN> (default: true)
* Black Over <BOOLEAN> (default: true)
* Black Over Time <NUMBER> (default: 1)
* Camera Effect <STRING> (default: "internal")
* Camera Effect Type <STRING> (default: "BACK")
*/

if (!isServer) exitWith {};

private _shotDefinitions = [

];

private _cameraDefinitions = [

];

/////// dont edit below
[_shotDefinitions, _cameraDefinitions] call GRAD_introCam_fnc_addShot;
