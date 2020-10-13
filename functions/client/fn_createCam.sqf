//#include "script_component.hpp"

params ["", "", "_pos", "_target", ["_zoom", 1], ["_showBorders", "true"], ["_fade", ""], ["_fadeTime", 1], ["_fadeText", ""], ["_effectCam", "internal"], ["_effectCamType", "BACK"]];

if (isNil _pos) exitWith {};

switch (typeName _pos) do {
    case "ARRAY": {
        _pos = getPosATL _pos;
    };
    case "ARRAY": {
        _pos = getPosATL _pos;
    };
};

if (!(_target isEqualType []) && {!(isNil _target)}) then {
	_target = getPosATL (missionNamespace getVariable [_target, -1]);
};

private _camera = "camera" camCreate _pos;
if (_showBorders == "true") then {
    showCinemaBorder true;
}else{
    showCinemaBorder false;
};
_camera cameraEffect [_effectCam, _effectCamType];
_camera camCommand "inertia on";
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom;
_camera camCommit 0;

if (_fade != "") then {
    cutText [_fadeText, _fade, _fadeTime];
};

_camera
