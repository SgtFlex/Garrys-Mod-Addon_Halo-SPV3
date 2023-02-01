AddCSLuaFile("shared.lua")
include('shared.lua')
include('bases/spv3_snpc_base/init.lua')/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM_TALL
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/unsc/pelican/pelicanturret.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 500
ENT.Appearance = {
	Color = Color(255,255,255),
	Bodygroups = {},
	Skin = 0,
}
ENT.DisableBackBreak = true
ENT.DisableForceDeath = true
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = false-- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_UNSC", "CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?

-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_spv3_shade_cannon" -- The entity that is spawned when range attacking
ENT.RangeAttackReps = 30 -- How many times does it run the projectile code?
ENT.NextRangeAttackTime = 0 -- How much time until it can use a range attack?
ENT.NextAnyAttackTime_Range = 5
ENT.TimeUntilRangeAttackProjectileRelease = 0.1 -- How much time until the projectile code is ran?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "muzzle" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackPos_Up = 0 -- Up/Down spawning position for range attack
ENT.RangeAttackPos_Forward = 0 -- Forward/Backward spawning position for range attack
ENT.RangeAttackPos_Right = 0 -- Right/Left spawning position for range attack
ENT.RangeDistance = 5000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 180 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeAttackSound = {
	"warthog/chain_fire (1).ogg",
	"warthog/chain_fire (2).ogg",
	"warthog/chain_fire (3).ogg",
	"warthog/chain_fire (4).ogg",
	"warthog/chain_fire (5).ogg",
	"warthog/chain_fire (6).ogg",
}
ENT.ConstantlyFaceEnemy = true
ENT.ConstantlyFaceEnemy_IfAttacking = true -- Should it face the enemy when attacking?
ENT.RangeAttackAnimationFaceEnemy = false
ENT.UnreachableByMelee = false
ENT.CustomCollision = {Min = Vector(-30,-30,10), Max = Vector(30,30,70)}
ENT.otherInit = function(entity)
	entity.eyeLight = ents.Create("env_sprite")
	entity.eyeLight:SetParent(entity,entity:LookupAttachment("Light"))
	entity.eyeLight:SetPos(entity:GetAttachment(entity:LookupAttachment("Light"))["Pos"])
	entity.eyeLight:SetKeyValue("rendermode", "9")
	entity.eyeLight:SetKeyValue("renderamt", "255")
	entity.eyeLight:SetKeyValue("model","blueflare1_noz.vmt")
	entity.eyeLight:SetKeyValue("GlowProxySize","3")
	entity.eyeLight:SetKeyValue("rendercolor",tostring("0 255 50"))
	entity.eyeLight:SetKeyValue("scale", "0.3")
	entity.eyeLight:Spawn()
	entity.eyeLight:Activate()
	timer.Simple(0.01, function() //Need a small delay or wont work
		if (!IsValid(entity:GetParent())) then
			local trace = util.TraceLine({
				start = entity:GetPos() + Vector(0,0,30),
				endpos = entity:GetPos() + entity:GetUp()*1000,
				filter = entity,
				ignoreworld = false,
			})
			if (trace.Hit) then
				entity:SetPos(trace.HitPos + Vector(0,0,-70))
			end
		end
	end)
end

function ENT:CustomOn_PoseParameterLookingCode(pitch,yaw,roll) 
	if (IsValid(self:GetEnemy())) then
		self:SetAngles(Angle(0, self:GetAimVector():Angle().y +15, 0))
	end
end

function ENT:CustomRangeAttackCode() 
	self:FireBullets({
		Damage = 5 * GetConVar("vj_spv3_DamageModifier"):GetFloat(),
		Dir = self:GetAimVector(),
		Src = self:GetPos(),
		Spread = Vector(0.03, 0.03, 0)
	})
	self:EmitSound(VJ_PICKRANDOMTABLE(self.RangeAttackSound), 90)
	ParticleEffectAttach("hcea_hunter_plasma_rifle_fire", PATTACH_POINT_FOLLOW, self, self:LookupAttachment("muzzle"))
end