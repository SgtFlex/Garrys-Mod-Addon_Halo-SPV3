AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
ENT.Model = {"models/hce/spv3/nature/blindwolf/blindwolf.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.StartHealth = 100
ENT.Appearance = {
	Color = Color(255,255, 255),
	Bodygroups = {1, 1},
	Skin = 0,
}
ENT.IsCarrier = true
ENT.DisableBackBreak = true
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_Front", "Die_Left", "Die_Right"} -- Death Animations
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
ENT.EntitiesToNoCollide = //Player no collide does affect how it behaves, even though the wiki states it doesn't
{
	"npc_vj_halo_flood_spv3_infection",
}
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {"Melee_1", "Melee_2"}
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 1.2
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?

ENT.HasPoseParameterLooking = false -- Does it look at its enemy using poseparameters?
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.GrenadeWeps = {}
ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {ACT_JUMP} -- Melee Attack Animations
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.NextLeapAttackTime = 2.5 -- How much time until it can use a leap attack?
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.RangeAttackEntityToSpawn = "obj_vj_spv3_floodwolf_shot" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = .15 -- How much time until the projectile code is ran?
ENT.RangeAttackReps = 10
ENT.NextAnyAttackTime_Range = 3
ENT.NextRangeAttackTime = 0
ENT.NextRangeAttackTime_DoRand = 4 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RemovableParts = {
	[501] = {Health = GetConVar("vj_spv3_precisionThreshold"):GetInt()*3, Bodygroup = "Weapon", Execute = function(entity, dmginfo) 
		local pos, ang = entity:GetBonePosition(26)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/wolf/floodWolf_weapon.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:RemoveAllDecals()
		entity.HasRangeAttack = false
		entity.NoChaseAfterCertainRange = false
		entity:SetHitboxSet("default")
	end},
}


ENT.otherInit = function(entity)
	entity:SetHitboxSet("weaponized")
end

function ENT:RangeAttackCode_OverrideProjectilePos(TheProjectile) -- return other value then 0 to override the projectile's position
	return self:GetPos() + Vector(0,0,50) + self:GetRight()*math.random(-10,10) + self:GetUp()*math.random(-10,10)
end

function ENT:CustomRangeAttackCode_BeforeProjectileSpawn(TheProjectile) 
	self:EmitSound("infested_wolf/fireGun/fireGun.ogg")
end -- This is ran before Spawn() is called

ENT.SoundTbl_Idle = {
"infested_wolf/idle/idle (1).ogg",
"infested_wolf/idle/idle (2).ogg",
"infested_wolf/idle/idle (3).ogg",
"infested_wolf/idle/idle (4).ogg",
"infested_wolf/idle/idle (5).ogg",
"infested_wolf/idle/idle (6).ogg",
}

ENT.SoundTbl_Alert = {
	"infested_wolf/spot/spot (1).ogg",
	"infested_wolf/spot/spot (2).ogg",
	"infested_wolf/spot/spot (3).ogg",
	"infested_wolf/spot/spot (4).ogg",
	"infested_wolf/spot/spot (5).ogg",
}

ENT.SoundTbl_OnKilledEnemy = {
	"infested_wolf/celebrate/celebrate (1).ogg",
	"infested_wolf/celebrate/celebrate (2).ogg",
}

ENT.SoundTbl_CombatIdle = ENT.SoundTbl_Idle

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".ogg", 70, 100, 1)
	end
end