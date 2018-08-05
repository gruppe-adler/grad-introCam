// by ALIAS, modified by nomisum

params ["_shot", "_index"];

_shot params ["_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]], ["_isRotation", false], ["_angle",1], ["_radius",100], ["_cclockwise", false]];

private _isLastShot = _index isEqualTo (count (missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []]));

if (_isRotation) then {
	[_campos1, _campos2, _target, _duration, _zoom1, _zoom2, _offset, _angle, _radius, _cclockwise] call GRAD_introCam_fnc_camRotate;
} else {
	if (_isAttached) then {
		[_campos1, _campos2, _target, _duration, _zoom1, _zoom2, _offset] call GRAD_introCam_fnc_camAttached;
	} else {
		[_campos1, _campos2, _target, _duration, _zoom1, _zoom2, _offset] call GRAD_introCam_fnc_camFree;
	};	
};

if (_isLastShot) then {
	missionNamespace setVariable ["GRAD_INTROCAM_DONE", true];
};