#include "script_component.hpp"
params [
	"_camera"
	"_camPos1",
	"_camPos2",
	"_target1",
	"_target2",
	"_duration",
	"_transition",
	"_zoom1",
	"_zoom2",
	"_offset1",
	"_offset2"
];

if (typeName _camPos1 isEqualTo "OBJECT") then {
	_camPos1 = getPosASL _camPos1;
};

if (typeName _camPos2 isEqualTo "OBJECT") then {
	_camPos2 = getPosASL _camPos2;
};

_camPos1 = _camPos1 vectorAdd _offset1;
_camPos1 = _camPos2 vectorAdd _offset2;

// pos 1 - starting point
_camera camPreparePos _camPos1;
_camera camPrepareTarget _target1;
_camera camPrepareFOV _zoom1;
_camera camCommitPrepared 0;

// pos 2 - where camera is moving next - target2
_camera camPreparePos _camPos2;
_camera camPrepareTarget _target2;
_camera camPrepareFOV _zoom2;

_camera camCommitPrepared _duration;
