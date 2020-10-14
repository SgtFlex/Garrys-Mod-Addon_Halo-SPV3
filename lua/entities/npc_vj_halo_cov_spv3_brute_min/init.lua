AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/brute/Brute.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(100,120,180)
ENT.bodyGroupTable = {
	1,
	1,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
}
ENT.StartHealth = 160
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldHealth = 0
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.ExtraShotCount = 0
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?

ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_WeaponReload = {ACT_RELOAD} -- Animations that play when the SNPC reloads
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_PISTOL} -- Animation played when the SNPC does weapon attack
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {} -- Death Animations
ENT.AnimTbl_CallForHelp = {"Warn"} -- Call For Help Animations
ENT.HasLostWeaponSightAnimation = true -- Set to true if you would like the SNPC to play a different animation when it has lost sight of the enemy and can't fire at it
ENT.AnimTbl_LostWeaponSight = {} -- The animations that it will play if the variable above is set to true
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDamage = 70
ENT.DisableMeleeAttackAnimation = false -- if true, it will disable the animation code
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the melee attack animation?
ENT.MeleeAttackDistance = 80 -- How close does it have to be until it attacks?
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 120 -- How far does the damage go?
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.TimeUntilMeleeAttackDamage = 0.8 -- This counted in seconds | This calculates the time until it hits something
ENT.NextAnyAttackTime_Melee = 1.3333333333333 -- How much time until it can use any attack again? | Counted in Seconds
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN_PISTOL} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_PISTOL} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_Run = {ACT_RUN_PISTOL}
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.ExtraShotCount = 0
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades
ENT.GrenadeAttackThrowDistanceClose = 250 -- How close until it stops throwing grenades
ENT.GrenadeAttackEntity = "obj_vj_cov_spv3_needler_nade" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeTypes = {
	"obj_vj_cov_spv3_gravity_nade",
	"obj_vj_cov_spv3_plasma_nade",
	"obj_vj_cov_spv3_cluster_nade",
	"obj_vj_unsc_spv3_frag_nade",
	"obj_vj_cov_spv3_needler_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
	"weapon_vj_unsc_spv3_frag_nade",
}
ENT.GrenadeAttackModel = nil -- The model for the grenade entity
ENT.TimeUntilGrenadeIsReleased = 1 -- Time until the grenade is released
	-- ====== Animation Variables ====== --
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.HasWeaponBackAway = false -- Should the SNPC back away if the enemy is close?
ENT.NoWeapon_UseScaredBehavior = false -- Should it use the scared behavior when it sees an enemy and doesn't have a weapon?
ENT.CanThrowBackDetectedGrenades = false-- Should it try to pick up the detected grenade and throw it back to the enemy?
ENT.MaxJumpLegalDistance = VJ_Set(400,550) -- The max distance the NPC can jump (Usually from one node to another) | ( UP, DOWN )
ENT.UseTheSameGeneralSoundPitch = false
ENT.BruteSelector = math.Rand(0,2)
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_ar",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
}
ENT.CanFlinch = 1
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true}

