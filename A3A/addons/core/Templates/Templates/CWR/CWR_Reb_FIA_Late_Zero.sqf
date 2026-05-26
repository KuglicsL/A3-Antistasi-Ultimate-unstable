///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "TOB"] call _fnc_saveToTemplate; 

["flag", "cwr3_Flag_FIA"] call _fnc_saveToTemplate;
["flagTexture", "cwr3\general\cwr3_flags\data\fia.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "cwr3_faction_fia"] call _fnc_saveToTemplate;

["vehiclesBasic", ["cwr3_i_landrover"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_nM1038_4s_USA_WDL", "CUP_B_nM1025_Unarmed_USMC_WDL", "CUP_B_M113A1_HQ_USA", "CUP_B_AAV_Unarmed_USMC"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_B_nM1025_SOV_M2_USMC_WDL", "CUP_B_M113A1_USA", "CUP_B_AAV_USMC"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["cwr3_b_usmc_m939_open","cwr3_o_ural_open"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_B_nM1036_TOW_USMC_WDL"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_O_LR_AA_TKA"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["cwr3_b_usmc_zodiac"]] call _fnc_saveToTemplate;
["vehiclesPlane", ["cwr3_i_cessna_t41_armed"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", ["cwr3_c_cessna"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_B_nM997_USMC_WDL", "CUP_B_S1203_Ambulance_CDF"]] call _fnc_saveToTemplate;


["vehiclesCivCar", ["cwr3_c_landrover_blue"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["cwr3_c_ural_blue"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_O_KORD_high_RU", "CUP_O_KORD_RU", "cwr3_i_ags30"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_O_Metis_RU"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_I_ZU23_NAPA", "CUP_O_Igla_AA_pod_ChDKZ"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_2b14_82mm_NAPA"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CUP_MineE_M"] call _fnc_saveToTemplate;
["mineAPERS", "APERSMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["DemoCharge_Remote_Mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["DemoCharge_Remote_Mag", 2]]] call _fnc_saveToTemplate;

#include "CWR_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    ["sgun_HunterShotgun_01_F", 2], ["2Rnd_12Gauge_Pellets", 16], ["2Rnd_12Gauge_Slug", 8],
    ["CUP_srifle_Mosin_Nagant", 1], ["CUP_5Rnd_762x54_Mosin_M",20],
    ["CUP_hgun_FlareGun",2], ["CUP_FlareWhite_265_M", 5],["CUP_FlareRed_265_M",5],["CUP_FlareGreen_265_M", 5],
    ["CUP_hgun_TT", 2], ["CUP_8Rnd_762x25_TT", 32],
    ["IEDUrbanSmall_Remote_Mag", 2], ["IEDLandSmall_Remote_Mag", 2],
    ["cwr3_i_vest_chicom", 6], ["cwr3_i_vest_58webbing",6],
    ["Binocular",10],

    "cwr3_o_backpack_gasmask", "cwr3_o_backpack_harness_roll",

    "ACE_EarPlugs",
    "ACE_RangeCard",
    "ACE_Clacker",
    "ACE_DefusalKit",
    "ACE_MapTools",
    "ACE_wirecutter",
    "ACE_RangeTable_82mm",
    "ACE_EntrenchingTool",
    "ACE_Cellphone",
    "ACE_CableTie",
    "ACE_SpottingScope",
    "ACE_Tripod",
    "ACE_Spraypaintred",
    "ACE_SpareBarrel",
    "ACE_Flashlight_XL50",
    "ACE_HandFlare_White",
    "ACE_Chemlight_HiBlue",
    "ACE_Chemlight_HiGreen",
    "ACE_Chemlight_HiRed",
    "ACE_Chemlight_HiWhite",
    "ACE_Chemlight_HiYellow",
    "ACE_Chemlight_Orange",
    "ACE_Chemlight_UltraHiOrange",
    "ACE_Chemlight_White",
    "ACE_bodyBag",
    "ACE_personalAidKit",

    ["ACE_fieldDressing", 15],
    ["ACE_salineIV_250", 4],
    ["ACE_tourniquet", 6],
    ["ACE_morphine", 3],
    ["ACE_splint", 5],
    ["ACE_bloodIV_250", 2]
];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "cwr3_i_uniform_alpenflage",
    "cwr3_i_uniform_fleckerlteppich",
    "cwr3_i_uniform_blumentarn",
    "cwr3_i_uniform_dpm_gloves",
    "cwr3_i_uniform_jigsaw_rolled",
    "cwr3_i_uniform_M62",
    "cwr3_i_uniform_og107",
    "cwr3_i_uniform_splitter_weathered",
    "cwr3_i_uniform_winter_gloves",
    "cwr3_o_uniform_m1969_barracks",
    "cwr3_o_uniform_m1969",
    "cwr3_o_uniform_m1972_tanker",
    "cwr3_o_uniform_m1982",
    "cwr3_o_uniform_m1982_rolled",
    "cwr3_o_uniform_klmk_1957_birch_v1",
    "cwr3_b_uniform_m65_woodland",
    "cwr3_b_uniform_m81_woodland_rolled_usmc",
    "CUP_U_B_BDUv2_roll2_dirty_OD_US",
    "cwr3_i_headgear_beret_02_black_fia",
    "cwr3_i_headgear_beret_02_green_fia",
    "cwr3_i_headgear_beret_01_brown_fia",
    "cwr3_i_headgear_beret_01_blue_fia",
    "cwr3_o_headgear_officer_cap_field",
    "cwr3_o_headgear_sidecap_m1973",
    "cwr3_o_bandanna_klmk",
    "cwr3_o_bandanna_od",
    "H_Bandanna_sand",
    "CUP_H_FR_BandanaWdl",
    "H_Watchcap_blk",
    "H_Watchcap_camo",
    "CUP_H_ChDKZ_Beanie",
    "SP_Beret_Brown",
    "cwr3_i_headgear_beret_02_km",
    "cwr3_b_uk_headgear_beret_para",
    "cwr3_b_uk_headgear_beret_rm",
    "cwr3_b_uk_headgear_beret_tank",
    "cwr3_o_beret_vmf",

    "cwr3_i_vest_ammo_pouch",
    "sp_webbing_58pattern_beltorder",
    "sp_webbing_58pattern_fightingorder",
    "sp_webbing_58pattern_nbc",
    "cwr3_o_vest_officer_jacket"

];          //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "cwr3_i_uniform_alpenflage",
    "cwr3_i_uniform_fleckerlteppich",
    "cwr3_i_uniform_blumentarn",
    "cwr3_i_uniform_dpm_gloves",
    "cwr3_i_uniform_jigsaw_rolled",
    "cwr3_i_uniform_M62",
    "cwr3_i_uniform_og107",
    "cwr3_i_uniform_splitter_weathered"
];          //Uniforms given to AI Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "cwr3_i_headgear_beret_02_black_fia",
    "cwr3_i_headgear_beret_02_green_fia",
    "cwr3_i_headgear_beret_01_brown_fia",
    "cwr3_i_headgear_beret_01_blue_fia",
    "cwr3_o_headgear_officer_cap_field",
    "cwr3_o_headgear_sidecap_m1973",
    "cwr3_o_bandanna_klmk",
    "cwr3_o_bandanna_od",
    "H_Bandanna_sand",
    "CUP_H_FR_BandanaWdl",
    "H_Watchcap_blk",
    "H_Watchcap_camo",
    "CUP_H_ChDKZ_Beanie",
    "SP_Beret_Brown",
    "cwr3_i_headgear_beret_02_km",
    "cwr3_b_uk_headgear_beret_para",
    "cwr3_b_uk_headgear_beret_rm",
    "cwr3_b_uk_headgear_beret_tank",
    "cwr3_o_beret_vmf"
    ]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09",
"Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", ["None","CUP_G_Balaclava_blk","CUP_G_Balaclava_oli","CUP_G_Bandanna_aviator","CUP_G_Bandanna_beast",
"CUP_G_Bandanna_blk","CUP_G_Bandanna_khk","CUP_G_Bandanna_oli","CUP_G_Bandanna_shades","CUP_G_Shades_Black"
]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;