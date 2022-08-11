private ["_pos", "_dir", "_classes", "_side"];
_pos = _this select 0;
_dir = _this select 1;
_classes = _this select 2;
_side = _this select 3;

private ["_count", "_road", "_roads"];
_count = count _classes;
_road = (_pos nearRoads 20) select 0;
_roads = [_road, _count, true] call NEO_fnc_convoyGetRoads;

private ["_vehicles", "_grp"];
_vehicles = [];
_grp = createGroup _side;

{
	private ["_position", "_class", "_list", "_vehicle"];
	_position = getPosATL _x;
	_class = _classes select _forEachIndex;
	_list = [_position, _dir, _class, _grp] call BIS_fnc_spawnVehicle;
	_vehicle = _list select 0;
	
	//Store
	_vehicles set [count _vehicles, _vehicle];
	
	//Vehicle variable
	_vehicle setVariable ["NEO_convoyVehicle", true];
	
} forEach _roads;

//Return vehicles List in order from first to last
private ["_radius", "_newList", "_relPos", "_nearestObjects"];
_radius = count _vehicles * 50;
_newList = [];
_relPos = [_pos, _radius, _dir] call BIS_fnc_relPos; _relPos set [2, 0];
_nearestObjects = nearestObjects [_relPos, ["LandVehicle"], _radius*2];

{
	if (!isNil { _x getVariable "NEO_convoyVehicle" }) then
	{
		_newList set [count _newList, _x];
	};
} forEach _nearestObjects;

//Return vehicles and Crew's Group
[_newList, _grp];
