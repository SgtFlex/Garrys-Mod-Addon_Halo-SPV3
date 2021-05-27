AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.extraInit = function(entity) 
	local set = math.random(0, 2)
	entity.Appearance = {
		Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)),
		Bodygroups = {0, math.random(0, 1), math.random(0, 2),math.random(0, 2),math.random(0, 2), 0},
		Skin = math.random(0, 3),
	}
	entity.StartHealth = 100
	entity.ShieldMaxHealth = math.random(0, 450)
	entity.ExtraShotCount = math.random(0, 4)
	entity.WeaponProfficiency = math.random(50, 100)
	entity.ShieldRecharge = (math.random(0.5, 2))
	entity.ShieldDelay = (math.random(1, 10))
	if (math.random(0, 4)==0) then
		entity.IsCarrier = true
	end
	if (math.random(0, 4)==0) then
		entity.IsBomber = true
	end
	if (math.random(0,4)==0) then
		entity.IsInvis = true
	end
end