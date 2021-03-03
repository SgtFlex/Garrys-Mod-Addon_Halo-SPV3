AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_hunter_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
	-- Range Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.RangeDistance = 2000
ENT.AnimTbl_RangeAttack = {""} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_spv3_shade_cannon" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = 0 -- How much time until the projectile code is ran?
ENT.NextAnyAttackTime_Range = 0 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime = 0 -- How much time until it can use a range attack?
ENT.NextAnyAttackTime_Range = 4
ENT.NextRangeAttackTime_DoRand = 5 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "cannon_1" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.RangeAttackExtraTimers = {0.35, 0.7, 1.05, 1.4} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.RangeAttackAngleRadius = 40 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.lights = {
	Light1 = {Object = "", Attachment = "Head_Light1", Color = "160 0 160", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light2 = {Object = "", Attachment = "Head_Light2", Color = "160 0 160", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light3 = {Object = "", Attachment = "Head_Light3", Color = "160 0 160", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light4 = {Object = "", Attachment = "Head_Light4", Color = "160 0 160", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light5 = {Object = "", Attachment = "Arm_Light1", Color = "160 0 160", Scale = 0.3, Offset = Vector(0, 0, 0)},
	Light6 = {Object = "", Attachment = "Arm_Light2", Color = "160 0 160", Scale = 0.3, Offset = Vector(0, 0, 0)},
	Light7 = {Object = "", Attachment = "Arm_Light3", Color = "160 0 160", Scale = 0.3, Offset = Vector(0, 0, 0)},
	Light8 = {Object = "", Attachment = "Arm_Light4", Color = "160 0 160", Scale = 0.3, Offset = Vector(0, 0, 0)},
}
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SpawnLights()
	self:SetColor(Color(36,36,36))
	self:SetBodygroup(2, 0)
	self:SetBodygroup(3, 2)
	self:SetSkin(1)
	self:SetCollisionBounds(Vector(45, 45, 115), Vector(-45, -45, 0))
end

---------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()-self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos):GetNormal()*2000
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_BeforeProjectileSpawn(TheProjectile) 
	self:EmitSound("weapons/shadeturret/turret_shade.ogg", 105)
	TheProjectile:SetOwner(self)
	ParticleEffectAttach("hcea_hunter_shade_cannon_trigger_muzzle", PATTACH_POINT_FOLLOW, self, 1)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/