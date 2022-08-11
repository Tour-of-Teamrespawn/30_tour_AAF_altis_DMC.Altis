private ["_vehicles", "_maxDist", "_safe"];
_vehicles = _this;
_maxDist = 0;
_safe = 20;

{
	private ["_bb", "_bbY"];
	_bb = boundingBox _x;
	_bbY = ((_bb select 1) select 1) * 2;
	
	_maxDist = _maxDist + (_bbY * 2) + _safe;
	
} forEach _vehicles;

_maxDist;
