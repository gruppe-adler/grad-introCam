params ["_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_offset"];
_offset params ["_offsetX", "_offsetY", "_offsetZ"];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPos _campos1;
};

if (typeName _campos2 isEqualTo "OBJECT") then {
	_campos2 = getPos _campos2;
};

_camera = "camera" camCreate _campos1;
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom1;
_camera camCommitPrepared 0;

// poz 2 - where camera is moving next - target2
_camera camPreparePos _campos2;
_camera camPrepareTarget _target;
_camera camPrepareFOV _zoom2;
_camera camCommitPrepared _duration;
sleep _duration;