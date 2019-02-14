#include "script_component.hpp"

private _jip = [(missionConfigFile >> "IntroCam" >> "allowForJIP"), "text", 0] call CBA_fnc_getConfigEntry;

if((_jip == 0) && {didJIP}) exitWith {};

STHud_UIMode = 0;


private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];
private _camSettings = missionNamespace getVariable ["GRAD_INTROCAM_CAMERADEFINITIONS", []];
private _countCamSettings = count _camSettings;
private _shotNumber = 0;
private _cam = "";

while {count _camShots > 0} do {
    _camShots params ["_shot"];
    _shot params [
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
        ["_cclockwise", false]
    ];

    _shotNumber = _shotNumber +1;
    if ((_countCamSettings >= _shotNumber) && {!((_camSettings select _shotNumber) isEqualTo [])}) then {
        [_start vectorAdd _offset1, _target1, _zoom1] call GRAD_introCam_fnc_createCam;
    };


    switch (_type) do {
        case "FREE": {
    		// posStart, posEnd
    		[_cam, _start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camFree;
    	};

    	case "ATTACHED": {
    		// posStart, posEnd
    		[_cam, _start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camAttached;
    	};

    	case "ROTATE": {
    		// angleStart, angleEnd
    		[_cam, _start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2, _radius, _cclockwise] call GRAD_introCam_fnc_camRotate;
    	};
    	default {};
    };

    _camShots deleteAt 0;
};

missionNamespace setVariable ["GRAD_INTROCAM_DONE", true];
