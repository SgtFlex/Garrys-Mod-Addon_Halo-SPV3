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
ENT.Model = {"models/hce/spv3/flood/elite/floodelite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.CustomBlood_Decal = {"VJ_SPV3_Blood_Flood1"}
ENT.Appearance = {
	Color = Color(40,60,200),
	Bodygroups = {0, 1, 1, 1, 1, 0},
	Skin = 1,
}
ENT.Faction = "Flood"
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 75
ENT.DisableBackBreak = true
ENT.IsBomber = false
	-- ====== Blood-Related Variables ====== --
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.HasBloodPool = true -- Does it have a blood pool?

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"} -- Death Animations
ENT.EntitiesToNoCollide = //Player no collide does affect how it behaves, even though the wiki states it doesn't
{
	"npc_vj_halo_flood_spv3_infection",
}
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?

ENT.AnimTbl_MeleeAttack = {"Melee_1", "Melee_2"}
ENT.TimeUntilMeleeAttackDamage = 0.5
ENT.NextAnyAttackTime_Melee = 1.2
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?


ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
}
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {ACT_JUMP} -- Melee Attack Animations
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.canFlinch = 0
ENT.NextLeapAttackTime = 2.5 -- How much time until it can use a leap attack?
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {
"infested_shared/pstcmbt/idle1.ogg",
"infested_shared/pstcmbt/idle2.ogg",
"infested_shared/pstcmbt/idle3.ogg",
"infested_shared/pstcmbt/idle4.ogg",
"infested_shared/pstcmbt/idle5.ogg",
"infested_shared/pstcmbt/idle6.ogg",
"infested_shared/pstcmbt/idle7.ogg",
"infested_shared/pstcmbt/idle8.ogg",
"infested_shared/pstcmbt/idle9.ogg",
"infested_shared/pstcmbt/idle10.ogg",
"infested_shared/pstcmbt/idle11.ogg",
"infested_shared/pstcmbt/idle12.ogg",
"infested_shared/pstcmbt/idle13.ogg",
"infested_shared/pstcmbt/idle14.ogg",
"infested_shared/pstcmbt/idle15.ogg",
"infested_shared/pstcmbt/idle16.ogg",
"infested_shared/pstcmbt/idle17.ogg"
}

