AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/elite/elite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(40,60,200)
ENT.bodyGroupTable = {
	0,
	1,
	2,
	4,
}
ENT.StartHealth = 35
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldHealth = 100
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 50
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Purple" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?

ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack

-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.AnimTbl_MoveToCover = {ACT_RUN} -- The animation it plays when moving to a covered position
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_WeaponReload = {ACT_ARM} -- Animations that play when the SNPC reloads
-- ENT.AnimTbl_CallForHelp = {} -- Call For Help Animations
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.TimeUntilGrenadeIsReleased = 0.97 -- Time until the grenade is released
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Kill_F_Gut"} -- Death Animations
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDamage = 70
ENT.DisableMeleeAttackAnimation = false -- if true, it will disable the animation code
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the melee attack animation?
ENT.MeleeAttackDistance = 80 -- How close does it have to be until it attacks?
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 90 -- How far does the damage go?
ENT.MeleeAttackDamageAngleRadius = 45 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.TimeUntilMeleeAttackDamage = 0.8 -- This counted in seconds | This calculates the time until it hits something
ENT.NextAnyAttackTime_Melee = 1.3333333333333 -- How much time until it can use any attack again? | Counted in Seconds
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?

ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.HasSword = false
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.CanFlinch = 0 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 5
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"hit_f_chest", "hit_f_gut"}},
	{HitGroup = {501}, Animation = {"hit_f_left_thigh"}},
	{HitGroup = {502}, Animation = {"hit_f_left_foot"}},
	{HitGroup = {503}, Animation = {"hit_f_right_thigh"}},
	{HitGroup = {504}, Animation = {"hit_f_right_foot"}},
	{HitGroup = {505}, Animation = {"hit_f_left_arm"}},
	{HitGroup = {506}, Animation = {"hit_f_left_hand"}},
	{HitGroup = {508}, Animation = {"hit_f_right_arm"}},
	{HitGroup = {509}, Animation = {"hit_f_right_hand"}},
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
ENT.Skin = 1
---------------------------------------------------------------------------------------------------------------------------------------------

function ENT:CustomOnPreInitialize()
	self.voicePermutation = tostring(math.random(1,2))
	self.SoundTbl_Alert = {
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (1).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (2).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (3).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (4).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (5).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (6).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (7).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (8).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (9).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (10).ogg",
}
self.SoundTbl_AllyDeath = {
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (1).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (2).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (3).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (4).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (5).ogg",
}
self.SoundTbl_Berserk = {
	"elite/shared/berserk/berserk (1).ogg",
	"elite/shared/berserk/berserk (2).ogg",
}
self.SoundTbl_CallForHelp = {
	"elite/elite0"..self.voicePermutation.."/call_help (1).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (2).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (3).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (4).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (5).ogg",
}
self.SoundTbl_CombatIdle = {
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (1).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (2).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (3).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (4).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (5).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (6).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (7).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (8).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (9).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (10).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (11).ogg",
}
self.SoundTbl_Death = {
	"elite/elite0"..self.voicePermutation.."/death/death (1).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (2).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (3).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (4).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (5).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (6).ogg",
}
self.SoundTbl_Fall = {
	"elite/elite0"..self.voicePermutation.."/fall/fall (1).ogg",
	"elite/elite0"..self.voicePermutation.."/fall/fall (2).ogg",
	"elite/elite0"..self.voicePermutation.."/fall/fall (3).ogg",
	"elite/elite0"..self.voicePermutation.."/fall/fall (4).ogg",
}
self.SoundTbl_GrenadeAttack = {
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (1).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (2).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (3).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (4).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (5).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (6).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (7).ogg",
}
self.SoundTbl_Investigate = {
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (1).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (2).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (3).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (4).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (5).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (6).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (7).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (8).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (9).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (10).ogg",
}
self.SoundTbl_LostEnemy = {
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (1).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (2).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (3).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (4).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (5).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (6).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (7).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (8).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (9).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (10).ogg",
}
self.SoundTbl_OnGrenadeSight = {
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (1).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (2).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (3).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (4).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (5).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (6).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (7).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (8).ogg",
}
self.SoundTbl_OnKilledEnemy = {
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (1).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (2).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (3).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (4).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (5).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (6).ogg",
}
self.SoundTbl_OnReceiveOrder = {
	"elite/elite0"..self.voicePermutation.."/ok/ok (1).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (2).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (3).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (4).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (5).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (6).ogg",
}
self.SoundTbl_Pain = {
	"elite/elite0"..self.voicePermutation.."/pain/pain (1).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (2).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (3).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (4).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (5).ogg",
}
self.SoundTbl_Stuck = {
	"elite/elite0"..self.voicePermutation.."/stuck/stuck (1).ogg",
	"elite/elite0"..self.voicePermutation.."/stuck/stuck (2).ogg",
	"elite/elite0"..self.voicePermutation.."/stuck/stuck (3).ogg",
}
self.SoundTbl_Suppressing = {
	"elite/elite0"..self.voicePermutation.."/firing/firing (1).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (2).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (3).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (4).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (5).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (6).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (7).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (8).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (9).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (10).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (11).ogg",
}
self.SoundTbl_Transform = {
	"elite/elite0"..self.voicePermutation.."/transform/transform (1).ogg",
	"elite/elite0"..self.voicePermutation.."/transform/transform (2).ogg",
	"elite/elite0"..self.voicePermutation.."/transform/transform (3).ogg",
}
self.SoundTbl_WeaponReload = {
	"elite/elite0"..self.voicePermutation.."/cover/cover (1).ogg",
	"elite/elite0"..self.voicePermutation.."/cover/cover (2).ogg",
	"elite/elite0"..self.voicePermutation.."/cover/cover (3).ogg",
}
end

