// ================================================================
// *	AUTHOR: GuzzenVonLidl
// *
// *	Description:
// *		A simple and fast way of displaying debugging information on screen and in rtp that is very detailed
// *
// *	Usage:
// *		[["Loading Framework Init: %1", missionName],[_DebugName,__FILE__,__Line__],"log"] call GVL_Fnc_DebugLog;	// stamp mission name
// *
// *	Parameters:
// *	0:	-	String or Array: Information to be logged
// *	1:	-	Array: Name of the script it is called from
// *			-	Name of the script called from
// *			-	File path of script
// *			-	From what line the script it was called
// *	2:	-	String: In what way the code should be displayed
// *			-	RTP = "rtp" or "log"
// *			-	Hint - Call = "hint"
// *			-	SystemChat - Spawn = "system"
// *			-	RTP & SystemChat - Spawn = "both"
// *			-	Default: If Nil then it will be selected from the GVL variable, in other words from the Mission Params
// *
// *	Returning Value:
// *		if debug is enabled, message on screen or/and rpt
// *
// ================================================================

	if (!(count _this == 2) && !(count _this == 3)) exitWith { diag_log profilename + " / GVL_Fnc_DebugLog: Error Params"; false };
	private ["_message","_debugging","_file","_line","_scriptName","_text","_output"];
	_message = [_this, 0, "Error Message", ["",[]]] call BIS_fnc_param;
	_debugging = [_this, 1, ["Name Not Found","File Not Found","Line Not Found"], [[]]] call BIS_fnc_param;
	_type = toLower ([_this, 2, "", [""]] call BIS_fnc_param);
	_extreme = false;
	if ((count _debugging) == 2) then {
		_file = [_debugging, 0] call BIS_fnc_paramIn;
		_line = [_debugging, 1] call BIS_fnc_paramIn;
		_scriptName = _file;
	};

	if ((count _debugging) == 3) then {
		_scriptName = [_debugging, 0] call BIS_fnc_paramIn;
		_file = [_debugging, 1] call BIS_fnc_paramIn;
		_line = [_debugging, 2] call BIS_fnc_paramIn;
	};

	if (typeName _message == "STRING") then {
		_text = ([_this, 0] call BIS_fnc_param);
	};

	if (typeName _message == "ARRAY") then {
		_text = format([_this, 0] call BIS_fnc_param);
	};

	if (!_extreme) then {
		_file = "Disabled";
	};

	_output = format["GVL_DebugLog: [%1] - [%2] [Time: %3 | TT: %4 | Line: %5 | Path: %6]",
		_scriptName,
		_text,
		time,
		diag_tickTime,
		_line,
		_file
	];

	if (isNil "GVL_Debug") then {
		if (["Debug_Config"] call GVL_Fnc_GetConfig >= 1) then {
			GVL_Debug = ["Debug_Config"] call GVL_Fnc_GetConfig;
			GOL_Debug = true;
		} else {
			GVL_Debug = 0;
			GOL_Debug = false;
		};
	};

// ================================================================

	_log = {
		diag_log text _output;
		true
	};

	_hint = {
		[_output, 7] call GVL_Fnc_Hint;
		true
	};

	_system = {
		systemChat _output;
		true
	};

// ================================================================

	if (count _this == 2) then {

		if (GVL_Debug == 1) then {	// Minimum
			_this call _log;
		};

		if (GVL_Debug == 2) then {	// Maximum
			_this call _log;
			_this call _system;
		};

		if (GVL_Debug == 3) then {	// Maximum in editor, else nuting

			if !(isMultiplayer) then {
				_this call _log;
				_this call _system;
			};

		};

	} else {

		if (_type == "log" || _type == "rtp") then {	_this call _log;	};

		if (_type == "hint") then {	_this call _hint;	};

		if (_type == "system" || _type == "chat" || _type == "side") then {	_this call _system;	};

		if (_type == "both") then {	_this call _system;	_this call _log;	};

	};
	true