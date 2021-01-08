AddCSLuaFile("shared.lua")
include('shared.lua')
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
ENT.ExtraShotCount = 0
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
ENT.ExtraShotCount = 0
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

function ENT:CustomOnInitialize()
	-- local matEnt = ents.Create("material_modify_control")
	-- matEnt:Spawn()
	-- matEnt:SetKeyValue("MaterialName", "models/hce/spv3/cov/elite/elite_main_diff_blue")
	-- matEnt:SetKeyValue("MaterialVar", "$color2")
	-- matEnt:SetKeyValue("MaterialVarValue", "[5 1 1]")
	self:SetSkin(self.Skin)
	timer.Simple(0.1, function()
	if (self:GetActiveWeapon().HoldType=="ar2") then
		self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_Run = {ACT_RUN_RIFLE}
		self.AnimTbl_TakingCover = {ACT_COVER_MED}
		self.AnimTbl_WeaponAttackCrouch = {ACT_COVER_MED}
	elseif (self:GetActiveWeapon().HoldType == "melee") then
		self.MeleeAttackDamage = 300 * GetConVarNumber("vj_spv3_damageModifier")
		self.AnimTbl_ShootWhileMovingRun = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_ShootWhileMovingWalk = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_Run = {ACT_MP_RUN_MELEE}
		self.AnimTbl_IdleStand = {ACT_IDLE_MELEE}
		self.AnimTbl_WeaponAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations

		self.Berserked = true
	end
end)
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
	self:SetCollisionBounds(Vector(30, 30, 85), Vector(-30, -30, 0))
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

function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false then return end
	for i=1, math.random(1,4) do
		self.ThingsToDrop[i] = self.GrenadeWeps[math.random(1,5)]
	end
	if math.random(1,self.ItemDropsOnDeathChance) == 1 then
		self:CustomRareDropsOnDeathCode(dmginfo,hitgroup)
		for k,v in pairs(self.ThingsToDrop) do
			local entlist = self.ThingsToDrop[k]
			if entlist != false then
				local randdrop = ents.Create(entlist)
				randdrop:SetPos(self:GetPos() + self:OBBCenter())
				randdrop:SetAngles(self:GetAngles())
				randdrop:Spawn()
				randdrop:Activate()
				local phys = randdrop:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetMass(60)
					phys:ApplyForceCenter(dmginfo:GetDamageForce()*.01)
				end
			end
		end
	end
end

function ENT:CustomOnGrenadeAttack_BeforeThrowTime() 
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
end

function ENT:CheckForGrenades()
	if self.CanDetectGrenades == false or self.ThrowingGrenade == true or self.HasSeenGrenade == true or self.VJ_IsBeingControlled == true then return end
	local FindNearbyGrenades = ents.FindInSphere(self:GetPos(),self.RunFromGrenadeDistance)
	for _,v in pairs(FindNearbyGrenades) do
		local IsFriendlyGrenade = false
		if self.EntitiesToRunFrom[v:GetClass()] && self:Visible(v) then
			if IsValid(v:GetOwner()) && v:GetOwner().IsVJBaseSNPC == true && (self:Disposition(v:GetOwner()) == D_LI or self:Disposition(v:GetOwner()) == D_NU) then
				IsFriendlyGrenade = true
			end
			if IsFriendlyGrenade == false then
				self.HasSeenGrenade = true
				self.TakingCoverT = CurTime() + 4
				if /*IsValid(self:GetEnemy()) &&*/v.VJHumanNoPickup != true && v.VJHumanTossingAway != true && self.CanThrowBackDetectedGrenades == true && self.HasGrenadeAttack == true && v:GetVelocity():Length() < 400 && self:VJ_GetNearestPointToEntityDistance(v) < 100 && self.EntitiesToThrowBack[v:GetClass()] then
					self.NextGrenadeAttackSoundT = CurTime() + 3
					self:ThrowGrenadeCode(v,true)
					v.VJHumanTossingAway = true
					//v:Remove()
				end
				//if self.VJ_PlayingSequence == false then self:VJ_SetSchedule(SCHED_RUN_FROM_ENEMY) end
				self:SetAngles(Angle(self:GetAngles().x, (self:GetPos()-v:GetPos()):Angle().y,self:GetAngles().z))
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL3, true, 2, false)
				self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH",function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
				timer.Simple(4,function() if IsValid(self) then self.HasSeenGrenade = false end end)
				break;
				//else
				//self.HasSeenGrenade = false
				//return
			end
		end
	end
