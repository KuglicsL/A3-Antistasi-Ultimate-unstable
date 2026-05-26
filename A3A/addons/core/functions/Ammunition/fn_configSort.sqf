params [["_fnc_filter", {
	true
}]];

// /////////////////////////
// // INIT EMPTY ARRAYS// //
// /////////////////////////
private _allWeaponConfigs = [];
private _allMagazineConfigs = [];
private _allBackpackConfigs = [];
private _allGlassesConfigs = [];

// /////////////////////////
// ////// BACKPACKS// //////
// /////////////////////////


private _rebelEquipFlags = getArray (configFile/"A3A"/"Templates"/(_factions#2)/"equipFlags");
private _cwEarly = ("coldWarEarly" in _rebelEquipFlags);
private _cwMid = ("coldWarMid" in _rebelEquipFlags);
private _cwLate = ("coldWarLate" in _rebelEquipFlags);

if (("coldWar" in A3A_factionEquipFlags) or _cwEarly or _cwMid or _cwLate) then {


	//////////////////////////////////////////////////////////////////////////////////////////////
	//// Cold war weapon whitelists divided by class and timeline (pre 60s, 60s-80s, 80s-90s) ////
	//////////////////////////////////////////////////////////////////////////////////////////////

	private _coldWarGlasses = [
		"G_Aviator","G_Lady_Blue","CUP_G_Scarf_Face_Blk","cwr3_b_facewear_scrimnet_scarf_olive","CUP_PMC_Facewrap_Black"

	];

	private _coldWarClothes = [
		"cwr3_o_uniform_m1969_barracks","cwr3_o_uniform_m1969","cwr3_o_uniform_m1972_tanker","cwr3_o_uniform_m1982","cwr3_o_uniform_m1982_rolled",
		"cwr3_o_uniform_klmk_1957_birch_v1","cwr3_b_uniform_og107","cwr3_b_uniform_m65_woodland","cwr3_b_uniform_m81_woodland_rolled_usmc","CUP_U_B_BDUv2_roll2_dirty_OD_US","cwr3_o_vest_harness_officer",
		"cwr3_o_vest_harness_ak74","cwr3_o_vest_harness_mg","cwr3_o_vest_harness_svd","cwr3_b_vest_alice_light","cwr3_b_vest_alice_mg","cwr3_b_vest_alice_officer","cwr3_o_headgear_ssh68_camo",
		"cwr3_o_headgear_ssh68","cwr3_o_headgear_officer_cap_field","cwr3_o_headgear_sidecap_m1973","cwr3_o_headgear_tsh4","CUP_H_SLA_Helmet_OD_worn","cwr3_b_headgear_m1_mitchell","cwr3_b_headgear_m1_goggles_mitchell",
		"cwr3_b_headgear_m1_woodland_army_1985","cwr3_b_headgear_m1_olive", "cwr3_o_bandanna_klmk", "cwr3_o_bandanna_od", "H_Bandanna_sand", "CUP_H_FR_BandanaWdl", "H_Watchcap_blk", "H_Watchcap_camo", "CUP_H_ChDKZ_Beanie",
		"cwr3_i_headgear_beret_01_blue_fia", "SP_Beret_Brown", "cwr3_i_headgear_beret_02_green_fia", "cwr3_i_headgear_beret_02_km", "cwr3_b_uk_headgear_beret_para", "cwr3_b_uk_headgear_beret_rm", "cwr3_b_uk_headgear_beret_tank",
		"cwr3_o_beret_vmf"
	];

	//Explosives
	private _coldWarExplosives = [
		"APERSMine_Range_Mag", "CUP_TimeBomb_M", "CUP_Mine_M", "CUP_MineE_M", "CUP_PipeBomb_M", "CUP_IED_V1_M", "CUP_IED_V2_M", "CUP_IED_V3_M", "CUP_IED_V4_M", "APERSBoundingMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag", 
		"APERSBoundingMine_Range_Mag", "APERSTripMine_Wire_Mag", "ACE_M84", "CUP_HandGrenade_RGD5","CUP_HandGrenade_RGO","SP_l2a1_grenade","ACE_Chemlight_IR", "Chemlight_red","Chemlight_green","ACE_Chemlight_White"
	];


	///////////
	// EARLY //
	///////////
	private _coldWarAttachmentsEarly = [
		"CUP_acc_CZ_M3X", "CUP_acc_Flashlight", "acc_flashlight", "CUP_acc_Zenit_2DS", "CUP_bipod_FNFAL", "CUP_bipod_Sa58", "bipod_01_F_blk", "CUP_optic_no23mk2", "CUP_optic_PEM", "CUP_optic_GrozaScope",
		"CUP_muzzle_mfsup_Flashhider_West_Base", "CUP_muzzle_mfsup_Flashhider_545x39_Black", "CUP_muzzle_mfsup_Flashhider_545x39_OD", "CUP_muzzle_mfsup_Flashhider_545x39_Tan", "CUP_muzzle_mfsup_Flashhider_556x45_Black",
		"CUP_muzzle_mfsup_Flashhider_556x45_OD", "CUP_muzzle_mfsup_Flashhider_556x45_Tan", "CUP_muzzle_mfsup_Flashhider_762x39_Black", "CUP_muzzle_mfsup_Flashhider_762x39_Tan",
		"CUP_muzzle_mfsup_Flashhider_762x51_Black", "CUP_muzzle_mfsup_Flashhider_762x51_OD", "CUP_muzzle_mfsup_Flashhider_762x51_Tan", "CUP_muzzle_mfsup_flashhider_Sa58", "CUP_muzzle_snds_M3A1_blk",
		"CUP_muzzle_snds_M3A1", "CUP_muzzle_snds_M3A1_snd", "CUP_muzzle_mfsup_Zendl", "sp_fwa_scope_zf39", "sp_fwa_muzzle_garand_flash_hider", "sp_fwa_scope_garand_m84", "ACE_muzzle_mzls_B", "CUP_optic_Leupold_VX3",
		"cwr3_muzzle_snds_aps", "sp_fwa_scope_ar_delft3x25", "sp_fwa_acc_bipod_browning","sp_fwa_acc_bipod_bar"
	];

	private _coldWarWeaponsEarly = [
		"CUP_arifle_AKM_Early", "CUP_arifle_AKMS_Early", "CUP_arifle_AK47", "CUP_arifle_AKS", "sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F", "CUP_arifle_FNFAL5060",
		"CUP_arifle_FNFAL5060_desert", "CUP_arifle_Gewehr1", "CUP_arifle_Sa58_Klec", "CUP_arifle_Sa58V_woodland", "CUP_arifle_TYPE_56_2_Early",
		"CUP_lmg_L7A2_Flat", "CUP_lmg_FNMAG", "CUP_lmg_MG3", "CUP_lmg_UK59", "cwr3_lmg_bren", "cwr3_arifle_l1a1", "CUP_srifle_M14", "CUP_srifle_LeeEnfield", "CUP_srifle_Mosin_Nagant", "CUP_SKS",
		
		"CUP_hgun_Browning_HP", "CUP_hgun_Colt1911", "CUP_hgun_TT", "cwr3_hgun_aps", "CUP_hgun_SA61", "CUP_smg_M3A1", "cwr3_smg_sterling", 
		"CUP_hgun_FlareGun", "cwr3_hgun_revolver",

		"sp_fwa_ar10","sp_fwa_ar10_porto_carbine","sp_fwa_smg_thompson_m1a1",
		"sp_fwa_m1919a6_browning","sp_fwa_smg_carlg_m45","sp_fwa_m1918a2_bar","cwr3_srifle_cz550", "sp_fwa_kar_98k", "sp_fwa_m1_garand", "sp_fwa_stg44", "sp_fwa_smg_mp40_black",

		"cwr3_launch_carlgustaf", "CUP_launch_RPG7V", "sp_fwa_2InchMortar"
		
	];


	private _coldWarMagazinesEarly = [
		//7.62x39
		"CUP_30Rnd_762x39_AK47_M", "CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_762x39_AKM_bakelite_desert_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M",
		//7.62x51 FAL
		"CUP_20Rnd_762x51_FNFAL_M", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_FNFAL_M", "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", "CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M",
		"CUP_20Rnd_762x51_FNFAL_Desert_M", "CUP_20Rnd_762x51_FNFAL_Woodland_M", "CUP_10Rnd_762x51_FNFAL_M", "CUP_30Rnd_762x51_FNFAL_M",
		//7.62x39 KLEC
		"CUP_45Rnd_Sa58_M", "CUP_45Rnd_Sa58_M_TracerG", "CUP_45Rnd_Sa58_M_TracerR", "CUP_45Rnd_Sa58_M_TracerY", "CUP_30Rnd_Sa58_M",
		"CUP_30Rnd_Sa58_M_TracerG", "CUP_30Rnd_Sa58_M_TracerR", "CUP_30Rnd_Sa58_M_TracerY", "CUP_30Rnd_Sa58_desert_M", "CUP_30Rnd_Sa58_woodland_M", "CUP_20Rnd_Sa58_M", "CUP_15Rnd_Sa58_M",
		//7.62x51, 7.62x54, .303,  other rifle rounds
		"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M",
		"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", "CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M", "CUP_120Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M",
		"CUP_50Rnd_UK59_762x54R_Tracer", "cwr3_30rnd_762x51_bren_m", "sp_fwa_50Rnd_3006_mag","sp_fwa_20Rnd_3006_BAR", "sp_fwa_20Rnd_762_ar10",
		"sp_fwa_8Rnd_3006_Garand_Tracer","sp_fwa_8Rnd_3006_Garand","sp_fwa_1rnd_riflegrenade_mas_ap","sp_fwa_1rnd_riflegrenade_mas_wp","sp_fwa_1rnd_riflegrenade_mas_flare","sp_fwa_1rnd_riflegrenade_mas_at_s",
		"sp_fwa_1rnd_riflegrenade_mas_dp","sp_fwa_1rnd_riflegrenade_m9a1_at","sp_fwa_1rnd_riflegrenade_m31_at",
		"sp_fwa_30Rnd_792x33_STG44_Ball","sp_fwa_30Rnd_792x33_STG44_Tracer","sp_fwa_30Rnd_792x33_STG44",
		//12 gauge
		"2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug",
		//Launcher
		"cwr3_carlgustaf_heat_m","cwr3_carlgustaf_hedp_m", "CUP_PG7V_M",
		//Handguns + SMG
		"CUP_13Rnd_9x19_Browning_HP", "CUP_7Rnd_45ACP_1911", "CUP_10Rnd_B_765x17_Ball_M","CUP_20Rnd_B_765x17_Ball_M","CUP_50Rnd_B_765x17_Ball_M", "CUP_8Rnd_762x25_TT", "CUP_30Rnd_45ACP_M3A1_M",
		"cwr3_20rnd_9x18_aps_m","cwr3_6rnd_revolver_m", "cwr3_30rnd_sterling_m", "sp_fwa_20Rnd_45acp_thompson_m1a1", "sp_fwa_36Rnd_9mm_carlg_m45",
		"sp_fwa_32Rnd_9x19_mp40","sp_fwa_32Rnd_9x19_mp40_Tracer","sp_fwa_32Rnd_9x19_mp40_Ball",
		//Flares
		"CUP_FlareWhite_265_M","CUP_FlareRed_265_M","CUP_FlareGreen_265_M","CUP_FlareYellow_265_M","CUP_IllumFlareWhite_265_M","CUP_IllumFlareRed_265_M",
		"CUP_IllumFlareGreen_265_M","CUP_IllumFlareYellow_265_M","CUP_StarClusterWhite_265_M","CUP_StarClusterRed_265_M","CUP_StarClusterGreen_265_M","CUP_StarClusterYellow_265_M",
		//Snipers
		"CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR","CUP_20Rnd_TE1_Red_Tracer_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR","CUP_20Rnd_TE1_White_Tracer_762x51_DMR",
		"20Rnd_762x51_Mag","10Rnd_Mk14_762x51_Mag", "CUP_10x_303_M", "CUP_5Rnd_762x54_Mosin_M", "CUP_10Rnd_762x39_SKS_M", "cwr3_5rnd_cz550_m", "sp_fwa_5Rnd_792x57_K98_Tracer", "sp_fwa_5Rnd_792x57_K98",
		//Mortar
		"sp_fwa_2inch_he_mag","sp_fwa_2inch_wp_mag","sp_fwa_2inch_smoke_mag","sp_fwa_2inch_flare_mag","sp_fwa_2inch_signal_red_mag","sp_fwa_2inch_signal_green_mag","sp_fwa_2inch_signal_multi_wht_mag",
		"sp_fwa_2inch_signal_multi_red_mag","sp_fwa_2inch_signal_multi_green_mag","sp_fwa_2inch_signal_multi_redgreen_mag"
	];

	private _coldWarBackpacksEarly = [
		"cwr3_b_uk_backpack", "cwr3_i_backpack", "cwr3_b_backpack_m5_medic_empty", "cwr3_o_backpack_rd54", "cwr3_o_backpack_gasmask", "cwr3_o_backpack_veshmeshok", "cwr3_o_backpack_veshmeshok_medic_empty",
		"sp_webbing_58pattern_LargePack", "SP_Backpack_RucksackGS_CarlGustav", "cwr3_o_backpack_rpg7"
	];

	private _coldWarNVGEarly = [

	];

	///////////
	/// MID ///
	///////////

	private _coldWarAttachmentsMid = [
		"CUP_optic_MAAWS_Scope", "CUP_acc_CZ_M3X", "CUP_acc_Flashlight", "acc_flashlight", "CUP_acc_Zenit_2DS", "CUP_bipod_FNFAL","CUP_optic_PGO7V3", "CUP_optic_PSO_1", "CUP_optic_PSO_1_AK", "bipod_01_F_blk",
		"CUP_optic_PSO_1_open", "CUP_optic_PSO_1_AK_open", "CUP_optic_PSO_1_1", "CUP_optic_PSO_1_1_open", "CUP_optic_artel_m14", "CUP_optic_Remington", "CUP_muzzle_mfsup_Flashhider_PK_Black", "CUP_muzzle_snds_M14",
		"CUP_muzzle_mfsup_Flashhider_PK_OD", "CUP_muzzle_mfsup_Flashhider_PK_Tan", "CUP_muzzle_PB6P9", "CUP_muzzle_Bizon", "CUP_muzzle_PBS4", "CUP_muzzle_mfsup_Flashhider_545x39_Black", "sp_fwa_muzzle_sionicsmaw556",
		"CUP_muzzle_snds_SA61", "cwr3_optic_suit", "cwr3_optic_iws", "ACE_muzzle_mzls_L", "CUP_muzzle_snds_FAMAS", "muzzle_snds_acp", "ACE_muzzle_mzls_smg_01", "CUP_acc_Flashlight_MP5", "ACE_muzzle_mzls_smg_02",
		"CUP_muzzle_mfsup_Flashhider_762x39_Black","CUP_muzzle_mfsup_Flashhider_762x39_Tan", "ACE_muzzle_mzls_B","CUP_muzzle_mfsup_Flashhider_762x51_Black", "muzzle_snds_B", "CUP_optic_Leupold_VX3",
		"CUP_muzzle_mfsup_Flashhider_556x45_Black","CUP_muzzle_mfsup_Flashhider_556x45_Tan", "cwr3_muzzle_snds_aps"
	];

	private _coldWarWeaponsMid = [
		
		"CUP_hgun_FlareGun", "sp_fwa_2InchMortar", "CUP_arifle_AK47", "sgun_HunterShotgun_01_F", "CUP_lmg_MG3", "cwr3_arifle_l1a1", "CUP_srifle_M14","CUP_SKS","CUP_lmg_L7A2_Flat",
		
		"CUP_arifle_AKM_GL", "CUP_arifle_AK74_Early", "CUP_arifle_AK74", "CUP_arifle_AK74_GL", "CUP_arifle_AKM", "CUP_arifle_AKM_snds", "CUP_arifle_AKMS_GL_Early",
		"CUP_arifle_AKMS", "CUP_arifle_AKMS_GL", "CUP_arifle_AK47_GL", "CUP_arifle_AKS74", "CUP_arifle_AKS74U", "CUP_arifle_AUG_A1",
		"CUP_arifle_FNFAL5060_desert", "CUP_arifle_FNFAL5062", "CUP_arifle_FNFAL", "CUP_arifle_FNFAL_desert", "CUP_arifle_FNFAL_sand",
		"CUP_arifle_FNFAL5061_wooden", "CUP_arifle_Galil_556_black", "CUP_arifle_Galil_black", "CUP_arifle_Galil_SAR_black", "CUP_arifle_M16A1", "CUP_arifle_M16A1GL", "CUP_arifle_M16A1E1",
		"CUP_arifle_M16A1E1GL", "CUP_arifle_RPK74_45", "sp_fwa_ar18",
		"CUP_srifle_M40A3", "CUP_srifle_M21", "CUP_srifle_Remington700_scoped", "CUP_srifle_SVD_pso", "CUP_lmg_M240", "CUP_lmg_M60", "CUP_lmg_PKM", "CUP_lmg_PKMN",
		"CUP_Famas_F1", "CUP_glaunch_M79", "CUP_smg_Mac10", "CUP_hgun_Makarov", "CUP_hgun_PB6P9", "sp_fwa_smg_carlg_m45", "CUP_smg_MP5A5", "CUP_smg_MP5SD6", "cwr3_hgun_aps_sd", "cwr3_smg_sterling_sd",
		"CUP_sgun_AA12", "CUP_sgun_CZ584", "CUP_sgun_SPAS12",

		"cwr3_launch_carlgustaf", "CUP_launch_RPG7V", "CUP_launch_M47", "CUP_launch_M72A6", "CUP_launch_RPG18", "CUP_launch_9K32Strela"
	];

	private _coldWarMagazinesMid = [
		"CUP_FlareWhite_265_M","CUP_FlareRed_265_M","CUP_FlareGreen_265_M","CUP_FlareYellow_265_M","CUP_IllumFlareWhite_265_M","CUP_IllumFlareRed_265_M","CUP_IllumFlareGreen_265_M",
		"CUP_IllumFlareYellow_265_M","CUP_StarClusterWhite_265_M","CUP_StarClusterRed_265_M","CUP_StarClusterGreen_265_M","CUP_StarClusterYellow_265_M",
		"CUP_30Rnd_762x39_AK47_M","CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M","CUP_30Rnd_762x39_AK47_bakelite_M","CUP_30Rnd_762x39_AKM_bakelite_desert_M",
		"2Rnd_12Gauge_Pellets","2Rnd_12Gauge_Slug",
		"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M",
		"CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_TE1_Yellow_Tracer_762x51_FNFAL_M","CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M","CUP_20Rnd_TE1_Green_Tracer_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_Desert_M",
		"CUP_20Rnd_762x51_FNFAL_Woodland_M","CUP_10Rnd_762x51_FNFAL_M","CUP_30Rnd_762x51_FNFAL_M",
		"CUP_10Rnd_762x39_SKS_M",
		"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M",
		"sp_fwa_36Rnd_9mm_carlg_m45",
		"cwr3_carlgustaf_heat_m","cwr3_carlgustaf_hedp_m",
		"sp_fwa_2inch_he_mag","sp_fwa_2inch_wp_mag","sp_fwa_2inch_smoke_mag","sp_fwa_2inch_flare_mag","sp_fwa_2inch_signal_red_mag","sp_fwa_2inch_signal_green_mag","sp_fwa_2inch_signal_multi_wht_mag",
		"sp_fwa_2inch_signal_multi_red_mag","sp_fwa_2inch_signal_multi_green_mag","sp_fwa_2inch_signal_multi_redgreen_mag",
		//5.45x39
		"CUP_30Rnd_545x39_AK_M", "CUP_30Rnd_Subsonic_545x39_AK_M", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M",
		"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M",
		"CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M", "CUP_30Rnd_545x39_AK74M_M",
		"CUP_30Rnd_Subsonic_545x39_AK74M_M",
		"CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74M_M",
		"CUP_30Rnd_TE1_White_Tracer_545x39_AK74M_M", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M",
		"CUP_30Rnd_545x39_AK74M_camo_M",
		"CUP_60Rnd_545x39_AK74M_M",
		"CUP_20Rnd_545x39_AKSU_M", "CUP_20Rnd_Subsonic_545x39_AKSU_M",
		"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M",
		//7.62x39
		"CUP_20Rnd_762x39_AMD63_M", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
		"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
		//5.56x45
		"CUP_30Rnd_556x45_AUG", "CUP_30Rnd_TE1_Red_Tracer_556x45_AUG",
		"CUP_30Rnd_TE1_Yellow_Tracer_556x45_AUG", "CUP_30Rnd_TE1_Green_Tracer_556x45_AUG",
		"CUP_35Rnd_556x45_Galil_Mag", "CUP_35Rnd_556x45_Red_Tracer_Galil_Mag", "CUP_35Rnd_556x45_Green_Tracer_Galil_Mag",
		"CUP_50Rnd_556x45_Galil_Mag", "CUP_50Rnd_556x45_Red_Tracer_Galil_Mag", "CUP_50Rnd_556x45_Green_Tracer_Galil_Mag",
		"CUP_20Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag",
		"30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green",
		"30Rnd_556x45_Stanag_Tracer_Yellow", "30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_green",
		"CUP_100Rnd_556x45_BetaCMag_ar15", "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_ar15",
		"CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_ar15", "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_ar15",
		"CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas_Tracer_Red","CUP_25Rnd_556x45_Famas_Tracer_Green","CUP_25Rnd_556x45_Famas_Tracer_Yellow",
		"CUP_25Rnd_556x45_Famas_Wood","CUP_25Rnd_556x45_Famas_Wood_Tracer_Red","CUP_25Rnd_556x45_Famas_Wood_Tracer_Green",
		"CUP_25Rnd_556x45_Famas_Wood_Tracer_Yellow","CUP_25Rnd_556x45_Famas_Arid","CUP_25Rnd_556x45_Famas_Arid_Tracer_Red",
		"CUP_25Rnd_556x45_Famas_Arid_Tracer_Green","CUP_25Rnd_556x45_Famas_Arid_Tracer_Yellow",
		"sp_fwa_20Rnd_556_Ar18",
		//7.62x51
		"CUP_25Rnd_762x51_Galil_Mag","CUP_25Rnd_762x51_Red_Tracers_Galil_Mag","CUP_25Rnd_762x51_Green_Tracers_Galil_Mag", 
		//7.62x54
		"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M",
		"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M",
		//40mm Soviet
		"CUP_1Rnd_HE_GP25_M", "CUP_IlumFlareWhite_GP25_M", "CUP_IlumFlareRed_GP25_M", "CUP_IlumFlareGreen_GP25_M",
		"CUP_FlareWhite_GP25_M", "CUP_FlareGreen_GP25_M", "CUP_FlareRed_GP25_M", "CUP_FlareYellow_GP25_M",
		"CUP_1Rnd_SMOKE_GP25_M", "CUP_1Rnd_SMOKERED_GP25_M", "CUP_1Rnd_SMOKEGREEN_GP25_M", "CUP_1Rnd_SMOKEYELLOW_GP25_M",
		//40mm US
		"CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203",
		"CUP_1Rnd_StarCluster_White_M203", "CUP_1Rnd_StarCluster_Red_M203", "CUP_1Rnd_StarCluster_Green_M203",
		"CUP_1Rnd_StarFlare_White_M203", "CUP_1Rnd_StarFlare_Red_M203", "CUP_1Rnd_StarFlare_Green_M203",
		"CUP_FlareWhite_M203", "CUP_FlareGreen_M203", "CUP_FlareRed_M203", "CUP_FlareYellow_M203",
		"CUP_1Rnd_Smoke_M203", "CUP_1Rnd_SmokeRed_M203", "CUP_1Rnd_SmokeGreen_M203", "CUP_1Rnd_SmokeYellow_M203",
		//12 gauge
		"CUP_20Rnd_B_AA12_Pellets","CUP_20Rnd_B_AA12_74Slug","CUP_20Rnd_B_AA12_HE",
		"CUP_1Rnd_12Gauge_Pellets_No00_Buck","CUP_1Rnd_12Gauge_Pellets_No0_Buck","CUP_1Rnd_12Gauge_Pellets_No1_Buck","CUP_1Rnd_12Gauge_Pellets_No2_Buck",
		"CUP_1Rnd_12Gauge_Pellets_No3_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Bird","CUP_1Rnd_12Gauge_Slug","CUP_1Rnd_12Gauge_HE","CUP_7Rnd_B_CZ584_OFP",

		"CUP_8Rnd_12Gauge_Pellets_No00_Buck","CUP_8Rnd_12Gauge_Pellets_No0_Buck","CUP_8Rnd_12Gauge_Pellets_No1_Buck","CUP_8Rnd_12Gauge_Pellets_No2_Buck",
		"CUP_8Rnd_12Gauge_Pellets_No3_Buck","CUP_8Rnd_12Gauge_Pellets_No4_Buck","CUP_8Rnd_12Gauge_Pellets_No4_Bird","CUP_8Rnd_12Gauge_Slug","CUP_8Rnd_12Gauge_HE", 
		//Launcher
		"CUP_Dragon_EP1_M",
		"CUP_PG7V_M", "CUP_PG7VM_M", "CUP_PG7VL_M",
		//Handguns + SMG
		"CUP_30Rnd_45ACP_MAC10_M","CUP_30Rnd_45ACP_Yellow_Tracer_MAC10_M","CUP_30Rnd_45ACP_Green_Tracer_MAC10_M",
		"CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_MakarovSD_M", "cwr3_20rnd_9x18_aps_m", "cwr3_30rnd_sterling_m", 
		"CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5","CUP_30Rnd_Red_Tracer_9x19_MP5","CUP_30Rnd_Yellow_Tracer_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5",
		//Snipers
		"CUP_5Rnd_762x51_M24", "CUP_20Rnd_762x51_DMR","CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR","CUP_20Rnd_TE1_Red_Tracer_762x51_DMR","CUP_20Rnd_TE1_Green_Tracer_762x51_DMR","CUP_20Rnd_TE1_White_Tracer_762x51_DMR",
		"20Rnd_762x51_Mag","10Rnd_Mk14_762x51_Mag", "CUP_6Rnd_762x51_R700", "CUP_10Rnd_762x54_SVD_M","CUP_1Rnd_762x51_CZ584"
	];

	private _coldWarBackpacksMid = [
		"cwr3_b_backpack_alice", "CUP_B_CivPack_WDL"
	];

	private _coldWarNVGMid = [ 
		"cwr3_o_nvg_pnv57", "cwr3_o_nvg_pnv57_tsh3" 
	];

	////////////
	/// LATE ///
	////////////

	private _coldWarAttachmentsLate = [
		"CUP_optic_LeupoldMk4", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "CUP_optic_LeupoldMk4_MRT_tan", "CUP_optic_LeupoldM3LR", "CUP_optic_LeupoldMk4_20x40_LRT", "CUP_acc_sffh",
		"CUP_optic_LeupoldMk4_25x50_LRT", "CUP_optic_LeupoldMk4_25x50_LRT_SNOW", "CUP_optic_NSPU_RPG", "CUP_optic_NSPU", "CUP_muzzle_mfsup_Flashhider_545x39_Black", "CUP_muzzle_snds_L85",
		"CUP_optic_PGO7V3", "CUP_optic_PSO_3", "CUP_optic_PSO_3_open", "CUP_optic_SMAW_Scope", "CUP_optic_SUSAT", "CUP_optic_ACOG_TA01B_Black","CUP_optic_RCO", "CUP_optic_ACOG_TA01B_Tan", 
		"CUP_muzzle_snds_MicroUzi", "CUP_muzzle_snds_UZI", "muzzle_snds_B", "muzzle_snds_L", "CUP_muzzle_TGPA", "CUP_muzzle_TGPA_desert", "CUP_muzzle_TGPA_woodland",
		"CUP_optic_ACOG_TA01B_Tropic", "CUP_muzzle_snds_KZRZP_AK545", "CUP_muzzle_snds_KZRZP_AK545_desert", "CUP_muzzle_snds_KZRZP_AK545_woodland", "CUP_muzzle_snds_KZRZP_AK762", "CUP_muzzle_snds_KZRZP_AK762_desert",
		"CUP_muzzle_snds_KZRZP_AK762_woodland", "CUP_muzzle_snds_KZRZP_PK", "CUP_muzzle_snds_KZRZP_PK_desert", "CUP_muzzle_snds_KZRZP_PK_woodland", "CUP_muzzle_snds_KZRZP_SVD", "CUP_muzzle_snds_KZRZP_SVD_desert",
		"CUP_muzzle_snds_KZRZP_SVD_woodland", "CUP_muzzle_snds_M14", "CUP_muzzle_snds_M9", "ACE_SPIR", "muzzle_snds_570", 
		"CUP_optic_SB_3_12x50_PMII", "CUP_optic_SB_11_4x20_PM", "ACE_optic_SOS_2D", "CUP_optic_HensoldtZO_low",
		"CUP_optic_Aimpoint_5000", "CUP_optic_ZDDot", "CUP_muzzle_snds_FAMAS", "CUP_optic_MAAWS_Scope", 
		"CUP_muzzle_mfsup_Flashhider_PK_Black", "CUP_optic_PSO_1", "CUP_muzzle_mfsup_Flashhider_762x39_Black", "CUP_acc_Zenit_2DS", "acc_flashlight", "CUP_acc_Flashlight",
		"CUP_optic_Leupold_VX3", "ACE_muzzle_mzls_L","bipod_01_F_blk","CUP_muzzle_mfsup_Flashhider_556x45_Black", "CUP_acc_Flashlight_MP5","ACE_muzzle_mzls_smg_02"
	];

	private _coldWarWeaponsLate = [
		"CUP_lmg_MG3",  "CUP_arifle_AKM", "CUP_arifle_AK74_GL", "CUP_arifle_AK74", "CUP_arifle_RPK74_45", "CUP_lmg_PKMN", "CUP_srifle_SVD_pso",
		"CUP_arifle_M16A1E1", "CUP_arifle_M16A1E1GL", "CUP_srifle_M40A3", "CUP_arifle_AUG_A1", "CUP_Famas_F1", "CUP_glaunch_M79",
		"CUP_smg_MP5A5", "CUP_smg_MP5SD6", "CUP_sgun_AA12", "CUP_sgun_SPAS12",

		"CUP_arifle_AK101", "CUP_arifle_AK101_GL", "CUP_arifle_AK74M", "CUP_arifle_AK74M_desert", "CUP_arifle_AS_VAL", "CUP_arifle_AS_VAL_flash", "CUP_arifle_AS_VAL_top_rail", "CUP_arifle_AS_VAL_VFG", "CUP_srifle_VSSVintorez",
		"CUP_srifle_VSSVintorez_top_rail", "CUP_arifle_M16A2",	"CUP_arifle_M16A2_GL", "CUP_arifle_Colt727", "CUP_arifle_Colt727_M203", "CUP_srifle_M107_Base", "CUP_srifle_M24_blk", 
		"CUP_lmg_L110A1", "CUP_lmg_M240_B","CUP_lmg_M249_E1", "CUP_lmg_M249_E2", "CUP_lmg_minimipara", "CUP_lmg_minimi_railed",
		"CUP_arifle_L85A2", "CUP_arifle_L86A2", "CUP_glaunch_M32",
		"CUP_hgun_CZ75", "CUP_hgun_Deagle", "CUP_hgun_M9" , "CUP_hgun_MicroUzi", "CUP_hgun_TEC9_FA", "CUP_hgun_UZI", "CUP_smg_p90_black",

		"cwr3_launch_carlgustaf", "CUP_launch_RPG7V", "CUP_launch_M47", "CUP_launch_M72A6", "CUP_launch_RPG18", "CUP_launch_APILAS", "CUP_launch_BF3", "CUP_launch_FIM92Stinger", "CUP_launch_Igla", "CUP_launch_M136", 
		"CUP_launch_Mk153Mod0", "CUP_launch_RPG26", "CUP_launch_RShG2"
	];

	private _coldWarMagazinesLate = [
		"CUP_120Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_120Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M",
		"CUP_30Rnd_762x39_AK47_bakelite_M","CUP_30Rnd_762x39_AK47_M","CUP_20Rnd_762x39_AMD63_M","CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M","CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
		"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M","CUP_30Rnd_762x39_AKM_bakelite_desert_M",
		"CUP_30Rnd_545x39_AK_M","CUP_30Rnd_Subsonic_545x39_AK_M","CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M","CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M","CUP_30Rnd_TE1_White_Tracer_545x39_AK_M","CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M",
		"CUP_30Rnd_545x39_AK74M_M","CUP_30Rnd_Subsonic_545x39_AK74M_M","CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M","CUP_30Rnd_TE1_Red_Tracer_545x39_AK74M_M","CUP_30Rnd_TE1_White_Tracer_545x39_AK74M_M",
		"CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK74M_M","CUP_30Rnd_545x39_AK74M_camo_M","CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M","CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M",
		"CUP_60Rnd_545x39_AK74M_M","CUP_20Rnd_545x39_AKSU_M","CUP_20Rnd_Subsonic_545x39_AKSU_M","CUP_1Rnd_HE_GP25_M","CUP_IlumFlareWhite_GP25_M","CUP_IlumFlareRed_GP25_M","CUP_IlumFlareGreen_GP25_M",
		"CUP_FlareWhite_GP25_M","CUP_FlareGreen_GP25_M","CUP_FlareRed_GP25_M","CUP_FlareYellow_GP25_M","CUP_1Rnd_SMOKE_GP25_M",
		"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M","CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Yellow_M",
		"CUP_10Rnd_762x54_SVD_M",
		"CUP_30Rnd_556x45_Stanag","CUP_20Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_green",
		"CUP_100Rnd_556x45_BetaCMag_ar15","CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_ar15","CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_ar15","CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag_ar15",
		"CUP_1Rnd_HE_M203","CUP_1Rnd_HEDP_M203","CUP_1Rnd_StarCluster_White_M203","CUP_1Rnd_StarCluster_Red_M203","CUP_1Rnd_StarCluster_Green_M203","CUP_1Rnd_StarFlare_White_M203","CUP_1Rnd_StarFlare_Red_M203",
		"CUP_1Rnd_StarFlare_Green_M203","CUP_FlareWhite_M203","CUP_FlareGreen_M203","CUP_FlareRed_M203","CUP_FlareYellow_M203","CUP_1Rnd_Smoke_M203","CUP_1Rnd_SmokeRed_M203","CUP_1Rnd_SmokeGreen_M203","CUP_1Rnd_SmokeYellow_M203",
		"CUP_30Rnd_556x45_AUG","CUP_30Rnd_TE1_Red_Tracer_556x45_AUG","CUP_30Rnd_TE1_Yellow_Tracer_556x45_AUG","CUP_30Rnd_TE1_Green_Tracer_556x45_AUG",
		"CUP_1Rnd_762x51_CZ584",
		"CUP_25Rnd_556x45_Famas","CUP_25Rnd_556x45_Famas_Tracer_Red","CUP_25Rnd_556x45_Famas_Tracer_Green","CUP_25Rnd_556x45_Famas_Tracer_Yellow","CUP_25Rnd_556x45_Famas_Wood",
		"CUP_25Rnd_556x45_Famas_Wood_Tracer_Red","CUP_25Rnd_556x45_Famas_Wood_Tracer_Green","CUP_25Rnd_556x45_Famas_Wood_Tracer_Yellow","CUP_25Rnd_556x45_Famas_Arid",
		"CUP_25Rnd_556x45_Famas_Arid_Tracer_Red","CUP_25Rnd_556x45_Famas_Arid_Tracer_Green","CUP_25Rnd_556x45_Famas_Arid_Tracer_Yellow",
		"CUP_30Rnd_9x19_MP5","CUP_30Rnd_Green_Tracer_9x19_MP5","CUP_30Rnd_Red_Tracer_9x19_MP5","CUP_30Rnd_Yellow_Tracer_9x19_MP5","CUP_30Rnd_Subsonic_9x19_MP5",
		"CUP_20Rnd_B_AA12_Pellets","CUP_20Rnd_B_AA12_74Slug","CUP_20Rnd_B_AA12_HE",
		"CUP_8Rnd_12Gauge_Pellets_No00_Buck","CUP_8Rnd_12Gauge_Pellets_No0_Buck","CUP_8Rnd_12Gauge_Pellets_No1_Buck","CUP_8Rnd_12Gauge_Pellets_No2_Buck","CUP_8Rnd_12Gauge_Pellets_No3_Buck", "CUP_8Rnd_12Gauge_Pellets_No4_Buck",
		"CUP_8Rnd_12Gauge_Pellets_No4_Bird","CUP_8Rnd_12Gauge_Slug","CUP_8Rnd_12Gauge_HE","CUP_1Rnd_12Gauge_Pellets_No00_Buck","CUP_1Rnd_12Gauge_Pellets_No0_Buck", "CUP_1Rnd_12Gauge_Pellets_No1_Buck",
		"CUP_1Rnd_12Gauge_Pellets_No2_Buck","CUP_1Rnd_12Gauge_Pellets_No3_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Buck","CUP_1Rnd_12Gauge_Pellets_No4_Bird","CUP_1Rnd_12Gauge_Slug","CUP_1Rnd_12Gauge_HE",
		"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Green_Tracer_762x51_Belt_M","CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M",
		"cwr3_carlgustaf_heat_m","cwr3_carlgustaf_hedp_m",
		"CUP_PG7V_M","CUP_PG7VM_M","CUP_PG7VL_M","CUP_PG7VR_M","CUP_TBG7V_M",
		"CUP_Dragon_EP1_M",
		

		//5.56x45 Soviet
		"CUP_30Rnd_556x45_AK", "CUP_30Rnd_TE1_Red_Tracer_556x45_AK",
		"CUP_30Rnd_TE1_Green_Tracer_556x45_AK", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_AK",
		//9x39 
		"CUP_20Rnd_9x39_SP5_VSS_M", "CUP_10Rnd_9x39_SP5_VSS_M",
		//5.56x45
		"CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1", "CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",
		"CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1",
		"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",
		"CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249", "CUP_200Rnd_TE4_Green_Tracer_556x45_M249",
		"CUP_200Rnd_TE1_Red_Tracer_556x45_M249", "CUP_100Rnd_TE4_Green_Tracer_556x45_M249",
		"CUP_100Rnd_TE4_Red_Tracer_556x45_M249", "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249",
		"CUP_200Rnd_TE4_Green_Tracer_556x45_M249_Pouch", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249_Pouch",
		"CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249_Pouch", "CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch",
		"CUP_30Rnd_556x45_Stanag_L85", 
		//40mm 6Rnd
		"CUP_6Rnd_HE_M203","CUP_6Rnd_FlareWhite_M203","CUP_6Rnd_FlareGreen_M203","CUP_6Rnd_FlareRed_M203","CUP_6Rnd_FlareYellow_M203",
		"CUP_6Rnd_Smoke_M203","CUP_6Rnd_SmokeRed_M203","CUP_6Rnd_SmokeGreen_M203","CUP_6Rnd_SmokeYellow_M203", 
		//Handguns + SMGs
		"CUP_16Rnd_9x19_cz75", "CUP_7Rnd_50AE_Deagle", "CUP_15Rnd_9x19_M9", "CUP_30Rnd_9x19_UZI", "CUP_32Rnd_9x19_TEC9", "CUP_32Rnd_9x19_UZI_M", 
		"50Rnd_570x28_SMG_03","CUP_50Rnd_570x28_Red_Tracer_P90_M","CUP_50Rnd_570x28_Green_Tracer_P90_M","CUP_50Rnd_570x28_Yellow_Tracer_P90_M", 
		"CUP_10Rnd_127x99_m107", "CUP_5Rnd_762x51_M24",
		//Launchers
		"CUP_SMAW_HEAA_M","CUP_SMAW_HEDP_M","CUP_SMAW_NE_M", "CUP_SMAW_Spotting"
	];

	private _coldWarBackpacksLate = [
		"cwr3_i_bergen_backpack_dpm", "TFAR_anarc164", "CUP_B_ACRScout_m95", "cwr3_i_bergen_backpack_od", "cwr3_i_bergen_backpack_khaki", "TFAR_anarc210", "TFAR_rt1523g", "TFAR_rt1523g_black", "TFAR_rt1523g_big"
	];

	private _coldWarNVGLate = [
	"cwr3_nvgoggles_npo1", "CUP_NVG_PVS7", "CUP_NVG_PVS7_Hide"
	];

	
	private _coldWarMagazines = _coldWarExplosives;
	private _coldWarWeapons = _coldWarClothes;
	private _coldWarBackpacks = [];

	if (_cwEarly) then {
		_coldWarMagazines append _coldWarMagazinesEarly;
		_coldWarWeapons   append _coldWarWeaponsEarly;
		_coldWarWeapons   append _coldWarAttachmentsEarly;
		_coldWarWeapons   append _coldWarNVGEarly;
		_coldWarBackpacks append _coldWarBackpacksEarly;	 
	}; 
	if (_cwMid) then {
		_coldWarMagazines append _coldWarMagazinesMid;
		_coldWarWeapons   append _coldWarWeaponsMid;
		_coldWarWeapons   append _coldWarAttachmentsMid;
		_coldWarWeapons   append _coldWarNVGMid;
		_coldWarBackpacks append _coldWarBackpacksMid;  
	}; 
	if (_cwLate) then {
		_coldWarMagazines append _coldWarMagazinesLate;
		_coldWarWeapons   append _coldWarWeaponsLate;
		_coldWarWeapons   append _coldWarAttachmentsLate;
		_coldWarWeapons   append _coldWarNVGLate;
		_coldWarBackpacks append _coldWarBackpacksLate;		  
	};	 
				  
	private _allMagArray = [];	
	private _missingCount = 0; 
	{
		private _whiteListItem = (configFile >> "CfgMagazines" >> _x);
		private _isNull = (_whiteListItem == configNull);
		private _hasNoPicture = (getText(_whiteListItem >> "picture") == "");
		private _hasNoDisplayName = (getText(_whiteListItem >> "displayname") == "");
		private _scopeIsZero = (getNumber(_whiteListItem >> "scope") == 0);
		//duplicate entry, not an error worth diaglogging
		if (_whiteListItem in _allMagazineConfigs) then {
			continue;
		};
		//actual problem with whitelist, should throw error		
		if (_isNull or _hasNoPicture or _hasNoDisplayName or _scopeIsZero) then {
			 diag_log format ["Whitelist loading error, entry %1 isNull:%2 hasNoPicture:%3 hasNoDisplayName:%4 scopeIsZero:%5" , _x, _isNull, _hasNoPicture, _hasNoDisplayName, _scopeIsZero];	   
			_missingCount = _missingCount + 1;	
			continue;
		};
		_allMagazineConfigs pushBack _whiteListItem;
		_allMagArray pushBack _x;
		
	} forEach _coldWarMagazines;
	private _cnt = count _allMagazineConfigs;
	diag_log format ["Added %1 magazines to magazine config list, missed %2 items from whitelist", _cnt, _missingCount];
	  

	_missingCount = 0;
	{
		private _whiteListItem = (configFile >> "CfgWeapons" >> _x);
		
		private _type = getNumber (_whiteListItem >> "type");
		private _isNull = (_whiteListItem == configNull);
		private _hasNoPicture = (getText(_whiteListItem >> "picture") == "");
		private _hasNoDisplayName = (getText(_whiteListItem >> "displayname") == "");
		private _scopeIsZero = (getNumber(_whiteListItem >> "scope") == 0);
		private _noMag = false;
		//for weapons, we check if a compatible magazine is in the whitelist
		//only exceptions are launchers, they might be single use
		if (_type < 5) then {
			private _magArray = getArray (_whiteListItem >> "magazines");
			_noMag = !(("CBA_FakeLauncherMagazine" in _magArray) or (count(_magArray arrayIntersect ( _allMagArray)) > 0));   
		};
						
		//duplicate entry, not an error worth diaglogging
		if (_whiteListItem in _allWeaponConfigs) then {
			continue;
		};
		//actual problem with whitelist, should throw error		
		if (_isNull or _hasNoPicture or _hasNoDisplayName or _scopeIsZero or _noMag) then {
			 diag_log format ["Whitelist loading error, entry %1 isNull:%2 hasNoPicture:%3 hasNoDisplayName:%4 scopeIsZero:%5 noMag:%6" , _x, _isNull, _hasNoPicture, _hasNoDisplayName, _scopeIsZero, _noMag];	   
			_missingCount = _missingCount + 1;	
			continue;
		};
		_allWeaponConfigs pushBack _whiteListItem;
	} forEach _coldWarWeapons;
	_cnt = count _allWeaponConfigs;

	diag_log format ["Added %1 weapons and attachments to weapon config list, missed %2 items from whitelist", _cnt, _missingCount]; 

	//Glasses
	{
		_allGlassesConfigs pushBackUnique (configFile >> "CfgGlasses" >> _x);
	} forEach _coldWarGlasses;

	//Backpacks
	{
		_allBackpackConfigs pushBackUnique (configFile >> "CfgVehicles" >> _x);
	} forEach _coldWarBackpacks;

} else {
	// --- filter entries which satisfy all below conditions in CfgWeapons ---
	    // get number from config entry _x and check if scope==2 - this means it has a picture in gear
	    // get number from config entry _x and check if type is not 65536 - this means it is not a vehicle weapon
	    // get text from config entry _x and check if a picture exists - this means item has a picture
	_allWeaponConfigs = "
	getNumber (_x >> 'scope') == 2
	&& {
		getNumber (_x >> 'type') != 65536
		&& getText (_x >> 'picture') != ''
	}
	" configClasses (configFile >> "CfgWeapons");

	_allBackpackConfigs = "
    { getNumber (_x >> 'scope') isEqualTo 2 }
    &&
    { getText (_x >> 'vehicleClass') isEqualTo 'Backpacks' }
    " configClasses (configFile >> "CfgVehicles");

	_allGlassesConfigs = "
    { getNumber (_x >> 'scope') isEqualTo 2 }
    " configClasses (configFile >> "CfgGlasses");
};

private _allConfigs = _allWeaponConfigs + _allMagazineConfigs + _allBackpackConfigs + _allGlassesConfigs;

// /////////////////////////
// /  Sorting Function  // /
// /////////////////////////
private ["_nameX", "_item", "_itemMod", "_itemType", "_categories"];           // pretty daft optimization, not likely to make much difference
{
	_nameX = configName _x;

	    // If in disabledMods, remove. Don't need itemType for this so we do it first
	_itemMod = _x call A3A_fnc_getModOfConfigClass;
	if (_itemMod in A3A_disabledMods) then {
		continue
	};

	    // Filter items by current factions/modset
	_itemType = _nameX call A3A_fnc_itemType;
	if !([_x, _itemMod, _itemType] call _fnc_filter) then {
		continue
	};

	_categories = [_nameX, _itemType] call A3A_fnc_equipmentClassToCategories;
	{
		// We're not returning a default value with getVariable, becuase it *must* be instantiated before now. If it isn't, we *need* it to error.
		        (missionNamespace getVariable ("all" + _x)) pushBack _nameX;         // uniqueness should be guaranteed by base weapon filtering
	} forEach _categories;
} forEach _allConfigs;