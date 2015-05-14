
// ================================================
//      Defined LoadOuts:
// ================================================
// *    GEAR_cargo - Role Selection Box
// *    A_cargo - Attachment Box
// *    Misc_cargo - Misc Box
// *    Med_cargo - Medical Box
// *    BAF_cargo - BAF ammo Box
// *    FIA_cargo - FIA ammo Box
// *    NATO_cargo - NATO ammo Box
// *    USMC_cargo - USMC ammo Box
// *
// ================================================
// *
// *    AUTHOR: GuzzenVonLidl
// *
// *    Description:
// *        Handles all the items in the boxes
// *
// *    Usage:
// *        [_cargo,["GEAR_cargo","west"],[false,true]] call GVL_Fnc_GearCargo;
// *        [this,["big_box","west"],[true]] call GVL_Fnc_GearHandler;
// *
// *    Parameters:
// *    0: ObjNull: -   Object
// *    1: String:  -   LoadOut
// *        0: String:  -   LoadOut
// *        1: String:  -   Side, Only accepts west,east & independent and its is not case sensitive
// *    2: Array:   -   Moveable (Optinal)
// *        0: Boolean: -   Moveable (Default: True)
// *        1: Boolean: -   AllowDamage (Default: False)
// *        2: Boolean: -   Allow gear to be assigend to a vehicle (Default: False)
// *
// *    Returning Value:
// *        Gives a vehicle / box the proper gear it should have
// *
// ====================================================================================

    if !(isServer) exitWith {false};

    _cargo = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
    _param1 = [_this, 1] call BIS_fnc_param;
    _gearbox = toLower ([_param1, 0, "small_box", [""]] call bis_fnc_param);
    _side = toLower ([_param1, 1, "west", [""]] call bis_fnc_param);
    _cargoArray = [_this, 2, [true,true], [[]]] call BIS_fnc_param;
    _isVehicle = _cargo isKindOf "AllVehicles";
    if !(_isVehicle) Then {
        if ((_cargoArray select 0)) then {  // Enable Move Object
//          [_cargo, true] call AGM_Drag_fnc_makeDraggable;
        } else {    // Disable Move Object
            _cargo setVariable ["AGM_disableDrag", true, true];
        };
    };

    if ((_cargoArray select 1)) then {  // Can be destroyed
        _cargo allowDamage true;
    } else {
        _cargo allowDamage false;
    };

