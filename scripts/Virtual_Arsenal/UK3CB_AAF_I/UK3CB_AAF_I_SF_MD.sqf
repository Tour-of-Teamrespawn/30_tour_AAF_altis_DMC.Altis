_weapon_accessories = [
	"rhsusf_acc_anpeq15_bk",
	"rhsusf_acc_anpeq15_bk_light",
	"optic_mrco",
	
	"optic_holosight_BLK_f",
	"optic_holosight_khk_f",
	"optic_hamr",
	"optic_hamr_khk_f",
	
	"optic_tws_mg",
	"optic_nvs",
	
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
	"arifle_SDAR_F",
	"UK3CB_G3A3V",
	"UK3CB_G3A3V_RIS",
	"UK3CB_HK33KA2",
	"UK3CB_HK33KA2_RIS",
	"UK3CB_HK33KA3"
];

_launchers = [
	"rhs_weap_rpg26",
	"rhs_weap_fim92",
	"launch_o_vorona_brown_f",
	"launch_o_vorona_green_f"
];

_static = 
[
	"rhs_podnos_gun_bag",
	"rhs_kornet_gun_bag",
	"rhs_spg9_gun_bag"
];

_backpacks = 
[
	"UK3CB_AAF_B_B_CARRYALL_DIGI_GRN",
	"UK3CB_AAF_B_B_CARRYALL_DIGI_BRN",

	"UK3CB_AAF_B_B_FIELDPACK_DIGI_BLK",
	
	"B_Assaultpack_Dgtl",
	"UK3CB_AAF_B_B_ASS_DIGI_BRN",
	"UK3CB_AAF_B_B_ASS_DIGI_BLK"
];

_uniform_berets = 
[
	"UK3CB_AAF_B_H_Beret_SF"
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
	"H_Bandanna_khk_hs",
	"H_watchcap_blk",
	"H_watchcap_cbr",
	"H_watchcap_camo"
];

_uniform_glasses = 
[
	"UK3CB_G_neck_shemag_tan",
	"UK3CB_G_neck_shemag_oli",
	"UK3CB_G_neck_shemag",
	"G_bandanna_aviator",
	"G_bandanna_blk",
	"G_balaclava_blk",
	"G_I_Diving"
];

_uniform_helmet = 
[
	"UK3CB_AAF_I_H_MKVI_Helmet_A_BLK",
	"UK3CB_AAF_I_H_MKVI_Helmet_B_BLK",
	
	"H_HelmetB_Light",
	"H_HelmetB_Light_black",
	"H_HelmetB_Light_desert",
	"H_HelmetB_Light_sand",
	"H_HelmetB_Light_grass",
	"H_HelmetB_Light_snakeskin",
	"H_HelmetB_Light_wdl",
	"H_HelmetB_Light_tna_f"
];

_uniform_items = 
[
	"rhsusf_ANPVS_15"
];

_uniform_uniform = 
[
	"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_MIX_01",
	"UK3CB_AAF_B_U_CombatUniform_DIGI_MIX_01",
	"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_DIGI_MIX_02",
	"UK3CB_AAF_B_U_CombatUniform_DIGI_MIX_02",
	"UK3CB_AAF_B_U_CombatUniform_Shortsleeve_Navy_DIGI_BLK",
	"UK3CB_AAF_B_U_CombatUniform_Navy_DIGI_BLK",
	"U_I_WETSUIT",
	"UK3CB_AAF_I_U_CombatUniform_Ghillie_DIGI_GRN",
	"UK3CB_AAF_I_U_CombatUniform_Ghillie_DIGI_Mixed"
];

_uniform_vest = 
[
	"UK3CB_AAF_I_V_Falcon_1_DIGI_BLK",
	"UK3CB_AAF_I_V_Falcon_2_DIGI_BRN",
	"UK3CB_AAF_I_V_Falcon_2_DIGI_GRN",
	"V_rebreatherIA"
];

_bis_items = 
[
	"ItemGPS",
	"ItemMap",
	"Rangefinder",
	"Laserdesignator",
	"Laserdesignator_01_khk_F"
];

_bis_magazines = 
[
	"rhsusf_m112_mag"
];

_ACE_items =
[
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"ACE_DefusalKit",
	"ACE_DeadManSwitch",
	"ACE_HuntIR_monitor",
	"ACE_HuntIR_M203",
	"ACE_Kestrel4500",
	"ACE_DAGR",
	"ACE_Vector",
	"ACE_VectorDay",
	"ACE_Yardage450",
	"ACE_MX2A",
	"ACE_SpottingScope",
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
