private ["_vehicles", "_dismount"];
_vehicles = _this select 0;
_dismount = _this select 1;

{
	private ["_vehicle", "_grp"];
	_vehicle = _x;
	_grp = _vehicle getVariable "NEO_convoyVehicleCargo";
	
	if (!isNil { _grp }) then
	{
		if (_dismount) then
		{
			//Dismount Vehicle and Fight
			_grp enableAttack true;
			_grp setCombatMode "RED";
			_grp setBehaviour "COMBAT";
			_grp setSpeedMode "FULL";
			
			{
				unassignVehicle _x;
				[_x] orderGetIn false;
				[_x] allowGetin false;
				
				_x enableAi "TARGET";
				_x enableAi "AUTOTARGET";
				_x enableAi "FSM";
			} forEach units _grp;
			
			//Stop Convoy
			//true call NEO_fnc_convoyStop;
		}
		else
		{
			//Board vehicle
			_grp enableAttack false;
			_grp setCombatMode "GREEN";
			_grp setBehaviour "SAFE";
			_grp setSpeedMode "FULL";
			
			{
				_x doMove position _vehicle;
				_x assignAsCargo _vehicle;
				[_x] orderGetIn true;
				[_x] allowGetin true;
				
				_x disableAi "TARGET";
				_x disableAi "AUTOTARGET";
				_x disableAi "FSM";
			} forEach units _grp;
			
			//Move Convoy
			//false call NEO_fnc_convoyStop;
		};
	};
} forEach _vehicles;
