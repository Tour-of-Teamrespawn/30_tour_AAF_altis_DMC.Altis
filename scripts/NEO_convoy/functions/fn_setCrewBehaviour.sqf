{
	{
		if (!isPlayer _x) then
		{
			if ((group _x) == (group (driver (vehicle _x)))) then
			{
				_x disableAi "FSM";
				_x disableAi "TARGET";
				if (_x != assignedGunner vehicle _x) then { _x disableAi "AUTOTARGET" };
				
				_x setBehaviour "CARELESS";
				_x setCombatMode "RED";
				_x setSpeedMode "FULL";
				group _x enableAttack false;
			};
		};
	} forEach  crew _x;
} forEach _this;