end

ENT.GrenadeAttackVelForward1 = 300 -- Grenade attack velocity up | The first # in math.random

function ENT:ThrowGrenadeCode(CustomEnt, NoOwner)
	if self.Dead == true or self.Flinching == true or self.MeleeAttacking == true /*or (IsValid(self:GetEnemy()) && !self:Visible(self:GetEnemy()))*/ then return end
	//if self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() +self:OBBCenter()),self:GetEnemy():EyePos()) == true then return end
	NoOwner = NoOwner or false
	local getIsCustom = false
	local gerModel = self.GrenadeAttackModel
	local gerClass = self.GrenadeAttackEntity
	local gerFussTime = self.GrenadeAttackFussTime
	
	if IsValid(self:GetEnemy()) && !self:Visible(self:GetEnemy()) then
		if self:VisibleVec(self.LatestVisibleEnemyPosition) && self:GetEnemy():GetPos():Distance(self.LatestVisibleEnemyPosition) <= 600 then
			self:FaceCertainPosition(self.LatestVisibleEnemyPosition)
		else
			return
		end
	end
	
	local getSpawnPos = self.GrenadeAttackAttachment
	local getSpawnAngle;
	if getSpawnPos == false then
		getSpawnPos = self:GetPos() + self.GrenadeAttackSpawnPosition
		getSpawnAngle = getSpawnPos:Angle()
	else
		getSpawnPos = self:GetAttachment(self:LookupAttachment(self.GrenadeAttackAttachment)).Pos
		getSpawnAngle = self:GetAttachment(self:LookupAttachment(self.GrenadeAttackAttachment)).Ang
	end
	
	if self.DisableGrenadeAttackAnimation == false then
		self.CurrentAttackAnimation = VJ_PICK(self.AnimTbl_GrenadeAttack)
		self.CurrentAttackAnimationDuration = self:DecideAnimationLength(self.CurrentAttackAnimation, false, 0.2)
		self.PlayingAttackAnimation = true
		timer.Create("timer_act_playingattack"..self:EntIndex(), self.CurrentAttackAnimationDuration, 1, function() self.PlayingAttackAnimation = false end)
		self:VJ_ACT_PLAYACTIVITY(self.CurrentAttackAnimation, self.GrenadeAttackAnimationStopAttacks, self:DecideAnimationLength(self.CurrentAttackAnimation, self.GrenadeAttackAnimationStopAttacksTime), true, self.GrenadeAttackAnimationDelay, {PlayBackRateCalculated=true})
	end

	if IsValid(CustomEnt) then -- Custom nernagner gamal nernagner vor yete bidi nede
		getIsCustom = true
		gerModel = CustomEnt:GetModel()
		gerClass = CustomEnt:GetClass()
		CustomEnt:SetMoveType(MOVETYPE_NONE)
		CustomEnt:SetParent(self)
		if self.GrenadeAttackAttachment == false then
			CustomEnt:SetPos(getSpawnPos)
		else
			CustomEnt:Fire("SetParentAttachment",self.GrenadeAttackAttachment)
		end
		CustomEnt:SetAngles(getSpawnAngle)
		if gerClass == "obj_vj_grenade" then
			gerFussTime = math.abs(CustomEnt.FussTime - CustomEnt.TimeSinceSpawn)
		elseif gerClass == "obj_handgrenade" or gerClass == "obj_spore" then
			gerFussTime = 1
		elseif gerClass == "npc_grenade_frag" or gerClass == "doom3_grenade" or gerClass == "fas2_thrown_m67" or gerClass == "cw_grenade_thrown" or gerClass == "cw_flash_thrown" or gerClass == "cw_smoke_thrown" then
			gerFussTime = 1.5
		elseif gerClass == "obj_cpt_grenade" then
			gerFussTime = 2
		end
	end

	if !IsValid(self:GetEnemy()) then
		local iamarmo = self:VJ_CheckAllFourSides()
		local facepos = false
		if iamarmo.Forward then facepos = self:GetPos() + self:GetForward()*200; doit = true;
		elseif iamarmo.Right then facepos = self:GetPos() + self:GetRight()*200;  doit = true;
		elseif iamarmo.Left then facepos = self:GetPos() + self:GetRight()*-200;  doit = true;
		elseif iamarmo.Backward then facepos = self:GetPos() + self:GetForward()*-200;  doit = true;
		end
		if facepos != false then
			self:FaceCertainPosition(facepos, self.CurrentAttackAnimationDuration or 1.5)
		end
	end

	self.ThrowingGrenade = true
	self:CustomOnGrenadeAttack_BeforeThrowTime()
	self:PlaySoundSystem("GrenadeAttack")

	timer.Simple(self.TimeUntilGrenadeIsReleased, function()
		if getIsCustom == true && !IsValid(CustomEnt) then return end
		if IsValid(CustomEnt) then CustomEnt.VJHumanTossingAway = false CustomEnt:Remove() end
		if IsValid(self) && self.Dead == false /*&& IsValid(self:GetEnemy())*/ then -- Yete SNPC ter artoon e...
			local gerThrowPos = self:GetPos() + self:GetForward()*200
			if IsValid(self:GetEnemy()) then
				if !self:Visible(self:GetEnemy()) && self:VisibleVec(self.LatestVisibleEnemyPosition) && self:GetEnemy():GetPos():Distance(self.LatestVisibleEnemyPosition) <= 600 then
					gerThrowPos = self.LatestVisibleEnemyPosition
					self:FaceCertainPosition(gerThrowPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
				else
					gerThrowPos = self:GetEnemy():GetPos()
				end
			else -- Yete teshnami chooni, nede amenan lav goghme
				local iamarmo = self:VJ_CheckAllFourSides()
				if iamarmo.Forward then gerThrowPos = self:GetPos() + self:GetForward()*200; self:FaceCertainPosition(gerThrowPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
				elseif iamarmo.Right then gerThrowPos = self:GetPos() + self:GetRight()*200; self:FaceCertainPosition(gerThrowPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
				elseif iamarmo.Left then gerThrowPos = self:GetPos() + self:GetRight()*-200; self:FaceCertainPosition(gerThrowPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
				elseif iamarmo.Backward then gerThrowPos = self:GetPos() + self:GetForward()*-200; self:FaceCertainPosition(gerThrowPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
				end
			end
			local gent = ents.Create(gerClass)
			local getThrowVel = (gerThrowPos - getSpawnPos) + (self:GetUp()*(getSpawnPos:Distance(gerThrowPos)/3) + self:GetForward()*self.GrenadeAttackVelForward1 + self:GetRight()*self.GrenadeAttackVelRight1)
			if NoOwner == false then gent:SetOwner(self) end
			gent:SetPos(getSpawnPos)
			gent:SetAngles(getSpawnAngle)
			gent:SetModel(Model(gerModel))
			-- Set the timers for all the different grenade entities
				if gerClass == "obj_vj_grenade" then
					gent.FussTime = gerFussTime
				elseif gerClass == "obj_cpt_grenade" then
					gent:SetTimer(gerFussTime)
				elseif gerClass == "obj_spore" then
					gent:SetGrenade(true)
				elseif gerClass == "ent_hl1_grenade" then
					gent:ShootTimed(CustomEnt, getThrowVel, gerFussTime)
				elseif gerClass == "doom3_grenade" or gerClass == "obj_handgrenade" then
					gent:SetExplodeDelay(gerFussTime)
				elseif gerClass == "cw_grenade_thrown" or gerClass == "cw_flash_thrown" or gerClass == "cw_smoke_thrown" then
					gent:SetOwner(self)
					gent:Fuse(gerFussTime)
				end
			gent:Spawn()
			gent:Activate()
			if gerClass == "npc_grenade_frag" then gent:Input("SetTimer",self:GetOwner(),self:GetOwner(),gerFussTime) end
			local phys = gent:GetPhysicsObject()
			if IsValid(phys) then
				phys:Wake()
				phys:AddAngleVelocity(Vector(math.Rand(500,500),math.Rand(500,500),math.Rand(500,500)))
				phys:SetVelocity(getThrowVel)
			end
			self:CustomOnGrenadeAttack_OnThrow(gent)
		end
		self.ThrowingGrenade = false
	end)
end






function ENT:SelectSchedule()
	if self.VJ_IsBeingControlled == true then return end
	self:CustomOnSchedule()
	if self.DisableSelectSchedule == true or self.Dead == true then return end
	
	if !IsValid(self:GetEnemy()) then -- Idle Behavior --
		if self.ThrowingGrenade == false then
			self:DoIdleAnimation()
		end
		if self.Alerted == false then
			self.TakingCoverT = 0
		end
		self:IdleSoundCode()
		self.NoWeapon_UseScaredBehavior_Active = false
	else -- Combat Behavior --
		local wep = self:GetActiveWeapon()
		local ene = self:GetEnemy()
		local enedist = ene:GetPos():Distance(self:GetPos())
		
		if enedist < self.SightDistance then -- If the enemy is in sight then continue
			self:IdleSoundCode()
			
			-- Scared behavior system
			if !IsValid(wep) && self.NoWeapon_UseScaredBehavior == true && CurTime() > self.NextChaseTime then
				self.NoWeapon_UseScaredBehavior_Active = true -- Tells the idle system to use the scared behavior animation
				if self.FollowingPlayer == false then
					if self:Visible(ene) then
						self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
						return
					else
						self:DoIdleAnimation(2)
					end
				end
			else -- Not scared, return back to normal
				self.NoWeapon_UseScaredBehavior_Active = false
			end
			
			local enepos_eye = ene:EyePos()
			local enedist_eye = self:EyePos():Distance(enepos_eye)
			local dontshoot = false
			
			-- Back away from the enemy if it's to close
			if self.HasWeaponBackAway == true && (IsValid(wep) && (!wep.IsMeleeWeapon)) && enedist <= self.WeaponBackAway_Distance && CurTime() > self.TakingCoverT && CurTime() > self.NextChaseTime && self.MeleeAttacking == false && self.FollowingPlayer == false && self.ThrowingGrenade == false && self.VJ_PlayingSequence == false && self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos()+self:OBBCenter()),enepos_eye) == false then
				local checkdist = self:VJ_CheckAllFourSides(200)
				local randmove = {}
				if checkdist.Backward == true then randmove[#randmove+1] = "Backward" end
				if checkdist.Right == true then randmove[#randmove+1] = "Right" end
				if checkdist.Left == true then randmove[#randmove+1] = "Left" end
				local pickmove = VJ_PICK(randmove)
				if pickmove == "Backward" then self:SetLastPosition(self:GetPos() + self:GetForward()*math.random(-200,-200)) end
				if pickmove == "Right" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(200,200)) end
				if pickmove == "Left" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(-200,-200)) end
				if pickmove == "Backward" or pickmove == "Right" or pickmove == "Left" then
					self.IsReloadingWeapon = false
					self.TakingCoverT = CurTime() + 2
					dontshoot = true
					self:VJ_TASK_GOTO_LASTPOS("TASK_RUN_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
				end
			end
			
			if dontshoot == false && self:IsAbleToShootWeapon(false, false, enedist_eye) == true then
				if enedist_eye > self.Weapon_FiringDistanceFar or CurTime() < self.NextWeaponAttackT then -- Enemy to far away or not allowed to fire a weapon
					self:DoChaseAnimation()
					self.AllowToDo_WaitForEnemyToComeOut = false
				elseif self:IsAbleToShootWeapon(true, true, enedist_eye) == true then -- Check if enemy is in sight, then continue...
					//self:VJ_ForwardIsHidingZone(self:EyePos(), enepos_eye, true, {SpawnTestCube=true})
					-- If I can't see the enemy then either wait for it or charge at the enemy
					if self:VJ_ForwardIsHidingZone(self:EyePos(), enepos_eye, true) == true && self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() + self:OBBCenter()) + self:GetUp()*30, enepos_eye + self:GetUp()*30, true) /*or self:VJ_ForwardIsHidingZone(util.VJ_GetWeaponPos(self),enepos_eye) == true*/ /*or (!self:Visible(ene))*/ then -- Chase enemy or wait for enemy if hiding
						if self.WaitForEnemyToComeOut == true && (!wep.IsMeleeWeapon) && self.AllowToDo_WaitForEnemyToComeOut == true && self.IsReloadingWeapon == false && self.Weapon_TimeSinceLastShot <= 5 && self.WaitingForEnemyToComeOut == false && (enedist_eye < self.Weapon_FiringDistanceFar) && (enedist_eye > self.WaitForEnemyToComeOutDistance) then
						-- Wait for the enemy to come out
							self.WaitingForEnemyToComeOut = true
							if self.HasLostWeaponSightAnimation == true then
								self:VJ_ACT_PLAYACTIVITY(self.AnimTbl_LostWeaponSight, false, 0, true)
							end
							self.NextChaseTime = CurTime() + math.Rand(self.WaitForEnemyToComeOutTime.a, self.WaitForEnemyToComeOutTime.b)
						elseif self.DisableChasingEnemy == false && self.IsReloadingWeapon == false && CurTime() > self.LastHiddenZoneT then
						-- Go after the enemy!
							self.DoingWeaponAttack = false
							self.DoingWeaponAttack_Standing = false
							self:DoChaseAnimation()
						end
					else -- I can see the enemy...
						self.AllowToDo_WaitForEnemyToComeOut = true
						if (wep.IsVJBaseWeapon) then -- VJ Base weapons
							self:FaceCertainEntity(ene,true)
							local dontattack = false
							// self:DoChaseAnimation()
							-- if covered, try to move forward by calculating the distance between the prop and the NPC
							local covered_npc, covertr = self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() + self:OBBCenter()), enepos_eye, false, {SetLastHiddenTime=true})
							local covered_wep, guncovertr = self:VJ_ForwardIsHidingZone(wep:GetNWVector("VJ_CurBulletPos"), enepos_eye, false)
							//print("Is covered? ",covered_npc)
							//print("Is gun covered? ",covered_wep)
							local covered_isobj = true
							if covered_npc == false or (IsValid(covertr.Entity) && (covertr.Entity:IsNPC() or covertr.Entity:IsPlayer())) then
								covered_isobj = false
							end
							if !wep.IsMeleeWeapon then
								-- If ally in line of fire, then move
								if covered_isobj == false && self.DoingWeaponAttack_Standing == true && CurTime() > self.TakingCoverT && IsValid(guncovertr.Entity) && guncovertr.Entity:IsNPC() && guncovertr.Entity != self && (self:Disposition(guncovertr.Entity) == D_LI or self:Disposition(guncovertr.Entity) == D_NU) && guncovertr.HitPos:Distance(guncovertr.StartPos) <= 3000 then
									local checkdist = self:VJ_CheckAllFourSides(40)
									local randmove = {}
									if checkdist.Right == true then randmove[#randmove+1] = "Right" end
									if checkdist.Left == true then randmove[#randmove+1] = "Left" end
									local pickmove = VJ_PICK(randmove)
									if pickmove == "Right" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(30,40)) end
									if pickmove == "Left" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(-40,-30)) end
									if pickmove == "Right" or pickmove == "Left" then
										self:StopMoving()
										self.NextChaseTime = CurTime() + 1
										self:VJ_TASK_GOTO_LASTPOS("TASK_WALK_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
									end
								end
								
								-- If the NPC is behind cover...
								if covered_npc == true then
									self.WeaponUseEnemyEyePos = true -- Make the bullet direction go towards the head of the enemy
									if CurTime() < self.TakingCoverT then dontattack = true end -- Behind cover and is taking cover, don't fire!
									
									if dontattack == false && CurTime() > self.NextMoveOnGunCoveredT && ((covertr.HitPos:Distance(self:GetPos()) > 150 && covered_isobj == true) or (covered_wep == true && !guncovertr.Entity:IsNPC() && !guncovertr.Entity:IsPlayer())) then
										local calc;
										local enepos;
										if IsValid(covertr.Entity) then
											calc = self:VJ_GetNearestPointToEntity(covertr.Entity, true)
											enepos = calc.EnemyPosition - self:GetForward()*15
										else
											calc = self:VJ_GetNearestPointToVector(covertr.HitPos, true)
											enepos = calc.PointPosition - self:GetForward()*15
										end
										if calc.MyPosition:Distance(enepos) <= 1000 then
											self:SetLastPosition(enepos)
											//VJ_CreateTestObject(enepos, self:GetAngles(), Color(0,255,255))
											local vsched = ai_vj_schedule.New("vj_goto_cover")
											vsched:EngTask("TASK_GET_PATH_TO_LASTPOSITION", 0)
											vsched:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
											vsched.IsMovingTask = true
											vsched.ConstantlyFaceEnemy = true
											vsched.StopScheduleIfNotMoving_Any = true
											local coveranim = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_MoveToCover))
											if VJ_AnimationExists(self, coveranim) == true then
												self:SetMovementActivity(coveranim)
											else
												vsched.CanShootWhenMoving = true
												vsched.IsMovingTask_Run = true
											end
											self:StartSchedule(vsched)
											//self:VJ_TASK_GOTO_LASTPOS("TASK_WALK_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
										end
										self.NextMoveOnGunCoveredT = CurTime() + 2
									end
								else -- NPC not covered
									self.WeaponUseEnemyEyePos = false -- Make the bullet direction go towards the center of the enemy rather then its head
								end
							end
							
							if dontattack == false && CurTime() > self.NextWeaponAttackT /*&& self.DoingWeaponAttack == false*/ then
								if (wep.IsMeleeWeapon) then -- Melee Only
									self:CustomOnWeaponAttack()
									local resultanim = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_WeaponAttack))
									if CurTime() > self.NextMeleeWeaponAttackT && VJ_AnimationExists(self, resultanim) == true /*&& VJ_IsCurrentAnimation(self, resultanim) == false*/ then
										local animlength = VJ_GetSequenceDuration(self, resultanim)
										wep.NPC_NextPrimaryFire = animlength -- Make melee weapons dynamically change the next primary fire
										VJ_EmitSound(self, wep.NPC_BeforeFireSound, wep.NPC_BeforeFireSoundLevel, math.Rand(wep.NPC_BeforeFireSoundPitch.a, wep.NPC_BeforeFireSoundPitch.b))
										self.NextMeleeWeaponAttackT = CurTime() + animlength
										self.CurrentWeaponAnimation = resultanim
										self:VJ_ACT_PLAYACTIVITY(resultanim, true, false, !self.Berserked)
									end
								else -- Regular weapons
									-- If the current animation is already a firing animation, then imply just tell the base It's already firing and don't restart the animation
									if VJ_IsCurrentAnimation(self, self:TranslateToWeaponAnim(self.CurrentWeaponAnimation)) == true then
										self.DoingWeaponAttack = true
										self.DoingWeaponAttack_Standing = true
									-- If the current activity isn't the last weapon animation and it's not a transition, then continue
									elseif self:GetActivity() != self.CurrentWeaponAnimation && self:GetActivity() != ACT_TRANSITION then
										self:CustomOnWeaponAttack()
										self.WaitingForEnemyToComeOut = false
										self.Weapon_TimeSinceLastShot = 0
										//self.NextMoveRandomlyWhenShootingT = CurTime() + 2
										local resultanim;
										local anim_crouch = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_WeaponAttackCrouch))
										if self.CanCrouchOnWeaponAttack == true && covered_npc == false && covered_wep == false && enedist_eye > 500 && VJ_AnimationExists(self, anim_crouch) == true && ((math.random(1, self.CanCrouchOnWeaponAttackChance) == 1) or (CurTime() <= self.Weapon_DoingCrouchAttackT)) && self:VJ_ForwardIsHidingZone(wep:GetNWVector("VJ_CurBulletPos") + self:GetUp()*-18, enepos_eye, false) == false then
											resultanim = anim_crouch
											self.Weapon_DoingCrouchAttackT = CurTime() + 2 -- Asiga bedke vor vestah elank yed votgi cheler hemen
										else -- Not crouching
											resultanim = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_WeaponAttack))
										end
										if VJ_AnimationExists(self, resultanim) == true && VJ_IsCurrentAnimation(self, resultanim) == false then
											VJ_EmitSound(self, wep.NPC_BeforeFireSound, wep.NPC_BeforeFireSoundLevel, math.Rand(wep.NPC_BeforeFireSoundPitch.a, wep.NPC_BeforeFireSoundPitch.b))
											self.CurrentWeaponAnimation = resultanim
											self:VJ_ACT_PLAYACTIVITY(resultanim, false, 0, true)
											self.DoingWeaponAttack = true
											self.DoingWeaponAttack_Standing = true
										end
									end
								end
							end
							-- Move randomly when shooting
							if covered_npc == false && self.IsGuard != true && self.FollowingPlayer == false && self.MoveRandomlyWhenShooting == true && (!wep.IsMeleeWeapon) && (!wep.NPC_StandingOnly) && self.DoingWeaponAttack == true && self.DoingWeaponAttack_Standing == true && CurTime() > self.NextMoveRandomlyWhenShootingT && (CurTime() - self.TimeSinceEnemyAcquired) > 2 && (enedist_eye < (self.Weapon_FiringDistanceFar / 1.25)) && self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() +self:OBBCenter()),enepos_eye) == false && self:CustomOnMoveRandomlyWhenShooting() != false then
								local randpos = math.random(150,400)
								local checkdist = self:VJ_CheckAllFourSides(randpos)
								local randmove = {}
								if checkdist.Backward == true then randmove[#randmove+1] = "Backward" end
								if checkdist.Right == true then randmove[#randmove+1] = "Right" end
								if checkdist.Left == true then randmove[#randmove+1] = "Left"end
								local pickmove = VJ_PICK(randmove)
								if pickmove == "Backward" then self:SetLastPosition(self:GetPos() + self:GetForward()*-randpos) end
								if pickmove == "Right" then self:SetLastPosition(self:GetPos() + self:GetRight()*randpos) end
								if pickmove == "Left" then self:SetLastPosition(self:GetPos() + self:GetRight()*-randpos) end
								if pickmove == "Backward" or pickmove == "Right" or pickmove == "Left" then
									self:StopMoving()
									self:VJ_TASK_GOTO_LASTPOS(VJ_PICK({"TASK_RUN_PATH","TASK_WALK_PATH"}),function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
								end
								self.NextMoveRandomlyWhenShootingT = CurTime() + math.Rand(self.NextMoveRandomlyWhenShootingTime1,self.NextMoveRandomlyWhenShootingTime2)
							end
						else -- None VJ Base weapons
							self:FaceCertainEntity(ene, true)
							self.WaitingForEnemyToComeOut = false
							self.DoingWeaponAttack = true
							self.DoingWeaponAttack_Standing = true
							self:CustomOnWeaponAttack()
							self.Weapon_TimeSinceLastShot = 0
							//wep:SetClip1(99999)
							self:VJ_SetSchedule(SCHED_RANGE_ATTACK1)
						end
					end
				end
			end
		elseif IsValid(ene) then
			self:ResetEnemy(false)
		end
		self.LatestEnemyDistance = ene:GetPos():Distance(self:GetPos())
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/