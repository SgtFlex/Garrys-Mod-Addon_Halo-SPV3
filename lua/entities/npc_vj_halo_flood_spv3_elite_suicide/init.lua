AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/flood/elite/floodelite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(127,0,0)
ENT.bodyGroupTable = {0, 1, 1, 1, 1}
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeDistance = 500 -- This is how far away it can shoot
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.AnimTbl_RangeAttack = {} -- Range Attack Animations
ENT.NextRangeAttackTime = 0.5 -- How much time until it can use a range attack?
ENT.HasDeathAnimation = false
ENT.StartHealth = 120
ENT.ShieldHealth = 0

ENT.infFormCount = 6
local spreadRadius = 175

ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC

ENT.PlasmaNade1 = nil
ENT.PlasmaNade2 = nil
function ENT:CustomOnInitialize()
	self:SetColor(self.modelColor)
	for i=0, #self.bodyGroupTable-1 do
		self:SetBodygroup(i, self.bodyGroupTable[i+1])
	end
	self:SetSkin(2)
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetCollisionBounds(Vector(30, 30, 80), Vector(-30, -30, 0))
	-- Shields --
	if (self.SpawnedFromInf==false) then
		self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
			if (math.random(0,100) >= GetConVarNumber("vj_spv3_floodEliteShield")) then
		self.ShieldHealth = self.ShieldHealth * GetConVarNumber("vj_spv3_ShieldModifier")
		self.ShieldActivated = true
	else
		self.ShieldHealth = 0
		self.ShieldActivated = false
	end
	end
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self:SetHealth(self.ShieldHealth + self.StartHealth)

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

ENT.actualNade1 = nil
ENT.actualNade2 = nil
ENT.nadesActivated = false
function ENT:CustomRangeAttackCode()
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