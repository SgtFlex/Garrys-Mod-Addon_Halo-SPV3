AddCSLuaFile("shared.lua")
include('shared.lua')
include('bases/spv3_snpc_base/init.lua')/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/grunt/grunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.Appearance = {
	Color = Color(127,111,63),
	Bodygroups = {2, 1},
	Skin = 0,
}
ENT.StartHealth = 45
ENT.HeadHitgroup = 505
ENT.CanFlee = true
ENT.ExtraShotCount = 0
ENT.WeaponProfficiency = 30
	-- ====== Blood-Related Variables ====== --
ENT.BloodColor = "Blue" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.AnimTbl_MoveToCover = {ACT_RUN} -- The animation it plays when moving to a covered position
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_WeaponReload = {ACT_RELOAD} -- Animations that play when the SNPC reloads
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.DropWeaponOnDeathAttachment = "Cannon" -- Which attachment should it use for the weapon's position
ENT.AnimTbl_Death = {"Die_2", "Die_3", "Die_4", "Die_5"}
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.TimeUntilGrenadeIsReleased = 0.97 -- Time until the grenade is released
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 3
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut"}},
	{HitGroup = {505}, Animation = {"h_f_head"}},
	{HitGroup = {501}, Animation = {"h_f_l_foot"}},
	{HitGroup = {502}, Animation = {"h_f_r_foot"}},
	{HitGroup = {503}, Animation = {"h_f_l_arm"}},
	{HitGroup = {504}, Animation = {"h_f_l_hand"}},
	{HitGroup = {506}, Animation = {"h_f_r_arm"}},
	{HitGroup = {507}, Animation = {"h_f_r_hand"}},
}
ENT.GrenadeTypes = {
	"obj_vj_cov_spv3_gravity_nade",
	"obj_vj_cov_spv3_plasma_nade",
	"obj_vj_cov_spv3_cluster_nade",
	"obj_vj_cov_spv3_needler_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true, npc_vj_halo_flood_spv3_carrier=true}
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_magnum",
}
ENT.RemovableParts = {
	[505] = {Health = GetConVarNumber("vj_spv3_PrecisionThreshold"), Bodygroup = "Head", Execute = function(entity, dmginfo) 
		entity:Flee()
		entity:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
		entity:EmitSound("grunt/shared/grunt_mask_destroyed/grunt_backpack_steam"..math.random(1,3)..".ogg", 80, 100, 1)
		local pos, ang = entity:GetBonePosition(13)
		pos = pos + entity:GetRight()*35
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/cov/grunt/garbage/minor_mask.mdl", 
		{
			Pos = pos, 
			Ang = ang,
			BloodDecal="",
			CollideSound={"phx/epicmetal_hard.wav", "phx/epicmetal_hard1.wav", "phx/epicmetal_hard2.wav", "phx/epicmetal_hard3.wav", "phx/epicmetal_hard4.wav", "phx/epicmetal_hard5.wav", "phx/epicmetal_hard6.wav", "phx/epicmetal_hard7.wav"},
		},
			function(gib) 
				gib:SetColor(entity:GetColor())
				gib:SetSkin(entity:GetSkin()) 
			end
		)
		ParticleEffect("GruntMaskGas", pos - entity:GetRight()*35 , ang, entity)
		if (dmginfo:GetDamage() >= GetConVar("vj_spv3_PrecisionThreshold"):GetInt()) then
			dmginfo:SetDamage(entity:Health())
		end
	end},
	[508] = {Health = 15, Bodygroup = "Body", Execute = function(entity, dmginfo)
		entity:Flee()
		entity:VJ_ACT_PLAYACTIVITY("h_b_gut", true, 1, false)
		entity:EmitSound("grunt/shared/grunt_backpack_destroyed/grunt_backpack_steam"..math.random(1,3)..".ogg", 80, 100, 1)
		local pos = entity:GetAttachment(entity:LookupAttachment("Backpack"))["Pos"] + entity:GetRight()*35 //Corrective position
		local ang = entity:GetAttachment(entity:LookupAttachment("Backpack"))["Ang"]
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/cov/grunt/garbage/tank_one.mdl", 
			{
				Pos = pos, 
				Ang = ang,
				BloodDecal="",
				CollideSound={"phx/epicmetal_hard.wav", "phx/epicmetal_hard1.wav", "phx/epicmetal_hard2.wav", "phx/epicmetal_hard3.wav", "phx/epicmetal_hard4.wav", "phx/epicmetal_hard5.wav", "phx/epicmetal_hard6.wav", "phx/epicmetal_hard7.wav"},
			},
			function(gib) 
				gib:SetColor(entity:GetColor())
				gib:SetSkin(entity:GetSkin()) 
			end
		)
		ParticleEffectAttach("GruntBackGasTank",PATTACH_POINT_FOLLOW,entity,entity:LookupAttachment("Backpack"))
	end}
}

