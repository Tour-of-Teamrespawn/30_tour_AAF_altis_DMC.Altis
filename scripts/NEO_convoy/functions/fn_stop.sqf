private ["_stop"];
_stop = _this;

private ["_list", "_vehicles"];
_list = NEO_convoy;
_vehicles = _list select 0;

private ["_driver"];
_driver = driver (_vehicles select 0);

if (_stop) then
{
	_driver disableAi "MOVE";
}
else
{
	_driver enableAi "MOVE";
};
