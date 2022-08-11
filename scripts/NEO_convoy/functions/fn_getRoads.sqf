private ["_road", "_count", "_debug", "_roadPool"];
_road = _this select 0;
_count = round (_this select 1);
_debug = if (count _this > 2) then { _this select 2 } else { false };
_roadPool = [_road];

//Get connected roads
for [{ _i = 0 },{ count _roadPool < _count && _i < _count * 10 },{ _i = _i + 1 }] do
{
	private ["_newRoads"];
	_newRoads = roadsConnectedTo _road;
	
	{
		private ["_currentRoad"];
		_currentRoad = _x;
		
		if 
		(
			!(_currentRoad in _roadPool)
			&&
			count _roadPool < _count
		)
		then
		{
			_roadPool set [count _roadPool, _currentRoad];
			_road = _currentRoad;
		};
	} forEach _newRoads;
};

if (_debug) then
{
	{
		private ["_mkr"];
		_mkr = createMarkerLocal [format ["NEO_road_%1", position _x], position _x];
		_mkr setMarkerTypeLocal "mil_dot";
		_mkr setMarkerColorLocal "ColorBlack";
		
	} forEach _roadPool;
};

_roadPool;
