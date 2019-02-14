#include "script_component.hpp"
params ["_shotDefinitions", "_cameraDefinitions"];

if (!isServer) exitWith {};

private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

{
    _camShots pushBack _x;
}forEach _shotDefinitions;

missionNamespace setVariable ["GRAD_INTROCAM_SHOTS", _camShots, true];

private _camDefinitions = missionNamespace getVariable ["GRAD_INTROCAM_CAMERADEFINITIONS", []];

{
    _camDefinitions pushBack _x;
}forEach _cameraDefinitions;

missionNamespace setVariable ["GRAD_INTROCAM_CAMERADEFINITIONS", _camDefinitions, true];