//  ====================================================================================

    #include "Factions\Classes\Common.sqf"

    switch (_side) do {
        case "west": {
            [] call compile preprocessFileLineNumbers ("GVL_Core\Modules\Gear\Factions\Classes\" + GVL_Faction_West +".sqf");
        };
        case "east": {
            [] call compile preprocessFileLineNumbers ("GVL_Core\Modules\Gear\Factions\Classes\" + GVL_Faction_East +".sqf");
        };
        case "indep": {
            [] call compile preprocessFileLineNumbers ("GVL_Core\Modules\Gear\Factions\Classes\" + GVL_Faction_Indep +".sqf");
        };
        default {
            diag_log "Error in GearCargo faction";
        };
    };

    [_camo] call _weaponCamo;

//  ====================================================================================

    _AGM_standard = [
//      [ClassName, Gearbox,Extra Supplies,Standard Supplies],
        [_bandage, 100,75,40],
        [_morph, 100,50,20],
        [_barrel, 20,10,6]
    ];

    _AGM_Advanced = [
        [_epi, 100,20],
        [_blood, 100,10]
    ];

    _standard = [
        [_glHE, 250,50,20],
        [_glsmokeW, 250,20,10],
        [_glflareW, 250,10,5],
        [_grenade, 250,30,20],
        [_grenademini, 250,30,20],
        [_smokegrenadeW, 250,30,20],
        [_smokegrenadeG, 250,10,5]
    ];

    _Supplies = {
        if (GVL_Gear_Extra) Then {
                { [_cargo, (_x select 0), (_x select 2)] call GVL_Fnc_AddItemCargo; } forEach _standard;
                { [_cargo, (_x select 0), (_x select 2)] call GVL_Fnc_AddItemCargo; } forEach _AGM_standard;
                { [_cargo, (_x select 0), (_x select 2)] call GVL_Fnc_AddItemCargo; } forEach _AGM_Advanced;
        } else {
                { [_cargo, (_x select 0), (_x select 3)] call GVL_Fnc_AddItemCargo; } forEach _standard;
                { [_cargo, (_x select 0), (_x select 3)] call GVL_Fnc_AddItemCargo; } forEach _AGM_standard;
        };
    };

    ClearWeaponCargoGlobal _cargo;
    ClearMagazineCargoGlobal _cargo;
    ClearItemCargoGlobal _cargo;
    ClearBackpackCargoGlobal _cargo;

//  Inventory
//  ====================================================================================
    switch (_gearbox) do {

        case "gear_box": {      //  Spawn Box

            [[[_cargo], {
                (_this select 0) addAction ["Platoon > Actual"," [player,'pl'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Platoon > Forward Air Controller"," [player,'fac'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Squad > Fire Team Leader"," [player,'ftl'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Squad > Rifleman"," [player,'r'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Squad > Grenadier"," [player,'g'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Squad > Asst. Gunner"," [player,'ag'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Squad > Automatic Rifleman"," [player,'ar'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Squad > Light Rifleman"," [player,'lr'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];
                (_this select 0) addAction ["Echo > Pilot"," [player,'p'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)"];

//              (_this select 0) addAction ["Echo > Commander"," [player,'vco'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)];
//              (_this select 0) addAction ["Echo > Crew"," [player,'vcrew'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)];
//              (_this select 0) addAction ["Echo > Sniper"," [player,'sniper'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)];
//              (_this select 0) addAction ["Echo > Spotter"," [player,'spotter'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)];
//              (_this select 0) addAction ["Echo > Diver"," [player,'diver'] call GVL_Fnc_GearHandler; ",nil,1,false,false,"","((_target distance _this) < 5)];

            }], "bis_fnc_call", true, true] call BIS_fnc_MP;

            { [_cargo, (_x select 0), (_x select 1)] call GVL_Fnc_AddItemCargo; } forEach _standard;
            { [_cargo, (_x select 0), (_x select 1)] call GVL_Fnc_AddItemCargo; } forEach _AGM_standard;
            { [_cargo, (_x select 0), (_x select 1)] call GVL_Fnc_AddItemCargo; } forEach _AGM_Advanced;

        };

        case "a_box": { //  Attachment Box

            // CCO
            [_cargo, "optic_Aco", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "optic_ACO_grn", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "optic_MRD", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_optic_AC11704", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_optic_MicroCCO", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_optic_MicroCCO_low", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_optic_AIM", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_optic_HWS", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_optic_AC12136", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "rhsusf_acc_EOTECH", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "rhsusf_acc_compm4", 50] call GVL_Fnc_AddItemCargo;

            // Items
            [_cargo, "acc_pointer_IR", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "acc_flashlight", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_acc_ANPEQ15_black", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_acc_ANPEQ15", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_acc_LLM01L", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "FHQ_acc_LLM01F", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "AGM_muzzle_mzls_H", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "AGM_muzzle_mzls_B", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "AGM_muzzle_mzls_L", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "rhsusf_acc_anpeq15", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "rhsusf_acc_anpeq15a", 50] call GVL_Fnc_AddItemCargo;
            [_cargo, "rhsusf_acc_anpeq15_light", 50] call GVL_Fnc_AddItemCargo;
        };

        case "misc_box": {  //  Misc Box
            [_cargo, _bino, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _toolkit, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _demoCharge, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _satchelCharge, 50] call GVL_Fnc_AddItemCargo;

            [_cargo, _radio152, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _radio1000a, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _Android, 50] call GVL_Fnc_AddItemCargo;

            [_cargo, _mapTools, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _kestrel, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _IRStrobe, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _earplugs, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _clacker, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _defusalKit, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _cables, 100] call GVL_Fnc_AddItemCargo;
            [_cargo, _flashBang, 50] call GVL_Fnc_AddItemCargo;
        };

        case "med_box": {   //  Medical Box
            [_cargo, _bandage, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _morph, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _epi, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _blood, 50] call GVL_Fnc_AddItemCargo;
            [_cargo, _barrel, 20] call GVL_Fnc_AddItemCargo;
        };

        case "small_box":   {   //  Small Box
            // Weapon & Equipment
            [_cargo, _pistol_mag, 10] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _rifle_mag, 32] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _rifleGL_mag, 30] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _carbine_mag, 5] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _LMG_mag_tr, 12] call GVL_Fnc_AddMagazineCargo;

            [_cargo, _LAT, 3] call GVL_Fnc_AddWeaponCargo;
            [_cargo, _LATmag, 4] call GVL_Fnc_AddMagazineCargo;

            [] call _Supplies;
        };

        case "big_box": {   //  Big Box
            // Weapon & Equipment
            [_cargo, _pistol_mag, 20] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _rifle_mag, 60] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _rifleGL_mag, 50] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _carbine_mag, 10] call GVL_Fnc_AddMagazineCargo;
            [_cargo, _LMG_mag_tr, 24] call GVL_Fnc_AddMagazineCargo;

            [_cargo, _LAT, 6] call GVL_Fnc_AddWeaponCargo;
            [_cargo, _LATmag, 8] call GVL_Fnc_AddMagazineCargo;

            [] call _Supplies;
        };

    };