AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.infFormCount = 5
local spreadRadius = 50
ENT.otherInit = function(entity) 
	local set = math.random(0, 2)
	entity.Appearance = {
		Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)),
		Bodygroups = {0, math.random(0, 1), math.random(0, 2),math.random(0, 2),math.random(0, 2), 0},
		Skin = math.random(0, 2),
	}
	entity.StartHealth = 100
	entity.ShieldMaxHealth = math.random(0, 450)
	entity.ExtraShotCount = math.random(0, 4)
	entity.WeaponProfficiency = math.random(50, 100)
	entity.ShieldRecharge = (math.random(0.5, 2))
	entity.ShieldDelay = (math.random(1, 10))
	if (math.random(0, 4)==0) then
		entity.IsCarrier = true
		entity.Appearance["Bodygroups"][2] = 2
		entity.HasDeathRagdoll = false
	else
		entity.IsCarrier = false
	end
	if (math.random(0, 4)==0) then
		entity.IsBomber = true
	else
		entity.IsBomber = false
	end
	if (math.random(0,4)==0) then
		entity.IsInvis = true
	else
		entity.IsInvis = false
	end

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
end

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

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	self:DropWeapon()
	if (!self.IsBomber) then return end
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

function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if (!self.IsCarrier) then return end
	if (GetConVarNumber("vj_spv3_bonusInfForms")==0) then
		self.HasDeathRagdoll = true
		return
	end
	self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
	self:EmitSound("carrier/hkillbackgut/hkillbackgut.ogg")
	timer.Simple(1.3,function() if self:IsValid() then
	local BlastInfo = DamageInfo()
	BlastInfo:SetDamageType(DMG_BLAST)
	BlastInfo:SetDamage(20 * GetConVarNumber("vj_spv3_damageModifier"))
	BlastInfo:SetDamagePosition(self:GetPos())
	BlastInfo:SetInflictor(self)
	BlastInfo:SetReportedPosition(self:GetPos())
	util.BlastDamageInfo(BlastInfo, self:GetPos(), 250)
	util.ScreenShake(self:GetPos(),16,100,1,800)
	ParticleEffect("CarrierDeath", self:GetPos() + self:OBBCenter(), self:GetAngles(), nil)
	//ParticleEffectAttach("hcea_flood_inf_death",PATTACH_POINT_FOLLOW,self,0)
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
	end)
end