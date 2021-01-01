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
if VJExists == true then
	include('autorun/vj_controls.lua')
	local vCat = "Halo CE SPV3"
	VJ.AddNPC("[Spawn] Map Spawner","obj_vj_halo_spv3_map_spawner",vCat)
	VJ.AddNPC("[Nat] Blind Wolf","npc_vj_halo_nat_spv3_blindwolf",vCat)
	VJ.AddNPC("[Spawn Cov] Phantom","npc_vj_halo_cov_spv3_phantom",vCat)
	VJ.AddNPC("[Spawn UNSC] Pelican","npc_vj_halo_unsc_spv3_pelican",vCat)
	VJ.AddNPC("[Cov] Turret","npc_vj_halo_cov_spv3_phantom_turret",vCat)
	VJ.AddNPC("[UNSC] Hanging Turret","npc_vj_halo_unsc_spv3_pelican_turret",vCat)
	VJ.AddNPC("[UNSC] Rocket Turret","npc_vj_halo_unsc_spv3_rocket_pod",vCat)
	VJ.AddNPC("[For] Aggressor","npc_vj_halo_for_spv3_aggressor",vCat)
	VJ.AddNPC("[For] Aggressor Major","npc_vj_halo_for_spv3_aggressor_major",vCat)
	VJ.AddNPC("[For] Aggressor Black","npc_vj_halo_for_spv3_aggressor_black",vCat)
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
	VJ.AddNPC_HUMAN("[Her] Elite ","npc_vj_halo_cov_spv3_elite_her",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_particleCarbine","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Her] Grunt","npc_vj_halo_cov_spv3_grunt_her",{"weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Minor","npc_vj_halo_cov_spv3_elite_min",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_particleCarbine","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Major","npc_vj_halo_cov_spv3_elite_maj",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_focusrifle","weapon_vj_cov_spv3_needler"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Ultra","npc_vj_halo_cov_spv3_elite_ult",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Zealot","npc_vj_halo_cov_spv3_elite_zel",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_needler", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Ossoona","npc_vj_halo_cov_spv3_elite_oss",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_needler", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite Spec-Ops","npc_vj_halo_cov_spv3_elite_spc",{"weapon_vj_cov_spv3_plasmarifle","weapon_vj_cov_spv3_needler", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Minor","npc_vj_halo_cov_spv3_elite_hg_min",{"weapon_vj_cov_spv3_plasmarifle"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Major","npc_vj_halo_cov_spv3_elite_hg_maj",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Ultra","npc_vj_halo_cov_spv3_elite_hg_ult",{"weapon_vj_cov_spv3_plasmarifle", "weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Elite HG Zealot","npc_vj_halo_cov_spv3_elite_hg_zel",{"weapon_vj_cov_spv3_energysword"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Minor","npc_vj_halo_cov_spv3_grunt_min",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Major","npc_vj_halo_cov_spv3_grunt_maj",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Spec-Ops","npc_vj_halo_cov_spv3_grunt_spc",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol","weapon_vj_cov_spv3_piercer"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Grunt Ultra","npc_vj_halo_cov_spv3_grunt_ult",{"weapon_vj_cov_spv3_piercer","weapon_vj_cov_spv3_plasmarifleBrute"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal Minor","npc_vj_halo_cov_spv3_jackal_min",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistol"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal Major","npc_vj_halo_cov_spv3_jackal_maj",{"weapon_vj_cov_spv3_needler","weapon_vj_cov_spv3_plasmapistolBrute"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal Spec-Ops","npc_vj_halo_cov_spv3_jackal_spc",{"weapon_vj_cov_spv3_piercer","weapon_vj_cov_spv3_plasmapistolBrute", "weapon_vj_cov_spv3_shredder"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal MKM. Minor","npc_vj_halo_cov_spv3_jackal_mkm_min",{"weapon_vj_cov_spv3_particleCarbine"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal MKM. Major","npc_vj_halo_cov_spv3_jackal_mkm_maj",{"weapon_vj_cov_spv3_focusrifle"},vCat)
	VJ.AddNPC_HUMAN("[Cov] Jackal MKM. Ultra","npc_vj_halo_cov_spv3_jackal_mkm_ult",{"weapon_vj_cov_spv3_particleCarbine", "weapon_vj_cov_spv3_focusrifle"},vCat)

	VJ.AddNPC_HUMAN("[UNSC] ODST","npc_vj_halo_unsc_spv3_odst",{"weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_dmr", "weapon_vj_unsc_spv3_sr", "weapon_vj_unsc_spv3_smgsd", "weapon_vj_unsc_spv3_rl"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Marine","npc_vj_halo_unsc_spv3_marine",{"weapon_vj_unsc_spv3_ar", "weapon_vj_unsc_spv3_sg", "weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_smg"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Crewman","npc_vj_halo_unsc_spv3_crewman",{"weapon_vj_unsc_spv3_magnum"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Sgt. Stacker","npc_vj_halo_unsc_spv3_stacker",{"weapon_vj_unsc_spv3_ar", "weapon_vj_unsc_spv3_sg", "weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_smg", "weapon_vj_unsc_spv3_sr"},vCat)
	VJ.AddNPC_HUMAN("[UNSC] Sgt. Johnson","npc_vj_halo_unsc_spv3_johnson",{"weapon_vj_unsc_spv3_ar", "weapon_vj_unsc_spv3_sg", "weapon_vj_unsc_spv3_br", "weapon_vj_unsc_spv3_smg"},vCat)
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
	VJ.AddConVar("vj_spv3_infModifier", 2.5, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_floodOption", "infect_onlyHalo", FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_ffretal", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_bonusInfForms", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_InfFormsExplode", 1, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_covUNSCWeps", 0, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_UNSCCovWeps", 0, FCVAR_ARCHIVE)
	VJ.AddConVar("vj_spv3_floodWeps", 1, FCVAR_ARCHIVE)
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


	local function VJ_SPV3_MAIN(Panel)
		local reset = vgui.Create("DButton")
		local output = {}
		reset:SetFont("DermaDefaultBold")
		reset:SetText("Config Spawners/Dropships")
		reset:SetSize(150,25)
		reset:SetColor(Color(0,0,0,255))
		reset.DoClick = function(reset)
			local Frame = vgui.Create( "DFrame" )
			Frame:SetPos(ScrW() * .4, ScrH() * .5) 
			Frame:SetSize(500, 700) 
			Frame:SetTitle( "Configure Phantom" ) 
			Frame:Center()
			Frame:SetVisible( true ) 
			Frame:SetDraggable( false ) 
			Frame:ShowCloseButton( true ) 
			Frame:MakePopup()

			

			local label = vgui.Create("DLabel", Frame)
			label:SetText("\"Reinforcement Strength\" is the accumulative strength of all the units\n that the phantom drops off. You can randomize this amount with the\n Min and Max Sliders. Having a low Max Unit strength means\n that the phantom will drop off more lower-tier units, while having a high\n Min Unit strength means the phantom will drop less, but more\n powerful high-tier units.")
			label:SetPos(Frame:GetWide()*.05, 270)
			label:SetSize(Frame:GetWide()*.9, 75)

			local totStr = vgui.Create("DNumSlider", Frame)
			totStr:SetText("Min Reinforcement Strength")
			totStr:SetMin(1)
			totStr:SetMax(300)
			totStr:SetSize(Frame:GetWide()*.9, 20)
			totStr:SetPos(Frame:GetWide()*.05, 350)
			totStr:SetDecimals(0)
			totStr:SetConVar("vj_spv3_phan")
			totStr:SetConVar("vj_spv3_phantomMinReinfStr")

			local totMaxStr = vgui.Create("DNumSlider", Frame)
			totMaxStr:SetText("Max Reinforcement Strength")
			totMaxStr:SetMin(1)
			totMaxStr:SetMax(300)
			totMaxStr:SetSize(Frame:GetWide()*.9, 20)
			totMaxStr:SetPos(Frame:GetWide()*.05, 380)
			totMaxStr:SetDecimals(0)
			totMaxStr:SetConVar("vj_spv3_phan")
			totMaxStr:SetConVar("vj_spv3_phantomMaxReinfStr")

			local minStr = vgui.Create("DNumSlider", Frame)
			minStr:SetText("Minimum Unit Strength")
			minStr:SetMin(1)
			minStr:SetMax(15)
			minStr:SetSize(Frame:GetWide()*.9, 20)
			minStr:SetPos(Frame:GetWide()*.05, 410)
			minStr:SetDecimals(0)
			minStr:SetConVar("vj_spv3_phantomMinUnitStr")

			local maxStr = vgui.Create("DNumSlider", Frame)
			maxStr:SetText("Maximum Unit Strength")
			maxStr:SetMin(1)
			maxStr:SetMax(15)
			maxStr:SetSize(Frame:GetWide()*.9, 20)
			maxStr:SetPos(Frame:GetWide()*.05, 440)
			maxStr:SetDecimals(0)
			maxStr:SetConVar("vj_spv3_phantomMaxUnitStr")


			local nSlider1 = vgui.Create("DNumSlider", Frame)
			nSlider1:SetText("Dropship Assist Time")
			nSlider1:SetMin(1)
			nSlider1:SetMax(120)
			nSlider1:SetSize(Frame:GetWide()*.9, 20)
			nSlider1:SetPos(Frame:GetWide()*.05, 30)
			nSlider1:SetConVar("vj_spv3_phantomAssistTime")
			nSlider1:SetDefaultValue(GetConVar("vj_spv3_phantomAssistTime"):GetFloat())

			local nSlider2 = vgui.Create("DNumSlider", Frame)
			nSlider2:SetText("Number of times Biomass spreads (exponential!)")
			nSlider2:SetMin(0)
			nSlider2:SetMax(5)
			nSlider2:SetSize(Frame:GetWide()*.9, 20)
			nSlider2:SetPos(Frame:GetWide()*.05, 60)
			nSlider2:SetDecimals(0)
			nSlider2:SetConVar("vj_spv3_biomassSpread")
			nSlider2:SetDefaultValue(GetConVar("vj_spv3_biomassSpread"):GetInt())

			local nSlider3 = vgui.Create("DNumSlider", Frame)
			nSlider3:SetText("Multiplies spawn of infection forms")
			nSlider3:SetMin(0.5)
			nSlider3:SetMax(10)
			nSlider3:SetSize(Frame:GetWide()*.9, 20)
			nSlider3:SetPos(Frame:GetWide()*.05, 90)
			nSlider3:SetConVar("vj_spv3_infModifier")
			nSlider3:SetDefaultValue(GetConVar("vj_spv3_infModifier"):GetFloat())

			local nSlider7 = vgui.Create("DNumSlider", Frame)
			nSlider7:SetText("Map: SPV3 NPC limit")
			nSlider7:SetMin(0)
			nSlider7:SetMax(200)
			nSlider7:SetSize(Frame:GetWide()*.9, 20)
			nSlider7:SetPos(Frame:GetWide()*.05, 120)
			nSlider7:SetConVar("vj_spv3_mapLimit")
			nSlider7:SetDecimals(0)
			nSlider7:SetDefaultValue(GetConVar("vj_spv3_mapLimit"):GetInt())


			local nSlider4 = vgui.Create("DNumSlider", Frame)
			nSlider4:SetText("Map: Flood Weight")
			nSlider4:SetMin(0)
			nSlider4:SetMax(100)
			nSlider4:SetSize(Frame:GetWide()*.9, 20)
			nSlider4:SetPos(Frame:GetWide()*.05, 150)
			nSlider4:SetConVar("vj_spv3_mapFlood")
			nSlider4:SetDefaultValue(GetConVar("vj_spv3_mapFlood"):GetFloat())

			local nSlider5 = vgui.Create("DNumSlider", Frame)
			nSlider5:SetText("Map: Cov Weight")
			nSlider5:SetMin(0)
			nSlider5:SetMax(100)
			nSlider5:SetSize(Frame:GetWide()*.9, 20)
			nSlider5:SetPos(Frame:GetWide()*.05, 180)
			nSlider5:SetConVar("vj_spv3_mapCov")
			nSlider5:SetDefaultValue(GetConVar("vj_spv3_mapCov"):GetFloat())

			local nSlider6 = vgui.Create("DNumSlider", Frame)
			nSlider6:SetText("Map: UNSC Weight")
			nSlider6:SetMin(0)
			nSlider6:SetMax(100)
			nSlider6:SetSize(Frame:GetWide()*.9, 20)
			nSlider6:SetPos(Frame:GetWide()*.05, 210)
			nSlider6:SetConVar("vj_spv3_mapUNSC")
			nSlider6:SetDefaultValue(GetConVar("vj_spv3_mapUNSC"):GetFloat())








			local value = 5
			local customSpawn = vgui.Create("DCheckBoxLabel", Frame)
			customSpawn:SetPos(Frame:GetWide()*.05, 240)
			customSpawn:SetText("Use custom spawning?")
			if (GetConVar("vj_spv3_phantomSpawns"):GetInt()==0) then
				customSpawn:SetChecked(false)
			else
				customSpawn:SetChecked(true)
			end

			local numberScratch = vgui.Create("DNumberWang", Frame)
			numberScratch:SetPos(Frame:GetWide()*.05, 270)
			numberScratch:SetSize(100, 20)
			numberScratch.OnValueChanged = function(self)
				value = tonumber(self:GetValue())
				if (value >= 10) then
					output[1] = tostring(value)
				else
					output[1] = "0"..tostring(value)
				end				
			end

			local meButton = vgui.Create("DButton", Frame)
			meButton:SetFont("DermaDefaultBold")
			meButton:SetText("Initialize Table")
			meButton:SetSize(150,25)
			meButton:SetPos(Frame:GetWide()*.05, 300)
			meButton:SetColor(Color(0,0,0,255))
			local combobox = {}
			local form = nil
			local scrollpanel = nil
			meButton.DoClick = function(reset)
				scrollpanel = vgui.Create("DScrollPanel", Frame)
				scrollpanel:SetSize(Frame:GetWide()*.9, 320)
				scrollpanel:SetPos(Frame:GetWide()*.05, 330)
				
				for k=1, value do
					combobox[k] = vgui.Create("DComboBox", scrollpanel)
					scrollpanel:AddItem(combobox[k])
					combobox[k]:Dock( TOP )
					combobox[k]:DockMargin( 0, 0, 0, 5 )
					combobox[k]:AddChoice( "Grunt Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Grunt Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Grunt Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Grunt Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Zealot" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Zealot" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Chieftain" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Warchieftain" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Hunter Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Hunter Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Hunter Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Mkm Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Mkm Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Mkm Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:ChooseOptionID(1)
				end


			end

			local SetButton = vgui.Create("DButton", Frame)
			SetButton:SetFont("DermaDefaultBold")
			SetButton:SetText("Set Phantom Spawns")
			SetButton:SetSize(150,25)
			SetButton:SetPos(Frame:GetWide()*.05, Frame:GetTall()*.95)
			SetButton:SetColor(Color(0,0,0,255))
			SetButton.DoClick = function(reset)
				for k=1, #combobox do
					if (combobox[k]:GetSelectedID() < 10) then
						output[k+1] = tostring("0"..combobox[k]:GetSelectedID())
					else
						output[k+1] = tostring(combobox[k]:GetSelectedID())
					end
				end
				local outputString = ""
				for k=1, #output do
					outputString = outputString..tostring(output[k])
				end
				print(outputString)
				LocalPlayer():ConCommand("vj_spv3_phantomSpawns "..outputString)
			end
			if (customSpawn:GetChecked()==false) then
				local x,y = maxStr:GetPos()
				Frame:SetSize(500, y + 30)
			else
				local x,y = SetButton:GetPos()
				Frame:SetSize(500, y + 30)
			end
			Frame:Center()
			customSpawn.OnChange = function(self)
				if (customSpawn:GetChecked()==false) then
					local x,y = maxStr:GetPos()
					Frame:SetSize(500, y + 30)
					Frame:Center()
				else
					local x,y = SetButton:GetPos()
					Frame:SetSize(500, y + 30)
					Frame:Center()
				end
				numberScratch:SetVisible(customSpawn:GetChecked())
				meButton:SetVisible(customSpawn:GetChecked())
				if (scrollpanel!=nil) then
					scrollpanel:SetVisible(customSpawn:GetChecked())
				end
				totStr:SetVisible(!customSpawn:GetChecked())
				totMaxStr:SetVisible(!customSpawn:GetChecked())
				minStr:SetVisible(!customSpawn:GetChecked())
				maxStr:SetVisible(!customSpawn:GetChecked())
				
				label:SetVisible(!customSpawn:GetChecked())
				if (customSpawn:GetChecked()==false) then
					LocalPlayer():ConCommand("vj_spv3_phantomSpawns "..0)
				end
			end
			numberScratch:SetVisible(customSpawn:GetChecked())
			meButton:SetVisible(customSpawn:GetChecked())
			if (form!=nil) then
				form:SetVisible(customSpawn:GetChecked())
			end


			totStr:SetVisible(!customSpawn:GetChecked())
			totMaxStr:SetVisible(!customSpawn:GetChecked())
			minStr:SetVisible(!customSpawn:GetChecked())
			maxStr:SetVisible(!customSpawn:GetChecked())
			label:SetVisible(!customSpawn:GetChecked())
			minStr.OnValueChanged = function(self)
				maxStr:SetMin(minStr:GetValue())
			end
			maxStr.OnValueChanged = function(self)
				minStr:SetMax(maxStr:GetValue())
			end
			totStr.OnValueChanged = function(self)
				totMaxStr:SetMin(totStr:GetValue())
			end
			totMaxStr.OnValueChanged = function(self)
				totStr:SetMax(totMaxStr:GetValue())
			end
		end
		local damageConfig = vgui.Create("DButton")
		damageConfig:SetFont("DermaDefaultBold")
		damageConfig:SetText("Config Damage/Health")
		damageConfig:SetSize(150,25)
		damageConfig:SetColor(Color(0,0,0,255))
		damageConfig.DoClick = function(damageConfig)
			local Frame = vgui.Create( "DFrame" )
			Frame:SetPos(ScrW() * .4, ScrH() * .5) 
			Frame:SetSize(400, 500) 
			Frame:SetTitle("Configure SPV3 Damage/Health") 
			Frame:Center()
			Frame:SetVisible( true ) 
			Frame:SetDraggable( false ) 
			Frame:ShowCloseButton( true ) 
			Frame:MakePopup()

			local nSlider1 = vgui.Create("DNumSlider", Frame)
			nSlider1:SetText("Health Modifier")
			nSlider1:SetMin(0.01)
			nSlider1:SetMax(100)
			nSlider1:SetSize(Frame:GetWide()*.9, 20)
			nSlider1:SetPos(Frame:GetWide()*.05, 30)
			nSlider1:SetConVar("vj_spv3_HealthModifier")
			nSlider1:SetDefaultValue(GetConVar("vj_spv3_HealthModifier"):GetFloat())

			local nSlider2 = vgui.Create("DNumSlider", Frame)
			nSlider2:SetText("Shield Modifier")
			nSlider2:SetMin(0.01)
			nSlider2:SetMax(100)
			nSlider2:SetSize(Frame:GetWide()*.9, 20)
			nSlider2:SetPos(Frame:GetWide()*.05, 60)
			nSlider2:SetConVar("vj_spv3_ShieldModifier")
			nSlider2:SetDefaultValue(GetConVar("vj_spv3_ShieldModifier"):GetFloat())

			local nSlider3 = vgui.Create("DNumSlider", Frame)
			nSlider3:SetText("Damage Modifier")
			nSlider3:SetMin(0.01)
			nSlider3:SetMax(100)
			nSlider3:SetSize(Frame:GetWide()*.9, 20)
			nSlider3:SetPos(Frame:GetWide()*.05, 90)
			nSlider3:SetConVar("vj_spv3_damageModifier")
			nSlider3:SetDefaultValue(GetConVar("vj_spv3_damageModifier"):GetFloat())

			local nSlider4 = vgui.Create("DNumSlider", Frame)
			nSlider4:SetText("SPV3 NPC Vulnerability")
			nSlider4:SetMin(0.01)
			nSlider4:SetMax(100)
			nSlider4:SetSize(Frame:GetWide()*.9, 20)
			nSlider4:SetPos(Frame:GetWide()*.05, 120)
			nSlider4:SetConVar("vj_spv3_npctakedamagemodifier")
			nSlider4:SetDefaultValue(GetConVar("vj_spv3_npctakedamagemodifier"):GetFloat())

			local x, y = nSlider4:GetPos()
			Frame:SetSize(400, y + 30)
			Frame:Center()
		end
		local miscConfig = vgui.Create("DButton")
		miscConfig:SetFont("DermaDefaultBold")
		miscConfig:SetText("Config Miscellaneous")
		miscConfig:SetSize(150,25)
		miscConfig:SetColor(Color(0,0,0,255))
		miscConfig.DoClick = function(miscConfig)
			local Frame = vgui.Create( "DFrame" )
			Frame:SetPos(ScrW() * .4, ScrH() * .5) 
			Frame:SetSize(400, 500) 
			Frame:SetTitle("Configure Miscellaneous") 
			Frame:Center()
			Frame:SetVisible( true ) 
			Frame:SetDraggable( false ) 
			Frame:ShowCloseButton( true ) 
			Frame:MakePopup()

			local check1 = vgui.Create("DCheckBoxLabel", Frame)
			check1:SetPos(Frame:GetWide()*.05, 30)
			check1:SetText("UNSC friendly fire retaliation?")
			check1:SetConVar("vj_spv3_ffretal")

			local check2 = vgui.Create("DCheckBoxLabel", Frame)
			check2:SetPos(Frame:GetWide()*.05, 60)
			check2:SetText("Covenant can use UNSC weapons?")
			check2:SetConVar("vj_spv3_covUNSCWeps")

			local check3 = vgui.Create("DCheckBoxLabel", Frame)
			check3:SetPos(Frame:GetWide()*.05, 90)
			check3:SetText("UNSC can use Covenant weapons?")
			check3:SetConVar("vj_spv3_UNSCCovWeps")

			local check4 = vgui.Create("DCheckBoxLabel", Frame)
			check4:SetPos(Frame:GetWide()*.05, 120)
			check4:SetText("Flood can use weapons?")
			check4:SetConVar("vj_spv3_floodWeps")

			local check5 = vgui.Create("DCheckBoxLabel", Frame)
			check5:SetPos(Frame:GetWide()*.05, 150)
			check5:SetText("Infection forms explode (thus causing chain kills)?")
			check5:SetConVar("vj_spv3_InfFormsExplode")

			local dbox1 = vgui.Create("DComboBox", Frame)
			dbox1:SetPos(Frame:GetWide()*.05, 180)
			dbox1:SetText("What is transformable by the Flood?")
			dbox1:SetSize(Frame:GetWide()*.8, 20)
			dbox1:AddChoice("Anything can be transformed by the Flood.", "vj_spv3_floodOption infect_anything")
			dbox1:AddChoice("Only Halo-related NPCs can be transformed by the Flood.", "vj_spv3_floodOption infect_onlyHalo")
			dbox1:AddChoice("Nothing can be transformed by the Flood.", "vj_spv3_floodOption infect_nothing")
			dbox1.OnSelect = function(dbox1)
				local none, result = dbox1:GetSelected()
				LocalPlayer():ConCommand(result)
				print(result)
			end

			local x, y = dbox1:GetPos()
			Frame:SetSize(400, y + 30)
			Frame:Center()
		end
		Panel:AddPanel(damageConfig)
		Panel:AddPanel(reset)
		Panel:AddPanel(miscConfig)
		Panel:ControlHelp("NOTE: These settings will only apply to newly spawned SNPCs.")
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
game.AddParticles("particles/main_effects.pcf")
	local particlename = {
		"hcea_shield_impact",
		"hcea_shield_recharged",
		"hcea_shield_enabled",
		"hcea_shield_disperse",

		"hcea_hunter_ab_charge",
		"hcea_hunter_ab_explode",
		"hcea_hunter_ab_muzzle",
		"hcea_hunter_ab_proj",
		
		"hcea_hunter_frg_charge",
		"hcea_hunter_frg_explode",
		"hcea_hunter_frg_muzzle",
		"hcea_hunter_frg_proj",
		"hcea_hunter_frg_proj_lightning_trcr_e",
		
		"hcea_hunter_shade_cannon_trigger_muzzle",
		"hcea_hunter_shade_cannon_proj",
		"hcea_hunter_shade_cannon_explode_ground",
		"hcea_hunter_shade_cannon_explode_air",
		
		"hcea_hunter_canister_green",
		"hcea_hunter_canister_purple",
		"hcea_hunter_canister_orange",
		
		"hcea_flood_carrier_death",
		"hcea_flood_infected_death",
		"hcea_flood_runner_death",
		
		"hcea_hunter_particle_carbine",
		"hcea_hunter_particle_carbine_impact",
		"hcea_hunter_needler_muzzle",
		"hcea_hunter_needler_proj",
		"hcea_hunter_needler_pistol_impact",
		"hcea_hunter_plasma_rifle_fire",
		"hcea_hunter_plasma_rifle_proj",
		"hcea_hunter_plasma_rifle_impact",
		"hcea_hunter_plasma_pistol_fire",
		"hcea_hunter_plasma_pistol_proj",
		"hcea_hunter_plasma_pistol_impact",
	}
	for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end
	
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

game.AddParticles("particles/halo_beam.pcf")
game.AddParticles("particles/covenant_fx.pcf")
	local particlename = {
		"halo_beam_main",
		"halo_beam_trail_1",
		"halo_beam_trail_2",
		"halo_beam_trail_3",
		"halo_beam_trail_glow_1",
		"halo_beam_trail_glow_2",
		"halo_beam_trail_glow_3",
		
		"hcea_flood_car_death",
		"hcea_flood_car_death_core",
		"hcea_flood_car_death_dirt",
		"hcea_flood_car_death_frag",
		"hcea_flood_car_death_frag_2",
		"hcea_flood_car_death_gibs",
		"hcea_flood_car_death_smoke",
		"hcea_flood_car_death_smoke_2",
		"hcea_flood_car_death_splat",
		"hcea_flood_car_death_splat_2",
		"hcea_flood_car_death_splatter",
		"hcea_flood_car_death_swave_xy",
		"hcea_flood_car_death_swave_xz",
		"hcea_flood_inf_death",
		"hcea_flood_inf_death_core",
		"hcea_flood_inf_death_gibs",
		"hcea_flood_inf_death_largesplat",
		
		"hcea_hunter_charge",
		"hcea_hunter_charge_core",
		"hcea_hunter_charge_embers",
		"hcea_hunter_charge_glow",
		
		"hcea_hunter_frnade_hit",
		"hcea_hunter_frnade_hit_blitz",
		"hcea_hunter_frnade_hit_collide",
		"hcea_hunter_frnade_hit_core",
		"hcea_hunter_frnade_hit_fire",
		"hcea_hunter_frnade_hit_flash",
		"hcea_hunter_frnade_hit_flash_2",
		"hcea_hunter_frnade_hit_flicker",
		"hcea_hunter_frnade_hit_glow",
		"hcea_hunter_frnade_hit_largeglow",
		"hcea_hunter_frnade_hit_lghtning",
		
		"hcea_hunter_frnade_nade",
		"hcea_hunter_frnade_nade_beam",
		"hcea_hunter_frnade_nade_beam_2",
		"hcea_hunter_frnade_nade_core",
		"hcea_hunter_frnade_nade_core_2",
		"hcea_hunter_frnade_nade_core_3",
		"hcea_hunter_frnade_nade_embers",
		"hcea_hunter_frnade_nade_glow",
		"hcea_hunter_frnade_trail",
		
		"hcea_t25p_charge",
		"hcea_t25p_charge_core",
		"hcea_t25p_charge_glow",
		
		"hcea_t25p_hit",
		"hcea_t25p_hit_blitz",
		"hcea_t25p_hit_collide",
		"hcea_t25p_hit_flicker",
		"hcea_t25p_hit_glow",
		
		"hcea_t25p_muzzle",
		"hcea_t25p_muzzle_charged",
		"hcea_t25p_muzzle_charged_core",
		"hcea_t25p_muzzle_core",
		"hcea_t25p_muzzle_core_2",
		"hcea_t25p_muzzle_embers",
		"hcea_t25p_muzzle_flames",
		"hcea_t25p_muzzle_glow",
		"hcea_t25p_muzzle_heat",
		"hcea_t25p_muzzle_lghtning",
		
		"hcea_t25p_tracer",
		"hcea_t25p_tracer_charged",
		"hcea_t25p_tracer_charged_fadeglow",
		"hcea_t25p_tracer_charged_sparks",
		"hcea_t25p_tracer_fadeglow",
		"hcea_t25p_tracer_line",
		
		"hcea_t25r_core",
		"hcea_t25r_core_2",
		"hcea_t25r_embers",
		"hcea_t25r_flames",
		"hcea_t25r_flames_0a",
		"hcea_t25r_flames_2",
		"hcea_t25r_glow",
		"hcea_t25r_lghtning",
		"hcea_t25r_muzzle",
		"hcea_t25r_tracer",
		"hcea_t25r_tracer_fadeglow",
		"hcea_t25r_tracer_halo_nopunintended",
		"hcea_t25r_tracer_line",
	}
	for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end

//game.AddParticles("particles/ds_artorias_fx.pcf")
//for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end