AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Color = Color(155,155,155)
ENT.BodyGroups = "0321021201"
ENT.Skin = 0
ENT.helmet = "models/hce/spv3/cov/brute/garbage/ultra_helmet.mdl"
ENT.StartHealth = 250
ENT.ShieldMaxHealth = 75
ENT.ExtraShotCount = 3
ENT.RemovableParts = {}
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
	"weapon_vj_unsc_spv3_sr",
}

ENT.PrecacheGibs = {
	ENT.helmet,
	"models/hce/spv3/cov/brute/garbage/ultra_front.mdl",
	"models/hce/spv3/cov/brute/garbage/ultra_back.mdl",
	"models/hce/spv3/cov/brute/garbage/ultra_shoulder_1.mdl",
	"models/hce/spv3/cov/brute/garbage/ultra_shoulder_2.mdl",
	"models/hce/spv3/cov/brute/garbage/ultra_leg_1.mdl",
	"models/hce/spv3/cov/brute/garbage/ultra_leg_2.mdl",
}

function ENT:DisperseShield(dmginfo)
	self.BaseClass.DisperseShield(self, dmginfo)
	local pos, ang = self:GetBonePosition(14)
	pos = pos + self:GetRight()*75		
	self:CreateGib(self.helmet, pos, ang)
	pos, ang = self:GetBonePosition(8)
	pos = pos + self:GetRight()*75	+ self:GetForward() * 10
	self:CreateGib("models/hce/spv3/cov/brute/garbage/ultra_front.mdl", pos, ang)
	pos, ang = self:GetBonePosition(8)
	pos = pos + self:GetRight()*75 + self:GetForward() * -10
	self:CreateGib("models/hce/spv3/cov/brute/garbage/ultra_back.mdl", pos, ang)
	self:CreateGib("models/hce/spv3/cov/brute/garbage/ultra_shoulder_1.mdl", self:GetBonePosition(10))
	self:CreateGib("models/hce/spv3/cov/brute/garbage/ultra_shoulder_2.mdl", self:GetBonePosition(11))
	self:CreateGib("models/hce/spv3/cov/brute/garbage/ultra_leg_1.mdl", self:GetBonePosition(1))
	self:CreateGib("models/hce/spv3/cov/brute/garbage/ultra_leg_2.mdl", self:GetBonePosition(2))
	for k, v in pairs(self:GetBodyGroups()) do
		self:SetBodygroup(k, 0)
	end
	
end

function ENT:CreateGib(model, pos, ang)
	self:CreateGibEntity("obj_vj_gib", model, 
		{
			Pos = pos, 
			Ang = ang,
			BloodDecal="",
			CollideSound={"phx/epicmetal_hard.wav", "phx/epicmetal_hard1.wav", "phx/epicmetal_hard2.wav", "phx/epicmetal_hard3.wav", "phx/epicmetal_hard4.wav", "phx/epicmetal_hard5.wav", "phx/epicmetal_hard6.wav", "phx/epicmetal_hard7.wav"},
		},
		function(gib) 
			gib:SetColor(self:GetColor())
			gib:SetSkin(self:GetSkin()) 
		end
	)
end