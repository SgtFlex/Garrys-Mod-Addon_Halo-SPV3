AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
ENT.Model = {"models/hce/spv3/flood/jackal/floodjackal.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 20
ENT.IsCarrier = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DisableBackBreak = true
ENT.DisableForceDeath = true
	-- ====== Blood-Related Variables ====== --
ENT.BloodColor = "Yellow" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.HasBloodPool = false -- Does it have a blood pool?

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Death = {} -- Death Animations
ENT.DisableDeathAnimationSCHED = true -- If set to true, it will disable the setschedule code
ENT.HasItemDropsOnDeath = false
ENT.EntitiesToNoCollide = //Player no collide does affect how it behaves, even though the wiki states it doesn't
{
	"npc_vj_halo_flood_spv3_infection",
}
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 20
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.TimeUntilMeleeAttackDamage = 0.6 -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttack_NoProps = true -- If set to true, it won't attack or push any props (Mostly used with multiple melee attacks)
ENT.MeleeAttackDamage = 25
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackExtraTimers = {}
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 1.7
ENT.MeleeAttackDamageType = DMG_SLASH

ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {ACT_JUMP} -- Melee Attack Animations
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.canFlinch = 0
ENT.NextLeapAttackTime = 0 -- How much time until it can use a leap attack?
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {
"infected_jackal/idle/idle 1.ogg",
"infected_jackal/idle/idle 2.ogg",
"infected_jackal/idle/idle 3.ogg",
}
ENT.IdleSoundChance = 5
ENT.SoundTbl_Impact = {
"infested_shared/hit/floodflesh_hit_small1.ogg",
"infested_shared/hit/floodflesh_hit_small2.ogg",
"infested_shared/hit/floodflesh_hit_small3.ogg",
"infested_shared/hit/floodflesh_hit_small4.ogg",
"infested_shared/hit/floodflesh_hit_small5.ogg",
"infested_shared/hit/floodflesh_hit_small6.ogg",
"infested_shared/hit/floodflesh_hit_small7.ogg",
"infested_shared/hit/floodflesh_hit_small8.ogg",
"infested_shared/hit/floodflesh_hit_small9.ogg",
"infested_shared/hit/floodflesh_hit_small10.ogg",
"infested_shared/hit/floodflesh_hit_small11.ogg"
}
ENT.SoundTbl_Alert = {
	"infected_jackal/spot/spot enemy 1.ogg",
	"infected_jackal/spot/spot enemy 2.ogg",
	"infected_jackal/spot/spot enemy 3.ogg",
}
ENT.SoundTbl_Pain = {
	"infected_jackal/ping_soft/hurt 1.ogg",
	"infected_jackal/ping_soft/hurt 2.ogg",
	"infected_jackal/ping_soft/hurt 3.ogg",
	"infected_jackal/ping_soft/hurt 4.ogg",
}
ENT.SoundTbl_OnKilledEnemy = 
{
	"infected_jackal/celebrate/killed player 1.ogg",
	"infected_jackal/celebrate/killed player 2.ogg",
}
ENT.SoundTbl_MeleeAttack = {
	"infected_jackal/melee/attack 1.ogg",
	"infected_jackal/melee/attack 2.ogg",
	"infected_jackal/melee/attack 3.ogg",
	"infected_jackal/melee/attack 4.ogg",
}
ENT.SoundTbl_Death = {
	"infected_jackal/ping_hard/death 1.ogg",
	"infected_jackal/ping_hard/death 2.ogg",
	"infected_jackal/ping_hard/death 3.ogg",
	"infected_jackal/ping_hard/death 4.ogg",
}

ENT.SoundTbl_LeapAttackJump = {
	"infected_jackal/leap/leap attack 1.ogg",
	"infected_jackal/leap/leap attack 2.ogg",
}
ENT.SoundTbl_Expl = {
	"infected_jackal/explode/mutilation_1.ogg",
	"infected_jackal/explode/mutilation_2.ogg",
	"infected_jackal/explode/mutilation_3.ogg",
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SpawnedFromInf=false
ENT.RemovableParts = {
	Special = {Health = 15, Bodygroup = "Head", Execute = function(entity, dmginfo) --Untargetable, but we can utilize this for on death to create gibs
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_leg.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_leg.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_arm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_arm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end},
}
ENT.CustomCollision = {Min = Vector(-16,-16,0), Max = Vector(16,16,25)}
ENT.otherInit = function(entity)
	entity:SetAngles(entity:GetAngles() + Angle(0, 180, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".ogg", 70, 100, 1)
	elseif key == "Pain" then
		self:EmitSound((self.SoundTbl_Pain[math.random(1, #(self.SoundTbl_Pain))]))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/