function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_AGITATED
    	self.WeaponAnimTranslations[ACT_COVER_LOW]					= ACT_COVER_LOW
    elseif (htype == "ar2") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_RIFLE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    	self.WeaponAnimTranslations[ACT_COVER_LOW]					= ACT_COVER_MED
    elseif (htype == "melee") then
    	self.WeaponAnimTranslations[ACT_IDLE]                 		= ACT_IDLE_MELEE
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_MP_RUN_MELEE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_MELEE_ATTACK2
    end
	return true
end

function ENT:CustomOnInitialize()
	self:RandomizeTraits()
	self:SetSkin(self.Skin)
-- 	timer.Simple(0.1, function()
-- 	if (self:GetActiveWeapon().HoldType=="ar2") then
-- 		self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
-- 		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_Run = {ACT_RUN_RIFLE}
-- 		self.AnimTbl_TakingCover = {ACT_COVER_MED}
-- 		self.AnimTbl_WeaponAttackCrouch = {ACT_COVER_MED}
-- 	elseif (self:GetActiveWeapon().HoldType == "melee") then
-- 		self.MeleeAttackDamage = 300 * GetConVarNumber("vj_spv3_damageModifier")
-- 		self.AnimTbl_ShootWhileMovingRun = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_ShootWhileMovingWalk = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_Run = {ACT_MP_RUN_MELEE}
-- 		self.AnimTbl_IdleStand = {ACT_IDLE_MELEE}
-- 		self.AnimTbl_WeaponAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations

-- 		self.Berserked = true
-- 	end
-- end)
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	self.NextMoveTime = 0
	self.NextDodgeTime = 0
	self.NextMoveAroundTime = 0
	self.NextBlockTime = 0
	self.onfire = false
	self.UsingMagic = false
	self:SetColor(self.modelColor)
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end
	self:SetCollisionBounds(Vector(-18, -18, 0), Vector(18, 18, 85))
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	-- Shields & Health --
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self.ShieldHealth = self.ShieldHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self.ShieldActivated = true
	self:SetHealth(self.ShieldHealth + self.StartHealth)

end
---------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:CustomOnThink_AIEnabled()
-- 	-- Shields --
-- 	if self.ShieldActivated == true then
-- 		self.Bleeds = false
-- 	else
-- 		self.Bleeds = true
-- 	end
	
-- 	-- Dodging --
-- 	if self:GetEnemy() != nil then
-- 		local attackthev = ents.FindInSphere(self:GetPos(),500)
-- 		for _,v in pairs(attackthev) do
-- 			local EnemyDistance = self:GetPos():Distance(v:GetPos())
-- 			if EnemyDistance < 500 && math.random(1,10) == 1 && CurTime() > self.NextMoveTime && self:CanDodge("normal") then -- Random movement
-- 				local Evade = self:VJ_CheckAllFourSides(500)
-- 				self:StopAttacks(true)
-- 				if Evade.Right == false then
-- 					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false) -- Left dodge anim
-- 					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
				
