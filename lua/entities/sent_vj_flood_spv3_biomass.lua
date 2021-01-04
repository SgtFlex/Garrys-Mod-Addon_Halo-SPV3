/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
ENT.Base 			= "prop_vj_animatable"
ENT.Type 			= "anim"
ENT.PrintName 		= "Flood Biomass"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Used to make simple props and animate them, since prop_dynamic doesn't work properly in Garry's Mod."
ENT.Instructions 	= "Don't change anything."
ENT.Category		= "VJ Base"
ENT.StartHealth = 5
ENT.MaxSize = Vector(1.3, 1.3, 1.3)
ENT.MinSize = Vector(0.8, 0.8, 0.8)
ENT.Grow = true
ENT.SpawnTable = {
	"npc_vj_halo_flood_spv3_elite_ran",
	"npc_vj_halo_flood_spv3_jackal",
	"npc_vj_halo_flood_spv3_marine",
	"npc_vj_halo_flood_spv3_odst",
	"npc_vj_halo_flood_spv3_wolf",
	"npc_vj_halo_flood_spv3_brute"
}
ENT.SpawnedFromSpawner = true
ENT.Number = 0
ENT.SpawnFactorial = 3
ENT.BlastRadius = 250
ENT.HivePos = nil
if (SERVER) then
	AddCSLuaFile()
	function ENT:CustomOnInitialize()
		self:SetModelScale(0)
		self:SetModelScale(1, 5)
		self.SpawnFactorial = GetConVar("vj_spv3_biomassSpread"):GetInt()
		if (self.Number < self.SpawnFactorial) then
			timer.Create("Spawn"..self:GetCreationID(), math.random(5, 15), self.SpawnFactorial - self.Number, function()
				if (IsValid(self)) then
					local spawnTrace = nil
					local spawnBox = nil
					self.spawnAttempts = 0
					self.viablePos = true
					repeat
						self.viablePos = true
						self.spawnAttempts = self.spawnAttempts + 1
						spawnTrace = util.TraceLine({
							start = self:GetPos() + self:GetUp()*100,
							endpos = (self:GetPos() + Vector(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1)):GetNormalized()*800),
							filter = self,
						})
						spawnBox = util.TraceHull({
							start = spawnTrace.HitPos + spawnTrace.HitNormal*100,
							endpos = spawnTrace.HitPos + spawnTrace.HitNormal*100,
							mins = Vector(-50, -50, -50),
							maxs = Vector(50, 50, 50),
							mask = MASK_NPCSOLID,
							filter = self
						})
						debugoverlay.Line(spawnTrace.StartPos, spawnTrace.HitPos, 10, Color(255,255,255), false)
						debugoverlay.Box(spawnTrace.HitPos + spawnTrace.HitNormal*100, Vector(-50, -50, -50), Vector(50, 50, 50), 10, Color(255,255,255,0))

						for k,v in pairs(ents.FindInSphere(spawnTrace.HitPos, self.BlastRadius)) do
							if (v:GetClass()=="sent_vj_flood_spv3_biomass") then
								self.viablePos = false
								break
							else
								self.viablePos = true
							end
						end
					until self.spawnAttempts >= 50 or (self.viablePos==true and spawnTrace.Hit and spawnTrace.HitPos:Distance(self:GetPos()) > self.BlastRadius and spawnBox.Hit==false)
					
					if (self.spawnAttempts < 50) then
						local biomass = ents.Create("sent_vj_flood_spv3_biomass")
						biomass:SetPos(spawnTrace.HitPos)
						biomass.Number = self.Number + 1
						biomass:SetAngles(spawnTrace.HitNormal:Angle() + Angle(90, 0, 0))
						biomass:Spawn()
					end
				end
			end)
		end
		self:SetMaxHealth(self.StartHealth)
		self:SetHealth(self.StartHealth)
		timer.Simple(math.random(30, 120), function()
		if (IsValid(self)) then
			self:TakeDamage(self:GetMaxHealth(), self, self)
		end
		end)
		self:SetModel("models/hce/spv3/flood/biomass1/biomass1.mdl")
		self:SetBodygroup(0, math.random(0, 2))
		self:SetBodygroup(1, math.random(0, 2))
		self:SetCollisionBounds(Vector(20, 20, 65), Vector(-20, -20, 0))
		self:SetMoveType(MOVETYPE_NONE)
		self:SetSolid(SOLID_BBOX)
		self:ResetSequence("Idle1")
		self.randomScale = math.Rand(1, 3)
		self:ManipulateBoneScale(0, Vector(self.randomScale, self.randomScale, self.randomScale))
		timer.Create("Grow"..self:GetCreationID(), 0.01, 0, function()
			if (IsValid(self)) then
				if (self:GetManipulateBoneScale(1).x <= self.MinSize.x and self.Grow == false) then
					self.Grow = true
				elseif (self:GetManipulateBoneScale(1).x >= self.MaxSize.x) then
					self.Grow = false
				end
				if (self.Grow==true) then
					self:ManipulateBoneScale(1, self:GetManipulateBoneScale(1) + Vector(0.002,0.002,0.002))
				else
					self:ManipulateBoneScale(1, self:GetManipulateBoneScale(1) - Vector(0.002,0.002,0.002))
				end
			end
		end)
	end
	
