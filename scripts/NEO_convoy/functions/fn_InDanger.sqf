if (isNil { NEO_convoy }) exitWith {};

private ["_vehicle"];
_vehicle = _this select 0;

private ["_list", "_vehicles", "_speed", "_maxDist", "_safeDistance", "_minVehicleDist", "_maxVehicleDist", "_exitOnDanger", "_inDanger"];
_list = NEO_convoy;
_vehicles = _list select 0;
_speed = _list select 1;
_maxDist = _list select 2;
_safeDistance = _list select 3;
_minVehicleDist = _list select 4;
_maxVehicleDist = _list select 5;
_exitOnDanger = _list select 6;
_inDanger = _list select 7;

if (!_inDanger && _vehicle in _vehicles) then
{
	//Update List
	_list set [7, true];
	NEO_convoy = _list;
	publicVariable "NEO_convoy";
	
	[] spawn 
	{
		private ["_delay"];
		_delay = 30 + random 60;
		
		//InDanger Time
		sleep _delay;
		
		//Update List
		NEO_convoy set [7, false];
		publicVariable "NEO_convoy";
	};
};
