fnc_sortArray = {
	_array = _this select 0;

	_arraySorted = [];
	{
		_laptimeNumber = parseNumber _x;
		systemChat format["%1",_laptimeNumber];
	} forEach _array;
};