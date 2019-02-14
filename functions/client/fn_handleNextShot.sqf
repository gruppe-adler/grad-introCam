params ["_camShots", "_camSettings", "_countCamSettings", "_shotNumber", "_cam"];

if (count _camShots == 0) exitWith {
    missionNamespace setVariable ["GRAD_INTROCAM_DONE", true];
};

(_camShots select 0) params [
    "_type",
    "_start",
    "_end",
    "_target1",
    "_target2",
    "_duration",
    "_transition",
    "_zoom1",
    "_zoom2",
    ["_offset1",[0,0,0]],
    ["_offset2",[0,0,0]],
    ["_angle",1],
    ["_radius",100],
    ["_clockwise", false],
    ["_rise", 0]
];
_camShots deleteAt 0;

_shotNumber = _shotNumber +1;
if ((_countCamSettings >= _shotNumber) && {!((_camSettings select _shotNumber) isEqualTo [])}) then {
    [_start vectorAdd _offset1, _target1, _zoom1] call GRAD_introCam_fnc_createCam;
};

private _waitCondition = nil;

switch (_type) do {
    case "MOVE": {
    	// posStart, posEnd
    	[_cam, _start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camFree;
    };

    case "ATTACH": {
    	// posStart, posEnd
    	[_cam, _start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camAttached;
    };

    case "ROTATE": {
    	[_cam, _target, _start, _end, _duration, _radius, _clockwise, _rise] call GRAD_introCam_fnc_camRotate;
        _waitCondition = {!(isNil "GRAD_introCam_camRotateFinish") && {GRAD_introCam_camRotateFinish}};
    };
    default {};
};

if (isNil "_waitCondition") then {
    [
        {
            _this call GRAD_introCam_fnc_handleNextShot;
        },
        [_camShots, _camSettings, _countCamSettings, _shotNumber, _cam],
        (_duration + 0.01)
    ] call CBA_fnc_waitAndExecute;
}else{
    [
        _waitCondition,
        {
            _this call GRAD_introCam_fnc_handleNextShot;
        },
        [_camShots, _camSettings, _countCamSettings, _shotNumber, _cam],
        (_duration + 1),
        {
            _this call GRAD_introCam_fnc_handleNextShot;
        }
    ] call CBA_fnc_waitUntilAndExecute;
};
