AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/

function ENT:CustomOnInitialize()
	ENT.Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255))
	ENT.BodyGroups = "0"..table.concat({math.random(0, 3), math.random(0, 2), math.random(0, 3), math.random(0, 7)})
	ENT.Skin = math.random(0, 2)
	entity.StartHealth = 100
	entity.ShieldMaxHealth = math.random(0, 450)
	entity.ExtraShotCount = math.random(0, 4)
	entity.WeaponProfficiency = math.random(50, 100)
	entity.ShieldRecharge = (math.random(0.5, 2))
	entity.ShieldDelay = (math.random(1, 10))
	if (math.random(0,4)==0) then
		entity.IsInvis = true
	else
		entity.IsInvis = false
	end
	if (math.random(0,1)==0) then
		entity.HasSword = true
	else
		entity.HasSword = false
	end
	self.BaseClass.CustomOnInitialize(self)
end