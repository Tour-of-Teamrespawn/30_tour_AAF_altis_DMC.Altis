_d = execVM "scripts\general\debugRPT.sqf";
waitUntil {scriptDone _d};

_p = execVM "params.sqf";
waitUntil {scriptDone _p};

_a = TOUR_Core execVM "a2s_multitask.sqf";
waitUntil {scriptDone _a};
TOUR_IED_jammers = [];
TOUR_IED_triggermen = [];

setViewDistance 2500;

execVM "scripts\general\headCam.sqf";

[250, TOUR_viewDistance, 20, 0.05] execVM "scripts\general\viewDistance.sqf";

{
	_x setVariable ["BIS_noCoreConversations",true];
} forEach allUnits;

_t = [TOUR_core, [INDEPENDENT, "UK3CB_AAF_I"], [WEST, "UK3CB_BAF_Faction_Army_MTP"], "TOUR_base", TOUR_officer, 1000] execVM "scripts\TDMC\TDMC_init.sqf";
waitUntil {scriptDone _t};

_siAction = if (true) then
{
	"(alive player) && ([player, ""ACRE_PRC148""] call acre_api_fnc_hasKindOfRadio)"
}else
{
	"(alive player) && (""ItemRadio"" in (assignedItems player))"
};

_si = 
[
	TOUR_core,
	RESISTANCE,
	_siAction,
	"(alive player) && (player == leader group player) && (player distance TOUR_Officer < 2.5) && (count (TDMC_core getVariable ""A2S_taskArray"") == 0)",
	true,
	[
		[
			"artillery",
			"Artemis One",
			[
				["8rnd_82mm_mo_shells", 0],
				["8rnd_82mm_mo_flare_white", 0],
				["8rnd_82mm_mo_smoke_white", 0],
				["8rnd_82mm_mo_guided", 0],
				["8rnd_82mm_mo_lg", 0],
				["32rnd_155mm_mo_shells", 0],
				["6rnd_155mm_mo_smoke", 30],
				["2rnd_155mm_mo_guided", 0],
				["2rnd_155mm_mo_lg", 0],
				["6rnd_155mm_mo_mine", 0],
				["6rnd_155mm_mo_at_mine", 0],
				["2rnd_155mm_mo_cluster", 0]
			]
		],
		[
			"helicopter",
			TOUR_chopper_4,
			"Hera One",
			[
				"Circle",
				"Land",
				"Land (Engine Off)",
				"Move To",
				"Pickup",
				"Return To Base"
			],
			getPosATL TOUR_chopper_4
		],
		[
			"helicopter",
			TOUR_chopper_2,
			"Apollo One",
			[
				"Circle",
				"CAS",
				"Land",
				"Land (Engine Off)",
				"Move To",
				"Pickup",
				"Return To Base"
			],
			getPosATL TOUR_chopper_2
		],
		[
			"helicopter",
			TOUR_chopper_3,
			"Apollo Two",
			[
				"Circle",
				"CAS",
				"Land",
				"Land (Engine Off)",
				"Move To",
				"Pickup",
				"Return To Base"
			],
			getPosATL TOUR_chopper_3
		],
		[
			"helicopter",
			TOUR_chopper_1,
			"Gorgan One",
			[
				"CAS", 
				"CAS (Laser Designation)",
				"Move To",
				"Return To Base"
			],
			getPosATL TOUR_chopper_1
		]
	]
] execVM "scripts\TOUR_SI\TOUR_SI_init.sqf";

if (isServer) then
{
	[] spawn
	{
		waitUntil {(({alive _x}count (playableunits + switchableUnits)) > 0)};
		sleep 5;
		while 
		{
			!TOUR_RC_INDEPENDENT_DEAD
		} do
		{
			// if and everyone is dead then Number of lives left are equal to 0 
			sleep 2;
		};
		if (TDMC_current_mission != "") then
		{
			if (TDMC_current_mission call A2S_taskState != "succeeded") then
			{
				[TDMC_current_mission, "failed"] call A2S_setTaskState;
				TDMC_current_mission call A2S_taskCommit;
				sleep 2;
				TDMC_current_mission call A2S_taskHint;
				sleep 3;
				"failed" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
			}else
			{
				sleep 5;
				"complete" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
			};
		}else
		{
				sleep 5;
				"kia" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];		
		};
	};
	[group TOUR_SV_man_1, getMarkerPos "TOUR_mkr_ground_service", "land", 5] execFSM"scripts\TOUR_service\service.fsm";
	[group TOUR_SV_man_2, getMarkerPos "TOUR_mkr_heli_service", "air", 30] execFSM"scripts\TOUR_service\service.fsm";
};

//player only

if (!isDedicated) then
{

	[] call A2S_tasksSync;
	
	#include "briefing.hpp";

	doStop player;

	{
		_x execVM "scripts\Virtual_arsenal\init.sqf";
	}forEach [TOUR_AmmoBox_1, TOUR_AmmoBox_2, TOUR_ammoBox_3];

	//createlightsources for the used base areas
	execVM "scripts\general\lights.sqf";
	
	[] execVM "scripts\TOUR_IED\init.sqf";
	[] execVM "scripts\TOUR_EXPLOSIVES\init.sqf";
	[] execVM "scripts\general\dust.sqf";
	execVM "scripts\interaction\bed_start.sqf";
	execVM "scripts\interaction\medicTent.sqf";
	  
};