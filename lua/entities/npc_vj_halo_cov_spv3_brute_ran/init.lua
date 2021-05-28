AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.otherInit = function(entity) 
	entity.Appearance = {
		Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)),
		Bodygroups = {math.random(0, 5), math.random(0, 2), math.random(0, 2), math.random(0, 1), math.random(0, 3), math.random(0, 3), math.random(0, 3), math.random(0, 1), math.random(0, 1)},
		Skin = math.random(0, 3),
	}
	entity.StartHealth = 200
	if (math.random(0, 1)==0) then
		entity.ShieldMaxHealth = 0
	else
		entity.ShieldMaxHealth = math.random(75, 300)
	end
	if (math.random(0, 4)==0) then
		entity.ShieldRecharge = (math.random(0.5, 2))
		entity.ShieldDelay = (math.random(1, 10))
	else
		entity.ShieldRecharge = (0)
		entity.ShieldDelay = (0)
	end
	if (math.random(0,4)==0) then
		entity.IsInvis = true
	else
		entity.IsInvis = false
	end
	entity.ExtraShotCount = math.random(0, 4)
	entity.WeaponProfficiency = math.random(50, 100)
end