function ENT:CustomOnInitialize()
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.UNSCWeps))
		end
		if (self:GetActiveWeapon().HoldType=="ar2") then
			self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
			self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
			self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
			self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
			self.AnimTbl_Run = {ACT_RUN_RIFLE}

		end
	end)
	
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
	self.ShieldActivated = false
	self:SetHealth(self.ShieldHealth + self.StartHealth)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	-- Shields --
	if self.ShieldActivated == true then
		self.Bleeds = false
	else
		self.Bleeds = true
	end
	
	-- Dodging --
	if self:GetEnemy() != nil then
		local attackthev = ents.FindInSphere(self:GetPos(),500)
		for _,v in pairs(attackthev) do
			local EnemyDistance = self:GetPos():Distance(v:GetPos())
			if EnemyDistance < 500 && math.random(1,10) == 1 && CurTime() > self.NextMoveTime && self:CanDodge("normal") then -- Random movement
				local Evade = self:VJ_CheckAllFourSides(500)
				self:StopAttacks(true)
				if Evade.Right == false then
					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_RIGHT,true,1,false) -- Left dodge anim
					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
				
				elseif Evade.Left == false then
					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_LEFT,true,1,false) -- Right dodge anim	
					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
					
				elseif Evade.Forward == false then
					local rnd_dodge = math.random(1,2)
					if rnd_dodge == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_FORWARD,true,1,false) -- Left dodge anim
						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)	
					elseif rnd_dodge == 2 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_FORWARD,true,1,false) -- Left dodge anim
						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)						
					end
				
				elseif Evade.Backward == false then
				end
				self.NextMoveTime = CurTime() +math.random(4,7)
			elseif EnemyDistance < 500 && math.random(1,30) == 1 && CurTime() > self.NextDodgeTime && self:CanDodge("player") then -- Dodge attack
				local Evade = self:VJ_CheckAllFourSides(500)
				self:StopAttacks(true)
				if Evade.Right == false then
					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_RIGHT,true,1,false) -- Left dodge anim
					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
					
				elseif Evade.Left == false then
					self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_LEFT,true,1,false) -- Right dodge anim	
					timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
					timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)
					
				elseif Evade.Forward == false then
				local rnd_dodge = math.random(1,2)
					if rnd_dodge == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_FORWARD,true,1,false) -- Left dodge anim
						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)	
					elseif rnd_dodge == 2 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_FORWARD,true,1,false) -- Left dodge anim
						timer.Simple(0.3,function() if self:IsValid() then self.ConstantlyFaceEnemy = true end end)
						timer.Simple(1,function() if self:IsValid() then self.ConstantlyFaceEnemy = false end end)						
					end
				end
				self.NextDodgeTime = CurTime() +math.random(2,4.5)
			end
		end
	end
	
	-- -- Detection --
	-- if self:GetEnemy() != nil then
	-- self.AnimTbl_IdleStand = {ACT_IDLE}
	-- else
	-- self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AcceptableWeaponsTbl = {"gmod_camera","gmod_tool","weapon_physgun","weapon_physcannon"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CanDodge(dodgetype)
	if dodgetype == "normal" then
		if self.UsingMagic == false && self.MeleeAttacking == false && self.onfire == false && self.Flinching == false && self:GetEnemy():IsNPC() && ((self:GetEnemy().MeleeAttacking && self:GetEnemy().MeleeAttacking == true) or (self:GetEnemy().cpt_atkAttacking && self:GetEnemy().cpt_atkAttacking == true)) then
			return true
		else
			return false
		end
	elseif dodgetype == "player" then
		if self.UsingMagic == false && self.MeleeAttacking == false && self:GetEnemy():IsPlayer() && self:GetEnemy():GetEyeTrace().Entity == self && self.onfire == false && self.Flinching == false && self:GetEnemy():IsPlayer() && self:GetEnemy():GetActiveWeapon() != nil && !table.HasValue(self.AcceptableWeaponsTbl,self:GetEnemy():GetActiveWeapon():GetClass()) && (self:GetEnemy():KeyPressed(IN_ATTACK) or self:GetEnemy():KeyPressed(IN_ATTACK2) or self:GetEnemy():KeyReleased(IN_ATTACK) or self:GetEnemy():KeyReleased(IN_ATTACK2) or self:GetEnemy():KeyDown(IN_ATTACK) or self:GetEnemy():KeyDown(IN_ATTACK2)) then
			return true
		else
			return false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindSeq(seq)
	return self:GetSequenceActivity(self:LookupSequence(seq))
end

ENT.SoundTbl_OnKilledEnemy = {
	"brute/killEnemy/killEnemy (1).wav",
	"brute/killEnemy/killEnemy (2).wav",
	"brute/killEnemy/killEnemy (3).wav",
	"brute/killEnemy/killEnemy (4).wav",
	"brute/killEnemy/killEnemy (5).wav",
	"brute/killEnemy/killEnemy (6).wav",
	"brute/killEnemy/killEnemy (7).wav",
	"brute/killEnemy/killEnemy (8).wav",
	"brute/killEnemy/killEnemy (9).wav",
	"brute/killEnemy/killEnemy (10).wav",
	"brute/killEnemy/killEnemy (11).wav",
	"brute/killEnemy/killEnemy (12).wav",
	"brute/killEnemy/killEnemy (13).wav",
}
ENT.SoundTbl_Alert = {
	"brute/sightPlayer/seefoe (1).wav",
	"brute/sightPlayer/seefoe (2).wav",
	"brute/sightPlayer/seefoe (3).wav",
	"brute/sightPlayer/seefoe (4).wav",
	"brute/sightPlayer/seefoe (5).wav",
	"brute/sightPlayer/seefoe (6).wav",
	"brute/sightPlayer/seefoe (7).wav",
	"brute/sightPlayer/seefoe (8).wav",
	"brute/sightPlayer/seefoe (9).wav",
	"brute/sightPlayer/seefoe (10).wav",
	"brute/sightPlayer/seefoe (11).wav",
	"brute/sightPlayer/seefoe (12).wav",
	"brute/sightPlayer/seefoe (13).wav",
}
ENT.SoundTbl_Pain = {
	"brute/pain/pain (1).wav",
	"brute/pain/pain (2).wav",
	"brute/pain/pain (3).wav",
	"brute/pain/pain (4).wav",
	"brute/pain/pain (5).wav",
}
ENT.SoundTbl_CallForHelp = {

}
ENT.SoundTbl_Death = {
	"brute/selfDeath/selfDeath (1).wav",
	"brute/selfDeath/selfDeath (2).wav",
	"brute/selfDeath/selfDeath (3).wav",
	"brute/selfDeath/selfDeath (4).wav",
	"brute/selfDeath/selfDeath (5).wav",
	"brute/selfDeath/selfDeath (6).wav",
	"brute/selfDeath/selfDeath (7).wav",
}
ENT.SoundTbl_OnGrenadeSight = {
	"brute/sightGrenade/sightGrenade (1).wav",
	"brute/sightGrenade/sightGrenade (2).wav",
	"brute/sightGrenade/sightGrenade (3).wav",
	"brute/sightGrenade/sightGrenade (4).wav",
	"brute/sightGrenade/sightGrenade (5).wav",
	"brute/sightGrenade/sightGrenade (6).wav",
	"brute/sightGrenade/sightGrenade (7).wav",
	"brute/sightGrenade/sightGrenade (8).wav",
	"brute/sightGrenade/sightGrenade (9).wav",
	"brute/sightGrenade/sightGrenade (10).wav",
	"brute/sightGrenade/sightGrenade (11).wav",
	"brute/sightGrenade/sightGrenade (12).wav",
	"brute/sightGrenade/sightGrenade (13).wav",
	"brute/sightGrenade/sightGrenade (14).wav",
	"brute/sightGrenade/sightGrenade (15).wav",
}
ENT.SoundTbl_GrenadeAttack = {
	"brute/throwGrenade/throwGrenade (1).wav",
	"brute/throwGrenade/throwGrenade (2).wav",
	"brute/throwGrenade/throwGrenade (3).wav",
	"brute/throwGrenade/throwGrenade (4).wav",
	"brute/throwGrenade/throwGrenade (5).wav",
	"brute/throwGrenade/throwGrenade (6).wav",
	"brute/throwGrenade/throwGrenade (7).wav",
	"brute/throwGrenade/throwGrenade (8).wav",
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"brute/meleeGrunt/melee (1).wav",
	"brute/meleeGrunt/melee (2).wav",
	"brute/meleeGrunt/melee (3).wav",
	"brute/meleeGrunt/melee (4).wav",
	"brute/meleeGrunt/melee (5).wav",
	"brute/meleeGrunt/melee (6).wav",
	"brute/meleeGrunt/melee (7).wav",
	"brute/meleeGrunt/melee (8).wav",
	"brute/meleeGrunt/melee (9).wav",
	"brute/meleeGrunt/melee (10).wav",
	"brute/meleeGrunt/melee (11).wav",
}
ENT.SoundTbl_LostEnemy = {
	"brute/lostEnemy/taunt (1).wav",
	"brute/lostEnemy/taunt (2).wav",
	"brute/lostEnemy/taunt (3).wav",
	"brute/lostEnemy/taunt (4).wav",
	"brute/lostEnemy/taunt (5).wav",
	"brute/lostEnemy/taunt (6).wav",
	"brute/lostEnemy/taunt (7).wav",
	"brute/lostEnemy/taunt (8).wav",
	"brute/lostEnemy/taunt (9).wav",
	"brute/lostEnemy/taunt (10).wav",
	"brute/lostEnemy/taunt (11).wav",
	"brute/lostEnemy/taunt (12).wav",
	"brute/lostEnemy/taunt (13).wav",
	"brute/lostEnemy/taunt (14).wav",
	"brute/lostEnemy/taunt (15).wav",
}
ENT.SoundTbl_Investigate = {
	"brute/investigate/investigate (1).wav",
	"brute/investigate/investigate (2).wav",
	"brute/investigate/investigate (3).wav",
	"brute/investigate/investigate (4).wav",
	"brute/investigate/investigate (5).wav",
	"brute/investigate/investigate (6).wav",
}
ENT.SoundTbl_OnReceiveOrder = {
	"brute/orderRe/orderRe (1).wav",
	"brute/orderRe/orderRe (2).wav",
	"brute/orderRe/orderRe (3).wav",
	"brute/orderRe/orderRe (4).wav",
	"brute/orderRe/orderRe (5).wav",
	"brute/orderRe/orderRe (6).wav",
}
ENT.SoundTbl_WeaponReload = {
	"brute/reload/reload (1).wav",
	"brute/reload/reload (2).wav",
	"brute/reload/reload (3).wav",
	"brute/reload/reload (4).wav",
	"brute/reload/reload (5).wav",

}
ENT.SoundTbl_AllyDeath = {
	"brute/allyDeath/allyDeath (1).wav",
	"brute/allyDeath/allyDeath (2).wav",
	"brute/allyDeath/allyDeath (3).wav",
	"brute/allyDeath/allyDeath (4).wav",
	"brute/allyDeath/allyDeath (5).wav",
	"brute/allyDeath/allyDeath (6).wav",
	"brute/allyDeath/allyDeath (7).wav",
}
ENT.SoundTbl_Berserk = {
	"brute/berserk/berserk (1).wav",
	"brute/berserk/berserk (2).wav",
	"brute/berserk/berserk (3).wav",
}
ENT.SoundTbl_Stuck = {
	"brute/stuck/stuck (1).wav",
	"brute/stuck/stuck (2).wav",
	"brute/stuck/stuck (3).wav",
	"brute/stuck/stuck (4).wav",
	"brute/stuck/stuck (5).wav",
	"brute/stuck/stuck (6).wav",
	"brute/stuck/stuck (7).wav",
	"brute/stuck/stuck (8).wav",
	"brute/stuck/stuck (9).wav",
	"brute/stuck/stuck (10).wav",
	"brute/stuck/stuck (11).wav",
	"brute/stuck/stuck (12).wav",
}
ENT.SoundTbl_Transform = {
	"brute/transform/transform (1).wav",
	"brute/transform/transform (2).wav",
	"brute/transform/transform (3).wav",
}

ENT.bodyParts = {
	Head = {Health = 35, Bodygroup = "Head", Removed = false},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("brute/footstep/footstep ("..math.random(1,2)..").ogg", 80, math.random(50,125), 0.5)
	elseif key == "Melee1" then
		self:EmitSound("elite/stand_pistol_melee/stand_pistol_melee"..math.random(1,2)..".wav", 80, 100, 1)
		self:EmitSound("elite/melee/melee"..math.random(1,12)..".wav", 80, 100, 1)
		
	elseif key == "Hit" then
		self:MeleeAttackCode()
	
	elseif key == "EvadeR" then
		self:EmitSound("elite/stand_pistol_evade_right/stand_pistol_evade_right.wav", 80, 100, 1)
		self:EmitSound("elite/dodge/dodge"..math.random(1,6)..".wav", 80, 100, 1)
	
	elseif key == "EvadeL" then
		self:EmitSound("elite/stand_pistol_evade_left/stand_pistol_evade_left.wav", 80, 100, 1)
		self:EmitSound("elite/dodge/dodge"..math.random(1,6)..".wav", 80, 100, 1)
	
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
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
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL_FORWARD, true, 2, false)
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

ENT.Berserked = false
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (self.bodyParts["Head"]["Removed"]==true and hitgroup==500) then
		dmginfo:ScaleDamage(3)
	end
end


function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup) 
	if (self:Health()<self:GetMaxHealth()*.4 and self.Berserked==false) then
		self:Berserk()
		
	end
	if (hitgroup==500 and self.bodyParts["Head"]["Removed"]==false) then
		self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Head"]["Health"] <= 0) then
			self.bodyParts["Head"]["Removed"]=true
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 0)
			self:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
		end
	end
