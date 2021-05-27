AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(127,0,0),
	Bodygroups = {0, 1, 1, 1, 1, 0},
	Skin = 0,
}
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeDistance = 500 -- This is how far away it can shoot
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.AnimTbl_RangeAttack = {} -- Range Attack Animations
ENT.NextRangeAttackTime = 0.5 -- How much time until it can use a range attack?
ENT.HasDeathAnimation = true
ENT.StartHealth = 120
ENT.ShieldMaxHealth = 0

ENT.infFormCount = 6
local spreadRadius = 175

ENT.HasDeathRagdoll = true -- If set to false, it will not spawn the regular ragdoll of the SNPC

ENT.PlasmaNade1 = nil
ENT.PlasmaNade2 = nil
ENT.otherInit = function(entity) 
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

ENT.actualNade1 = nil
ENT.actualNade2 = nil
ENT.nadesActivated = false
function ENT:CustomRangeAttackCode()
	if (self.nadesActivated==false) then
		self.nadesActivated = true
	else
		return
	end
	self.DisableForceDeath = true
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
ENT.DisableForceDeath = true
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if (self.actualNade1!=nil) then
		self.actualNade1:SetParent(nil)
		self.actualNade2:SetParent(nil)
	else
		self.PlasmaNade1:SetParent(nil)
		self.PlasmaNade2:SetParent(nil)
	end
	if (dmginfo:GetInflictor()!=self) then return end
	self.HasDeathAnimation = false
	self.HasDeathRagdoll = false
	ParticleEffect("CarrierDeath", self:GetPos() + self:OBBCenter(), self:GetAngles(), nil)
	for i=1, 4 do
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 1150)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 1150)), BloodType = "Yellow"})
	end
	if (self.RemovableParts[502]["Health"] > 0) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_rightarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.RemovableParts[503]["Health"] > 0) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_leftarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.RemovableParts[500]["Health"] > 0) then
		self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodelite_head.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
	if (self.RemovableParts[501]["Health"] > 0) then
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
		self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
	end
end