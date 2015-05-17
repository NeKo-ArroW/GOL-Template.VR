
		private ["_DebugName"];
		_DebugName = "GOL-corePostInit";
		scriptName _DebugName;

		["------ Framework PostInit ------",[_DebugName,__FILE__,__LINE__],"log"] call GOL_Fnc_DebugLog;

		[] call GOL_Fnc_HeadlessClient;
		[] call GOL_Fnc_radioSettings;
		[] call GOL_Fnc_NotesInit;
		[(["Default_AI"] call GOL_Fnc_GetConfig)] call GOL_Fnc_EnemyFactions;
		[] spawn GOL_Fnc_CoreLoop;
		[] spawn GOL_Fnc_AudioDetectorAI;
		[] spawn GOL_Fnc_MissionFunctions;

		if (hasInterface) then {
// *		Loads Mandatory Player functions
			player addRating 100000;
			player setVariable ["BIS_noCoreConversations", true, true];
			player setVariable ["BIS_enableRandomization", false, true];
			GOL_Gamelogic_Local = "Logic" createVehicleLocal [0,0,0];

			if (isNil {player getVariable "GOL_Player"}) then {
				player setVariable ["GOL_Player", [player,(getPlayerUID player),([] call BIS_fnc_didJIP),time], true];
			};
			[] spawn {
				sleep 5;
			    [[[player], { (_this select 0) setGroupId [((_this select 0) getVariable "GOL_GroupID")]; }], "bis_fnc_call", true, true] call BIS_fnc_MP;
				[player, (player getVariable "GOL_UnitColor")] call ACE_Interaction_fnc_joinTeam;

				if ((player getVariable "GOL_Player") select 2) then {
					{
						if (_x getVariable "GOL_MHQ_Active") then {
							[_x] call GOL_Fnc_MHQActions;
						};
					} forEach MHQArray;
				};
			};
		};

		if (isServer) then {
			if (("GOL_Params_FTL_Teleport" call BIS_fnc_getParamValue) == 1) then {
				GOL_Allow_FTL_Teleport = true;
			} else {
				GOL_Allow_FTL_Teleport = false;
			};
			GOL_FTL_Distance_TP = "GOL_Params_Teleport_Distance" call BIS_fnc_getParamValue;

			publicVariable "GOL_Allow_FTL_Teleport";
			publicVariable "GOL_FTL_Distance_TP";
		};

		private ["_DebugName"];
		_DebugName = "GOL-corePostInit";
		scriptName _DebugName;

		["PostInit INITIALIZED",[_DebugName,__FILE__,__LINE__],"log"] call GOL_Fnc_DebugLog;
