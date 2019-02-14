//#include "script_component.hpp"
params ["_shotDefinitions"];

if (!isServer) exitWith {};

private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

{
    _camShots pushBack _x;
}forEach _shotDefinitions;

missionNamespace setVariable ["GRAD_INTROCAM_SHOTS", _camShots, true];
