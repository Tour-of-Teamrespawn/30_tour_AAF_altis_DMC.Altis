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
	"rhs_podnos_gun_bag"
];

_backpacks = 
[
	"UK3CB_AAF_B_B_CARRYALL_DIGI_GRN",
	"UK3CB_AAF_B_B_CARRYALL_DIGI_BRN",
	"B_Assaultpack_Dgtl",
	"UK3CB_AAF_B_B_ASS_DIGI_BRN"
];

_uniform_berets = 
[
	"UK3CB_AAF_I_H_Beret_Army"
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
	"UK3CB_AAF_I_H_MKVI_Helmet_B_BRN",
	"UK3CB_AAF_I_H_MKVI_Helmet_B_GRN"
];

_uniform_items = 
[

];

_uniform_uniform = 
[
	"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_BRN",
	"UK3CB_AAF_B_U_CombatUniform_DIGI_BRN",
	"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_GRN",
	"UK3CB_AAF_B_U_CombatUniform_DIGI_GRN"
];

_uniform_vest = 
[

];

_bis_items = 
[
	"ItemGPS",
	"Rangefinder"
];

_bis_magazines = 
[
	//specific mags.... usually explosives etc
];

_ACE_items =
[
	"ACE_RangeCard",
	"ace_vector"
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
