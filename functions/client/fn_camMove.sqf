//#include "script_component.hpp"

params ["_camera", "_args"];
_args params [
	"",
	"_duration",
	"_camPos1",
	"_camPos2",
	"_target1",
	"_target2",
	["_zoom1", 1],
	["_zoom2", 1],
	["_offset1", [0,0,0]],
	["_offset2", [0,0,0]]
];

diag_log str _this;

if !(_camPos1 isEqualType []) then {
	_camPos1 = [_camPos1] call GRAD_introCam_fnc_getPos;
};

if !(_camPos2 isEqualType []) then {
	_camPos2 = [_camPos2] call GRAD_introCam_fnc_getPos;
};

if !(_target1 isEqualType []) then {
	_target1 = [_target1] call GRAD_introCam_fnc_getPos;
};
if !(_target2 isEqualType []) then {
	_target2 = [_target2] call GRAD_introCam_fnc_getPos;
};

diag_log format ["%1, %2, %3, %4", _camPos1, _camPos2, _target1, _target2];

_camPos1 = _camPos1 vectorAdd _offset1;
_camPos2 = _camPos2 vectorAdd _offset2;

// pos 1 - starting point
_camera camSetPos _camPos1;
_camera camSetTarget _target1;
_camera camSetFov _zoom1;
_camera camCommit 0;

// pos 2 - where camera is moving next - target2
_camera camSetPos _camPos2;
_camera camSetTarget _target2;
_camera camSetFov _zoom2;
_camera camCommit _duration;
