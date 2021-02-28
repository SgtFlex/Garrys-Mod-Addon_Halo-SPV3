AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM

ENT.Model = {"models/hce/spv3/nature/blindwolf/blindwolf.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 75
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_Front", "Die_Left", "Die_Right"} -- Death Animations
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
ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
ENT.HasLeapAttack = false -- Should the SNPC have a leap attack?
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
ENT.HasDeathRagdoll = false
function ENT:CustomOnInitialize()
	self:SetBodygroup(1, 1)
	self:SetBodygroup(0, 1)

end

ENT.infFormCount = 6
local spreadRadius = 175

function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if (GetConVarNumber("vj_spv3_bonusInfForms")==0) then
		self.HasDeathRagdoll = true
		return
	end
	self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
	self:EmitSound("carrier/hkillbackgut/hkillbackgut.ogg")
	timer.Simple(0.5,function() if self:IsValid() then
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
	-- local posone = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector1 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector1:SetPos(posone)
	-- infector1:SetAngles(self:GetAngles())
	-- infector1:Spawn()
	-- infector1:Activate()
	-- infector1:SetOwner(self)
	-- infector1:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local postwo = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector2 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector2:SetPos(postwo)
	-- infector2:SetAngles(self:GetAngles())
	-- infector2:Spawn()
	-- infector2:Activate()
	-- infector2:SetOwner(self)
	-- infector2:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local posthree = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector3 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector3:SetPos(posthree)
	-- infector3:SetAngles(self:GetAngles())
	-- infector3:Spawn()
	-- infector3:Activate()
	-- infector3:SetOwner(self)
	-- infector3:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local posfour = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector4 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector4:SetPos(posfour)
	-- infector4:SetAngles(self:GetAngles())
	-- infector4:Spawn()
	-- infector4:Activate()
	-- infector4:SetOwner(self)
	-- infector4:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local posfive = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector5 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector5:SetPos(posfive)
	-- infector5:SetAngles(self:GetAngles())
	-- infector5:Spawn()
	-- infector5:Activate()
	-- infector5:SetOwner(self)
	-- infector5:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
		end
	end)
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