#include "script_component.hpp"

private _jip = [(missionConfigFile >> "IntroCam" >> "allowForJIP"), "text", 0] call CBA_fnc_getConfigEntry;
private _code = compile ([(missionConfigFile >> "IntroCam" >> "code"), "text", ""] call CBA_fnc_getConfigEntry);

if((_jip == 0) && {didJIP}) exitWith {};

STHud_UIMode = 0;


private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

while {count _camShots > 0} do {
    _camShots params ["_shot"];
    _shot params ["_type",
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

    switch (_type) do {
        case "FREE": {
    		// posStart, posEnd
    		[_start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camFree;
    	};

    	case "ATTACHED": {
    		// posStart, posEnd
    		[_start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2] call GRAD_introCam_fnc_camAttached;
    	};

    	case "ROTATE": {
    		// angleStart, angleEnd
    		[_start, _end, _target1, _target2, _duration, _transition, _zoom1, _zoom2, _offset1, _offset2, _radius, _cclockwise] call GRAD_introCam_fnc_camRotate;
    	};
    	default {};
    };

    _camShots deleteAt 0;
};

missionNamespace setVariable ["GRAD_INTROCAM_DONE", true];
