#include "script_component.hpp"

private _jip = [(missionConfigFile >> "missionSettings" >> "userIntro" >> "allowForJIP"), "text", 0] call CBA_fnc_getConfigEntry;

if((_jip == 0) && {didJIP}) exitWith {};

STHud_UIMode = 0;
diwako_dui_main_toggled_off = true;

private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];
private _cam = objNull;

private _first = _camShots select 0;
if ((_first select 0) == "CAMERA") then {
    _cam = _first call GRAD_introCam_fnc_createCam;
    _camShots deleteAt 0;
}else{
    _cam = [[0,0,2],[0,0,0]] call GRAD_introCam_fnc_createCam;
};

[_camShots, _cam] call GRAD_introCam_fnc_handleNextShot;
