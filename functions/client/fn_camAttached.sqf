//#include "script_component.hpp"

params ["_camera", "_args"];
_args params ["", "_duration", "_object", "_target",["_zoom", 1], ["_offset",[0,0,0]]];

if (_target isEqualType objNull) then {
	_target = getPos _target;
};

_camera attachTo [_object, _offset];
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom;
_camera camCommitPrepared 0;

[
	{
		detach _this;
	},
	_camera,
	_duration
] call CBA_fnc_waitAndExecute;
