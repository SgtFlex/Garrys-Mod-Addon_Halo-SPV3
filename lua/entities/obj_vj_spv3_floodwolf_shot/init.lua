AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/weapons/w_missile_closed.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 1 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 10 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_SLASH -- Damage type
ENT.ShakeWorldOnDeath = false -- Should the world shake when the projectile hits something?
ENT.DecalTbl_DeathDecals = {"FadingScorch"}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_OnCollide = {}
ENT.RemoveOnHit = true -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.CollideCodeWithoutRemoving = false -- If RemoveOnHit is set to false, you can still make the projectile deal damage, place a decal, etc.


---------------------------------------------------------------------------------------------------------------------------------------------
ENT.targetedEnemy = ""
ENT.stopTracking = false
function ENT:CustomOnInitialize()
	self.targetedEnemy = self:GetOwner().targetedEnemy //Use to track enemy
	self.RadiusDamage = self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier") -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
	self:SetNoDraw(true)
	util.SpriteTrail(self, 0, Color(255,0,0), true, 5, 1, 0.2, 5, "trails/plasma")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	ParticleEffect("hcea_hunter_plasma_rifle_impact",self:GetPos(),Angle(0,0,0),nil)
	self.ExplosionLight1 = ents.Create("light_dynamic")
	self.ExplosionLight1:SetKeyValue("brightness", "4")
	self.ExplosionLight1:SetKeyValue("distance", "100")
	self.ExplosionLight1:SetLocalPos(data.HitPos)
	self.ExplosionLight1:SetLocalAngles(self:GetAngles())
	self.ExplosionLight1:Fire("Color", "173 61 224")
	self.ExplosionLight1:SetParent(self)
	self.ExplosionLight1:Spawn()
	self.ExplosionLight1:Activate()
	self.ExplosionLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.ExplosionLight1)
end

function ENT:CustomOnCollideWithoutRemove(data,phys) 
	for k,v in pairs(ents.FindInSphere(self:GetPos(), 50)) do
		if (v:IsNPC() or v:IsPlayer()) then
			self:SetParent(v)
			self:SetMoveType(8)
			self:SetCollisionGroup(20)
		end
	end
	timer.Simple(10, function() if (IsValid(self)) then self:Remove() self:EmitSound("weapons/needler/expire/1.ogg") end end)
	self.stopTracking=true
	self:GetPhysicsObject():SetVelocity(self:GetForward()*1000)
end


function ENT:CustomOnThink() 
	if (IsValid(self) and self.stopTracking==false and IsValid(self.targetedEnemy)) then
		if (self.targetedEnemy:IsPlayer()) then
			self:GetPhysicsObject():AddVelocity(self.targetedEnemy:GetVelocity()/(self:GetPos():Distance(self.targetedEnemy:GetPos()) * 0.001)) //There's probably a better way to do this that's less taxing
		elseif (self.targetedEnemy:IsNPC()) then
			self:GetPhysicsObject():AddVelocity(self.targetedEnemy:GetGroundSpeedVelocity()/(self:GetPos():Distance(self.targetedEnemy:GetPos()) * 0.001)) //There's probably a better way to do this that's less taxing
		end	
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/