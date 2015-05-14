
#include "Common.sqf";

_AllowNVG = true;

// ===========================
// WEAPON SELECTION

_weaponCamo = {
	switch (_this select 0) do {
	    default {
			_pistol = "hgun_Rook40_F";
			_pistol_mag = "16Rnd_9x21_Mag";
				_secondaryPistol = [];

			_rifle = "arifle_Katiba_F";
			_rifle_mag = "30Rnd_65x39_caseless_green";
			_rifle_mag_tr = "30Rnd_65x39_caseless_green_mag_Tracer";
				_primaryRifle = ["optic_ACO_grn","acc_pointer_IR"];

			_rifleGL = "arifle_Katiba_GL_F";
			_rifleGL_mag = "30Rnd_65x39_caseless_green";
			_rifleGL_mag_tr = "30Rnd_65x39_caseless_green_mag_Tracer";
				_primaryRifleGL = ["optic_ACO_grn","acc_pointer_IR"];

			_rifleALT = "arifle_Katiba_C_F";
			_rifleALT_mag = "30Rnd_65x39_caseless_green";
			_rifleALT_mag_tr = "30Rnd_65x39_caseless_green_mag_Tracer";
				_primaryRifleALT = ["optic_ACO_grn","acc_pointer_IR"];

			_carbine = "SMG_02_F";
			_carbine_mag = "30Rnd_9x21_Mag";
			_carbine_mag_tr = "30Rnd_9x21_Mag";
				_primaryCarbine = ["optic_ACO_grn","acc_pointer_IR"];

			_LMG = "asdg_LMG_Zafir_F";
			_LMG_mag = "150Rnd_762x54_Box";
			_LMG_mag_tr = "150Rnd_762x54_Box_Tracer";
				_primaryLMG = ["optic_ACO_grn","acc_pointer_IR"];

			// Rifleman AT
			_LAT = "launch_RPG32_F";
			_LATmag = "RPG32_F";

			// Rifleman AT
			_MAT = "launch_RPG32_F";
			_MATmag1 = "RPG32_F";
			_MATmag2 = "RPG32_HE_F";
		};
	};
};

// ===========================

// CLOTHES AND UNIFORMS
_camoflage = {
	switch (_this select 0) do {
		case "desert": {
			// Infantry
			_baseHelmet = ["H_HelmetLeaderO_oucamo"] call BIS_fnc_selectRandom;
			_baseUniform = ["U_O_CombatUniform_oucamo"] call BIS_fnc_selectRandom;
			_baseVest = ["V_HarnessOSpec_gry"] call BIS_fnc_selectRandom;
			_baseGlasses = ["G_Combat","G_Shades_Black"] call BIS_fnc_selectRandom;

			// Pilot
			_pilotHelmet = "H_PilotHelmetHeli_B";
			_pilotUniform = "SP_0000_Standard_Coverall_Green";
			_pilotVest = "SP_Modular1_Green";

			// Vehicle Crewman
			_crewHelmet = ["SP_PASGTHelmet_Green1"] call BIS_fnc_selectRandom;
			_crewVest = "SP_PlateCarrier1_Green";

			// Backpacks
			_bagRifleman = "B_FieldPack_oucamo";
			_bagAG = "B_Carryall_oucamo";
			_radioAirBackpack = "tf_rt1523g_big";
			_radioBackpack = "tf_rt1523g_big";
		};

	    default {
			// Infantry
			_baseHelmet = ["H_HelmetLeaderO_ocamo"] call BIS_fnc_selectRandom;
			_baseUniform = ["U_O_CombatUniform_ocamo"] call BIS_fnc_selectRandom;
			_baseVest = ["V_HarnessOSpec_brn"] call BIS_fnc_selectRandom;
			_baseGlasses = ["G_Combat","G_Shades_Black"] call BIS_fnc_selectRandom;

			// Pilot
			_pilotHelmet = "H_PilotHelmetHeli_B";
			_pilotUniform = "SP_0000_Standard_Coverall_Green";
			_pilotVest = "SP_Modular1_Green";

			// Vehicle Crewman
			_crewHelmet = ["SP_PASGTHelmet_Green1"] call BIS_fnc_selectRandom;
			_crewVest = "SP_PlateCarrier1_Green";

			// Backpacks
			_bagRifleman = "B_FieldPack_ocamo";
			_bagAG = "B_Carryall_ocamo";
			_radioAirBackpack = "tf_mr3000";
			_radioBackpack = "tf_mr3000";
		};
	};
};