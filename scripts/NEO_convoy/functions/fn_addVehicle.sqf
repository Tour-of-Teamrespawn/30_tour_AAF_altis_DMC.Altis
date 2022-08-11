private ["_vehicle", "_positionIt"];
_vehicle = _this select 0;
_positionIt = _this select 1;

private ["_list", "_vehicles", "_posEnd", "_last"];
_list = NEO_convoy;
_vehicles = _list select 0;
_posEnd = _list select 2;
_last = _vehicles select (count _vehicles - 1);

if (_positionIt) then
{
	private ["_size", "_dir", "_pos", "_height", "_rel"];
	_size = sizeOf typeOf _last + sizeOf typeOf _vehicle;
	_dir = getDir _last + 180;
	_pos = getPosASL _last;
	_height = _pos select 2;
	_rel = [_pos, _size, _dir] call BIS_fnc_relPos;
	_rel set [2, _height];
	
	//Position isFlatEmpty?
	_vehicle setDir getDir _last;
	_vehicle setPosASL _rel;
};

//Update
_vehicles set [count _vehicles, _vehicle];
_list set [0, _vehicles];
NEO_convoy = _list;
publicVariable "NEO_convoy";

private ["_back", "_front"];
_back = _vehicle;
_front = _vehicles select ((_vehicles find _back) - 1);

//Move to current EndPos
_back doMove (_posEnd select 0);

//Convoy Vehicle FSM - This will handle all back vehicles so they keep behind the one on front of them
[_back, _front] execFSM "scripts\NEO_convoy\fsms\convoy_flowVehicle.fsm";