ENT.SoundTbl_Pain = {
"infested_shared/pain/pain1.ogg",
"infested_shared/pain/pain2.ogg",
"infested_shared/pain/pain3.ogg",
"infested_shared/pain/pain4.ogg",
"infested_shared/pain/pain5.ogg",
"infested_shared/pain/pain6.ogg",
"infested_shared/pain/pain7.ogg",
"infested_shared/pain/pain8.ogg",
"infested_shared/pain/pain9.ogg",
"infested_shared/pain/pain10.ogg",
"infested_shared/pain/pain11.ogg",
"infested_shared/pain/pain12.ogg",
"infested_shared/pain/pain13.ogg",
"infested_shared/pain/pain14.ogg",
"infested_shared/pain/pain15.ogg",
"infested_shared/pain/pain16.ogg",
"infested_shared/pain/pain17.ogg",
"infested_shared/pain/pain18.ogg"
}

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
ENT.SoundTbl_Fall = {
	"infested_shared/dth/death8.ogg",
	"infested_shared/dth/death_mjr1.ogg",
	"infested_shared/dth/death_mjr2.ogg",
}
ENT.SoundTbl_Death = {
	"infested_shared/dth/death1.ogg",
	"infested_shared/dth/death2.ogg",
	"infested_shared/dth/death3.ogg",
	"infested_shared/dth/death4.ogg",
	"infested_shared/dth/death5.ogg",
	"infested_shared/dth/death6.ogg",
	"infested_shared/dth/death7.ogg",
	"infested_shared/dth/death8.ogg",
	"infested_shared/dth/death9.ogg",
	"infested_shared/dth/death10.ogg",
	"infested_shared/dth/death11.ogg",
	"infested_shared/dth/death12.ogg",
}
ENT.WeaponSpread = 0
ENT.Weapon_ShotsSinceLastReload = 0
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_ar",
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
	"weapon_vj_unsc_spv3_sr",
	"weapon_vj_unsc_spv3_sg",
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_rl",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
	"weapon_vj_cov_spv3_plasmaPistolBrute",
	"weapon_vj_cov_spv3_plasmaRifleBrute",
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_needler",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_piercer",
	"weapon_vj_cov_spv3_plasmapistol",
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_shredder",
}
ENT.RangeDistance = 500 -- This is how far away it can shoot
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.AnimTbl_RangeAttack = {} -- Range Attack Animations
ENT.NextRangeAttackTime = 0.5 -- How much time until it can use a range attack?
ENT.RemovableParts = {
	[500] = {Health = 15, Bodygroup = "Head", Execute = function(entity, dmginfo) 
		local pos, ang = entity:GetBonePosition(26)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_head.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[500]["Bodygroup"]), 1)
	end},
	[502] = {Health = 25, Bodygroup = "Right Arm", Execute = function(entity, dmginfo)
		local pos, ang = entity:GetBonePosition(29)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_leftArm.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[502]["Bodygroup"]), 3)
		entity:DropWeapon()
		entity.actualNade1 = entity:DropGrenade(entity.actualNade1)
		entity.PlasmaNade1 = entity:DropGrenade(entity.PlasmaNade1)
	end},
	[503] = {Health = 25, Bodygroup = "Left Arm", Execute = function(entity, dmginfo)
		local pos, ang = entity:GetBonePosition(13)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_rightArm.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[503]["Bodygroup"]), 3)
		entity.HasMeleeAttack = false
		entity.actualNade2 = entity:DropGrenade(entity.actualNade2)
		entity.PlasmaNade2 = entity:DropGrenade(entity.PlasmaNade2)
	end},
	[501] = {Health = 20, Bodygroup = "Body", Execute = function(entity, dmginfo)
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow", BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[501]["Bodygroup"]), 1)
		entity:EmitSound("infection_form/infection_pop/pop1.ogg")
		ParticleEffect("InfDeath", entity:GetPos() + Vector(0,0,50), entity:GetAngles(), nil)
		if (dmginfo) then
			dmginfo:SetDamage(entity:Health())
		end
	end},
}
ENT.CustomCollision = {Min = Vector(-16,-16,0), Max = Vector(16,16,80)}
ENT.extraInit = function(entity) end
ENT.otherInit = function(entity) 
	entity.extraInit(entity)
	if (entity.IsBomber) then
		entity.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
		entity.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
		entity.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
		entity.HasRangeAttack = true
		entity.RangeDistance = 500
		entity.PlasmaNade1 = ents.Create("weapon_vj_cov_spv3_plasma_nade")
		entity.PlasmaNade1:SetParent(entity, entity:LookupAttachment("Cannon"))
		entity.PlasmaNade1:SetPos(entity:GetAttachment(entity:LookupAttachment("Cannon"))["Pos"])
		entity.PlasmaNade1:SetLocalPos(Vector(5,0,0))
		entity.PlasmaNade1:Spawn()
		entity.PlasmaNade1:Activate()
		entity.PlasmaNade2 = ents.Create("weapon_vj_cov_spv3_plasma_nade")
		entity.PlasmaNade2:SetParent(entity, entity:LookupAttachment("anim_attachment_LH"))
		entity.PlasmaNade2:SetPos(entity:GetAttachment(entity:LookupAttachment("anim_attachment_LH"))["Pos"])
		entity.PlasmaNade2:SetLocalPos(Vector(8,2,0))
		entity.PlasmaNade2:Spawn()
		entity.PlasmaNade2:Activate()
	end
	if (entity.IsCarrier) then
		entity.Appearance["Bodygroups"][2] = 2
	end
end

