AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/weapons/w_missile_closed.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 100 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 20 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 20 -- Put the force amount it should apply | false = Don't apply any force
ENT.RadiusDamageForce_Up = 0 -- How much up force should it have? | false = Let the base automatically decide the force using RadiusDamageForce value
ENT.ShakeWorldOnDeath = true -- Should the world shake when the projectile hits something?
ENT.DecalTbl_DeathDecals = {"FadingScorch"}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_OnCollide = {"weapons/rocket launcher/impact/1.ogg", "weapons/rocket launcher/impact/2.ogg", "weapons/rocket launcher/impact/3.ogg", "weapons/rocket launcher/impact/4.ogg"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AimVector = nil
ENT.EnemyPos = nil
function ENT:CustomOnInitialize()
	util.SpriteTrail(self, 0,Color(200,200,200,200),true,20,5,.5,20,"trails/smoke")
	self.RadiusDamage = self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier") -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
	self:SetNoDraw(true)
	ParticleEffectAttach("vj_rpg2_fulltail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	self.soundTrail = CreateSound(self, "weapons/rocket launcher/trail/rocket_loop.ogg")
	self.soundTrail:Play()
	if (IsValid(self:GetOwner())) then
		self.AimVector = self:GetOwner():GetAimVector()
		self.EnemyPos = self:GetOwner():GetEnemy():GetPos()
	end
	//debugoverlay.Line(self:GetPos() + self.AimVector, self:GetPos() + (self.EnemyPos - self:GetPos()), 5, Color(0,255,0), false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	ParticleEffect("vj_explosion2",self:GetPos(),Angle(0,0,0),nil)
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
	self.soundTrail:Stop()
end

ENT.Curve = 0
ENT.StraightenVector = nil
function ENT:Think()
	self.Curve = self.Curve + 0.2
	self.Velocity = self:GetPhysicsObject():GetVelocity()
	if (IsValid(self:GetOwner()) and self.AimVector and (self.Velocity:Dot(self.EnemyPos - self:GetPos()))>0) then
		self:GetPhysicsObject():SetVelocity((self.Velocity + (self.EnemyPos - self:GetPos())*self.Curve):GetNormalized()*1300)
		//debugoverlay.Line(self:GetPos(),self:GetPos() + (self.EnemyPos - self:GetPos()), 0.1, Color(0,255,0), false)
	else
		self:GetPhysicsObject():SetVelocity(self:GetForward()*1300)
	
	end
	self:SetAngles(self:GetPhysicsObject():GetVelocity():Angle())
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/