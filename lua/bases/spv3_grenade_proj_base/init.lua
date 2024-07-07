/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_grenade"
ENT.PrintName		= "SPV3 Grenade Projectile Base"
ENT.Author 			= "SgtFlex"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "VJ Base"

ENT.Spawnable = false
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

ENT.Model = {"models/hce/spv3/weapons/unsc/fraggrenade.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.MoveCollideType = nil -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.CollisionGroupType = nil -- Collision type, recommended to keep it as it is
ENT.SolidType = SOLID_VPHYSICS -- Solid type, recommended to keep it as it is
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 300 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 113  -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 140 -- Put the force amount it should apply | false = Don't apply any force
ENT.DecalTbl_DeathDecals = {"Scorch"}

ENT.ParticleEffect_Trail = "hcea_t25p_tracer_charged_sparks"
ENT.ParticleEffect_Explode = "hcea_hunter_ab_explode"
ENT.SoundTbl_OnCollide = {"grenades/frag nade/impact/impact.ogg"}
ENT.ParticleEffect_Collide = "cball_bounce"

ENT.Sound_Trail = nil
ENT.SoundTbl_OnCollide = {"grenades/frag nade/impact/impact.ogg"}
ENT.SoundTbl_Death = {"grenades/frag nade/explode/explode (1).ogg","grenades/frag nade/explode/explode (2).ogg"}
ENT.SoundTbl_Windup = {""}
ENT.SoundTbl_Armed = {""}
ENT.SoundTbl_StickTo = {""}
ENT.Bounciness = 0.35
ENT.FuseSpeedThreshold = 250 --Grenades below this speed will stop simulating physics and begin their detonation timer

-- Custom
ENT.FuseTime = 3
ENT.TimeSinceSpawn = 0
ENT.Sticky = false
ENT.StuckEntity = nil
ENT.ExplodeCount = 0

ENT.ArmConditionOnCollide = function(self, data) 
	return (data.Speed < self.FuseSpeedThreshold and (data.HitNormal.z < -0.9))
end

ENT.GrenadeChildrenAmount = 0
ENT.GrenadeChildClass = nil
ENT.GrenadeChildSpeed = 350

ENT.LastSurfaceHitResult = nil
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:EnableGravity(true)
	phys:SetBuoyancyRatio(0)
	phys:AddAngleVelocity(Vector(math.random(-1500,1500),math.random(-1500,1500),math.random(-1500,1500)))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetFriction(5)
	self:PhysicsInitSphere(2.5)
	if (self:GetOwner():IsNPC()) then
		self.RadiusDamage=self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier")
	end
	ParticleEffectAttach(self.ParticleEffect_Trail, PATTACH_ABSORIGIN_FOLLOW, self, 0)
	-- local effect = EffectData()
	-- effect:SetOrigin(self:GetPos())
	-- util.SpriteTrail(self, 0, Color(150,150,150), true, 10, 0, 0.25, 0.1, "trails/smoke")
	if (Sound_Trail) then 
		self.trailSound = CreateSound(self, self.Sound_Trail)
		self.trailSound:Play()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	self.TimeSinceSpawn = self.TimeSinceSpawn + 0.2
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage(dmginfo)
	if IsValid(self:GetPhysicsObject()) then
		--self:SetMoveType(6)
		self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.Settled = false
function ENT:CustomOnPhysicsCollide(data,phys)
	self.LastSurfaceHitResult = data
    if (self.Sticky and data.HitEntity and !data.HitEntity:IsWorld()) then
        self:OnHitEntity(data.HitEntity)
        return
	else
		self:OnHitSurface(data, phys)
	end
	
end

function ENT:OnHitSurface(data, phys)
	if (self.Settled==true) then return end

	velocity = data.OurOldVelocity
	speed = data.Speed
	NormalPitch = data.HitNormal.z

	if speed > 100 then -- If the grenade is going faster than 100, then play the touch sound
		self:OnCollideSoundCode()
		local effect = EffectData()
		effect:SetOrigin(self:GetPos())
		util.Effect(self.ParticleEffect_Collide ,effect)
	end

	if (self.ArmConditionOnCollide(self, data)) then
		self.Settled=true
		phys:Sleep()
		phys:EnableMotion(false)
		self:ArmGrenade(self.FuseTime)
	else
		local vector = data.OurOldVelocity - 2 * (data.OurOldVelocity * data.HitNormal) * data.HitNormal --Reflection vector formula
		phys:SetVelocity(vector * self.Bounciness)
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
	if (self.trailSound) then self.trailSound:Stop() end
	self.ExplodeCount = self.ExplodeCount - 1
	for k,v in pairs(ents.FindInSphere(self:GetPos(), self.RadiusDamageRadius)) do
		if (v:GetOwner()==nil) then
			for i,j in pairs(self.GrenadeWeps) do
				if (v:GetClass()==tostring("weapon"..self.GrenadeWeps[i])) then
					local nadeSpawned = ents.Create("obj"..self.GrenadeWeps[i])
					nadeSpawned:SetPos(v:GetPos())
					nadeSpawned:SetAngles(v:GetAngles())
					nadeSpawned:Spawn()
					if (IsValid(self:GetOwner())) then
						nadeSpawned:SetOwner(self:GetOwner())
					end
					v:Remove()
				end
			end
		end
	end
	self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Death))
	ParticleEffect(self.ParticleEffect_Explode, self:GetPos(), Angle(0,0,0), nil)
	//effectdata:SetScale( 500 )
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

	if (!IsValid(self.StuckEntity)) then self:SetLocalPos(Vector(self:GetPos().x,self:GetPos().y,self:GetPos().z +4)) end --Because the entity is too close to the ground
	local tr = util.TraceLine({
	start = self:GetPos(),
	endpos = self:GetPos() - Vector(0, 0, 100),
	filter = self })
	util.Decal(VJ_PICK(self.DecalTbl_DeathDecals),tr.HitPos+tr.HitNormal,tr.HitPos-tr.HitNormal)
	
	self:DoDamageCode()
	self:SetDeathVariablesTrue(nil,nil,false)
	local hit = self.LastSurfaceHitResult
	if (self.GrenadeChildClass) then
		for i = 1, self.GrenadeChildrenAmount do
			local ChildGrenade = ents.Create(self.GrenadeChildClass)
			ChildGrenade.GrenadeChildrenAmount = 0
			ChildGrenade.FuseTime = 0.5
			ChildGrenade:Spawn()
			if (IsValid(self:GetOwner())) then ChildGrenade:SetOwner(self:GetOwner()) end
			ChildGrenade:SetPos(self:GetPos() + (-hit.HitNormal*10))
			ChildGrenade:SetAngles(self:GetAngles())
			ChildGrenade:GetPhysicsObject():SetVelocity((-hit.HitNormal + Vector(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1))):GetNormalized()*self.GrenadeChildSpeed)
			ChildGrenade:GetPhysicsObject():AddAngleVelocity(VectorRand(-500, 500))
		end
	end
	if (self.ExplodeCount > 0) then
		self:ArmGrenade(self.FuseTime)
	else
		self:Remove()
	end
