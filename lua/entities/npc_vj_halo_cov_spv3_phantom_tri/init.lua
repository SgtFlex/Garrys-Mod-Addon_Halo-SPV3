AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_phantom/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM

function ENT:CustomOnInitialize()
	self:SetAngles(Angle(0, math.random(0, 360), 0))
	self:SetSolid(6)
	local trace = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetUp()*-10000,
		filter = self,
	})
	if (trace.Hit) then
		self:SetPos(trace.HitPos + Vector(0,0,math.random(300, 1000)))
	end
	timer.Simple(0.001, function() 	self:VJ_ACT_PLAYACTIVITY(self.SpawnAnim,true,self:SequenceDuration(self:LookupSequence(self.SpawnAnim)),false)	end) --Since June 17th VJ Update, line will not work without a delay
	self:SetCollisionBounds(Vector(-500, -300, -50), Vector(500, 300, 400))
	self.engineSound = CreateSound(self, "phantom/engine_hover.wav")
	self.movingSound = CreateSound(self, "phantom/engine_moving.wav")
	self.hoverSound = CreateSound(self, "phantom/hover (2).wav")
	self.gravSound = CreateSound(self, "phantom/grav_lift.wav")
	self.engineSound:SetSoundLevel(105)
	self.hoverSound:SetSoundLevel(100)
	self.gravSound:SetSoundLevel(85)
	self.movingSound:SetSoundLevel(115)
	self.engineSound:Play()
	self.movingSound:Play()
	self.hoverSound:Play()
	self.gravSound:Play()
	self.movingSound:ChangeVolume(0)
	self.gravSound:ChangeVolume(0)
	self.hoverSound:ChangeVolume(0)
	self.engineSound:ChangeVolume(0)
	local i
	self.turret = {}
	for i=1, 3 do
		self.turret[i] = ents.Create("npc_vj_halo_cov_spv3_phantom_turret")
		self.turret[i]:SetParent(self, 2)
		self.turret[i]:SetPos(self:GetAttachment(self:LookupAttachment("Cannon"..i))["Pos"])
		self.turret[i]:SetAngles(self:GetAttachment(self:LookupAttachment("Cannon"..i))["Ang"])
		self.turret[i]:SetOwner(self)
		self.turret[i]:Spawn()
		self.turret[i]:SetNoDraw(true)
	end
	timer.Simple(0.3, function()
		if (IsValid(self) and IsValid(self.turret[1])) then
			self:SetNoDraw(false)
			for i=1, 3 do
				self.turret[i]:SetNoDraw(false)
			end
		end
	end)
	timer.Simple(self:SequenceDuration(self:LookupSequence(self.SpawnAnim)), function()
		if (IsValid(self)) then
			self:SpawnCovies()
		end
	end)
end


ENT.IsLeaving = false
function ENT:Leave()
	if (self.IsLeaving==true) then return end
	self.IsLeaving = true
	self:VJ_ACT_PLAYACTIVITY(self.LeaveAnim,true,self:SequenceDuration(self:LookupSequence(self.LeaveAnim)),false)
	self.movingSound:ChangeVolume(0, 5)	
	timer.Simple(self:SequenceDuration(self:LookupSequence(self.LeaveAnim)), function()
		if (IsValid(self)) then
			self:Remove()
		end
	end)
end


function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	local mins1, maxs1 = self:GetHitBoxBounds(9, 0)
	mins1 = self:LocalToWorld(mins1) - Vector(300, 250, 150)
	maxs1 = self:LocalToWorld(maxs1) + Vector(300, 250, 150)
	local mins2, maxs2 = self:GetHitBoxBounds(10, 0)
	mins2 = self:LocalToWorld(mins2)- Vector(300, 250, 150)
	maxs2 = self:LocalToWorld(maxs2)+ Vector(300, 250, 150)

	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	-- PrintMessage(3, "Min "..tostring(mins1))
	-- PrintMessage(3, "Damage"..tostring(dmginfo:GetDamagePosition()))
	-- PrintMessage(3, "Max "..tostring(maxs1))
	if (dmginfo:GetDamagePosition():WithinAABox(mins1, maxs1) or dmginfo:GetDamagePosition():WithinAABox(mins2, maxs2)) then
		dmginfo:ScaleDamage(3.5)
		-- PrintMessage(3, tostring("Hit"))
	end
	if (hitgroup==503 and IsValid(self.turret)) then
		self.turret:TakeDamage(5, self, self)
	end
	if ((dmginfo:GetDamage() >= self:Health()) and (self.IsDead==false)) then
		self.IsDead = true
		self:SetHealth(9999)
		self:EmitSound("phantom/phantom_windup.ogg", 130)
		local effect = EffectData()
		effect:SetEntity(self)
		effect:SetOrigin(self:GetPos() + (self:GetForward()*math.random(-350, 350)) + (self:GetRight()*math.random(-200, 200)) + Vector(0,0,math.random(250, 300)))
		util.Effect("phantomFXBurst", effect) 

		timer.Create("miniexplosions"..self:GetCreationID(), 0.25, 2, function()
			if (IsValid(self)) then
				local effect = EffectData()
				local explosionLoc = self:GetPos() + (self:GetForward()*math.random(-350, 350)) + (self:GetRight()*math.random(-200, 200)) + Vector(0,0,math.random(250, 300))
				effect:SetEntity(self)
				effect:SetOrigin(explosionLoc)
				util.Effect("phantomFXBurst", effect) 
				for k=1, 5 do
					local ent = {}
					ent[k] = self:CreateGibEntity("obj_vj_sent_gib",self.gibTable[k])
					constraint.NoCollide(ent[k], self, 0, 0)
					ent[k]:SetPos(explosionLoc)
					ent[k]:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
					ent[k]:GetPhysicsObject():AddVelocity(Vector(math.random(-1000, 1000),math.random(-1000, 1000), math.random(-100, 300)))
					local effect=EffectData()
					if (GetConVarNumber("vj_sent_useParticles")==1) then timer.Create("FireFallFXSmall"..self:GetCreationID()..math.random(0,100)..k, 0.03, math.random(75, 150), function() 
						if (IsValid(ent[k])) then 
							effect:SetOrigin(ent[k]:GetPos()) 
							util.Effect("fireFallFXSmall", effect)
							end 
						end) 
					end
				end
			end
		end)
		if (math.random(0,1)==1) then
			self:PhysicsInit(SOLID_VPHYSICS)
			self:GetPhysicsObject():Wake()
		end
		timer.Simple(1.2, function()
			if (IsValid(self)) then
				self:TakeDamage(9999)
			end
		end)
	end
end