AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM

ENT.Model = {"models/hce/spv3/flood/jackal/floodjackal.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 20
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.HasBloodPool = false -- Does it have a blood pool?

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {} -- Death Animations
ENT.DeathAnimationTime = 1.65 -- Time until the SNPC spawns its corpse and gets removed
ENT.DisableDeathAnimationSCHED = true -- If set to true, it will disable the setschedule code

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
function ENT:CustomOnInitialize()
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	if (self.SpawnedFromInf==false) then
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_healthModifier")
end
	self:SetHealth(self.StartHealth)
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetColor(self.modelColor)
	self:SetCollisionBounds(Vector(-16, -16, 0), Vector(16, 16, 25))
	self:SetAngles(self:GetAngles() + Angle(0, 180, 0))
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
end

function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt)
	if (hitEnt.MeleeAttacking==true) then
		hitEnt:SetAngles(hitEnt:GetAngles() + Angle(0,180,0))
	end
	return false 
end -- return true to disable the attack and move onto the next entity!
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.infFormCount = 10
local spreadRadius = 200
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
	self:EmitSound((self.SoundTbl_Expl[math.random(1, #(self.SoundTbl_Expl))]))
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
	self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_leg.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_leg.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_arm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/jackal/floodjackal_arm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	for k=1, self.infFormCount do
		self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
		self.infForm:SetPos(self:GetPos())
		self.infForm:SetOwner(self)
		self.infForm:Spawn()
		local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 200))
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