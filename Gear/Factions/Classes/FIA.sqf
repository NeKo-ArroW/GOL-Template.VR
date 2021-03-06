
#include "Common.sqf"

_AllowNVG = true;
_factionValue = false;
_factionScript = "Default";

// ===========================
// WEAPON SELECTION

switch (GOL_Gear_Camo) do {
    default {	// Woodland
		_pistol = "hgun_P07_F";
		_pistol_mag = "16Rnd_9x21_Mag";
			_secondaryPistol = [];

		_rifle = "arifle_TRG21_F";
		_rifle_mag = "30Rnd_556x45_Stanag";
		_rifle_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
			_primaryRifle = ["acc_flashlight"];

		_rifleGL = "arifle_TRG21_GL_F";
		_rifleGL_mag = "30Rnd_556x45_Stanag";
		_rifleGL_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
			_primaryRifleGL = ["acc_flashlight"];

		_rifleALT = "arifle_TRG20_F";
		_rifleALT_mag = "30Rnd_556x45_Stanag",
		_rifleALT_mag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
			_primaryRifleALT = ["acc_flashlight"];

		_carbine = "SMG_01_F";
		_carbine_mag = "30Rnd_45ACP_Mag_SMG_01";
		_carbine_mag_tr = "30Rnd_45ACP_Mag_SMG_01_tracer_green";
			_primaryCarbine = ["acc_flashlight"];

		_LMG = "LMG_Mk200_F";
		_LMG_mag = "200Rnd_65x39_cased_Box";
		_LMG_mag_tr = "200Rnd_65x39_cased_Box_Tracer";
			_primaryLMG = ["acc_flashlight","optic_Holosight","bipod_03_F_blk"];

		// Rifleman AT
		_LAT = "launch_RPG32_F";
		_LATmag = "RPG32_F";

		// Rifleman AT
		_MAT = "launch_RPG32_F";
		_MATmag1 = "RPG32_F";
		_MATmag2 = "RPG32_HE_F";
	};
};

// ===========================

// Infantry
_baseHelmet = ["H_Shemag_olive","H_ShemagOpen_tan","H_Bandanna_khk","H_Booniehat_khk","H_Cap_oli","H_Watchcap_blk"] call BIS_fnc_selectRandom;
_baseUniform = ["U_BG_leader","U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_BG_Guerrilla_6_1"] call BIS_fnc_selectRandom;
_baseVest = ["V_PlateCarrier1_blk","V_PlateCarrierIAGL_oli"] call BIS_fnc_selectRandom;
_baseGlasses = ["G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli"] call BIS_fnc_selectRandom;

// Pilot
_pilotHelmet = "H_PilotHelmetHeli_I";
_pilotUniform = "U_I_HeliPilotCoveralls";
_pilotVest = ["V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_oli"] call BIS_fnc_selectRandom;

// Vehicle Crewman
_crewHelmet = _baseHelmet;
_crewVest = _pilotVest;

// Backpacks
_bagRifleman = "B_FieldPack_khk";
_bagAG = "B_Carryall_oli";
_radioAirBackpack = "tf_rt1523g_black";
_radioBackpack = "tf_rt1523g_black";
