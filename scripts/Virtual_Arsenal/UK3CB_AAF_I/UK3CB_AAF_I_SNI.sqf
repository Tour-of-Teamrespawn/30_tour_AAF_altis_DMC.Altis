_weapon_accessories = [
	"rhsusf_acc_anpeq15_bk",
	"rhsusf_acc_anpeq15_bk_light",
	"optic_mrco",
	
	"optic_sos",
	"optic_sos_khk_f",
	
	"optic_tws",
	"optic_nvs",
	
	"optic_erco_blk_f",
	"optic_erco_khk_f",
	
	"bipod_03_f_blk",
	"bipod_03_f_oli",
	
	"muzzle_snds_L",
	"muzzle_snds_I",
	"UK3CB_muzzle_snds_hk33",
	"UK3CB_muzzle_snds_G3"
];

_magazines = [

];

_weapons = [
	"UK3CB_G3SG1",
	"UK3CB_G3SG1_RIS",
	"UK3CB_PSG1A1",
	"UK3CB_PSG1A1_RIS"
];

_launchers = [

];

_static = 
[

];

_backpacks = 
[
	"B_Assaultpack_Dgtl",
	"UK3CB_AAF_B_B_ASS_DIGI_BRN",
	"UK3CB_AAF_B_B_ASS_DIGI_BLK"
];

_uniform_berets = 
[
	"UK3CB_AAF_I_H_Beret_Army"
];

_uniform_boonie = 
[
	"H_booniehat_khk_f",
	"H_booniehat_dgtl",
	"H_booniehat_oli"
];

_uniform_bowman = 
[
	"rhsusf_bowman_cap",
	"rhsusf_bowman",
	"H_milcap_gry",
	"H_milcap_dgtl",
	"H_Bandanna_khk_hs"
];

_uniform_glasses = 
[

];

_uniform_helmet = 
[
	"UK3CB_AAF_I_H_MKVI_Helmet_A_BRN",
	"UK3CB_AAF_I_H_MKVI_Helmet_A_GRN",
	"UK3CB_AAF_I_H_MKVI_Helmet_A_BLK"
	
];

_uniform_items = 
[

];

_uniform_uniform = 
[
	"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Navy_DIGI_BLK",
	"UK3CB_AAF_B_U_CombatUniform_Navy_DIGI_BLK",
	"UK3CB_AAF_I_U_CombatUniform_Ghillie_DIGI_GRN",
	"UK3CB_AAF_I_U_CombatUniform_Ghillie_DIGI_Mixed"
];

_uniform_vest = 
[
	"UK3CB_AAF_I_V_Falcon_1_DIGI_BLK",
	"UK3CB_AAF_I_V_Falcon_6_DIGI_BRN",
	"UK3CB_AAF_I_V_Falcon_6_DIGI_GRN"
];

_bis_items = 
[
	"Rangefinder"
];

_bis_magazines = 
[
	"ClaymoreDirectionalMine_Remote_Mag"
];

_ACE_items =
[
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_Kestrel4500",
	"ACE_Vector",
	"ACE_Yardage450",
	"ACE_RangeCard"
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
