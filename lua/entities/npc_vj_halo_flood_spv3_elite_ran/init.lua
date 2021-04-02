AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/flood/elite/floodelite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(0,110,255)
ENT.bodyGroup = 0
ENT.StartHealth = 50
ENT.ShieldHealth = 50
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldCurrentHealth = ENT.ShieldHealth
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.HasBloodPool = false -- Does it have a blood pool?

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"} -- Death Animations
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamage = 50
ENT.AnimTbl_MeleeAttack = {"Melee_1", "Melee_2"}
ENT.TimeUntilMeleeAttackDamage = 0.5
ENT.NextAnyAttackTime_Melee = 1.2
ENT.MeleeAttackReps = 1 -- How many times does it run the melee attack code?
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 90
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeDistance = 500 -- This is how far away it can shoot
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.AnimTbl_RangeAttack = {} -- Range Attack Animations
ENT.NextRangeAttackTime = 0.5 -- How much time until it can use a range attack?
ENT.EntitiesToNoCollide = {"npc_vj_halo_flood_spv3_infection"}
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

ENT.Variants = {
	{Name = "Minor", Color = Color(67,79,127), BodyGroup = {0, 1, 1, 1, 1}, Skin = 1, Health = 44, Shields = 100},
	{Name = "Major", Color = Color(127,0,0), BodyGroup = {0, 1, 1, 1, 1}, Skin = 2, Health = 45, Shields = 120},
	{Name = "Ultra", Color = Color(182,182,182), BodyGroup = {0, 1, 1, 1, 1}, Skin = 0, Health = 63, Shields = 135},
	{Name = "Zealot", Color = Color(255,191,0), BodyGroup = {0, 1, 1, 1, 1}, Skin = 3, Health = 75, Shields = 150},
	{Name = "Spec-Ops", Color = Color(36,36,36), BodyGroup = {0, 1, 1, 1, 1}, Skin = 0, Health = 63, Shields = 135},
	{Name = "Ossoona", Color = Color(36,36,36), BodyGroup = {0, 1, 1, 1, 1}, Skin = 0, Health = 75, Shields = 0},
	{Name = "HG Minor", Color = Color(67,79,127), BodyGroup = {0, 1, 2, 2, 2}, Skin = 1, Health = 50, Shields = 135},
	{Name = "HG Major", Color = Color(127,0,0), BodyGroup = {0, 1, 2, 2, 2}, Skin = 2, Health = 75, Shields = 145},
	{Name = "HG Ultra", Color = Color(182,182,182), BodyGroup = {0, 1, 2, 2, 2}, Skin = 0, Health = 88, Shields = 155},
	{Name = "HG Zealot", Color = Color(255,191,0), BodyGroup = {0, 1, 2, 2, 2}, Skin = 3, Health = 100, Shields = 165},
	{Name = "Runner", Color = Color(67,79,127), BodyGroup = {0, 2, 0, 0, 0}, Skin = 0, Health = 45, Shields = 100},
	{Name = "Suicide", Color = Color(127,0,0), BodyGroup = {0, 1, 1, 1, 1}, Skin = 2, Health = 50, Shields = 120}
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.PlasmaNade1 = nil
ENT.PlasmaNade2 = nil

function ENT:CustomOnInitialize()
	self.variantSelector = math.random(1, #self.Variants)
	timer.Simple(0.01, function() 
		if (math.random(0,100) < GetConVarNumber("vj_spv3_floodWeps") and self.Variants[self.variantSelector]["Name"] != "Suicide") then
			self:Give(VJ_PICKRANDOMTABLE(self.WeaponTable))
		end
	end)
	if (self.Variants[self.variantSelector]["Name"]=="Ossoona") then
		self.material = self:GetMaterial()
		self:SetMaterial("models/props_c17/frostedglass_01a")
		self:AddFlags(FL_NOTARGET)
		timer.Simple(0.02, function()
			if (IsValid(self:GetActiveWeapon())) then
				self.weaponMaterial = self:GetActiveWeapon():GetMaterial()
				self:GetActiveWeapon():SetMaterial("models/props_c17/frostedglass_01a")
			end
		end)
	end
	self:SetColor(self.Variants[self.variantSelector]["Color"])
	for i=0, #(self.Variants[self.variantSelector]["BodyGroup"])-1 do
		self:SetBodygroup(i, self.Variants[self.variantSelector]["BodyGroup"][i+1])
	end
	self:SetSkin(self.Variants[self.variantSelector]["Skin"])
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetCollisionBounds(Vector(-16, -16, 0), Vector(16, 16, 80))
	-- Shields --
	self.StartHealth = self.Variants[self.variantSelector]["Health"] * GetConVarNumber("vj_spv3_HealthModifier")
	if (math.random(0,100) < GetConVarNumber("vj_spv3_floodEliteShield")) then
		self.ShieldHealth = self.Variants[self.variantSelector]["Shields"] * GetConVarNumber("vj_spv3_ShieldModifier")
		self.ShieldActivated = true
	else
		self.ShieldHealth = 0
		self.ShieldActivated = false
	end
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self:SetHealth(self.ShieldHealth + self.StartHealth)
	if (self.Variants[self.variantSelector]["Name"] == "Suicide") then
		self.HasDeathAnimation = false
		self.HasDeathRagdoll = false
		self.PlasmaNade1 = ents.Create("weapon_vj_cov_spv3_plasma_nade")
		self.PlasmaNade1:SetParent(self, self:LookupAttachment("Cannon"))
		self.PlasmaNade1:SetPos(self:GetAttachment(self:LookupAttachment("Cannon"))["Pos"])
		self.PlasmaNade1:SetLocalPos(Vector(5,0,0))
		self.PlasmaNade1:Spawn()
		self.PlasmaNade1:Activate()

		self.PlasmaNade2 = ents.Create("weapon_vj_cov_spv3_plasma_nade")
		self.PlasmaNade2:SetParent(self, self:LookupAttachment("anim_attachment_LH"))
		self.PlasmaNade2:SetPos(self:GetAttachment(self:LookupAttachment("anim_attachment_LH"))["Pos"])
		self.PlasmaNade2:SetLocalPos(Vector(8,2,0))
		self.PlasmaNade2:Spawn()
		self.PlasmaNade2:Activate()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:MultipleMeleeAttacks()
-- local randattack_close = math.random(1,2)
-- 	self.MeleeAttackDistance = 70
-- 	if randattack_close == 1 then
-- 		self.AnimTbl_MeleeAttack = {"Melee_1"}
-- 		self.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageDistance = 90
-- 		self.NextAnyAttackTime_Melee = 1.6666666004393
-- 		self.MeleeAttackDamage = 20
-- 		self.MeleeAttackDamageType = DMG_SLASH	
		
-- 	elseif randattack_close == 2 then
-- 		self.AnimTbl_MeleeAttack = {"Melee_2"}
-- 		self.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageDistance = 90
-- 		self.NextAnyAttackTime_Melee = 1.2000000286102
-- 		self.MeleeAttackDamage = 20
-- 		self.MeleeAttackDamageType = DMG_SLASH	
-- 	end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.ShieldDelay = 6
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (self.Variants[self.variantSelector]["Name"]=="Ossoona") then
		self:SetMaterial(self.material)
		self:RemoveFlags(FL_NOTARGET)
		if (IsValid(self:GetActiveWeapon())) then
			self:GetActiveWeapon():SetMaterial(self.weaponMaterial)
		end
		timer.Create("Uncloak"..self:GetCreationID(), 1, 1, function()
			if (IsValid(self) and self:Health()>0) then
				self:SetMaterial("models/props_c17/frostedglass_01a")
				self:AddFlags(FL_NOTARGET)
				if (IsValid(self:GetActiveWeapon())) then
					self:GetActiveWeapon():SetMaterial("models/props_c17/frostedglass_01a")
				end
			end
		end)
	end
	if self.ShieldActivated == true then
		self.Bleeds=false
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
		if (dmginfo:GetDamageType()==DMG_PLASMA) then
			self.ShieldCurrentHealth = (self.ShieldCurrentHealth - (dmginfo:GetDamage()*3))
		else
			self.ShieldCurrentHealth = (self.ShieldCurrentHealth - dmginfo:GetDamage())
		end
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	if (self.ShieldCurrentHealth <= 0) then
		if (hitgroup==502 and self.bodyParts["Right_Arm"]["Removed"]==false) then
			self.bodyParts["Right_Arm"]["Health"] = self.bodyParts["Right_Arm"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Right_Arm"]["Health"] <= 0) then
				self.bodyParts["Right_Arm"]["Removed"]=true
				local pos, ang = self:GetBonePosition(29)
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_leftArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Right_Arm"]["Bodygroup"]), 3)
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
				local pos, ang = self:GetBonePosition(13)
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_rightArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Left_Arm"]["Bodygroup"]), 3)
				self.HasMeleeAttack = false
			end
		elseif (hitgroup==500 and self.bodyParts["Head"]["Removed"]==false) then
			self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Head"]["Health"] <= 0) then

				self.bodyParts["Head"]["Removed"]=true
				local pos, ang = self:GetBonePosition(26)
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_head.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 1)
			end
		elseif (hitgroup==501 and self.bodyParts["Inf_Form"]["Removed"]==false) then
			self.bodyParts["Inf_Form"]["Health"] = self.bodyParts["Inf_Form"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Inf_Form"]["Health"] <= 0) then
				self.bodyParts["Inf_Form"]["Removed"]=true
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Inf_Form"]["Bodygroup"]), 1)
				self:EmitSound("infection_form/infection_pop/pop1.ogg")
				ParticleEffect("hcea_flood_infected_death", self:LocalToWorld(Vector(0,0,50)), self:GetAngles() + Angle(90,0,0), nil)
				self:TakeDamage(1000, dmginfo:GetAttacker(), dmginfo:GetInflictor())
			end
		end
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
end

function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt)
	if (hitEnt.MeleeAttacking==true) then
		hitEnt:SetAngles(hitEnt:GetAngles() + Angle(0,180,0))
	end
	return false 
end -- return true to disable the attack and move onto the next entity!

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter.IsCarrier = (self.Variants[self.variantSelector]["Name"]=="Runner")
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
ENT.infFormCount = 6
local spreadRadius = 175

function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if (self.Variants[self.variantSelector]["Name"]=="Runner" and GetConVarNumber("vj_spv3_bonusInfForms")==1) then
		self.HasDeathRagdoll = false
		self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
		self:EmitSound("carrier/hkillbackgut/hkillbackgut.ogg")
		timer.Simple(1.3,function() 
			if self:IsValid() then
				local BlastInfo = DamageInfo()
				BlastInfo:SetDamageType(DMG_BLAST)
				BlastInfo:SetDamage(20 * GetConVarNumber("vj_spv3_damageModifier"))
				BlastInfo:SetDamagePosition(self:GetPos())
				BlastInfo:SetInflictor(self)
				BlastInfo:SetReportedPosition(self:GetPos())
				util.BlastDamageInfo(BlastInfo, self:GetPos(), 250)
				util.ScreenShake(self:GetPos(),16,100,1,800)
				ParticleEffect("hcea_flood_carrier_death", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
				//ParticleEffectAttach("hcea_flood_inf_death",PATTACH_POINT_FOLLOW,self,0)
				for k=1, self.infFormCount do
					self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
					self.infForm:SetPos(self:GetPos())
					self.infForm:SetOwner(self)
					self.infForm:Spawn()
					local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(200, 500))
					self.infForm:SetVelocity(velocity)
					self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
					self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
				end
				for i=1, 4 do
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 1150)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 1150)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Right_Arm"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_rightarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Left_Arm"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_leftarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Head"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_head.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Inf_Form"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
			end
		end)
	end
