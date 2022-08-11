private ["_posEnd"];
_posEnd = _this;

private ["_list", "_vehicles"];
_list = NEO_convoy;
_vehicles = _list select 0;

{
	_x doMove (_posEnd select 0);
} forEach _vehicles;

//Update
_list set [2, _posEnd];
NEO_convoy = _list;
publicVariable "NEO_convoy";