ENT.SpawnedFromInf=false
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".ogg", 70, 100, 1)
	elseif key == "Melee1" then
		self:EmitSound("infested_elite/stand_pistol_melee_1/stand_pistol_melee_1.ogg", 70, 100, 1)
		self:EmitSound("infested_shared/melee/melee"..math.random(1,6)..".ogg", 70, 100, 1)
	elseif key == "Melee2" then
		self:EmitSound("infested_elite/stand_pistol_melee_2/stand_pistol_melee_2.ogg", 70, 100, 1)
		self:EmitSound("infested_shared/melee/melee"..math.random(1,6)..".ogg", 70, 100, 1)	
	elseif key == "Hit" then
		self:MeleeAttackCode()
	end
end

function ENT:CustomOnInitialKilled(dmginfo,hitgroup) 
	self:DropWeapon()
	if (self.IsBomber) then 
		self.actualNade1 = self:DropGrenade(self.actualNade1)
		self.actualNade2 = self:DropGrenade(self.actualNade2)
		self.PlasmaNade1 = self:DropGrenade(self.PlasmaNade1)
		self.PlasmaNade1 = self:DropGrenade(self.PlasmaNade2)
	end
	if (self.Suicided == true) then
		ParticleEffect("CarrierDeath", self:GetPos() + self:OBBCenter(), self:GetAngles(), nil)
		self.HasDeathAnimation = false
		self.HasDeathRagdoll = false
		for k, v in pairs(self.RemovableParts) do
			if (v["Health"] > 0) then
				v["Execute"](self)
			end
		end
	end
end

ENT.WeaponSpread = 1
function ENT:WeaponAimPoseParameters(ResetPoses)
end

function ENT:CustomOnThink() 
	if (IsValid(self:GetEnemy()) and self:IsLineOfSightClear(self:GetEnemy():GetPos()) and IsValid(self:GetActiveWeapon()) and self:GetActiveWeapon():Clip1()>0 and self:GetPos():DistToSqr(self:GetEnemy():GetPos())> 100) then
		self.AnimTbl_Run = {ACT_WALK_PISTOL}
		self.HasLeapAttack = false
	else
		self.AnimTbl_Run = {ACT_RUN}
		self.HasLeapAttack = true
	end
end

function ENT:CustomRangeAttackCode()
	if (!self.IsBomber) then return end
	if (self.nadesActivated != true) then
		self.nadesActivated = true
	else
		return
	end
	self.DisableForceDeath = true
	if (self.PlasmaNade1) then
		self.actualNade1 = ents.Create("obj_vj_cov_spv3_plasma_nade")
		self.actualNade1:SetParent(self, self:LookupAttachment("Cannon"))
		self.actualNade1:SetPos(self.PlasmaNade1:GetPos())
		self.actualNade1:Spawn()
		self.actualNade1:Activate()
		self.actualNade1:SetOwner(self)
		self.PlasmaNade1:Remove()
		self.PlasmaNade1 = nil
		self.actualNade1.Manual=true
		self.actualNade1:SetCollisionGroup(1)
		self.actualNade1:ManualExplode()
	end
	if (self.PlasmaNade2) then
		self.actualNade2 = ents.Create("obj_vj_cov_spv3_plasma_nade")
		self.actualNade2:SetParent(self, self:LookupAttachment("anim_attachment_LH"))
		self.actualNade2:SetPos(self.PlasmaNade2:GetPos())
		self.actualNade2:Spawn()
		self.actualNade2:Activate()
		self.actualNade2:SetOwner(self)
		self.PlasmaNade2:Remove()
		self.PlasmaNade2 = nil
		self.actualNade2.Manual=true
		self.actualNade2:SetCollisionGroup(1)
		self.actualNade2:ManualExplode()
	end
	timer.Simple(2, function() 
		if (IsValid(self)) then
			if (self.actualNade1 or self.actualNade2) then
				self.Suicided = true
			end
			self:TakeDamage(self:GetMaxHealth(),self)
		end
	end)
end

function ENT:DropGrenade(entity)
	if (entity==nil) then return end
	entity:SetMoveType(MOVETYPE_NONE)
	entity:SetParent(nil)
	entity:PhysicsInit(6)
	entity:GetPhysicsObject():Wake()
	return nil
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/