end


ENT.HasStuck=false
function ENT:Berserk()
	self.BerserkSound = CreateSound(self, VJ_PICKRANDOMTABLE(self.SoundTbl_Berserk))
	if (self.Berserked==true or self.HasStuck==true) then return end
	self.BerserkSound:Play()
	self.Berserked=true
	self.MoveRandomlyWhenShooting = false
	self.AllowWeaponReloading = false -- If false, the SNPC will no longer reload
	self.WaitForEnemyToComeOut = false
	self.NoWeapon_UseScaredBehavior = false
	self:VJ_ACT_PLAYACTIVITY("Berserk", true, 2, false)
	timer.Simple(2, function() 
		if (IsValid(self)) then
		timer.Create("Berserk"..self:GetCreationID(), 0.5, 0, function ()
			if (IsValid(self) and (IsValid(self:GetEnemy()))) then
				self:SetTarget(self:GetEnemy())
				self:VJ_TASK_GOTO_TARGET(movetype, function(x)
					x.CanShootWhenMoving = true
					x.ConstantlyFaceEnemyVisible = (IsValid(self:GetActiveWeapon()) and true) or false
				end)
			end
		end)
		timer.Create("Scream"..self:GetCreationID(), 4.5, 0, function()
			if (self.HasStuck==false and (IsValid(self:GetEnemy()))) then
				self.BerserkSound:Stop()
				self.BerserkSound = CreateSound(self, VJ_PICKRANDOMTABLE(self.SoundTbl_Berserk))
				self.BerserkSound:Play()
			end
		end)
	end
	end)
end

function ENT:CustomOnPriorToKilled(dmginfo,hitgroup) 
	self.BerserkSound:Stop()
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