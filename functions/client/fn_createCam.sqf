params ["_pos", "_target", ["_zoom", 1], ["_showBorders", true], ["_effectCam", "internal"], ["_effectCamType", "BACK"]];

private _camera = "camera" camCreate _pos;
showCinemaBorder _showBorders;
_camera cameraEffect [_effectCam, _effectCamType];
_camera camCommand "inertia on";
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom;
_camera camCommitPrepared 0;

_camera