-- 				elseif Evade.Left == false then
-- 					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false) -- Right dodge anim	
-- 					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
					
-- 				elseif Evade.Forward == false then
-- 					local rnd_dodge = math.random(1,2)
-- 					if rnd_dodge == 1 then
-- 						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false) -- Left dodge anim
-- 						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)	
-- 					elseif rnd_dodge == 2 then
-- 						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false) -- Left dodge anim
-- 						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)						
-- 					end
				
-- 				elseif Evade.Backward == false then
-- 				end
-- 				self.NextMoveTime = CurTime() +math.random(4,7)
-- 			elseif EnemyDistance < 500 && math.random(1,30) == 1 && CurTime() > self.NextDodgeTime && self:CanDodge("player") then -- Dodge attack
-- 				local Evade = self:VJ_CheckAllFourSides(500)
-- 				self:StopAttacks(true)
-- 				if Evade.Right == false then
-- 					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false) -- Left dodge anim
-- 					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
					
-- 				elseif Evade.Left == false then
-- 					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false) -- Right dodge anim	
-- 					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
					
-- 				elseif Evade.Forward == false then
-- 				local rnd_dodge = math.random(1,2)
-- 					if rnd_dodge == 1 then
-- 						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false) -- Left dodge anim
-- 						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)	
-- 					elseif rnd_dodge == 2 then
-- 						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false) -- Left dodge anim
-- 						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
-- 						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)						
-- 					end
-- 				end
-- 				self.NextDodgeTime = CurTime() +math.random(2,4.5)
-- 			end
-- 		end
-- 	end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasStuck=false
function ENT:Berserk()
	self.BerserkSound = CreateSound(self, VJ_PICKRANDOMTABLE(self.SoundTbl_Berserk))
	if (self.HasSword == true) then
		self.MeleeAttackDamage = 300 * GetConVarNumber("vj_spv3_damageModifier")
		self.AnimTbl_ShootWhileMovingRun = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_ShootWhileMovingWalk = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_Run = {ACT_MP_RUN_MELEE}
		self.AnimTbl_IdleStand = {ACT_IDLE_MELEE}
		self.AnimTbl_WeaponAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations

		timer.Simple(0.5, function() 
			if (IsValid(self) and IsValid(self:GetActiveWeapon())) then
				local wep = ents.Create(self:GetActiveWeapon():GetClass())
				wep:SetPos(self:GetAttachment(self:LookupAttachment("Cannon"))["Pos"])
				wep:SetAngles(self:GetActiveWeapon():GetAngles())
				wep:Spawn()
				self:GetActiveWeapon():Remove()
				self:Give("weapon_vj_cov_spv3_energysword")
			end
		end)
	end
	if (self.Berserked==true or self.HasStuck==true) then return end
	self.BerserkSound:Play()
	self.Berserked=true
	self.MoveRandomlyWhenShooting = false
	self.AllowWeaponReloading = false -- If false, the SNPC will no longer reload
	self.WaitForEnemyToComeOut = false
	self.NoWeapon_UseScaredBehavior = false
	self:VJ_ACT_PLAYACTIVITY("Berserk", true, 2, false)
end


ENT.ShieldDelay = 6
ENT.EvadeCooldown = 0
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (math.random(0,2) == 2) then
		if (self.EvadeCooldown <= CurTime()) then
			if (math.random(0,1)==1) then
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false)
			end
			self.EvadeCooldown = CurTime() + 4
		end
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if self.ShieldActivated == true then
		self.Bleeds=false
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
		self.ShieldCurrentHealth = (self.ShieldCurrentHealth - dmginfo:GetDamage())
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB) then
			self:FlyingDeath(dmginfo)
		end
	end
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.HasDeathSounds = false -- If set to false, it won't play the death sounds
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter:SetOwner(self)
	self.imposter.Sequence = "Die_Airborne"
	local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
	if (dmginfo:GetDamageType()==DMG_CLUB) then
		velocity = velocity * 0.3
	end
	self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
	self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
	self.imposter:Spawn()
end


