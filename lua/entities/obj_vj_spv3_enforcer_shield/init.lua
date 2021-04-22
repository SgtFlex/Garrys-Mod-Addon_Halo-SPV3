if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
AddCSLuaFile("shared.lua")
include("shared.lua")
/*--------------------------------------------------
	=============== Board Entity ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used for defending a certain area from enemies, SNPCs will attack it when close.
--------------------------------------------------*/
ENT.uniqueId = ""
ENT.Model = {"models/sentinels/enf_lshield.mdl"}

ENT.shieldMaxHealth = 270 * GetConVarNumber("vj_spv3_ShieldModifier")
ENT.shieldHealth = ENT.shieldMaxHealth
ENT.shieldRegenAmount = 1
ENT.shieldRegenSpeed = .1
ENT.shieldRegenDelay = 20
ENT.shieldRegen = false
ENT.StartHealth = shieldMaxHealth
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	self:AddEFlags(EFL_DONTBLOCKLOS)
	self.uniqueId = tostring(self:GetCreationID())
	self:SetHealth(self.shieldMaxHealth)
	self:SetMaxHealth(self.shieldMaxHealth)
	self:SetMaterial("models/props_combine/portalball001_sheet")
	self.RenderGroup = RENDERGROUP_TRANSLUCENT
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NOCLIP)
	self:SetCollisionGroup(0)
	self:GetPhysicsObject():Wake()
	self:SetColor(Color(0, 255, 255, 255))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data, physobj)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(activator, caller)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo)
	self.shieldRegen = false //disable any current active shield regen
	if (self.shieldHealth > 0 and self.shieldHealth > dmginfo:GetDamage()) then
		self.shieldHealth = math.Clamp(self.shieldHealth - dmginfo:GetDamage(), 0, self.shieldHealth)
		self:SetColor(Color(Lerp(self.shieldHealth/self.shieldMaxHealth, 255, 0), Lerp(self.shieldHealth/self.shieldMaxHealth, 0, 255)	, Lerp(self.shieldHealth/self.shieldMaxHealth, 0, 255)	, 255))
	elseif (self.shieldHealth == 0 or self.shieldHealth <= dmginfo:GetDamage()) then
		self.shieldHealth = 0
		self:SetColor(Color(0, 0, 0, 0))
		self:PhysicsInit(SOLID_NONE)
	end
	self:SetHealth(self.shieldHealth)
	if (timer.Exists("regendelay"..self.uniqueId)) then
		timer.Destroy("regendelay"..self.uniqueId)
	end
		timer.Create("regendelay"..self.uniqueId, self.shieldRegenDelay,0, function() if(IsValid(self)) then self:RegenShield() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RegenShield() //Regenerate the shield
	self.shieldRegen = true
	timer.Create("regen"..self.uniqueId, self.shieldRegenSpeed, (self.shieldMaxHealth - self.shieldHealth)/self.shieldRegenAmount , function() 
	if (IsValid(self) && self.shieldRegen && !self.dead && (self.shieldHealth < self.shieldMaxHealth)) then
		self.shieldHealth = self.shieldHealth + self.shieldRegenAmount
		self:SetHealth(self:Health() + self.shieldRegenAmount)
		self:SetColor(Color(Lerp(self.shieldHealth/self.shieldMaxHealth, 255, 0), Lerp(self.shieldHealth/self.shieldMaxHealth, 0, 255)	, Lerp(self.shieldHealth/self.shieldMaxHealth, 0, 255)	, 255))
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_NOCLIP)
	end
	end)
end


---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
end



/*--------------------------------------------------
	=============== Board Entity ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used for defending a certain area from enemies, SNPCs will attack it when close.
--------------------------------------------------*/
