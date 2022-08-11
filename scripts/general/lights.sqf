//createlightsources for the used base areas

private ["_light"];
{
	_light = "#lightpoint" createVehicleLocal _x;   
	_light setLightBrightness 0.3;
	_light setLightAmbient [1, 1, 1];
	_light setLightColor [1, 1, 1];
}foreach 	[
				[11580.5,12028,4],[11575.9,12020,4],
				[11571.5,11962.6,5]
			];

{
	_light = "#lightpoint" createVehicleLocal _x;   
	_light setLightBrightness 0.2;
	_light setLightAmbient [1, 1, 1];
	_light setLightColor [1, 1, 1];	
}forEach 	[
				[11595.5,12053.4,3],[11605.9,12043.3,6],
				[11580.5,12028,4],[11575.9,12020,4],
				
				[11653.6,11995.6,3], [11658.4,11989.4,6],
				
				[11569.7,11893.7,3.5],[11620.3,12011.8,3.5],
				
				[11589.6,12024.8,4.5],[11579,12008,4.5],[11570.7,11994.3,4.5]
			];