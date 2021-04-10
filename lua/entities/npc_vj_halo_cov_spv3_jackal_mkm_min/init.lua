AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_jackal_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.ExtraShotCount = 0
ENT.StartHealth = 100
ENT.LightColor = Color(255, 0, 255)
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
}
ENT.bodyGroupTable = {
	0,
	2,
}
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.Color = Color(80,80,80)
ENT.eyeLight = ""
function ENT:CustomOnInitialize()
	self:SetHitboxSet("noShield")
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end
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
	timer.Simple(0.1, function()
	if (self:GetActiveWeapon().HoldType=="ar2") then
		self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_Run = {ACT_RUN_RIFLE}
		self.AnimTbl_IdleStand = {ACT_IDLE} -- The idle animation when AI is enabled
	end
end)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.UNSCWeps))
		end
	end)
	self:SetColor(self.Color)
	self:SetCollisionBounds(Vector(20, 20, 75), Vector(-20, -20, 0))
end