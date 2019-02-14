#include "script_component.hpp"
params ["_campos1", "_object", "_target1", "_target2", "_duration", "_zoom1", "_zoom2", ["_offset",[0,0,0]]];

_offset params ["_offsetX", "_offsetY", "_offsetZ"];

if (typeName _campos1 isEqualTo "OBJECT") then {
	_campos1 = getPos _campos1;
};
