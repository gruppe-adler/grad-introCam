params ["_variable"];

private _return = missionNamespace getVariable [_variable, -1];
if (!(_return isEqualType -1) && {!(isNil _variable)}) then {
    _return = getPosATL _return;
}else{
    _return = call compile _variable;
};

diag_log str _return;

_return
