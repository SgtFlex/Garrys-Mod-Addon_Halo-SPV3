include("client/SettingsMenu.lua")
AddCSLuaFile("spv3_funcs.lua")
include("spv3_funcs.lua")

/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Halo CE SPV3 SNPCs"
local AddonName = "Halo CE SPV3 SNPCs"
local AddonType = "SNPC"
local AutorunFile = "autorun/hce_spv3_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")

-- if CLIENT then
-- 	hook.Add("PostDrawSkyBox", "DrawDropShips", function()
-- 		for k, v in ipairs(ents.FindByClass("dropship_*")) do
-- 			v:Draw()
-- 		end
-- 	end)
-- end

if VJExists == true then
	include('autorun/vj_controls.lua')
	local vCat = "Halo CE SPV3"
	VJ.AddNPC("[Spawn] Map Spawner","obj_vj_halo_spv3_map_spawner",vCat)
	VJ.AddNPC("[Nat] Blind Wolf","npc_vj_halo_nat_spv3_blindwolf",vCat)
	VJ.AddNPC("[Spawn Cov] Phantom (Unarmed)","dropship_halo_cov_spv3_phantom",vCat)
	VJ.AddNPC("[Spawn Cov] Phantom (Armed)","dropship_halo_cov_spv3_phantom_tri",vCat)
	VJ.AddNPC("[Spawn UNSC] Pelican (Unarmed)","dropship_halo_unsc_spv3_pelican",vCat)
	VJ.AddNPC("[Spawn UNSC] Pelican (Armed)","dropship_halo_unsc_spv3_pelican_armed",vCat)
	VJ.AddNPC("[Cov] Turret","npc_vj_halo_cov_spv3_phantom_turret",vCat)
	VJ.AddNPC("[UNSC] Hanging Turret","npc_vj_halo_unsc_spv3_pelican_turret",vCat)
	VJ.AddNPC("[UNSC] Rocket Turret","npc_vj_halo_unsc_spv3_rocket_pod",vCat)
	VJ.AddNPC("[For] Aggressor","npc_vj_halo_for_spv3_aggressor",vCat)
	VJ.AddNPC("[For] Aggressor Major","npc_vj_halo_for_spv3_aggressor_major",vCat)
	VJ.AddNPC("[For] Aggressor Black","npc_vj_halo_for_spv3_aggressor_black",vCat)
	VJ.AddNPC("[For] Enforcer","npc_vj_halo_for_spv3_enforcer",vCat)
	--==__Flood__==--
	VJ.AddNPC("[Flood] Infection Form","npc_vj_halo_flood_spv3_infection",vCat)
	VJ.AddNPC("[Flood] Elite","npc_vj_halo_flood_spv3_elite",vCat)
	VJ.AddNPC("[Flood] Elite (Random)","npc_vj_halo_flood_spv3_elite_ran",vCat)
	VJ.AddNPC("[Flood] Elite (Honor Guard)","npc_vj_halo_flood_spv3_elite_hg",vCat)
	VJ.AddNPC("[Flood] Elite (Ossoona)","npc_vj_halo_flood_spv3_elite_oss",vCat)
	VJ.AddNPC("[Flood] Elite (Runner)","npc_vj_halo_flood_spv3_elite_runner",vCat)
	VJ.AddNPC("[Flood] Elite (Suicide)","npc_vj_halo_flood_spv3_elite_suicide",vCat)
	VJ.AddNPC("[Flood] Marine","npc_vj_halo_flood_spv3_marine",vCat)
	VJ.AddNPC("[Flood] Brute","npc_vj_halo_flood_spv3_brute",vCat)

	VJ.AddNPC("[Flood] ODST","npc_vj_halo_flood_spv3_odst",vCat)
	VJ.AddNPC("[Flood] Carrier","npc_vj_halo_flood_spv3_carrier",vCat)
	VJ.AddNPC("[Flood] Jackal","npc_vj_halo_flood_spv3_jackal",vCat)
	VJ.AddNPC("[Flood] Wolf","npc_vj_halo_flood_spv3_wolf",vCat)
	VJ.AddNPC("[Spawn Flood] Biomass","sent_vj_flood_spv3_biomass",vCat)
	--==__Covenant__==--
	VJ.AddNPC("[Cov] Hunter (Minor)","npc_vj_halo_cov_spv3_hunter_min",vCat)
	VJ.AddNPC("[Cov] Hunter (Major)","npc_vj_halo_cov_spv3_hunter_maj",vCat)
	VJ.AddNPC("[Cov] Hunter (Spec-Ops)","npc_vj_halo_cov_spv3_hunter_spc",vCat)
	VJ.AddNPC_HUMAN("[Cov] Brute Minor","npc_vj_halo_cov_spv3_brute_min",{"weapon_vj_cov_spv3_particleCarbine", "weapon_vj_cov_spv3_bruteshot", "weapon_vj_cov_spv3_plasmarifleBrute", "weapon_vj_cov_spv3_shredder"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Brute Major","npc_vj_halo_cov_spv3_brute_maj",{"weapon_vj_cov_spv3_focusrifle", "weapon_vj_cov_spv3_bruteshot", "weapon_vj_cov_spv3_plasmarifleBrute", "weapon_vj_cov_spv3_shredder"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Brute Ultra","npc_vj_halo_cov_spv3_brute_ult",{"weapon_vj_cov_spv3_focusrifle", "weapon_vj_cov_spv3_bruteshot", "weapon_vj_cov_spv3_plasmarifleBrute", "weapon_vj_cov_spv3_shredder", "weapon_vj_cov_spv3_piercer"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Brute Chieftain","npc_vj_halo_cov_spv3_brute_chf",{"weapon_vj_cov_spv3_bruteshot"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Brute War Chieftain","npc_vj_halo_cov_spv3_brute_wchf",{"weapon_vj_cov_spv3_bruteshot"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Brute Random","npc_vj_halo_cov_spv3_brute_ran",{"weapon_vj_cov_spv3_focusrifle", "weapon_vj_cov_spv3_particleCarbine", "weapon_vj_cov_spv3_bruteshot", "weapon_vj_cov_spv3_plasmarifleBrute", "weapon_vj_cov_spv3_shredder"},vCat)
	VJ.AddNPC_HUMAN("[Her] Elite ","npc_vj_halo_cov_spv3_elite_her",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_particleCarbine","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Her] Grunt","npc_vj_halo_cov_spv3_grunt_her",{"weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Minor","npc_vj_halo_cov_spv3_elite_min",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_particleCarbine","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Major","npc_vj_halo_cov_spv3_elite_maj",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_focusrifle","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Random","npc_vj_halo_cov_spv3_elite_ran",{"weapon_vj_cov_spv3_energysword", "weapon_vj_cov_spv3_particleCarbine", "weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_focusrifle","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Ultra","npc_vj_halo_cov_spv3_elite_ult",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Ultra","npc_vj_halo_cov_spv3_elite_ult",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Zealot","npc_vj_halo_cov_spv3_elite_zel",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_needler", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Ossoona","npc_vj_halo_cov_spv3_elite_oss",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_needler", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Spec-Ops","npc_vj_halo_cov_spv3_elite_spc",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_needler", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Minor","npc_vj_halo_cov_spv3_elite_hg_min",{"weapon_vj_cov_spv3_plasmarifle"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Major","npc_vj_halo_cov_spv3_elite_hg_maj",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Ultra","npc_vj_halo_cov_spv3_elite_hg_ult",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Zealot","npc_vj_halo_cov_spv3_elite_hg_zel",{"weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Minor","npc_vj_halo_cov_spv3_grunt_min",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Random","npc_vj_halo_cov_spv3_grunt_ran",{"weapon_vj_cov_spv3_plasmapistolBrute", "weapon_vj_cov_spv3_shredder", "weapon_vj_cov_spv3_piercer", "weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Major","npc_vj_halo_cov_spv3_grunt_maj",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Spec-Ops","npc_vj_halo_cov_spv3_grunt_spc",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_piercer"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Ultra","npc_vj_halo_cov_spv3_grunt_ult",{"weapon_vj_cov_spv3_piercer","weapon_vj_cov_spv3_plasmarifleBrute"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal Minor","npc_vj_halo_cov_spv3_jackal_min",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Kig-yar Random","npc_vj_halo_cov_spv3_kigyar_ran",{"weapon_vj_cov_spv3_focusrifle", "weapon_vj_cov_spv3_particleCarbine", "weapon_vj_cov_spv3_piercer", "weapon_vj_cov_spv3_plasmapistolBrute", "weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal Major","npc_vj_halo_cov_spv3_jackal_maj",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistolBrute"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal Spec-Ops","npc_vj_halo_cov_spv3_jackal_spc",{"weapon_vj_cov_spv3_piercer","weapon_vj_cov_spv3_plasmapistolBrute", "weapon_vj_cov_spv3_shredder"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal MKM. Minor","npc_vj_halo_cov_spv3_jackal_mkm_min",{"weapon_vj_cov_spv3_particleCarbine"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal MKM. Major","npc_vj_halo_cov_spv3_jackal_mkm_maj",{"weapon_vj_cov_spv3_focusrifle"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal MKM. Ultra","npc_vj_halo_cov_spv3_jackal_mkm_ult",{"weapon_vj_cov_spv3_particleCarbine", "weapon_vj_cov_spv3_focusrifle"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Skirmisher Minor","npc_vj_halo_cov_spv3_skirm_min",{"weapon_vj_cov_spv3_particleCarbine","weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Skirmisher Major","npc_vj_halo_cov_spv3_skirm_maj",{"weapon_vj_cov_spv3_focusrifle","weapon_vj_cov_spv3_particleCarbine"},vCat)

	VJ.AddNPC_HUMAN("[UNSC] ODST","npc_vj_halo_unsc_spv3_odst",{"weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_dmr", "weapon_vj_unsc_spv3_sr", "weapon_vj_unsc_spv3_smgsd", "weapon_vj_unsc_spv3_rl"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Marine","npc_vj_halo_unsc_spv3_marine",{"weapon_vj_unsc_spv3_ar", "weapon_vj_unsc_spv3_sg", "weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_smg"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Crewman","npc_vj_halo_unsc_spv3_crewman",{"weapon_vj_unsc_spv3_magnum"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Sgt. Stacker","npc_vj_halo_unsc_spv3_stacker",{"weapon_vj_unsc_spv3_sr"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Sgt. Johnson","npc_vj_halo_unsc_spv3_johnson",{"weapon_vj_unsc_spv3_sg"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Captain Keyes","npc_vj_halo_unsc_spv3_keyes",{"weapon_vj_unsc_spv3_magnum", "weapon_vj_unsc_spv3_smg"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Master Chief","npc_vj_halo_unsc_spv3_chief",{"weapon_vj_unsc_spv3_ar", "weapon_vj_unsc_spv3_sg", "weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_smg"},vCat)

	-- Weapons
	VJ.AddNPCWeapon("[SPV3] (Cov) Plasma Rifle", "weapon_vj_cov_spv3_plasmarifle")
	VJ.AddNPCWeapon("[SPV3] (Cov) Brute Plasma Rifle", "weapon_vj_cov_spv3_plasmarifleBrute")
	VJ.AddNPCWeapon("[SPV3] (Cov) Plasma Pistol", "weapon_vj_cov_spv3_plasmapistol")
	VJ.AddNPCWeapon("[SPV3] (Cov) Brute Plasma Pistol", "weapon_vj_cov_spv3_plasmapistolBrute")
	VJ.AddNPCWeapon("[SPV3] (Cov) Bruteshot", "weapon_vj_cov_spv3_bruteshot")
	VJ.AddNPCWeapon("[SPV3] (Cov) Focus Rifle", "weapon_vj_cov_spv3_focusrifle")
	VJ.AddNPCWeapon("[SPV3] (Cov) Particle Carbine", "weapon_vj_cov_spv3_particleCarbine")
	VJ.AddNPCWeapon("[SPV3] (Cov) Piercer", "weapon_vj_cov_spv3_piercer")
	VJ.AddNPCWeapon("[SPV3] (Cov) Shredder", "weapon_vj_cov_spv3_shredder")
	VJ.AddNPCWeapon("[SPV3] (Cov) Needler", "weapon_vj_cov_spv3_needler")
	VJ.AddNPCWeapon("[SPV3] (Cov) Energy Sword", "weapon_vj_cov_spv3_energysword")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Assault Rifle", "weapon_vj_unsc_spv3_ar")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Battle Rifle", "weapon_vj_unsc_spv3_br")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Designated Marksman Rifle", "weapon_vj_unsc_spv3_dmr")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Sniper Rifle", "weapon_vj_unsc_spv3_sr")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Shotgun", "weapon_vj_unsc_spv3_sg")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Rocket Launcher", "weapon_vj_unsc_spv3_rl")
	VJ.AddNPCWeapon("[SPV3] (UNSC) SMG", "weapon_vj_unsc_spv3_smg")
	VJ.AddNPCWeapon("[SPV3] (UNSC) SMGSD", "weapon_vj_unsc_spv3_smgsd")
	VJ.AddNPCWeapon("[SPV3] (UNSC) Magnum", "weapon_vj_unsc_spv3_magnum")
	VJ.AddWeapon("[SPV3] (Cov) Plasma Grenade","weapon_vj_cov_spv3_plasma_nade", false, vCat)
	VJ.AddWeapon("[SPV3] (Cov) Cluster Grenade","weapon_vj_cov_spv3_cluster_nade", false, vCat)
	VJ.AddWeapon("[SPV3] (Cov) Gravity Grenade","weapon_vj_cov_spv3_gravity_nade", false, vCat)
	VJ.AddWeapon("[SPV3] (Cov) Needler Grenade","weapon_vj_cov_spv3_needler_nade", false, vCat)
	VJ.AddWeapon("[SPV3] (UNSC) Frag Grenade","weapon_vj_unsc_spv3_frag_nade", false, vCat)

	VJ.AddConVar("vj_spv3_DamageModifier", 0.5, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_NPCTakeDamageModifier", 2, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_HealthModifier", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_ShieldModifier", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_PrecisionThreshold", 15, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_infModifier", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_floodOption", "infect_onlyHalo", FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_ffretal", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_bonusInfForms", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_InfFormsExplode", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_CovenantExtraWeaponChance", 30, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_UNSCExtraWeaponChance", 30, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_FloodExtraWeaponChance", 30, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_floodEliteShield", 30, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_phantomAssistTime", 20, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_phantomSpawns", 0 , FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_phantomMinReinfStr", 35, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_phantomMaxReinfStr", 45, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_phantomMinUnitStr", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_phantomMaxUnitStr", 15, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_biomassSpread", 3, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_mapCov", 100, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_mapUNSC", 100, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_mapFlood", 100, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_mapLimit", 80, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_dropGrenades", 1, FCVAR_ARCHIVE)

	if (SERVER) then
		util.AddNetworkString("vj_spv3_open_menu")
	end
	concommand.Add("spv3_settings", function( ply )
		net.Start("vj_spv3_open_menu")
		net.Send(ply)
	end)

	local function VJ_SPV3_MAIN(Panel)
		local reset = vgui.Create("DButton")
		local output = {}
		reset:SetFont("DermaDefaultBold")
		reset:SetText("Open Config menu")
		reset:SetSize(150,25)
		reset:SetColor(Color(0,0,0,255))
		reset.DoClick = function(reset)
			OpenMenu()
		end
		Panel:AddPanel(reset)
	end
	function VJ_ADDTOMENU_SPV3(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","Halo SPV3","Halo SPV3","","", VJ_SPV3_MAIN, {} )
	end
	hook.Add("PopulateToolMenu","VJ_ADDTOMENU_SPV3", VJ_ADDTOMENU_SPV3 )


game.AddAmmoType({
	name = "plasma_grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
})
game.AddAmmoType({
	name = "gravity_grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
})
game.AddAmmoType({
	name = "cluster_grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
})
game.AddAmmoType({
	name = "needler_grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
})
game.AddAmmoType({
	name = "frag_grenade",
	dmgtype = DMG_BULLET,
	tracer = TRACER_LINE,
	plydmg = 0,
	npcdmg = 0,
	force = 0,
	minsplash = 0,
	maxsplash = 0
})
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("VJ Base is not installed")
				VJF:SetSize(900,800)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				local VJURL = vgui.Create("DHTML")
				VJURL:SetParent(VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				local x,y = VJF:GetSize()
				VJURL:SetSize(x*0.99,y*0.96)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end
game.AddDecal("VJ_SPV3_Blood_Flood1", {"decals/f_blood1", "decals/f_blood2", "decals/f_blood3", "decals/f_blood4"})
game.AddDecal("VJ_SPV3_Blood_Flood2", {"decals/f_blood_small1", "decals/f_blood_small2", "decals/f_blood_small3", "decals/f_blood_small4"})