AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_jackal_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100
ENT.ExtraShotCount = 0
ENT.LightColor = Color(255, 0, 255)
ENT.ShieldProjMaxHealth = 0
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
}
ENT.Appearance = {
	Color = Color(80,80,80),
	Bodygroups = {0, 2},
	Skin = 0,
}
ENT.otherInit = function(self)
	self.eyeLight = ents.Create("env_sprite")
	self.eyeLight:SetParent(self,self:LookupAttachment("EyeLight"))
	self.eyeLight:SetPos(self:GetAttachment(self:LookupAttachment("EyeLight"))["Pos"])
	self.eyeLight:SetKeyValue("rendermode", "9")
	self.eyeLight:SetKeyValue("renderamt", "255")
	self.eyeLight:SetKeyValue("model","blueflare1_noz.vmt")
	self.eyeLight:SetKeyValue("GlowProxySize","3")
	self.eyeLight:SetKeyValue("rendercolor",tostring(self.LightColor))
	self.eyeLight:SetKeyValue("scale", "0.2")
	self.eyeLight:Spawn()
	self.eyeLight:Activate()
end