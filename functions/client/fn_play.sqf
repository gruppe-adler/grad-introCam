#include "script_component.hpp"

private _jip = [(missionConfigFile >> "IntroCam" >> "allowForJIP"), "text", 0] call CBA_fnc_getConfigEntry;

if((_jip == 0) && {didJIP}) exitWith {};

//STHud_UIMode = 0;

private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];
private _camSettings = missionNamespace getVariable ["GRAD_INTROCAM_CAMERADEFINITIONS", []];
private _countCamSettings = count _camSettings;
private _shotNumber = 0;
private _cam = "";

if (_camSettings isEqualTo []) then {

}else{
    (_camSettings select 0) call GRAD_introCam_fnc_createCam;
};

[_camShots, _camSettings, _countCamSettings, _shotNumber, _cam] call GRAD_introCam_fnc_handleNextShot;
