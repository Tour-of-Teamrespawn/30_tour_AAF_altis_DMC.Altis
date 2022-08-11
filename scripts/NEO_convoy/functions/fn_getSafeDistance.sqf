private ["_vehicles", "_sizeVehicle"];
_vehicles = _this;
_sizeVehicle = 0;

{
	private ["_bb", "_bbY"];
	_bb = boundingBox _x;
	_bbY = ((_bb select 1) select 1) * 2;
	
	if (_bbY > _sizeVehicle) then
	{
		_sizeVehicle = _bbY;
	};
} forEach _vehicles;

[_sizeVehicle * 2, _sizeVehicle * 4];
