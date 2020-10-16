params ["", "", ["_titleText", []], ["_blendOut", -1], ["_blendIn", -1]];

systemChat "BLEND";
systemChat str _this;
systemChat format ["               %1, %2, %3", _titleText, _blendOut, _blendIn];

if (_blendOut >= 0) then {
    cutText ["", "BLACK OUT", _blendOut];
} else {
	_blendOut = 0;
};

[{
	params ["_titleText", "_blendIn"];
	_titleText params ["_titleTextType"];

	switch (_titleTextType) do {
		case "PLAIN": {
			_titleText params ["", "_text"];
			_text call BIS_fnc_titleText;
		};
		case "DYNAMIC": {
			_titleText params ["", "_text", "_x", "_y", "_duration", "_fadeInTime", "_deltaY", "_rscLayer"];

			[_text, _x, _y, _duration, _fadeInTime, _deltaY, _rscLayer] spawn BIS_fnc_dynamicText;
		};
		case "TYPETEXT": {
			_titleText params ["", "_text"];

			[_text] spawn BIS_fnc_typeText;
		};
		case "TYPETEXT2": {
			_titleText params ["", "_text"];

			[_text] spawn BIS_fnc_typeText2;
		};
		case "INFOTEXT": {
			_titleText params ["", "_text"];
			[_text ] spawn BIS_fnc_infoText;
		};
	};

	if (_blendIn >= 0) then {
		cutText ["", "BLACK OUT", _blendIn];
	} else {
		_blendIn = 0;
	};

}, [_titleText, _blendIn], _blendOut] call CBA_fnc_waitAndExecute;