end



ENT.actualNade1 = nil
ENT.actualNade2 = nil
ENT.nadesActivated = false
function ENT:CustomRangeAttackCode()
	if (self.Variants[self.variantSelector]["Name"] != "Suicide") then return end
	if (self.nadesActivated==false) then
		self.nadesActivated = true
	else
		return
	end
	self.actualNade1 = ents.Create("obj_vj_cov_spv3_plasma_nade")
	self.actualNade1:SetParent(self, self:LookupAttachment("Cannon"))
	self.actualNade1:SetPos(self.PlasmaNade1:GetPos())
	self.actualNade1:Spawn()
	self.actualNade1:Activate()
	self.actualNade1:SetOwner(self)
	self.PlasmaNade1:Remove()
	self.actualNade1.Manual=true
	self.actualNade1:SetCollisionGroup(1)
	self.actualNade1:ManualExplode()

	self.actualNade2 = ents.Create("obj_vj_cov_spv3_plasma_nade")
	self.actualNade2:SetParent(self, self:LookupAttachment("anim_attachment_LH"))
	self.actualNade2:SetPos(self.PlasmaNade2:GetPos())
	self.actualNade2:Spawn()
	self.actualNade2:Activate()
	self.actualNade2:SetOwner(self)
	self.PlasmaNade2:Remove()
	self.actualNade2.Manual=true
	self.actualNade2:SetCollisionGroup(1)
	self.actualNade2:ManualExplode()
	timer.Simple(2, function() 
	if (IsValid(self)) then
		self:TakeDamage(self:GetMaxHealth(),self)
	end
	end)
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
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
	if (self.Variants[self.variantSelector]["Name"] != "Suicide") then return end
	if (self.actualNade1!=nil) then
		self.actualNade1:SetParent(nil)
		self.actualNade2:SetParent(nil)
	else
		self.PlasmaNade1:SetParent(nil)
		self.PlasmaNade2:SetParent(nil)
	end
	for i=1, 4 do
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 1150)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 1150)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Right_Arm"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_rightarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Left_Arm"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_leftarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Head"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_head.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.bodyParts["Inf_Form"]["Removed"] == false) then
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/