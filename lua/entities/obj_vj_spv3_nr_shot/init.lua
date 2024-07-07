AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/misc/needle.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = false -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 0 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 0 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BURN -- Damage type
ENT.ShakeWorldOnDeath = false -- Should the world shake when the projectile hits something?
ENT.DecalTbl_DeathDecals = {"FadingScorch"}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_OnCollide = {"weapons/needler/impact/whistle1.ogg","weapons/needler/impact/whistle2.ogg","weapons/needler/impact/whistle3.ogg","weapons/needler/impact/whistle4.ogg","weapons/needler/impact/whistle5.ogg","weapons/needler/impact/whistle6.ogg",}
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.CollideCodeWithoutRemoving = true -- If RemoveOnHit is set to false, you can still make the projectile deal damage, place a decal, etc.

-----------------------INTERNAL USE ONLY
ENT.DetonateT = 0
ENT.Collided = false
ENT.HitCharacter = nil
------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.RadiusDamage = self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier") -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
	-- ParticleEffectAttach("hcea_hunter_needler_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	util.SpriteTrail(self, 0, Color(255,0,255), true, 5, 0, 0.35, 0.1, "trails/plasma")
	self.glow = ents.Create("env_sprite")
	self.glow:SetKeyValue("rendermode", "9")
	self.glow:SetKeyValue("renderamt", "255")
	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
	self.glow:SetKeyValue("GlowProxySize","1")
	self.glow:SetKeyValue("rendercolor", "150 0 150")
	self.glow:SetKeyValue("scale","1")
	self.glow:SetPos(self:GetPos())
	self.glow:SetParent(self)
	self.glow:Spawn()
	self.glow:Activate()
	self:DeleteOnRemove(self.glow)
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


-- Will throw red collision errors in console, but don't seem to cause crashing. Couldn't figure out a way to keep errors from appearing with needler behavior.
function ENT:CustomOnCollideWithoutRemove(data, phys)
	self.Collided = true
	self.TargetedEnemy = nil
	self.DetonateT = CurTime() + 1.5
	if (!data.HitEntity:IsWorld()) then
		self:OnHitEntity(data.HitEntity, data, phys)
	else
		if (data.OurOldVelocity:Dot(data.HitNormal) >= 900) then 
			self:SetSolid(SOLID_NONE)
			self:SetMoveType(MOVETYPE_NONE)
		else
			local vector = data.OurOldVelocity - 2 * (data.OurOldVelocity * data.HitNormal) * data.HitNormal --Reflection vector formula
			self:GetPhysicsObject():SetVelocity(vector * 1)
			self:SetAngles(self:GetPhysicsObject():GetVelocity():Angle())
		end
	end
end

function ENT:OnHitEntity(ent)
	self.HitCharacter = ent
	self:ParentToEntity(ent)
	if (ent.Needles==nil) then ent.Needles = {} end
	table.insert(ent.Needles, self)
	if (#ent.Needles <= 7) then
		for i,j in pairs(ent.Needles) do
			j.DetonateT = CurTime() + 1.5
		end
	end
end

function ENT:ParentToEntity(ent)
	self:SetSolid(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	if (ent:GetBoneCount() > 1) then
		local closestBone = nil
		for i=0, ent:GetBoneCount()-1 do
			if (closestBone == nil or ent:GetBonePosition(i):Distance(self:GetPos()) < ent:GetBonePosition(closestBone):Distance(self:GetPos())) then
				closestBone = i
			end
		end
		closestBone = math.Clamp(closestBone + math.random(-1, 1), 0, ent:GetBoneCount()-1)
		self:FollowBone(ent, closestBone)
		self:SetPos(select(1, ent:GetBonePosition(closestBone)))
		self:SetAngles(select(2, ent:GetBonePosition(closestBone)) + Angle(90, 0, 0))
		self:SetVelocity(Vector(0,0,0))
	else
		self:SetParent(ent)
	end
end


function ENT:CustomOnThink()
	--self:SetAngles(self:GetAngles() + Angle(0,10,0))
	self:SetVelocity(self:GetForward():GetNormalized()*1000)
	
	--if (self.TargetedEnemy) then self:GetPhysicsObject():AddVelocity((self.TargetedEnemy:GetPos() - self:GetPos()):GetNormalized()*1000) end
	if (self.Collided and CurTime() >= self.DetonateT) then
		self:Detonate()
	end
	--self:SetAngles(self:GetPhysicsObject():GetVelocity():GetNormalized():Angle())
	--self:GetPhysicsObject():SetVelocity(self:GetForward():GetNormalized()*1000)
end

function ENT:Detonate()
	if (IsValid(self.HitCharacter)) then
		if (#self.HitCharacter.Needles >= 7) then
			SPV3.Supercombine(self.HitCharacter, self)
			return
		end
		self.HitCharacter:TakeDamage(10 * GetConVarNumber("vj_spv3_damageModifier"), self:GetOwner(), self:GetOwner())
		table.RemoveByValue(self.HitCharacter.Needles, self)
	else
	end
	self:EmitSound("weapons/needler/expire/1.ogg") 
	ParticleEffect("hcea_hunter_needler_pistol_impact", self:LocalToWorld(Vector(0,0,0)), self:GetAngles(), nil)
	self:Remove()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/