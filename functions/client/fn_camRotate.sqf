params ["_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_offset", "_angle", "_radius"];
_offset params ["_offsetX", "_offsetY", "_offsetZ"];

diag_log ["rotation: %1 + %2", _angle, _radius];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPos _campos1;
};

private _timeBegin = time;

_camera = "camera" camCreate _campos1;
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom1;
_camera camCommitPrepared 0;

while {time - _timeBegin < _duration} do {
 	private _targetPos = if (_target isEqualType []) then {_target} else {getPos _target};

    private _coords = _targetPos getPos [_radius,_angle];
    _coords set [2, _offsetZ];

    _camera camPreparePos _coords;
    _camera camCommitPrepared 0.01;

    waitUntil {camCommitted _camera};

    _angle = if (_dir == 0) then {_angle - 1} else {_angle + 1};
};