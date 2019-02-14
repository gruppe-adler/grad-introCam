//#include "script_component.hpp"

params ["_camera", "_args"];
_args params ["", "_duration", "_object", "_target1", "_target2", ["_zoom1", 1], ["_zoom2", 1], ["_offset",[0,0,0]]];

diag_log str _this;

if !(_object isEqualType []) then {
	_object = missionNamespace getVariable [_object, -1];
};

if !(_target1 isEqualType []) then {
	_target1 = [_target1] call GRAD_introCam_fnc_getPos;
};

if !(_target2 isEqualType []) then {
	_target2 = [_target2] call GRAD_introCam_fnc_getPos;
};

_cam attachTo [_object, _offset];
_camera camPrepareTarget _target1;
_camera camPrepareFOV _zoom1;
_camera camCommitPrepared 0;

[
	{
		params ["_camera", "_target2", "_zoom2"];
		detach _camera;
		_camera camPrepareTarget _target2;
		_camera camPrepareFOV _zoom2;
		_camera camCommitPrepared 0;
	},
	[_camera, _target2, _zoom2],
	_duration
] call CBA_fnc_waitAndExecute;
