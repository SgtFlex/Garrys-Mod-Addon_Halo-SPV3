/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('bases/spv3_grenade_proj_base/init.lua')

ENT.PrintName		= "Needler Grenade"

ENT.ParticleEffect_Trail = "hcea_hunter_shade_cannon_proj"

ENT.Model = {"models/hce/spv3/weapons/cov/needlergrenade.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 250 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 60 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_BLAST -- Damage type
ENT.RadiusDamageForce = 0 -- Put the force amount it should apply | false = Don't apply any force
ENT.SoundTbl_Death = {"weapons/needler/super/superneedleboom.ogg",}
-- Custom
ENT.FuseTime = 0.5
ENT.Bounciness = 1
ENT.GrenadeChildClass = "obj_vj_spv3_nr_shot"
ENT.GrenadeChildrenAmount = 30
ENT.GrenadeChildSpeed = 800
ENT.ArmConditionOnCollide = function(self, data) 
	return true
end
ENT.Sticky = true


function ENT:OnHitEntity(HitEntity)
	
	-- function self:DeathEffects()
	-- 	self.ExplosionCount = self.ExplosionCount - 1
	-- 	if (self.trailSound) then self.trailSound:Stop() end
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
	-- 	ParticleEffect(self.ParticleEffect_Explode, self:GetPos(), Angle(0,0,0), nil)
	-- 	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
	-- 	if (!IsValid(self.StuckEntity)) then self:SetLocalPos(Vector(self:GetPos().x,self:GetPos().y,self:GetPos().z +4)) end --Because the entity is too close to the ground
	-- 	local tr = util.TraceLine({
	-- 		start = self:GetPos(),
	-- 		endpos = self:GetPos() - Vector(0, 0, 100),
	-- 		filter = self }
	-- 	)
	-- 	self:DoDamageCode()
	-- 	self:SetDeathVariablesTrue(nil,nil,false)
	-- 	if (self.ExplosionCount <= 0) then self:Remove() end
	-- end

	-- timer.Create("NeedlerExplosion"..self:GetCreationID(), 1, self.ExplosionCount, function()
	-- 	if (IsValid(self)) then
	-- 		self:DeathEffects()
	-- 	end
	-- end)
	self.ExplodeCount = 4
	self.FuseTime = 1
	self.GrenadeChildrenAmount = 0
	self.StuckEntity = HitEntity
	if !(HitEntity:IsWorld()) then
		--HitEntity:TakeDamage(1, self:GetOwner(), self)
        self:SetSolid(SOLID_NONE)
		self:SetMoveType(MOVETYPE_NONE)
		if (HitEntity.OnStuckByEntity) then HitEntity:OnStuckByEntity(self) end
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
---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.glow = ""
-- function ENT:CustomOnInitialize()
-- 	if (self:GetOwner():IsNPC()) then
-- 		self.RadiusDamage=self.RadiusDamage * GetConVarNumber("vj_spv3_damageModifier")
-- 	end
-- 	ParticleEffectAttach("hcea_hunter_shade_cannon_proj", PATTACH_ABSORIGIN_FOLLOW, self, 0)
-- 	self:SetModel(VJ_PICKRANDOMTABLE(self.Model))
-- 	self.glow = ents.Create("env_sprite")
-- 	self.glow:SetKeyValue("rendermode", "9")
-- 	self.glow:SetKeyValue("renderamt", "255")
-- 	self.glow:SetKeyValue("model","blueflare1_noz.vmt")
-- 	self.glow:SetKeyValue("GlowProxySize","10")
-- 	self.glow:SetKeyValue("rendercolor", "255 0 255")
-- 	self.glow:SetKeyValue("scale","1")
-- 	self.glow:SetPos(self:GetPos())
-- 	self.glow:SetParent(self)
-- 	self.glow:Spawn()
-- 	self.glow:Activate()
-- 	self:DeleteOnRemove(self.glow)
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.DaddyNade = true
-- ENT.StuckTo=false
-- ENT.FirstCollide = false
-- ENT.HitNormal = Vector(0, 0, 0)
-- ENT.stuckSurface = ""
-- function ENT:CustomOnPhysicsCollide(data,phys)
-- 	self.stuckSurface = data
-- 	if (self.FirstCollide==true) then return end
-- 	self.FirstCollide=true
-- 	self.HitNormal = data.HitNormal
-- 	if (!(data.HitEntity:IsWorld()) and (data.HitEntity:IsPlayer() or data.HitEntity:IsNPC())) then
-- 		self.StuckTo = true
-- 		if (data.HitEntity:GetBoneCount() > 0) then
-- 			local closestBone
-- 			for i=0, data.HitEntity:GetBoneCount()-1 do
-- 				if (closestBone == nil or data.HitEntity:GetBonePosition(i):Distance(self:GetPos()) < data.HitEntity:GetBonePosition(closestBone):Distance(self:GetPos())) then
-- 					closestBone = i
-- 				end
-- 			end
-- 			closestBone = math.Clamp(closestBone + math.random(-1, 1), 0, data.HitEntity:GetBoneCount()-1)
-- 			self:SetMoveType(MOVETYPE_NONE)
-- 			self:FollowBone(data.HitEntity, closestBone)
-- 			self:SetPos(select(1, data.HitEntity:GetBonePosition(closestBone)))
-- 			self:SetAngles(select(2, data.HitEntity:GetBonePosition(closestBone)) + Angle(90, 0, 0))
-- 			self:SetVelocity(Vector(0,0,0))
-- 		else
-- 			self:SetParent(data.HitEntity)
-- 			self:SetMoveType(8)
-- 		end
-- 		self.Settled=true
-- 		self:SetSolid(0)
-- 		data.HitEntity:TakeDamage(1, self:GetOwner(), self)
-- 		if (data.HitEntity.Berserked!=nil and data.HitEntity.Berserked!=true and math.random(0, 1)==1) then
-- 			data.HitEntity:Berserk()
-- 		else
-- 			if (data.HitEntity.SoundTbl_Stuck) then
-- 				data.HitEntity:EmitSound(VJ_PICKRANDOMTABLE(data.HitEntity.SoundTbl_Stuck))
-- 			end
-- 			if (data.HitEntity:LookupSequence("Transform")!=-1) then
-- 				data.HitEntity:VJ_ACT_PLAYACTIVITY("Transform", true, 4, false)
-- 			end
-- 		end
-- 	end
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
-- 	if (self.StuckTo==false) then
-- 		timer.Simple(1, function()
-- 			if (IsValid(self)) then
-- 				self:DeathEffects()
-- 			end
-- 		end)
-- 	else
-- 		timer.Create("ExplodeNG"..self:GetCreationID(), 1.5, 7, function() 
-- 			if (IsValid(self)) then
-- 				self:NeedleExplode()
-- 			end
-- 		end)
-- 		timer.Simple(10.5, function()
-- 			if (IsValid(self)) then
-- 				self.glow:Remove()
-- 				self:Remove()
-- 			end
-- 		end)
-- 	end
-- end
-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:NeedleExplode()
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
-- 	self:EmitSound("weapons/needler/super/superneedleboom.ogg")
-- 	local BlastInfo = DamageInfo()
-- 	BlastInfo:SetDamageType(DMG_BLAST)
-- 	if (IsValid(self:GetOwner())) then
-- 		BlastInfo:SetAttacker(self:GetOwner())
-- 	end
-- 	BlastInfo:SetDamage(self.RadiusDamage)
-- 	BlastInfo:SetDamagePosition(self:GetPos())
-- 	BlastInfo:SetReportedPosition(self:GetPos())
-- 	util.BlastDamageInfo(BlastInfo, self:GetPos(), self.RadiusDamageRadius)
-- 	util.ScreenShake(self:GetPos(),16,100,1,800)
-- 	ParticleEffect("hcea_hunter_shade_cannon_explode_ground", self:GetPos(), Angle(0,0,0,0), nil)
-- end

-- function ENT:DeathEffects()
-- 	if (self.StuckTo==false) then
-- 		for i=1,30 do
-- 			local needle = ents.Create("obj_vj_spv3_nr_shot")
-- 			needle:Spawn()
-- 			if (IsValid(self:GetOwner())) then
-- 				needle:SetOwner(self:GetOwner())
-- 			end
-- 			needle:SetPos(self.stuckSurface.HitPos + Vector(0,0,1))
-- 			needle:SetAngles(self.stuckSurface.HitNormal:Angle())
-- 			needle:GetPhysicsObject():SetVelocity((-self.stuckSurface.HitNormal + Vector(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1))):GetNormalized()*800)
-- 		end
-- 	else
		
-- 	end
-- 	local effectdata = EffectData()
-- 	effectdata:SetOrigin(self:GetPos())
-- 	//effectdata:SetScale( 500 )
-- 	ParticleEffect("hcea_hunter_shade_cannon_trigger_muzzle", self:GetPos(), Angle(-90,0,0), nil)
-- 	self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Death))
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