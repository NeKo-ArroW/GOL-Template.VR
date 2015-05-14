// *
// *	This script handles all mission parameters selection in the mission lobby screen
// *	You will edit the parameters here instead of using the description.ext
// *
// ====================================================================================
// *	Use this link to get a better understanding of what it does and what you can change
// *	https://community.bistudio.com/wiki/Arma_3_Mission_Parameters
// *
/*
//	Macros
	#ifdef SelectFromParams
		#define	SelectFromParams	__EXEC(SelectFromParams = 1);
		SelectFromParams;
	#endif
	#ifndef SelectFromParams
		#define	SelectFromParamsDiactive	__EXEC(SelectFromParams = 0);
		SelectFromParamsDiactive;
	#endif
*/

// ====================================================================================
// *
// *	Selects the faction for Blufor to use by players
// *
#ifdef SelectFromParams
	class GVL_Params_Faction_West {
		title = "Selection of West Factions";
		values[] = {1,2,3,4};
		texts[] = {"NATO","FIA","USMC","BAF"};
		default = getNumber (missionconfigfile >> "GVL_FRAMEWORK" >> "Modules" >> "Gear" >> "Blufor");
	};

// ====================================================================================
// *
// *	Selects the faction for Opfor to use by players
// *
	class GVL_Params_Faction_East {
		title = "Selection of East Factions";
		values[] = {1,2,3,4};
		texts[] = {"CSAT","Russians","Guerilla (Not avilable atm)","Insurgents (Not avilable atm)"};
		default = (getNumber (missionconfigfile >> "GVL_FRAMEWORK" >> "Modules" >> "Gear" >> "Opfor"));
	};

// ====================================================================================
// *
// *	Selects the faction for Independent to use by players
// *
	class GVL_Params_Faction_Independent {
		title = "Selection of Independent Factions";
		values[] = {1};
		texts[] = {"AAF"};
		default = (getNumber (missionconfigfile >> "GVL_FRAMEWORK" >> "Modules" >> "Gear" >> "Independent"));
	};
#endif

// ====================================================================================
// *
// *	Adds extra gear to some soldiers
// *	Example. Medical supplies for AG's, M203 Grenades, Rockets for the AT
// *
class GVL_Params_Extra_Gear {
	title = "Enable Extra Gear";
	values[] = {0,1,2};
	texts[] = {"Standard Gear","Add Extra Supplies","Add Extra and Additional Supplies"};
//	0 = Standard Loadout
//	1 = Adds Extra supplies - Adds more bandages, magazines, greandes and such
//	2 = Adds Additional supplies - Same as above but also other equipment as epipen, blood
	default = 1;
};

// ====================================================================================
// *
// *	Disables firing by deleting all bullets fired in the beginning of the mission
// *
class GVL_Params_SafeStart {
	title = "Safe Start";
	values[] = {0,1,2,3,4,5,6,7,8,9,10,15};
	texts[] = {"Disabled","1","2","3","4","5","6","7","8","9","10","15"};
	default = 5;
};

// ====================================================================================
// *
// *	Enables the Teleportation to the Fire Team leader for every player by using the "GOL Menu"
// *
class GOL_Params_FTL_Teleport {
	title = "Allow Group Teleport";
	values[] = {0,1};
	texts[] = {"Disabled","Enabled"};
	default = 0;
};

// ====================================================================================
// *
// *	Selects the distance the player have to be from the FTL to be able to teleport
// *
class GOL_Params_Teleport_Distance {
	title = "Minimum Group Teleport Distance (Defined In Meters)";
	values[] = {0,50,100,250,500,1000,1500};
	texts[] = {"0","50","100","250","500","1000","1500"};
	default = 250;
	code = "GOL_FTL_Distance_TP = %1";
};







/*

// ====================================================================================
// *
// *	Should the players be able to select the time of day in the mission?
// *	To enable this option remove the 	/*	infront of the class Daytime and remove the *\ after the }; to fully enable it
// *
class Daytime
{
	title = $STR_a3_cfgvehicles_moduledate_f_arguments_hour_0;
	values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
	texts[] = {"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
	default = 12;
	function = "BIS_fnc_paramDaytime";
};

// ====================================================================================
// *
// *	Should the players be able to select the weather in the mission?
// *	To enable this option remove the 	/*	infront of the class Weather and remove the *\ after the }; to fully enable it
// *
class Weather
{
	title = $STR_A3_rscattributeovercast_title;
	values[] = {0,25,50,75,100};
	texts[] = {
		$STR_A3_rscattributeovercast_value000_tooltip,
		$STR_A3_rscattributeovercast_value025_tooltip,
		$STR_A3_rscattributeovercast_value050_tooltip,
		$STR_A3_rscattributeovercast_value075_tooltip,
		$STR_A3_rscattributeovercast_value100_tooltip
	};
	default = 25;
	function = "BIS_fnc_paramWeather";
};

*/