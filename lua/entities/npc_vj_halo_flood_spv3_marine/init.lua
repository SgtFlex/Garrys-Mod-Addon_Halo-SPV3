AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
ENT.Faction = "Flood"
ENT.Model = {"models/hce/spv3/flood/human/floodmarine.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 75
ENT.DisableBackBreak = true
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow"
ENT.CustomBlood_Decal = {"VJ_SPV3_Blood_Flood1"}
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.HasBloodPool = true -- Does it have a blood pool?
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2"} -- Death Animations
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
ENT.MeleeAttackDamageType = DMG_CLUB	

ENT.HasPoseParameterLooking = false -- Does it look at its enemy using poseparameters?
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.GrenadeWeps = {
	"weapon_vj_unsc_spv3_frag_nade",
}
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {ACT_JUMP} -- Melee Attack Animations
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.NextLeapAttackTime = 2.5 -- How much time until it can use a leap attack?
ENT.RemovableParts = {
	[500] = {Health = 15, Bodygroup = "Head", Execute = function(entity, dmginfo) 
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[500]["Bodygroup"]), 2)
	end},
	[502] = {Health = 25, Bodygroup = "Right Arm", Execute = function(entity, dmginfo)
		local pos, ang = entity:GetBonePosition(27)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodHuman_rightArm.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[502]["Bodygroup"]), 2)
		entity:DropWeapon()
	end},
	[503] = {Health = 25, Bodygroup = "Left Arm", Execute = function(entity, dmginfo)
		local pos, ang = entity:GetBonePosition(11)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodHuman_leftArm.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[503]["Bodygroup"]), 1)
		entity.HasMeleeAttack = false
	end},
	[501] = {Health = 20, Bodygroup = "Body", Execute = function(entity, dmginfo)
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood1"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow",BloodDecal="VJ_SPV3_Blood_Flood2"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[501]["Bodygroup"]), 2)
		entity:EmitSound("infection_form/infection_pop/pop1.ogg")
		ParticleEffect("InfDeath", entity:GetPos() + Vector(0,0,50), entity:GetAngles(), nil)
		dmginfo:SetDamage(entity:Health())
	end},
}
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
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SpawnedFromInf=false
ENT.CustomCollision = {Min = Vector(-15,-15,0), Max = Vector(15,15,75)}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".ogg", 70, 100, 1)
	
	elseif key == "Melee" then
		self:EmitSound("infested_marine/stand_pistol_melee/stand_pistol_melee.ogg", 80, 100, 1)
		self:EmitSound("infested_shared/melee/melee"..math.random(1,6)..".ogg", 80, 100, 1)
	
	elseif key == "Shortmove" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".ogg", 80, 100, 1)
		
	elseif key == "Longmove" then
		self:EmitSound("infested_marine/combat_human_longmove/humanform_longmove"..math.random(1,15)..".ogg", 80, 100, 1)
	
	elseif key == "Hit" then
		self:MeleeAttackCode()
		
	end
end

function ENT:CustomOnInitialKilled(dmginfo,hitgroup) 
	self:DropWeapon()
end

function ENT:CustomOnThink() 
	if (IsValid(self:GetEnemy()) and self:IsLineOfSightClear(self:GetEnemy():GetPos()) and IsValid(self:GetActiveWeapon()) and self:GetActiveWeapon():Clip1()>0 and self:GetPos():DistToSqr(self:GetEnemy():GetPos())> 100) then
		self.AnimTbl_Run = {ACT_WALK}
		self.HasLeapAttack = false
	else
		self.AnimTbl_Run = {ACT_RUN}
		self.HasLeapAttack = true
	end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.WeaponSpread = 1
function ENT:WeaponAimPoseParameters(ResetPoses)
end