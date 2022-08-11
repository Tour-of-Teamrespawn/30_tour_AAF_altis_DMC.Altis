private ["_position"];

_position = _this select 0;

player setCaptive true;
sleep 2;
cuttext ["", "black out", 2];
sleep 3;
player setPos getposATL _position;
player switchMove "acts_InjuredLyingRifle01";  
sleep 2;
(nearestBuilding player) setVariable ['BIS_Disabled_Door_1',1, false];
cuttext ["", "BLACK IN", 2];
sleep 6;  
if (alive player) then  
{
	if (local player) then
	{
		player setDir ((getDir (nearestBuilding player)) +  180);
	};
	player switchMove "AinjPpneMstpSnonWnonDnon_rolltofront";
};  
sleep 2;  
if (alive player) then  
{
	player switchMove "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
};

waitUntil {sleep 1; (player distance getPos _position > 4)};
if (alive player) then 
{
	player setCaptive false;
};