AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(155,155,155),
	Bodygroups = {3, 2, 1, 0, 2, 1, 2, 0, 1},
	Skin = 0,
}
ENT.helmet = "models/hce/spv3/cov/brute/garbage/ultra_helmet.mdl"
ENT.StartHealth = 250
ENT.ShieldMaxHealth = 75
//made up
//250 health
//75 shields
//325 total health
ENT.ExtraShotCount = 3
ENT.RemovableParts = {}
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
	"weapon_vj_unsc_spv3_sr",
}

function ENT:DisperseShield(dmginfo)
	if (self.ShieldActivated == false) then return false end
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	self:EmitSound("brute/fx/brute_shield_destroyed/brute_shield_destroyed ("..math.random(1, 3)..").ogg")
	self.ShieldActivated = false
	self.Bleeds = true
	local pos, ang = self:GetBonePosition(14)
	pos = pos + self:GetRight()*75		
	helmet = self:CreateGibEntity("obj_vj_metal_gib", {self.helmet}, {Pos = pos, Ang = ang})
	helmet:SetSkin(self:GetSkin())
	helmet:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(8)
	pos = pos + self:GetRight()*75	+ self:GetForward() * 10
	local front = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_front.mdl"}, {Pos = pos, Ang = ang})
	front:SetSkin(self:GetSkin())
	front:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(8)
	pos = pos + self:GetRight()*75 + self:GetForward() * -10
	local back = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_back.mdl"}, {Pos = pos, Ang = ang})
	back:SetSkin(self:GetSkin())
	back:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(10)
	pos = pos + self:GetRight()*75			
	local shoulder1 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_shoulder_1.mdl"}, {Pos = pos, Ang = ang})
	shoulder1:SetSkin(self:GetSkin())
	shoulder1:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(11)
	pos = pos + self:GetRight()*75
	local shoulder2 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_shoulder_2.mdl"}, {Pos = pos, Ang = ang})
	shoulder2:SetSkin(self:GetSkin())
	shoulder2:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(17)			
	local shoulder3 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_shoulder_1.mdl"}, {Pos = pos, Ang = ang})
	shoulder3:SetSkin(self:GetSkin())
	shoulder3:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(18)			
	local shoulder4 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_shoulder_2.mdl"}, {Pos = pos, Ang = ang})
	shoulder4:SetSkin(self:GetSkin())
	shoulder4:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(1)			
	local leg1 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_leg_1.mdl"}, {Pos = pos, Ang = ang})
	leg1:SetSkin(self:GetSkin())
	leg1:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(2)			
	local leg2 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_leg_2.mdl"}, {Pos = pos, Ang = ang})
	leg2:SetSkin(self:GetSkin())
	leg2:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(4)			
	local leg3 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_leg_1.mdl"}, {Pos = pos, Ang = ang})
	leg3:SetSkin(self:GetSkin())
	leg3:SetColor(self:GetColor())
	pos, ang = self:GetBonePosition(5)			
	local leg4 = self:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/brute/garbage/ultra_leg_2.mdl"}, {Pos = pos, Ang = ang})
	leg4:SetSkin(self:GetSkin())
	leg4:SetColor(self:GetColor())
	for k, v in pairs(self:GetBodyGroups()) do
		self:SetBodygroup(k, 0)
	end
	self:Berserk()
	return true
end