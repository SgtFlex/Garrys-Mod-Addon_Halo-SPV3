AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/

function ENT:CustomOnInitialize()
	self.BaseClass.CustomOnInitialize(self)
	self.Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255))
	self.BodyGroups = table.concat({0, math.random(0, 1), math.random(0, 2),math.random(0, 2),math.random(0, 2), 0})
	self.Skin = math.random(0, 3)
	self.StartHealth = 100
	self.ShieldMaxHealth = math.random(0, 450)
	self.ExtraShotCount = math.random(0, 4)
	self.WeaponProfficiency = math.random(50, 100)
	self.ShieldRecharge = (math.random(0.5, 2))
	self.ShieldDelay = (math.random(1, 10))
	if (math.random(0, 4)==0) then
		self.IsCarrier = true
	end
	if (math.random(0, 4)==0) then
		self.IsBomber = true
	end
	if (math.random(0,4)==0) then
		self.IsInvis = true
	end
end