_weapon_accessories = [	

];

_magazines = [

];

_weapons = [

];

_launchers = [

];

_static = 
[

];

_backpacks = 
[

];

_uniform_berets = 
[
	"UK3CB_AAF_I_H_Beret_Airforce_OFF"
];

_uniform_boonie = 
[

];

_uniform_bowman = 
[

];

_uniform_glasses = 
[

];

_uniform_helmet = 
[
	"H_PilotHelmetHeli_I",
	"H_PilotHelmetFighter_I"
];

_uniform_items = 
[

];

_uniform_uniform = 
[
	"UK3CB_AAF_I_U_H_Pilot_DIGI_GRN",
	"U_I_pilotCoveralls"
];

_uniform_vest = 
[
	"UK3CB_V_Pilot_Vest_02_Oli"
];

_bis_items = 
[
	"ItemGPS"
];

_bis_magazines = 
[
	//specific mags.... usually explosives etc
];

_ACE_items =
[

];

_ctab = 
[
	"ItemMicroDAGR",
	"ItemcTabHCam"
];

_array = [
			(_weapons + _launchers), 
			(_ctab + _bis_items + _weapon_accessories + _uniform_uniform + _uniform_berets + _uniform_boonie + _uniform_bowman + _uniform_glasses + _uniform_helmet + _uniform_items + _uniform_vest + _ACE_items),
			(_magazines + _bis_magazines),
			(_static + _backpacks)
			];

_array
