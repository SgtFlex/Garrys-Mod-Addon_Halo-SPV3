 AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_jackal_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.otherInit = function(entity)
	if (math.random(0, 3) == 0) then
		entity:SetModel("models/hce/spv3/cov/skirmisher/skirmisher.mdl")
		entity.Appearance = {
			Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)),
			Bodygroups = {0, math.random(0, 1)},
			Skin = 0,
		}
	else
		entity:SetModel("models/hce/spv3/cov/jackal/jackal.mdl")
		entity.Appearance = {
			Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)),
			Bodygroups = {0, math.random(0, 2)},
			Skin = 0,
		}
	end
	if (math.random(0, 2)==0) then
		entity.ShieldProjMaxHealth = 0
	else
		entity.ShieldProjMaxHealth = math.random(1, 450)
		entity.ShieldProjDelay = math.random(1, 10)
		entity.ShieldProjRecharge = math.random(0.5, 2)
	end
	entity.StartHealth = math.random(45, 105)
	if (math.random(0, 4)==0) then
		entity.ShieldMaxHealth = math.random(0, 150)
		entity.ShieldRecharge = math.random(0.5, 2)
		entity.ShieldDelay = math.random(1, 10)
	end
	if (math.random(0,4)==0) then
		entity.IsInvis = true
	else
		entity.IsInvis = false
	end
	entity.ExtraShotCount = math.random(0, 4)
	entity.WeaponProfficiency = math.random(50, 100)
end