AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/unsc/pelican/pelican_rocket_pod.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 1000
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = false-- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_UNSC", "CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.Behavior = VJ_BEHAVIOR_AGGRESSIVE
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_spv3_rp_shot" -- The entity that is spawned when range attacking
ENT.RangeAttackReps = 4 -- How many times does it run the projectile code?
ENT.TimeUntilRangeAttackProjectileRelease = 0.5 -- How much time until the projectile code is ran?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "muzzle" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackPos_Up = 0 -- Up/Down spawning position for range attack
ENT.RangeAttackPos_Forward = 0 -- Forward/Backward spawning position for range attack
ENT.RangeAttackPos_Right = 0 -- Right/Left spawning position for range attack
ENT.RangeDistance = 5000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 180 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.ConstantlyFaceEnemy = true
ENT.ConstantlyFaceEnemy_IfAttacking = true -- Should it face the enemy when attacking?
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeAttackSound = {
	"weapons/rocket launcher/fire/fire_1.wav",
	"weapons/rocket launcher/fire/fire_2.wav",
	"weapons/rocket launcher/fire/fire_3.wav"
}
function ENT:CustomRangeAttackCode_BeforeProjectileSpawn(TheProjectile) 
	self:EmitSound(VJ_PICK(self.RangeAttackSound), 105)
	TheProjectile:SetOwner(self)
	ParticleEffectAttach("hcea_hunter_plasma_rifle_fire", PATTACH_POINT_FOLLOW, self, 1)	
end -- This is ran before Spawn() is called

function ENT:CustomRangeAttackCode_AfterProjectileSpawn(TheProjectile) 
	TheProjectile:GetPhysicsObject():SetVelocity(Vector(self:GetAimVector().x*2500, self:GetAimVector().y*2500, 0)) 
	TheProjectile:SetAngles(TheProjectile:GetPhysicsObject():GetVelocity():Angle())
	if (IsValid(self:GetOwner())) then
		constraint.NoCollide(self:GetOwner(), TheProjectile, 0, 0)
	end
end


function ENT:CustomOnInitialize()
	self:SetCollisionBounds(self:GetModelBounds())

end

function ENT:RangeAttackCode_OverrideProjectilePos(TheProjectile) 
	return self:GetAttachment(self:LookupAttachment("muzzle"))["Pos"]
end -- return other value then 0 to override the projectile's position

function ENT:CustomOn_PoseParameterLookingCode(pitch,yaw,roll) 
	if (IsValid(self:GetEnemy())) then
		self:SetAngles(Angle(self:GetAngles().x, self:GetAimVector():Angle().y, self:GetAngles().z))
	end
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
end