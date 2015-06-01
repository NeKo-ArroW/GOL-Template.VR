// ================================================================
// *	AUTHOR: GuzzenVonLidl
// *
// *	Description:
// *		Spawns units in positions from one big array.
// *		Function allows a maximum of 10 units and should be used together with "GOL_Fnc_CopyLocation"
// *
// *	Usage:
// *		[[[461.042,1304.65,0.00143862],330,"UP"],[[461.042,1304.65,0.00143862],330,"Middle"]] call GOL_Fnc_CreateAIStatic;
// *
// *	Parameters:
// *		0-9:	Array:	Position and direction
// *
// *	Returning Value:
// *		None
// *
// ================================================================

	if (isMultiplayer && hasInterface) exitWith {false};		// Ensures only server or HC runs after and not players

	_this spawn {
		private ["_newGrp","_spawnLocation","_direction","_stance","_randomSelection","_newGrpUnit"];

		_newGrp = CreateGroup EnemySide;
		{
			sleep 0.5;
			_spawnLocation = (_x select 0);
			_direction = (_x select 1);
			_stance = (_x select 2);
			if (isNil "_stance") then { _stance = "Auto"; };
			_randomSelection = (EnemyUnits call BIS_fnc_selectRandom);
			_newGrpUnit = _newGrp createUnit [_randomSelection, _spawnLocation, [], 0, "NONE"];
				_newGrpUnit setPosATL _spawnLocation;
				_newGrpUnit setFormDir _direction;
				_newGrpUnit SetDir _direction;
				sleep 0.1;
				_newGrpUnit SetDir _direction;
				_newGrpUnit setPosATL _spawnLocation;
				_newGrpUnit setRank "PRIVATE";
				_newGrpUnit setSkill 0.4;
				_newGrpUnit setUnitPos _stance;
				_newGrpUnit forceSpeed ([0,0,-1] call BIS_fnc_selectRandom); // 2 out of 3 time unit will be static
				_newGrpUnit setVariable ["GOL_Caching", true, true];
				doStop _newGrpUnit;
		} forEach _this;
	};
