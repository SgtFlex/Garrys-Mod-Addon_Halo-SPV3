AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/


function ENT:CustomOnInitialize()
	self.Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255))
	self.BodyGroups = "0"..table.concat({math.random(1, 2), math.random(1, 2)})
	self.Skin = 0

	self.StartHealth = math.random(45, 105)
	if (math.random(0, 4)==0) then
		self.ShieldMaxHealth = math.random(0, 100)
		self.ShieldRecharge = (math.random(0.5, 2))
		self.ShieldDelay = (math.random(1, 10))
	end
	self.ExtraShotCount = math.random(0, 4)
	self.WeaponProfficiency = math.random(50, 100)
	if (math.random(0,4)==0) then
		self.IsInvis = true
	else
		self.IsInvis = false
	end
	self.BaseClass.CustomOnInitialize(self)
end