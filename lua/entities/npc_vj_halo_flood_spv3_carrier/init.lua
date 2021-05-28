AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
ENT.Model = {"models/hce/spv3/flood/carrier/carrier.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50
ENT.Appearance = {
	Color = Color(255,191,0),
	Bodygroups = {},
	Skin = 0,
}
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.HasBloodPool = false -- Does it have a blood pool?

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
ENT.EntitiesToNoCollide = //Player no collide does affect how it behaves, even though the wiki states it doesn't
{
	"npc_vj_halo_flood_spv3_infection",
}
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsCarrier = true
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 0.3
ENT.AnimTbl_Death = {"Melee_1"} -- Death Animations
ENT.HasItemDropsOnDeath = false
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageType = DMG_BLAST
ENT.MeleeAttack_NoProps = true -- If set to true, it won't attack or push any props (Mostly used with multiple melee attacks)
ENT.AnimTbl_MeleeAttack = {""}
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 0
ENT.MeleeAttackExtraTimers = {}
ENT.TimeUntilMeleeAttackDamage = 0
ENT.NextAnyAttackTime_Melee = 1.7
ENT.MeleeAttackDamage = 0
ENT.MeleeAttackDamageType = DMG_SLASH
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {
"carrier/idle/caridle70_1.ogg",
"carrier/idle/caridle70_2.ogg",
"carrier/idle/caridle70_3.ogg",
"carrier/idle/caridle70_4.ogg",
"carrier/idle/caridle70_5.ogg",
"carrier/idle_27/caridle27_1.ogg",
"carrier/idle_27/caridle27_2.ogg",
"carrier/idle_27/caridle27_3.ogg",
"carrier/idle_27/caridle27_4.ogg",
"carrier/idle_27/caridle27_5.ogg"
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

function ENT:CustomOnMeleeAttack_BeforeChecks()
	if self.Dead == true or self:GetEnemy() == nil then return end
	self:TakeDamage(999999999999999,self,self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SpawnedFromInf=false
ENT.CustomCollision = {Min = Vector(-17,-17,0), Max = Vector(17,17,75)}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.infFormCount = 25
ENT.spreadRadius = 275
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	local inflation = Vector(1,1,1)
	if (self.KilledBySelf == false) then
		self.AnimTbl_Death = {ACT_IDLE}
	end
	timer.Create("bonescale"..self:GetCreationID(), 0.05, 0, function()
		if (IsValid(self)) then
			inflation = inflation + Vector(0.10 / self.DeathAnimationTime,0.13 / self.DeathAnimationTime,0.13 / self.DeathAnimationTime)
			self:ManipulateBoneScale(self:LookupBone("frame sack center"), inflation)
			self:ManipulateBoneScale(self:LookupBone("frame sack left"), inflation)
			self:ManipulateBoneScale(self:LookupBone("frame sack right"), inflation)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("carrier/carrier_move/carrier_form_move/carrier_walk"..math.random(1,10)..".ogg", 60, 100, 1)
	elseif key == "Melee" then
		self:EmitSound("carrier/hkillbackgut/hkillbackgut.ogg", 70, 100, 1)
	elseif key == "Hit" then
		self:MeleeAttackCode()
	end
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		self.KilledBySelf = true
		dmginfo:SetDamage(0)
		self:SetSchedule(73)
		self:StopMoving()
		self:SetAngles(Angle(0, dmginfo:GetDamageForce():Angle().y, 0))
		self:SetVelocity(Vector(dmginfo:GetDamageForce():GetNormalized().x*1000,dmginfo:GetDamageForce():GetNormalized().y*1000,500))
		timer.Simple(1.5, function() if(IsValid(self)) then self:TakeDamage(999999999999999,self,self) end end)
		 //end end)
	end
end

ENT.KilledBySelf = false
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed) 
	self.KilledBySelf = true
	self.DeathAnimationTime = 1.3
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/