/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('bases/spv3_grenade_proj_base/init.lua')

ENT.PrintName		= "Gravity Grenade"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.ParticleEffect_Trail = "hcea_hunter_plasma_rifle_proj"
ENT.ParticleEffect_Armed = "Gravity_pull"

ENT.Model = {"models/hce/spv3/weapons/cov/gravitygrenade.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 200 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 120 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 2500 -- Put the force amount it should apply | false = Don't apply any force

ENT.SoundTbl_Armed = {"grenades/gravity nade/preExplode/preExplode.ogg",}
ENT.SoundTbl_Death = {"grenades/gravity nade/Explode/Explode (1).ogg","grenades/gravity nade/Explode/Explode (2).ogg","grenades/gravity nade/Explode/Explode (3).ogg"}

-- Custom
ENT.FuseTime = 4
ENT.Bounciness = 0.5
ENT.ArmConditionOnCollide = function(self, data) 
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.glow = ""
-- function ENT:CustomOnInitialize()
-- 	if (self:GetOwner():IsNPC()) then
-- 		self.RadiusDamage=self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier")
-- 	end
-- 	ParticleEffectAttach("hcea_hunter_plasma_rifle_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
-- 	self:SetModel(VJ_PICKRANDOMTABLE(self.Model))
-- 	self.glow = ents.Create("env_sprite")
-- 	self.glow:SetKeyValue("rendermode", "9")
-- 	self.glow:SetKeyValue("renderamt", "255")
-- 	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
-- 	self.glow:SetKeyValue("GlowProxySize","100")
-- 	self.glow:SetKeyValue("rendercolor", "0 120 255")
-- 	self.glow:SetKeyValue("scale","1")
-- 	self.glow:SetPos(self:GetPos())
-- 	self.glow:SetParent(self)
-- 	self.glow:Spawn()
-- 	self.glow:Activate()
-- 	self:DeleteOnRemove(self.glow)
-- 	//if self:GetOwner():IsValid() && (self:GetOwner().GrenadeAttackFussTime) then
-- 	//timer.Simple(self:GetOwner().GrenadeAttackFussTime,function() if IsValid(self) then self:DeathEffects() end end) else
-- 	//end
-- end

---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.DaddyNade = true
-- ENT.FirstCollide = false
-- function ENT:CustomOnPhysicsCollide(data,phys)

-- 	if (self.FirstCollide==true) then return end
-- 	ParticleEffectAttach("Gravity_pull", 1, self, 0)
-- 	self.FirstCollide=true
-- 	getvelocity = phys:GetVelocity()
-- 	velocityspeed = getvelocity:Length()
-- 	//print(velocityspeed)
-- 	if velocityspeed > 500 then -- Or else it will go flying!
-- 		phys:SetVelocity(getvelocity * 0.9)
-- 	end
	
-- 	if velocityspeed > 100 then -- If the grenade is going faster than 100, then play the touch sound
-- 		self:OnCollideSoundCode()
-- 	end
-- 	self:SetMoveType(0)
-- 	self:SetAngles(Angle(0,self:GetAngles().y,self:GetAngles().z))
-- 	timer.Create("Pull"..self:GetCreationID(), 0.2, 0, function()
-- 		if (IsValid(self)) then
-- 			util.ScreenShake(self:GetPos(), 100, 100, 1, self.RadiusDamageRadius)
-- 			for _, v in pairs(ents.FindInSphere(self:GetPos(), self.RadiusDamageRadius)) do
-- 				if (v!=self and !v:IsWorld() and v.MovementType != VJ_MOVETYPE_STATIONARY and !IsValid(v:GetParent())) then
-- 					local pullAmount
-- 					if (v:IsPlayer()) then
-- 						pullAmount = 10*math.max(v:GetRunSpeed(), v:GetWalkSpeed())*0.4/400 
-- 					else
-- 						pullAmount = 10
-- 					end
-- 					local force = (self:GetPos()-v:GetPos())*pullAmount
-- 					if (IsValid(v:GetPhysicsObject())) then
-- 						v:GetPhysicsObject():SetVelocity(force)
-- 						v:SetVelocity(force)
-- 						v:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-500,500),math.random(-500,500),math.random(-500,500)))
-- 					else
-- 						v:SetVelocity(force)
-- 					end
-- 					v:TakeDamage(self.RadiusDamage/40, self:GetOwner(), self:GetOwner())
-- 				end
-- 			end
-- 		end
-- 	end)
-- 	timer.Simple(4, function()
-- 		if (IsValid(self)) then
-- 			self:DeathEffects()
-- 		end
-- 	end)
-- end

