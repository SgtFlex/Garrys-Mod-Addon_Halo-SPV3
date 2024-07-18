AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:CustomOnInitialize()
	self.Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255))
	self.BodyGroups = "0"..table.concat({math.random(0, 5), math.random(0, 2), math.random(0, 2), math.random(0, 1), math.random(0, 3), math.random(0, 3), math.random(0, 3), math.random(0, 1), math.random(0, 1)})
	self.Skin = math.random(0, 3)
	self.StartHealth = 200
	if (math.random(0, 1)==0) then
		self.ShieldMaxHealth = 0
	else
		self.ShieldMaxHealth = math.random(75, 300)
	end
	if (math.random(0, 4)==0) then
		self.ShieldRecharge = (math.random(0.5, 2))
		self.ShieldDelay = (math.random(1, 10))
	else
		self.ShieldRecharge = (0)
		self.ShieldDelay = (0)
	end
	if (math.random(0,4)==0) then
		self.IsInvis = true
	else
		self.IsInvis = false
	end
	self.ExtraShotCount = math.random(0, 4)
	self.WeaponProfficiency = math.random(50, 100)
	self.BaseClass.CustomOnInitialize(self) --equivalent of calling Super
end