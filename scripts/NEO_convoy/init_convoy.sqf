if (!isNil { NEO_convoy }) exitWith {};
waitUntil { !isNil { BIS_fnc_init } };

//Load Functions
#include "init_functions.sqf"

private ["_posEnd", "_vehList", "_speed", "_exitOnDanger"];
_posEnd = _this select 0;
_vehList = _this select 1;
_speed = _this select 2;
_exitOnDanger = _this select 3;

private ["_convoy", "_vehicles", "_grp"];
_convoy = [];
_vehicles = [];
_grp = grpNull;

//Spawn Convoy?
if (typeName (_vehList select 0) != typeName objNull) then
{
	_convoy = [_vehList select 0, _vehList select 1, _vehList select 2, _vehList select 3, _vehList select 4] call NEO_fnc_convoySpawn;
	_vehicles = _convoy select 0;
	_grp = _convoy select 1;
}
else
{
	_vehicles = _vehList;
};

//Crew Behaviour
_vehicles call NEO_fnc_convoySetCrewBehaviour;

//Indanger Flag
private ["_inDanger"];
_inDanger = false;

//Min-Max Distances
private ["_maxDist", "_safeDistance", "_minVehicleDist", "_maxVehicleDist"];
_maxDist = _vehicles call NEO_fnc_convoyGetSize;
_safeDistance = _vehicles call NEO_fnc_convoyGetSafeDistance;
_minVehicleDist = _safeDistance select 0;
_maxVehicleDist = _safeDistance select 1;

//List
NEO_convoy = 
[
	_vehicles,
	_speed,
	_posEnd,
	_maxDist,
	_minVehicleDist,
	_maxVehicleDist,
	_exitOnDanger,
	_inDanger
];
publicVariable "NEO_convoy";

//Event Handlers
{
	_x addEventHandler ["Hit", { _this call NEO_fnc_convoyInDanger }];
	_x addEventHandler ["FiredNear", { _this call NEO_fnc_convoyInDanger }];
} forEach _vehicles;

//Convoy Main FSM - This will handle the distance from front to last vehicle and make the front go slower/faster depending on state
[] execFSM "scripts\NEO_convoy\fsms\convoy_flow.fsm";

//First && Last
private ["_first", "_last"];
_first = _vehicles select 0;
_last = _vehicles select (count _vehicles - 1);

//Vehicle Flow Start
for "_i" from 0 to (count _vehicles - 1) do
{
	private ["_front", "_back", "_driver"];
	_front = _vehicles select _i;
	_back = _vehicles select (_i + 1);
	_driver = driver _front;
	
	//Move to EndPos
	_driver doMove (_posEnd select 0);
	
	//Exit if no back vehicle
	if (isNil "_back") exitWith {};
	
	//Convoy Vehicle FSM - This will handle all back vehicles so they keep behind the one on front of them
	[_back, _front] execFSM "scripts\NEO_convoy\fsms\convoy_flowVehicle.fsm";
};

//Main Loop
while {true} do
{
	sleep 1;
	if (isNil { NEO_convoy }) exitWith {};
	
	private ["_list", "_vehicles", "_speed", "_posEnd", "_maxDist", "_safeDistance", "_minVehicleDist", "_maxVehicleDist", "_exitOnDanger", "_inDanger"];
	_list = NEO_convoy;
	_vehicles = _list select 0;
	_speed = _list select 1;
	_posEnd = _list select 2;
	_maxDist = _vehicles call NEO_fnc_convoyGetSize;
	_safeDistance = _vehicles call NEO_fnc_convoyGetSafeDistance;
	_minVehicleDist = _safeDistance select 0;
	_maxVehicleDist = _safeDistance select 1;
	_exitOnDanger = _list select 6;
	_inDanger = _list select 7;
	
	private ["_newVehicles"];
	_newVehicles = [];
	
	{
		if 
		(
			alive _x
			&&
			canMove _x
			&&
			alive driver _x
			&&
			fuel _x != 0
		)
		then
		{
			_newVehicles set [count _newVehicles, _x];
		}
		else
		{
			_x setVariable ["NEO_convoyVehicleLeave", true];
		};
	} forEach _vehicles;
	
	//Broadcast?
	private ["_broadcast"];
	_broadcast = false;
	
	//Update List?
	if (count _newVehicles != count _vehicles) then
	{
		_list set [0, _newVehicles];
		_list set [3, _maxDist];
		_list set [4, _minVehicleDist];
		_list set [5, _maxVehicleDist];
		
		NEO_convoy = _list;
		_broadcast = true;
	};
	
	//At an end position?
	if ((_newVehicles select 0) distance (_posEnd select 0) < 25) then
	{
		_posEnd set [0, "DELETE"];
		_posEnd = _posEnd - ["DELETE"];
		_list set [2, _posEnd];
		
		NEO_convoy = _list;
		_broadcast = true;
		
		//More waypoints left?
		if (count _posEnd > 0) then
		{
			_posEnd call NEO_fnc_convoySetDestination;
		}
		else
		{
			{ doStop _x } forEach _newVehicles;
		};
	};
	
	if (_broadcast) then
	{
		publicVariable "NEO_convoy";
	};
	
	//Exit if in danger or destroyed
	if ((_exitOnDanger && _inDanger) OR (count _newVehicles < 2)) exitWith {};
};