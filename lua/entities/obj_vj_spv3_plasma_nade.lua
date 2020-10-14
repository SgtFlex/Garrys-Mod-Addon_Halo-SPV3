/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Grenade"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "VJ Base"

ENT.Spawnable = true
ENT.AdminOnly = false

if (CLIENT) then
	local Name = "Grenade"
	local LangName = "obj_vj_grenade"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/hce/spv3/weapons/cov/plasmagrenade.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.MoveCollideType = nil -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.CollisionGroupType = COLLISION_GROUP_PROJECTILE -- Collision type, recommended to keep it as it is
ENT.SolidType = SOLID_VPHYSICS -- Solid type, recommended to keep it as it is
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 325 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 180 * GetConVarNumber("vj_spv3_damageModifier") -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 120 -- Put the force amount it should apply | false = Don't apply any force
ENT.DecalTbl_DeathDecals = {"Scorch"}
ENT.SoundTbl_Death = {"grenades/plasma nade/Explode/Explode (1).wav","grenades/plasma nade/Explode/Explode (2).wav"}
ENT.SoundTbl_preExplode = {"grenades/plasma nade/preExplode/preExplode (1).wav","grenades/plasma nade/preExplode/preExplode (2).wav","grenades/plasma nade/preExplode/preExplode (3).wav"}
-- Custom
ENT.FussTime = 0
ENT.TimeSinceSpawn = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	PrintMessage(3, tostring(phys:GetMass()))
	phys:Wake()
	phys:EnableGravity(true)
	phys:SetBuoyancyRatio(0)
	phys:AddAngleVelocity(Vector(math.random(-1500,1500),math.random(-1500,1500),math.random(-1500,1500)))
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.glow = ""
function ENT:CustomOnInitialize()
	ParticleEffectAttach("hcea_hunter_plasma_rifle_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	self:SetModel(VJ_PICKRANDOMTABLE(self.Model))
	self.glow = ents.Create("env_sprite")
	self.glow:SetKeyValue("rendermode", "9")
	self.glow:SetKeyValue("renderamt", "255")
	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
	self.glow:SetKeyValue("GlowProxySize","3")
	self.glow:SetKeyValue("rendercolor", "0 120 255")
	self.glow:SetKeyValue("scale","1")
	self.glow:SetPos(self:GetPos())
	self.glow:SetParent(self)
	self.glow:Spawn()
	self.glow:Activate()
	self:DeleteOnRemove(self.glow)
	//if self:GetOwner():IsValid() && (self:GetOwner().GrenadeAttackFussTime) then
	//timer.Simple(self:GetOwner().GrenadeAttackFussTime,function() if IsValid(self) then self:DeathEffects() end end) else
	//end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	self.TimeSinceSpawn = self.TimeSinceSpawn + 0.2
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage(dmginfo)
	if IsValid(self:GetPhysicsObject()) then
		self:SetMoveType(6)
		self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DaddyNade = true
ENT.FirstCollide = false
ENT.Settled = false
function ENT:CustomOnPhysicsCollide(data,phys)
	if (self.Settled==true) then return end
	if (self:GetPhysicsObject():GetVelocity():Length() < 200 and data.HitNormal.z >= -1 and data.HitNormal.z < -0.9) then
		self:GetPhysicsObject():SetVelocity(Vector(0,0,0))
		self.Settled=true
		self:SetMoveType(0)
	end
	if !(data.HitEntity:IsWorld()) then
		self:SetParent(data.HitEntity)
		self:SetMoveType(0)
		self.Settled=true
		if (data.HitEntity.SoundTbl_Stuck) then
			data.HitEntity:EmitSound(VJ_PICKRANDOMTABLE(data.HitEntity.SoundTbl_Stuck))
		end
	end
	getvelocity = phys:GetVelocity()
	velocityspeed = getvelocity:Length()
	//print(velocityspeed)
	if self.FirstCollide==false and data.HitNormal.z >= -1 and data.HitNormal.z < -0.9 then -- Or else it will go flying!
		phys:SetVelocity(getvelocity:GetNormalized()*200)
		self.FirstCollide=true
	end
	if velocityspeed > 100 then -- If the grenade is going faster than 100, then play the touch sound
		self:OnCollideSoundCode()
	end
	if (self.Settled==true) then
		timer.Simple(2, function()
		if (IsValid(self)) then 
			self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_preExplode))
		end
		end)
		timer.Simple(3, function()
			if (IsValid(self)) then 
				self:DeathEffects()
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.GrenadeWeps = {
	"_vj_cov_spv3_needler_nade",
	"_vj_cov_spv3_plasma_nade",
	"_vj_cov_spv3_gravity_nade",
	"_vj_cov_spv3_cluster_nade",
	"_vj_unsc_spv3_frag_nade",
}

function ENT:DeathEffects()
	for k,v in pairs(ents.FindInSphere(self:GetPos(), self.RadiusDamageRadius)) do
		PrintMessage(3, tostring(v:GetClass()))
		for i,j in pairs(self.GrenadeWeps) do
			if (v:GetClass()==tostring("weapon"..self.GrenadeWeps[i])) then
				local nadeSpawned = ents.Create("obj"..self.GrenadeWeps[i])
				nadeSpawned:SetPos(v:GetPos())
				nadeSpawned:SetAngles(v:GetAngles())
				nadeSpawned:Spawn()
				v:Remove()
			end
		end
	end
	local effectdata = EffectData()
	effectdata:SetOrigin(self:GetPos())
	//effectdata:SetScale( 500 )
	ParticleEffect("hcea_hunter_frg_explode", self:GetPos(), Angle(0,0,0), nil)
	self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Death))
	self.ExplosionLight1 = ents.Create("light_dynamic")
	self.ExplosionLight1:SetKeyValue("brightness", "4")
	self.ExplosionLight1:SetKeyValue("distance", "300")
	self.ExplosionLight1:SetLocalPos(self:GetPos())
	self.ExplosionLight1:SetLocalAngles( self:GetAngles() )
	self.ExplosionLight1:Fire("Color", "255 150 0")
	self.ExplosionLight1:SetParent(self)
	self.ExplosionLight1:Spawn()
	self.ExplosionLight1:Activate()
	self.ExplosionLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.ExplosionLight1)
	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
	local tr = util.TraceLine({
	start = self:GetPos(),
	endpos = self:GetPos() - Vector(0, 0, 100),
	filter = self })
	util.Decal(VJ_PICK(self.DecalTbl_DeathDecals),tr.HitPos+tr.HitNormal,tr.HitPos-tr.HitNormal)
	self:DoDamageCode()
	self:SetDeathVariablesTrue(nil,nil,false)
	self:Remove()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/