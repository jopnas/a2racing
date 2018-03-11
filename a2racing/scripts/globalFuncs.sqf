fnc_stringReplace = {
	private["_string","_replace","_with","_quoteUnicode","_newString"];

	_string = _this select 0;
	_replace = _this select 1;
	_with	= _this select 2;
	_quoteUnicode = ((toArray(_replace)) select 0);

	_stringArr = toArray(_string);

	for [{_i = 0},{_i < count _stringArr},{_i = _i + 1}] do {
		if ((_stringArr select _i) == _quoteUnicode) then {
			_stringArr set [_i, toArray(_with)];
		};
	};

	_newString = toString(_stringArr);
	_newString
};
