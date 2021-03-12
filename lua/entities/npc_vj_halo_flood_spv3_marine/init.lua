AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM

ENT.Model = {"models/hce/spv3/flood/human/floodmarine.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(127,0,0)
ENT.bodyGroups = {0,0,0,0,0}
ENT.StartHealth = 113
ENT.CanOpenDoors = true -- Can it open doors?
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.HasBloodPool = true -- Does it have a blood pool?
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2"} -- Death Animations
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDamage = 40
ENT.AnimTbl_MeleeAttack = {"Melee_1", "Melee_2"}
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 1.2
ENT.MeleeAttackReps = 1 -- How many times does it run the melee attack code?
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?
ENT.MeleeAttackDamageType = DMG_CLUB	
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 90
ENT.HasPoseParameterLooking = false -- Does it look at its enemy using poseparameters?
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.GrenadeWeps = {
	"weapon_vj_unsc_spv3_frag_nade",
}
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.NextLeapAttackTime = 2.5 -- How much time until it can use a leap attack?
ENT.bodyParts = {
	Head = {Health = 15, Bodygroup = "Head", Removed = false},
	Right_Arm = {Health = 25, Bodygroup = "Right Arm", Removed = false},
	Left_Arm = {Health = 25, Bodygroup = "Left Arm", Removed = false},
	Inf_Form = {Health = 20, Bodygroup = "Torso", Removed = false},
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
ENT.WeaponTable = {
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
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(-15, -15, 0), Vector(15, 15, 75))
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	timer.Simple(0.1, function() 
		if (math.random(0,100) <= GetConVarNumber("vj_spv3_floodWeps")) then
			self:Give(VJ_PICKRANDOMTABLE(self.WeaponTable))
		end
	end)
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetColor(self.modelColor)
	self:SetBodygroup(0, self.bodyGroups[1])
	self:SetBodygroup(1, self.bodyGroups[2])
	self:SetBodygroup(2, self.bodyGroups[3])
	self:SetBodygroup(4, self.bodyGroups[3])
		if (self.SpawnedFromInf==false) then
			self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
		end
	self:SetHealth(self.StartHealth)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	self:EmitSound("infested_shared/hit/floodflesh_hit_small"..math.random(1,11)..".ogg", 80, 100, 1)
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
	if (hitgroup==502 and self.bodyParts["Right_Arm"]["Removed"]==false) then
		self.bodyParts["Right_Arm"]["Health"] = self.bodyParts["Right_Arm"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Right_Arm"]["Health"] <= 0) then
			self.bodyParts["Right_Arm"]["Removed"]=true
			local pos, ang = self:GetBonePosition(27)
			self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodHuman_rightArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Right_Arm"]["Bodygroup"]), 2)
			if (IsValid(self:GetActiveWeapon())) then
				local wep = ents.Create(self:GetActiveWeapon():GetClass())
				wep:SetPos(self:GetActiveWeapon():GetPos())
				wep:SetAngles(self:GetActiveWeapon():GetAngles())
				wep:Spawn()
				wep:GetPhysicsObject():SetVelocity(dmginfo:GetDamageForce()*0.3)
				self:GetActiveWeapon():Remove()
			end
		end
	elseif (hitgroup==503 and self.bodyParts["Left_Arm"]["Removed"]==false) then
		self.bodyParts["Left_Arm"]["Health"] = self.bodyParts["Left_Arm"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Left_Arm"]["Health"] <= 0) then
			self.bodyParts["Left_Arm"]["Removed"]=true
			
			local pos, ang = self:GetBonePosition(11)
			self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodHuman_leftArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Left_Arm"]["Bodygroup"]), 1)
			self.HasMeleeAttack = false
		end
	elseif (hitgroup==500 and self.bodyParts["Head"]["Removed"]==false) then
		self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Head"]["Health"] <= 0) then
			self.bodyParts["Head"]["Removed"]=true
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 2)
		end
	elseif (hitgroup==501 and self.bodyParts["Inf_Form"]["Removed"]==false) then
		self.bodyParts["Inf_Form"]["Health"] = self.bodyParts["Inf_Form"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Inf_Form"]["Health"] <= 0) then
			self.bodyParts["Inf_Form"]["Removed"]=true
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Inf_Form"]["Bodygroup"]), 2)
			self:EmitSound("infection_form/infection_pop/pop1.ogg")
			ParticleEffect("hcea_flood_infected_death", self:LocalToWorld(Vector(0,0,50)), self:GetAngles() + Angle(90,0,0), nil)
			dmginfo:SetDamage(self:Health())
		end
	end
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter:SetOwner(self)
	self.imposter.Sequence = "Die_Airborne"
	local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
	if (dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()) then
		velocity = velocity * 0.3
	end
	self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
	self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
	self.imposter:Spawn()
end
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

function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false || GetConVarNumber("vj_spv3_dropGrenades")==0 then return end
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

function ENT:CustomOnInitialKilled(dmginfo,hitgroup) 
	if !(IsValid(self:GetActiveWeapon())) then return end
	local randdrop = ents.Create(self:GetActiveWeapon():GetClass())
	randdrop:SetPos(self:GetPos() + self:OBBCenter())
	randdrop:SetAngles(self:GetAngles())
	randdrop:Spawn()
	randdrop:Activate()
	local phys = randdrop:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMass(60)
		phys:ApplyForceCenter(dmginfo:GetDamageForce()*.01)
	end
	self:GetActiveWeapon():Remove()
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