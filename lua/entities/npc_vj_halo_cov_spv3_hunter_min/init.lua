AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/hunter/hunter.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 35
ENT.HullType = HULL_LARGE
---------------------------------------------------------------------------------------------------------------------------------------------
-- Custom
ENT.HUNTER_BlockWalking = false
ENT.NextBlockWalkingT = 0

	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Orange" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 80
ENT.AnimTbl_MeleeAttack = {"Melee_1"}
ENT.MeleeAttackAngleRadius = 40 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 110
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextAnyAttackTime_Melee = 1.9666666197777
ENT.MeleeAttackAnimationFaceEnemy = false
ENT.MeleeAttackDamage = 30 * GetConVarNumber("vj_spv3_damagemodifier")
ENT.MeleeAttackDamageType = DMG_SLASH	

	-- Range Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.RangeDistance = 2000
ENT.AnimTbl_RangeAttack = {""} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_spv3_beam_proj" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = 0.8 -- How much time until the projectile code is ran?
ENT.NextAnyAttackTime_Range = 0 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime = 3 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = 5 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "cannon_1" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.RangeAttackExtraTimers = {0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.RangeAttackAngleRadius = 40 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer()
	ParticleEffectAttach("hcea_hunter_ab_charge",PATTACH_POINT_FOLLOW,self,1)
	timer.Simple(0.8,function() if self:IsValid() then 
		self:EmitSound("hunter/hunter_cannon/hunter_cannon_loop/hunter_cannon/in.wav", 80, 100, 1) 
		end 
	end)
	self:EmitSound("hunter/hunter_cannon/hunter_charge.wav", 80, 100, 1)
	timer.Simple(1.8,function() if self:IsValid() then 
		self:StopParticles() 
		self:EmitSound("hunter/hunter_cannon/hunter_cannon_loop/hunter_cannon/out.wav", 80, 100, 1) 
		end 
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(TheProjectile)
	ParticleEffectAttach("hcea_hunter_ab_muzzle",PATTACH_POINT_FOLLOW,self,1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self:GetEnemy() != nil && self.VJ_IsBeingControlled == false then	
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 300 && self.VJ_IsBeingControlled == false then
			self.HUNTER_BlockWalking = true
			//self.ConstantlyFaceEnemy = false
			self.FootStepSoundLevel = 60
			self.AnimTbl_IdleStand = {ACT_IDLE}
		else
			self.HUNTER_BlockWalking = false
			//self.ConstantlyFaceEnemy = true
			self.FootStepSoundLevel = 70
			self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
		end
	end
	
	if self.VJ_IsBeingControlled == true then
		self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetColor(Color(63,79,127))
	self:SetBodygroup(2, 1)
	self:SetBodygroup(3, 0)
	self:SetSkin(2)
	self:SetCollisionBounds(Vector(45, 45, 115), Vector(-45, -45, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:SetMaxDamage(10)
		dmginfo:SetDamage(10)
		dmginfo:SetDamageBonus(0)
	elseif (hitgroup != 4) then
		dmginfo:ScaleDamage(0)
		self:EmitSound("hunter/hard_metal_thick_cov_hunter/hard_metal_thick_cov_hunter"..math.random(1,4)..".wav", 80, 100, 1)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Alert = {
"hunter/seefoe/warn1.wav",
"hunter/seefoe/warn2.wav",
"hunter/seefoe/warn3.wav",
"hunter/seefoe/warn4.wav",
"hunter/seefoe/warn5.wav",
"hunter/seefoe/warn6.wav",
"hunter/seefoe/warn7.wav",
"hunter/seefoe/warn8.wav",
"hunter/seefoe/warn9.wav"
}

ENT.SoundTbl_MeleeAttack = {
"hunter/hunter_melee_hits/hunter_melee_hit1.wav",
"hunter/hunter_melee_hits/hunter_melee_hit2.wav",
"hunter/hunter_melee_hits/hunter_melee_hit3.wav",
"hunter/hunter_melee_hits/hunter_melee_hit4.wav",
"hunter/hunter_melee_hits/hunter_melee_hit5.wav",
"hunter/hunter_melee_hits/hunter_melee_hit6.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()-self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos):GetNormal()*1500
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("hunter/run/walk"..math.random(1,6)..".wav", 80, 90, 1)
	
	elseif key == "Melee1" then
		self:EmitSound("hunter/unarmed_melee/hunter_shield_swing_"..math.random(1,3)..".wav", 80, 100, 1)
		self:EmitSound("hunter/melee/melee"..math.random(5,28)..".wav", 80, 100, 1)
		
	elseif key == "Hit" then
		self:MeleeAttackCode()
	
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/