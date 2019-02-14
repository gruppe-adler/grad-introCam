#include "script_component.hpp"
/*

	SHOT TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), clockwise (bool)]

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
