/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('bases/spv3_grenade_proj_base/init.lua')

ENT.FuseTime = 2
ENT.Bounciness = 0.2
ENT.Sticky = true

ENT.Model = {"models/hce/spv3/weapons/cov/plasmagrenade.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.PrintName = "Plasma Grenade"

ENT.ParticleEffect_Trail = "hcea_hunter_plasma_rifle_proj"
ENT.ParticleEffect_Armed = "hcea_hunter_frnade_nade"
ENT.ParticleEffect_Explode = "hcea_hunter_frg_explode"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.RadiusDamageRadius = 340 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 150 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 120 -- Put the force amount it should apply | false = Don't apply any force
ENT.SoundTbl_Death = {"grenades/plasma nade/Explode/Explode (1).ogg","grenades/plasma nade/Explode/Explode (2).ogg"}
ENT.SoundTbl_Windup = {"grenades/plasma nade/preExplode/preExplode (1).ogg","grenades/plasma nade/preExplode/preExplode (2).ogg","grenades/plasma nade/preExplode/preExplode (3).ogg"}

ENT.SoundTbl_OnCollide = {""}

ENT.SoundTbl_StickTo = {
	"grenades/plasma nade/stick/stick (1).ogg",
	"grenades/plasma nade/stick/stick (2).ogg",
	"grenades/plasma nade/stick/stick (3).ogg",
}
ENT.SoundTbl_Armed = {
	"grenades/plasma nade/settle/settle (1).ogg",
	"grenades/plasma nade/settle/settle (2).ogg",
	"grenades/plasma nade/settle/settle (3).ogg",
}
---------------------------------------------------------------------------------------------------------------------------------------------

-- ENT.glow = ""
-- function ENT:CustomOnInitialize()
-- 	if (self:GetOwner():IsNPC()) then
-- 		self.RadiusDamage=self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier")
-- 	end
-- 	self.trailSound = CreateSound(self, "grenades/plasma nade/trail/trail.wav")
-- 	self.trailSound:Play()
-- 	self.trailSound:ChangeVolume(0.35)

-- 	ParticleEffectAttach("hcea_t25p_tracer_charged_sparks", PATTACH_ABSORIGIN_FOLLOW, self, 0)
-- 	ParticleEffectAttach("hcea_hunter_plasma_rifle_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
-- 	self:SetModel(VJ_PICKRANDOMTABLE(self.Model))
-- 	self.glow = ents.Create("env_sprite")
-- 	self.glow:SetKeyValue("rendermode", "9")
-- 	self.glow:SetKeyValue("renderamt", "255")
-- 	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
-- 	self.glow:SetKeyValue("GlowProxySize","3")
-- 	self.glow:SetKeyValue("rendercolor", "0 120 255")
-- 	self.glow:SetKeyValue("scale","1")
-- 	self.glow:SetPos(self:GetPos())
-- 	self.glow:SetParent(self)
-- 	self.glow:Spawn()
-- 	self.glow:Activate()
-- 	self:DeleteOnRemove(self.glow)
-- end

/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/