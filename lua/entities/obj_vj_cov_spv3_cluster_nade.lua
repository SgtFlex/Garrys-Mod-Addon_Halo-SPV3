/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('bases/spv3_grenade_proj_base/init.lua')


ENT.PrintName		= "Cluster Grenade"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.ParticleEffect_Trail = "hcea_hunter_frnade_nade"
ENT.ParticleEffect_Explode = "hcea_hunter_frg_explode"

ENT.Model = {"models/hce/spv3/weapons/cov/clustergrenade.mdl"} -- The models it should spawn with | Picks a random one from the table

ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 150 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 30 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 100 -- Put the force amount it should apply | false = Don't apply any force

ENT.DecalTbl_DeathDecals = {"Scorch"}
ENT.SoundTbl_Death = {"grenades/cluster nade/explode/explode (1).ogg","grenades/cluster nade/explode/explode (2).ogg"}
-- Custom
ENT.FuseTime = 0
ENT.Bounciness = 0
ENT.GrenadeChildrenAmount = 5
ENT.GrenadeChildClass = "obj_vj_cov_spv3_cluster_nade"
ENT.GrenadeChildSpeed = 350
ENT.ArmConditionOnCollide = function(self, data) 
	return true
end

---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.glow = ""
-- function ENT:CustomOnInitialize()
-- 	if (self:GetOwner():IsNPC()) then
-- 		self.RadiusDamage=self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier")
-- 	end
-- 	ParticleEffectAttach("hcea_hunter_frnade_nade", PATTACH_ABSORIGIN_FOLLOW, self, 0)
-- 	self.glow = ents.Create("env_sprite")
-- 	self.glow:SetKeyValue("rendermode", "9")
-- 	self.glow:SetKeyValue("renderamt", "255")
-- 	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
-- 	self.glow:SetKeyValue("GlowProxySize","3")
-- 	self.glow:SetKeyValue("rendercolor", "0 255 0")
-- 	self.glow:SetKeyValue("scale","1")
-- 	self.glow:SetPos(self:GetPos())
-- 	self.glow:SetParent(self)
-- 	self.glow:Spawn()
-- 	self.glow:Activate()
-- 	self:DeleteOnRemove(self.glow)
-- 	self:GetPhysicsObject():SetMass(50000)
-- end

/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/