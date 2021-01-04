AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/weapons/cov/plasmagrenade.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 1 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 3 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_SLASH -- Damage type
ENT.ShakeWorldOnDeath = false -- Should the world shake when the projectile hits something?
ENT.DecalTbl_DeathDecals = {"FadingScorch"}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_OnCollide = {"weapons/needler/impact/whistle1.ogg","weapons/needler/impact/whistle2.ogg","weapons/needler/impact/whistle3.ogg","weapons/needler/impact/whistle4.ogg","weapons/needler/impact/whistle5.ogg","weapons/needler/impact/whistle6.ogg",}
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.CollideCodeWithoutRemoving = true -- If RemoveOnHit is set to false, you can still make the projectile deal damage, place a decal, etc.
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.RadiusDamage = self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier") -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
	self:SetNoDraw(true)
	ParticleEffectAttach("hcea_hunter_needler_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
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

ENT.needles = 0
ENT.stopTracking = false
function ENT:CustomOnCollideWithoutRemove(data,phys) 
	for k,v in pairs(ents.FindInSphere(self:GetPos(), 100)) do
		if (v:IsNPC() or v:IsPlayer()) then
			self:SetParent(v)
			self:SetMoveType(8)
		elseif (v:GetClass()=="obj_vj_spv3_nr_shot" and IsValid(self:GetParent()) and v:GetParent()==self:GetParent()) then
			self.needles = self.needles + 1
		end
	end
	if (self.needles >= 7 and IsValid(self:GetParent())) then
		self:EmitSound("weapons/needler/super/superneedleboom.ogg")
		local BlastInfo = DamageInfo()
		BlastInfo:SetDamageType(DMG_BLAST)
		BlastInfo:SetDamage(40 * GetConVarNumber("vj_spv3_damageModifier"))
		BlastInfo:SetDamagePosition(self:GetPos())
		if (IsValid(self:GetOwner())) then
			BlastInfo:SetAttacker(self:GetOwner())
		end
		BlastInfo:SetReportedPosition(self:GetPos())
		util.BlastDamageInfo(BlastInfo, self:GetPos(), 50)
		util.ScreenShake(self:GetPos(),16,100,1,800)
		ParticleEffect("hcea_hunter_shade_cannon_explode_ground", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
		for k,v in pairs(ents.FindInSphere(self:GetPos(), 100)) do
			if (v:GetClass()=="obj_vj_spv3_nr_shot" and v:GetParent()==self:GetParent()) then
				v:Remove()
			end
		end
	end
	timer.Simple(10, function() 
		if (IsValid(self)) then 
			self:Remove() 
			self:EmitSound("weapons/needler/expire/1.ogg") 
			ParticleEffect("hcea_hunter_needler_pistol_impact", self:LocalToWorld(Vector(0,0,0)), self:GetAngles(), nil)
		end 
	end)
	self.stopTracking=true
	if (data.OurOldVelocity:Dot(data.HitNormal) < 900) then phys:SetVelocity((1 * (-2*(data.OurOldVelocity:Dot(data.HitNormal))*data.HitNormal + data.OurOldVelocity)):GetNormalized()*1000) else self:SetMoveType(0) end
end


function ENT:CustomOnThink() 
	self:GetPhysicsObject():SetVelocity(self:GetVelocity():GetNormalized()*1000)
	if !(IsValid(self.targetedEnemy)) then return end
	if (IsValid(self) and self.stopTracking==false and self.targetedEnemy) then
		if (self.targetedEnemy:IsPlayer()) then
			self:GetPhysicsObject():AddVelocity(self.targetedEnemy:GetVelocity()/(self:GetPos():Distance(self.targetedEnemy:GetPos()) * 0.005)) //There's probably a better way to do this that's less taxing
		elseif (self.targetedEnemy:IsNPC()) then
			self:GetPhysicsObject():AddVelocity(self.targetedEnemy:GetGroundSpeedVelocity()/(self:GetPos():Distance(self.targetedEnemy:GetPos()) * 0.006)) //There's probably a better way to do this that's less taxing
		end	
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/