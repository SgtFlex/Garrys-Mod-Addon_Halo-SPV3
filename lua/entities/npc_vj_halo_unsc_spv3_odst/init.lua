AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 65
ENT.Color = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255))
ENT.BodyGroups = "0P594"
ENT.Skin = 0
ENT.ExtraWeapons = {
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_particleCarbine",
}

function ENT:SetPhysicalAppearance()
	self.BaseClass.SetPhysicalAppearance(self)
end