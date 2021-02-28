AddCSLuaFile("shared.lua")
include('shared.lua')
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
	{Name = "Minor", Color = Color(67,79,127), BodyGroup = 0, Skin = 1, Health = 44, Shields = 100},
	{Name = "Major", Color = Color(127,0,0), BodyGroup = 0, Skin = 2, Health = 45, Shields = 120},
	{Name = "Ultra", Color = Color(182,182,182), BodyGroup = 0, Skin = 0, Health = 63, Shields = 135},
	{Name = "Zealot", Color = Color(255,191,0), BodyGroup = 0, Skin = 3, Health = 75, Shields = 150},
	{Name = "Spec-Ops", Color = Color(36,36,36), BodyGroup = 0, Skin = 0, Health = 63, Shields = 135},
	{Name = "Ossoona", Color = Color(36,36,36), BodyGroup = 0, Skin = 0, Health = 75, Shields = 0},
	{Name = "HG Minor", Color = Color(67,79,127), BodyGroup = 1, Skin = 1, Health = 50, Shields = 135},
	{Name = "HG Major", Color = Color(127,0,0), BodyGroup = 1, Skin = 2, Health = 75, Shields = 145},
	{Name = "HG Ultra", Color = Color(182,182,182), BodyGroup = 1, Skin = 0, Health = 88, Shields = 155},
	{Name = "HG Zealot", Color = Color(255,191,0), BodyGroup = 1, Skin = 3, Health = 100, Shields = 165},
	{Name = "Runner", Color = Color(67,79,127), BodyGroup = 2, Skin = 0, Health = 45, Shields = 100},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.variantSelector = math.random(1, #self.Variants)
	timer.Simple(0.01, function() 
		if (math.random(0,100) <= GetConVarNumber("vj_spv3_floodWeps")) then
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
	for i=0, 2 do
		self:SetBodygroup(i, self.Variants[self.variantSelector]["BodyGroup"])
	end
	self:SetSkin(self.Variants[self.variantSelector]["Skin"])
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetCollisionBounds(Vector(-16, -16, 0), Vector(16, 16, 80))
	-- Shields --
	self.StartHealth = self.Variants[self.variantSelector]["Health"] * GetConVarNumber("vj_spv3_HealthModifier")
	if (math.random(0,100) >= GetConVarNumber("vj_spv3_floodEliteShield")) then
		self.ShieldHealth = self.Variants[self.variantSelector]["Shields"] * GetConVarNumber("vj_spv3_ShieldModifier")
		self.ShieldActivated = true
	else
		self.ShieldHealth = 0
		self.ShieldActivated = false
	end
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self:SetHealth(self.ShieldHealth + self.StartHealth)
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	-- Shields --
	if self.ShieldActivated == true then
		self.Bleeds = false
	else
		self.Bleeds = true
	end
end
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
		self.ShieldCurrentHealth = (self.ShieldCurrentHealth - dmginfo:GetDamage())
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
end

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

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	self:SetHealth((self.ShieldCurrentHealth + self.CurrentHealth))
	if (self.ShieldCurrentHealth<=0) then
		self:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
		self.ShieldActivated=false
		self.Bleeds=true
	end
	if (timer.Exists("ShieldDelay"..self:GetCreationID())) then
		timer.Adjust("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1)
	else
		timer.Create("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1, function() 
			if (IsValid(self)) then
				self:StopParticles()
				self:EmitSound(Sound("ambient/energy/whiteflash.ogg"),80,115)
				ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				self.ShieldActivated = true
				self.ShieldCurrentHealth = self.ShieldHealth
				self:SetHealth(self.CurrentHealth + self.ShieldCurrentHealth)
				self.Bleeds=false
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
	if self.ShieldActivated == false then return end
	self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
	self.NextChaseTime = CurTime() + 6
	self:EmitSound(Sound("ambient/energy/weld" .. math.random(1,2) .. ".ogg"),80,100)
	self:StopParticles()
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	ParticleEffectAttach("hcea_shield_enabled",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	self.ShieldActivated = false
end

function ENT:WeaponAimPoseParameters(ResetPoses)
end

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
			end
		end)
	end
end

function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false then return end
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
end

function ENT:CustomOnThink() 
	if (IsValid(self:GetEnemy()) and IsValid(self:GetActiveWeapon()) and self:GetActiveWeapon():Clip1()>0 and self:GetPos():DistToSqr(self:GetEnemy():GetPos())> 100) then
		self.AnimTbl_Run = {ACT_WALK}
	else
		self.AnimTbl_Run = {ACT_RUN}
	end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/