ENT.Berserked=false
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	self:SetHealth((self.ShieldCurrentHealth + self.CurrentHealth))
	if (self.ShieldCurrentHealth<=0) then
		self:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
		self.ShieldActivated=false
		self.Bleeds=true
		self.CanFlinch = 1
	end
	if (timer.Exists("ShieldDelay"..self:GetCreationID())) then
		timer.Adjust("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1)
	else
		timer.Create("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1, function() 
			if (IsValid(self)) then
				self:StopParticles()
				ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				self.ShieldActivated = true
				self.CanFlinch = 0
				self.ShieldCurrentHealth = self.ShieldHealth
				self:SetHealth(self.CurrentHealth + self.ShieldCurrentHealth)
				self.Bleeds=false
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
	if self.ShieldActivated == false then return end
	if (math.random(0,1)==0) and (self.Berserked==false) and (self:Health() > dmginfo:GetDamage()) then
		self:Berserk()
	elseif (self.Berserked==false) then
		self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
	end
	-- self:EmitSound(Sound("ambient/energy/weld" .. math.random(1,2) .. ".ogg"),80,100)
	self:StopParticles()
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	ParticleEffectAttach("hcea_shield_enabled",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	self.ShieldActivated = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AcceptableWeaponsTbl = {"gmod_camera","gmod_tool","weapon_physgun","weapon_physcannon"}
---------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:CanDodge(dodgetype)
-- 	if dodgetype == "normal" then
-- 		if self.UsingMagic == false && self.MeleeAttacking == false && self.onfire == false && self.Flinching == false && self:GetEnemy():IsNPC() && ((self:GetEnemy().MeleeAttacking && self:GetEnemy().MeleeAttacking == true) or (self:GetEnemy().cpt_atkAttacking && self:GetEnemy().cpt_atkAttacking == true)) then
-- 			return true
-- 		else
-- 			return false
-- 		end
-- 	elseif dodgetype == "player" then
-- 		if self.UsingMagic == false && self.MeleeAttacking == false && self:GetEnemy():IsPlayer() && self:GetEnemy():GetEyeTrace().Entity == self && self.onfire == false && self.Flinching == false && self:GetEnemy():IsPlayer() && self:GetEnemy():GetActiveWeapon() != nil && !table.HasValue(self.AcceptableWeaponsTbl,self:GetEnemy():GetActiveWeapon():GetClass()) && (self:GetEnemy():KeyPressed(IN_ATTACK) or self:GetEnemy():KeyPressed(IN_ATTACK2) or self:GetEnemy():KeyReleased(IN_ATTACK) or self:GetEnemy():KeyReleased(IN_ATTACK2) or self:GetEnemy():KeyDown(IN_ATTACK) or self:GetEnemy():KeyDown(IN_ATTACK2)) then
-- 			return true
-- 		else
-- 			return false
-- 		end
-- 	end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindSeq(seq)
	return self:GetSequenceActivity(self:LookupSequence(seq))
end
ENT.voicePermutation = ""

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("elite/shared/walk/walk ("..math.random(1,6)..").ogg", 80, 100, 1)
	elseif key == "Melee1" then
		self:EmitSound("elite/shared/stand_pistol_melee/stand_pistol_melee"..math.random(1,2)..".ogg", 80, 100, 1)
		self:EmitSound("elite/elite0"..self.voicePermutation.."/melee/melee ("..math.random(1,5)..").ogg", 80, 100, 1)
	elseif key == "Hit" then
		self:MeleeAttackCode()
	elseif key == "EvadeR" then
		self:EmitSound("elite/shared/stand_pistol_evade_right/stand_pistol_evade_right.ogg", 80, 100, 1)
		self:EmitSound("elite/elite0"..self.voicePermutation.."/dodge/dodge ("..math.random(1,4)..").ogg", 80, 100, 1)
	
	elseif key == "EvadeL" then
		self:EmitSound("elite/shared/stand_pistol_evade_left/stand_pistol_evade_left.ogg", 80, 100, 1)
		self:EmitSound("elite/elite0"..self.voicePermutation.."/dodge/dodge ("..math.random(1,4)..").ogg", 80, 100, 1)
	elseif key == "Pain" then
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Pain))
	end
end


ENT.GrenadeAttackVelForward1 = 300 -- Grenade attack velocity up | The first # in math.random




/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/