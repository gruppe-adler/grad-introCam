#include "script_component.hpp"
params ["_definitions"]; // pun intended

if (!isServer) exitWith {};

private _camShots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

{
    _camShots pushBack _x;
}forEach _definitions;

missionNamespace setVariable ["GRAD_INTROCAM_SHOTS", _camShots, true];
