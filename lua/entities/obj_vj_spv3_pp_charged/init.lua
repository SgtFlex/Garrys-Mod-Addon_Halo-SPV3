AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/spitball_small.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = false -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 1 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 35 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BURN -- Damage type
ENT.ShakeWorldOnDeath = false -- Should the world shake when the projectile hits something?
ENT.DecalTbl_DeathDecals = {"FadingScorch"}
ENT.SoundTbl_Idle = {"weapons/plasma pistol/charged loop/charged loop.wav"}
ENT.SoundTbl_OnCollide = {
	"weapons/plasma pistol/charged impact/charged impact (1).ogg",
	"weapons/plasma pistol/charged impact/charged impact (2).ogg",
	"weapons/plasma pistol/charged impact/charged impact (3).ogg",
	"weapons/plasma pistol/charged impact/charged impact (4).ogg",
}
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 35 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_BURN -- Damage type
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.DirectDamage = self.DirectDamage * GetConVarNumber("vj_spv3_damageModifier") -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
	self:SetNoDraw(true)
	ParticleEffectAttach("hcea_hunter_plasma_pistol_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	self.glow = ents.Create("env_sprite")
	self.glow:SetKeyValue("rendermode", "9")
	self.glow:SetKeyValue("renderamt", "255")
	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
	self.glow:SetKeyValue("GlowProxySize","3")
	self.glow:SetKeyValue("rendercolor", "0 200 0")
	self.glow:SetKeyValue("scale","4.5")
	self.glow:SetPos(self:GetPos())
	self.glow:SetParent(self)
	self.glow:Spawn()
	self.glow:Activate()
	self:DeleteOnRemove(self.glow)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	ParticleEffect("hcea_hunter_plasma_pistol_impact",self:GetPos(),Angle(0,0,0),nil)
	self.ExplosionLight1 = ents.Create("light_dynamic")
	self.ExplosionLight1:SetKeyValue("brightness", "4")
	self.ExplosionLight1:SetKeyValue("distance", "100")
	self.ExplosionLight1:SetLocalPos(data.HitPos)
	self.ExplosionLight1:SetLocalAngles(self:GetAngles())
	self.ExplosionLight1:Fire("Color", "14 171 255")
	self.ExplosionLight1:SetParent(self)
	self.ExplosionLight1:Spawn()
	self.ExplosionLight1:Activate()
	self.ExplosionLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.ExplosionLight1)
end

function ENT:CustomOnPhysicsCollide(data, phys) 
	if data.HitEntity:IsPlayer() and data.HitEntity:Armor() > 0 then
		self.RadiusDamage = data.HitEntity:Armor()
	elseif (data.HitEntity.ShieldCurrentHealth and data.HitEntity.ShieldCurrentHealth > 0) then
		self.RadiusDamage = data.HitEntity.ShieldCurrentHealth
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/