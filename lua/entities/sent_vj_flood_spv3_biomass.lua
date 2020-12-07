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
if (SERVER) then
	AddCSLuaFile()
	function ENT:CustomOnInitialize()
		self:SetHealth(self.StartHealth)
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


ENT.infFormCount = 5
ENT.infForm = nil
local spreadRadius = 275

function ENT:DoDeath()
	self.Bursted = true
	self:EmitSound("carrier/hkillbackgut/hkillbackgut.wav")
	local BlastInfo = DamageInfo()
	BlastInfo:SetDamageType(DMG_BLAST)
	BlastInfo:SetDamage(60 * GetConVarNumber("vj_spv3_damageModifier"))
	BlastInfo:SetDamagePosition(self:GetPos())
	BlastInfo:SetInflictor(self)
	BlastInfo:SetReportedPosition(self:GetPos())
	util.BlastDamageInfo(BlastInfo, self:GetPos(), 250)
	util.ScreenShake(self:GetPos(),16,100,1,800)
	ParticleEffect("hcea_flood_carrier_death", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
	if (math.random(0,1)==0 || self:GetBodygroup(1)==2) then
		self.infFormCount = (3 - self:GetBodygroup(1)) * math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
		for k=1, self.infFormCount do
			self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
			self.infForm:SetPos(self:GetPos())
			self.infForm:SetOwner(self)
			self.infForm:Spawn()
			local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 300))
			self.infForm:SetVelocity(velocity)
			self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
			self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
		end
	else
		for k=1, (3 - self:GetBodygroup(1)) do
			self.infForm = ents.Create(VJ_PICK(self.SpawnTable))
			self.infForm:SetPos(self:GetPos())
			self.infForm:SetOwner(self)
			self.infForm:Spawn()
			local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 300))
			self.infForm:SetVelocity(velocity)
			self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
			self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
		end
	end
	self:SetBodygroup(1, 3)
end
/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/