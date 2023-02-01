AddCSLuaFile("shared.lua")
include('shared.lua')
include('bases/spv3_snpc_base/init.lua')/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/jackal/jackal.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50
ENT.HeadHitgroup = 506
ENT.ShieldProjMaxHealth = 125
ENT.CanFlee = true
//125 shieldProjs
ENT.HullType = HULL_MEDIUM
ENT.Appearance = {
	Color = Color(100,100,140),
	Bodygroups = {0, 0},
	Skin = 0,
}
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"}
ENT.NextThrowGrenadeTime = 0 -- Time until it can throw a grenade again
ENT.ThrowGrenadeChance = 0 -- Chance that it will throw the grenade | Set to 1 to throw all the time
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Purple" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 2
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut","h_f_chest"}},
	{HitGroup = {501}, Animation = {"h_f_l_foot"}},
	{HitGroup = {502}, Animation = {"h_f_r_leg"}},
	{HitGroup = {503}, Animation = {"h_f_r_foot"}},
	{HitGroup = {504}, Animation = {"h_f_l_arm"}},
	{HitGroup = {505}, Animation = {"h_f_l_hand1","h_f_l_hand2"}},
	{HitGroup = {507}, Animation = {"h_f_r_arm"}},
	{HitGroup = {508}, Animation = {"h_f_r_hand"}},
}
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"} -- Death Animations

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.DropWeaponOnDeathAttachment = "Cannon" -- Which attachment should it use for the weapon's position
ENT.HasDeathBodyGroup = false -- Set to true if you want to put a bodygroup when it dies
ENT.HasItemDropsOnDeath = false -- Should it drop items on death?
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true, npc_vj_halo_flood_spv3_carrier=true}
ENT.WeaponProfficiency = 50
ENT.ExtraShotCount = 0

ENT.SoundTbl_OnKilledEnemy = {
"jackal/tnt/tnt9.ogg",
"jackal/tnt/tnt10.ogg",
"jackal/tnt/tnt11.ogg",
"jackal/tnt/tnt12.ogg",
"jackal/tnt/tnt13.ogg",
"jackal/tnt/tnt14.ogg"
}

ENT.SoundTbl_Alert = {
"jackal/seefoe/seefoe1.ogg",
"jackal/seefoe/seefoe2.ogg",
"jackal/seefoe/seefoe3.ogg",
"jackal/seefoe/seefoe4.ogg",
"jackal/seefoe/seefoe5.ogg",
"jackal/seefoe/seefoe6.ogg",
"jackal/seefoe/seefoe7.ogg",
"jackal/seefoe/seefoe8.ogg",
"jackal/seefoe/seefoe9.ogg"
}

ENT.SoundTbl_Pain = {
"jackal/pain/pain1.ogg",
"jackal/pain/pain2.ogg",
"jackal/pain/pain3.ogg",
"jackal/pain/pain4.ogg",
"jackal/pain/pain5.ogg",
"jackal/pain/pain6.ogg",
"jackal/pain/pain7.ogg",
"jackal/pain/pain8.ogg",
"jackal/pain/pain9.ogg",
"jackal/pain/pain10.ogg",
"jackal/pain/pain11.ogg",
"jackal/pain/pain12.ogg",
"jackal/pain/pain13.ogg",
"jackal/pain/pain14.ogg",
"jackal/pain/pain15.ogg",
"jackal/pain/pain16.ogg",
"jackal/pain/pain17.ogg",
"jackal/pain/pain18.ogg",
"jackal/pain/pain19.ogg",
"jackal/pain/pain20.ogg"
}

ENT.SoundTbl_Death = {
"jackal/dth/dth1.ogg",
"jackal/dth/dth2.ogg",
"jackal/dth/dth3.ogg",
"jackal/dth/dth4.ogg",
"jackal/dth/dth5.ogg",
"jackal/dth/dth6.ogg",
"jackal/dth/dth7.ogg",
"jackal/dth/dth8.ogg",
"jackal/dth/dth9.ogg",
"jackal/dth/dth10.ogg",
"jackal/dth/dth11.ogg",
"jackal/dth/dth12.ogg",
"jackal/dth/dth13.ogg",
"jackal/dth/dth14.ogg",
"jackal/dth/dth15.ogg"
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CustomCollision = {Min = Vector(-20, -20, 0), Max = Vector(20, 20, 75)}
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	if (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_plasmapistol") then
			self:SetSkin(0)
		elseif (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_needler") then
			self:SetSkin(1)
		elseif (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_plasmapistolbrute") then
			self:SetSkin(2)
		else
			self:SetSkin(3)
		end
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_AGITATED
    elseif (htype == "ar2") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_RIFLE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    elseif (htype == "normal" or htype == "passive") then
    	self.AnimTbl_Walk = {ACT_RUN_SCARED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
		self.AnimTbl_Run = {ACT_RUN_SCARED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
		self.AnimTbl_MoveToCover = {ACT_RUN_SCARED}
    end
	return true
end

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("elite/shared/walk/walk ("..math.random(1,6)..").ogg", 80, 100, 1)
	elseif key == "Pain" then
		self:PlaySoundSystem("Pain")
	end
end