function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	self.WeaponAnimTranslations[ACT_WALK]						= ACT_WALK
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_AGITATED
    elseif (htype == "normal" or htype == "passive") then
    	self.WeaponAnimTranslations[ACT_WALK]						= ACT_RUN_SCARED
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_SCARED
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_RUN_SCARED
    else
    	self.WeaponAnimTranslations[ACT_WALK]						= ACT_WALK
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_RIFLE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    end
	return true
end

function ENT:CustomOnPreInitialize()
	self.voicePermutation = tostring(math.random(1,4))
	self.SoundTbl_Alert = {
		"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (5).ogg",
	}
self.SoundTbl_AllyDeath = {
		"grunt/grunt0"..self.voicePermutation.."/ally_death/ally_death (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/ally_death/ally_death (2).ogg",
	}
self.SoundTbl_CombatIdle = {
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (6).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (7).ogg",
		"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (8).ogg",
	}
self.SoundTbl_Death = {
		"grunt/grunt0"..self.voicePermutation.."/death/death (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/death/death (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/death/death (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/death/death (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/death/death (5).ogg",
	}
self.SoundTbl_Fall = {
		"grunt/grunt0"..self.voicePermutation.."/fall/fall (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/fall/fall (2).ogg",
	}
self.SoundTbl_GrenadeAttack = {
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (6).ogg",
		"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (7).ogg",
	}
self.SoundTbl_Investigate = {
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (6).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (7).ogg",
		"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (8).ogg",
	}
self.SoundTbl_LostEnemy = {
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (6).ogg",
		"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (7).ogg",
	}
self.SoundTbl_OnGrenadeSight = {
		"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (5).ogg",
	}
self.SoundTbl_OnKilledEnemy = {
		"grunt/grunt0"..self.voicePermutation.."/killed_enemy/killed_enemy (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/killed_enemy/killed_enemy (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/killed_enemy/killed_enemy (3).ogg",
	}
self.SoundTbl_OnReceiveOrder = {
		"grunt/grunt0"..self.voicePermutation.."/ok/ok (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/ok/ok (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/ok/ok (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/ok/ok (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/ok/ok (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/ok/ok (6).ogg",
	}
self.SoundTbl_Pain = {
		"grunt/grunt0"..self.voicePermutation.."/pain/pain (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/pain/pain (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/pain/pain (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/pain/pain (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/pain/pain (5).ogg",
	}
self.SoundTbl_Scared = {
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (6).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (7).ogg",
		"grunt/grunt0"..self.voicePermutation.."/flee/flee (8).ogg",
	}
self.SoundTbl_Stuck = {
		"grunt/grunt0"..self.voicePermutation.."/stuck/stuck (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/stuck/stuck (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/stuck/stuck (3).ogg",
	}
self.SoundTbl_Suppressing = {
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (4).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (5).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (6).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (7).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (8).ogg",
		"grunt/grunt0"..self.voicePermutation.."/firing/firing (9).ogg",
	}
self.SoundTbl_Transform = {
		"grunt/grunt0"..self.voicePermutation.."/transform/transform (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/transform/transform (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/transform/transform (3).ogg",
	}
self.SoundTbl_WeaponReload = {
		"grunt/grunt0"..self.voicePermutation.."/cover/cover (1).ogg",
		"grunt/grunt0"..self.voicePermutation.."/cover/cover (2).ogg",
		"grunt/grunt0"..self.voicePermutation.."/cover/cover (3).ogg",
		"grunt/grunt0"..self.voicePermutation.."/cover/cover (4).ogg",
	}
end
ENT.CustomCollision = {Min = Vector(-20,-20,0), Max = Vector(20,20,60)}
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("grunt/shared/walk/walk"..math.random(1,6)..".ogg", 80, 100, 1)
	end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/