end

function ENT:ArmGrenade(fuseTime)
	fuseTime = fuseTime or self.FuseTime
	if (self.ParticleEffect_Armed) then ParticleEffectAttach(self.ParticleEffect_Armed, PATTACH_ABSORIGIN_FOLLOW, self, 0) end
	if (self.SoundTbl_Armed) then self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Armed)) end
	timer.Simple(fuseTime-0.8, function()
        if (IsValid(self)) then 
            self:EmitSound(VJ_PICK(self.SoundTbl_Windup))
        end
    end)
    timer.Simple(fuseTime, function()
        if (IsValid(self)) then 
            self:DeathEffects()
        end
    end)
end

function ENT:OnHitEntity(HitEntity)
	self.StuckEntity = HitEntity
	if !(HitEntity:IsWorld()) then
		--HitEntity:TakeDamage(1, self:GetOwner(), self)
		if (HitEntity.OnStuckByEntity) then HitEntity:OnStuckByEntity(self) end
        self:SetSolid(SOLID_NONE)
		self:SetMoveType(MOVETYPE_NONE)
		
		if (HitEntity:GetBoneCount() > 0) then
			
			local closestBone
			for i=0, HitEntity:GetBoneCount()-1 do
				if (closestBone == nil or HitEntity:GetBonePosition(i):Distance(self:GetPos()) < HitEntity:GetBonePosition(closestBone):Distance(self:GetPos())) then
					closestBone = i
				end
			end
			closestBone = math.Clamp(closestBone + math.random(-1, 1), 0, HitEntity:GetBoneCount()-1)
			self:FollowBone(HitEntity, closestBone)
			self:SetPos(select(1, HitEntity:GetBonePosition(closestBone)))
			self:SetAngles(select(2, HitEntity:GetBonePosition(closestBone)) + Angle(90, 0, 0))
			self:SetVelocity(Vector(0,0,0))
		else
			self:SetParent(HitEntity)
		end
		self:ArmGrenade(self.FuseTime)
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_StickTo))
		self:SetSolid(0)
		
	end
end

/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/