function ENT:ArmGrenade(fuseTime)
	if (self.SoundTbl_Armed) then self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Armed)) end
	ParticleEffectAttach("Gravity_pull", 1, self, 0)
	timer.Create("Pull"..self:GetCreationID(), 0.2, 0, function()
		if (IsValid(self)) then
			util.ScreenShake(self:GetPos(), 100, 100, 1, self.RadiusDamageRadius)
			for _, v in pairs(ents.FindInSphere(self:GetPos(), self.RadiusDamageRadius)) do
				if (v!=self and !v:IsWorld() and v.MovementType != VJ_MOVETYPE_STATIONARY and !IsValid(v:GetParent())) then
					local pullAmount
					if (v:IsPlayer()) then
						pullAmount = 10*math.max(v:GetRunSpeed(), v:GetWalkSpeed())*0.4/400 
					else
						pullAmount = 10
					end
					local force = (self:GetPos()-v:GetPos())*pullAmount
					if (IsValid(v:GetPhysicsObject())) then
						v:GetPhysicsObject():SetVelocity(force)
						v:SetVelocity(force)
						v:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-500,500),math.random(-500,500),math.random(-500,500)))
					else
						v:SetVelocity(force)
					end
					v:TakeDamage(self.RadiusDamage/40, self:GetOwner(), self:GetOwner())
				end
			end
		end
	end)
	timer.Simple(fuseTime, function()
		if (IsValid(self)) then
			self:DeathEffects()
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------

-- ENT.GrenadeWeps = {
-- 	"_vj_cov_spv3_needler_nade",
-- 	"_vj_cov_spv3_plasma_nade",
-- 	"_vj_cov_spv3_gravity_nade",
-- 	"_vj_cov_spv3_cluster_nade",
-- 	"_vj_unsc_spv3_frag_nade",
-- }

-- function ENT:DeathEffects()
-- 	for k,v in pairs(ents.FindInSphere(self:GetPos(), self.RadiusDamageRadius)) do
-- 		if (v:GetOwner()==nil) then
-- 			for i,j in pairs(self.GrenadeWeps) do
-- 				if (v:GetClass()==tostring("weapon"..self.GrenadeWeps[i])) then
-- 					local nadeSpawned = ents.Create("obj"..self.GrenadeWeps[i])
-- 					nadeSpawned:SetPos(v:GetPos())
-- 					nadeSpawned:SetAngles(v:GetAngles())
-- 					nadeSpawned:Spawn()
-- 					if (IsValid(self:GetOwner())) then
-- 						nadeSpawned:SetOwner(self:GetOwner())
-- 					end
-- 					v:Remove()
-- 				end
-- 			end
-- 		end
-- 	end
-- 	self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Death))
-- 	ParticleEffect("hcea_hunter_ab_explode", self:GetPos(), Angle(0,0,0), nil)
-- 	self:StopParticles()
-- 	self.ExplosionLight1 = ents.Create("light_dynamic")
-- 	self.ExplosionLight1:SetKeyValue("brightness", "4")
-- 	self.ExplosionLight1:SetKeyValue("distance", "300")
-- 	self.ExplosionLight1:SetLocalPos(self:GetPos())
-- 	self.ExplosionLight1:SetLocalAngles( self:GetAngles() )
-- 	self.ExplosionLight1:Fire("Color", "255 150 0")
-- 	self.ExplosionLight1:SetParent(self)
-- 	self.ExplosionLight1:Spawn()
-- 	self.ExplosionLight1:Activate()
-- 	self.ExplosionLight1:Fire("TurnOn", "", 0)
-- 	self:DeleteOnRemove(self.ExplosionLight1)
-- 	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)

-- 	self:SetLocalPos(Vector(self:GetPos().x,self:GetPos().y,self:GetPos().z +4)) -- Because the entity is too close to the ground
-- 	local tr = util.TraceLine({
-- 	start = self:GetPos(),
-- 	endpos = self:GetPos() - Vector(0, 0, 100),
-- 	filter = self })
-- 	util.Decal(VJ_PICK(self.DecalTbl_DeathDecals),tr.HitPos+tr.HitNormal,tr.HitPos-tr.HitNormal)
	
-- 	self:DoDamageCode()
-- 	self:SetDeathVariablesTrue(nil,nil,false)
-- 	self:Remove()
-- end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/