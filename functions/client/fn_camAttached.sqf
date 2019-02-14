#include "script_component.hpp"
params ["_camera", "_object", "_target1", "_target2", "_duration", "_zoom1", "_zoom2", ["_offset",[0,0,0]]];

_offset params ["_offsetX", "_offsetY", "_offsetZ"];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPos _campos1;
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
	[_camera, _target2, _zoom2]
	_duration
] call CBA_fnc_waitAndExecute;
