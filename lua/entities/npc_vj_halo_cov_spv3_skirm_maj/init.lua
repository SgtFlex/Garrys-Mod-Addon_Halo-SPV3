AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_skirm_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.ExtraShotCount = 2
ENT.LightColor = Color(0, 255, 0)
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_ar"
}
ENT.WeaponProfficiency = 100
ENT.ExtraShotCount = 2
ENT.ShieldActivated = true
ENT.ShieldMaxHealth = 100
//50 shields in SPV3

function ENT:CustomOnInitialize()
	self:SetHitboxSet("shielded")
	self:SetBodygroup(1, 1)
	self:SetBodygroup(2, 1)
	self:SetCollisionBounds(Vector(20, 20, 75), Vector(-20, -20, 0))
end