end
ENT.Bursted = false
function ENT:OnTakeDamage(dmginfo)
	self:SetHealth(self:Health() - dmginfo:GetDamage())
	if (self:Health() <= 0 and self.Bursted == false) then self:DoDeath() end
end


ENT.infFormCount = 2
ENT.infForm = nil
local spreadRadius = 275

function ENT:DoDeath()
	self:SetCollisionGroup(1)
	self.Bursted = true
	self:EmitSound("carrier/kill_instant/kill_instant.wav")
	local BlastInfo = DamageInfo()
	BlastInfo:SetDamageType(DMG_BLAST)
	BlastInfo:SetDamage(60 * GetConVarNumber("vj_spv3_damageModifier"))
	BlastInfo:SetDamagePosition(self:GetPos())
	BlastInfo:SetInflictor(self)
	BlastInfo:SetReportedPosition(self:GetPos())
	util.BlastDamageInfo(BlastInfo, self:GetPos(), self.BlastRadius)
	util.ScreenShake(self:GetPos(),16,100,1,800)
	ParticleEffect("hcea_flood_carrier_death", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
	self.SpawnedNPCs = {}
	if (math.random(0,1)==0 || self:GetBodygroup(1)==2) then
		self.infFormCount = ((3 - self:GetBodygroup(1)) * 1) + math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
		for k=1, self.infFormCount do
			self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
			self.infForm:SetPos(self:GetPos() + self:GetUp()*35)
			self.infForm:SetOwner(self)
			self.infForm:Spawn()
			local velocity = self:GetLocalPos():GetNormalized() + Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 300))
			self.infForm:SetVelocity(velocity)
			self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
			self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
		end
	else
		for k=1, (3 - self:GetBodygroup(1)) do
			self.infForm = ents.Create(VJ_PICK(self.SpawnTable))
			table.insert(self.SpawnedNPCs, self.infForm)
			//self.infForm:SetPos(self:GetPos() + self:GetUp()*60)
			self.infForm:SetOwner(self)
			self.infForm:Spawn()
			self.infForm.constraints = {}
			if (k!=1) then
				for k, v in pairs(self.SpawnedNPCs) do
					self.infForm.constraints[k] = constraint.NoCollide(self.infForm, self.SpawnedNPCs[k], 0, 0)
					timer.Simple(1, function()
						if (IsValid(self) and self.infForm.constraints[k]) then
							self.infForm.constraints[k]:Remove()
						end
					end)
				end
			end
			self.infForm:SetPos(self:GetPos() + self:GetUp()*self.SpawnedNPCs[k]:OBBMaxs().z)
			local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 300))
			self.infForm:SetVelocity(velocity)
			self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
			self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
		end
	end
	self:SetBodygroup(1, 3)
	timer.Simple(20, function()
		if (IsValid(self)) then
			self:Remove()
		end
	end)
end
/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/