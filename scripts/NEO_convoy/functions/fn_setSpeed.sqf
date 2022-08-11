private ["_speed"];
_speed = _this;

private ["_list"];
_list = NEO_convoy;

//Update
_list set [1, _speed];
NEO_convoy = _list;
publicVariable "NEO_convoy";
