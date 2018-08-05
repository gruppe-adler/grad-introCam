// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]], "_isRotation", "_angle", "_radius"
private _definitions = [
	[cam1, cam2, target1, 9, 0.3, 0.1, true, [0,0,1]],
	[cam2, cam3, target1, 3, 0.1, 0.1, true, [0,0,5]],
	[cam4, cam5, target1, 2, 0.1, 0.1, true, [0,0,10]],
	[cam5, cam5, target2, 5, 0.1, 0.3, false, [0,0,50]],
	[cam5, cam5, target2, 3, 0.3, 0.3, false, [0,0,3]],
	[cam5, cam5, target2, 5, 0.3, 0.3, false, [0,0,10]],
	[cam5, cam5, target2, 9, 0.3, 0.1, false, [0,0,0], true, 1, 150]
];

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _definitions;