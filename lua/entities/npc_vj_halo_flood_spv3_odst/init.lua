AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM

ENT.Model = {"models/hce/spv3/flood/human/floodmarine.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(0,110,255)
ENT.bodyGroups = {1,1,1}
ENT.StartHealth = 150

ENT.infFormCount = 6
local spreadRadius = 175

ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.bodyParts = {
	Head = {Health = 50, Bodygroup = "Head", Removed = false},
	Right_Arm = {Health = 50, Bodygroup = "Right Arm", Removed = false},
	Left_Arm = {Health = 25, Bodygroup = "Left Arm", Removed = false},
	Inf_Form = {Health = 50, Bodygroup = "Inf Form", Removed = false},
}
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if (GetConVarNumber("vj_spv3_bonusInfForms")==0) then
		self.HasDeathRagdoll = true
		return
	end
	self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
	self:EmitSound("carrier/hkillbackgut/hkillbackgut.wav")
	timer.Simple(1.3,function() if self:IsValid() then
	local BlastInfo = DamageInfo()
	BlastInfo:SetDamageType(DMG_BLAST)
	BlastInfo:SetDamage(20 * GetConVarNumber("vj_spv3_damageModifier"))
	BlastInfo:SetDamagePosition(self:GetPos())
	BlastInfo:SetInflictor(self)
	BlastInfo:SetReportedPosition(self:GetPos())
	util.BlastDamageInfo(BlastInfo, self:GetPos(), 250)
	util.ScreenShake(self:GetPos(),16,100,1,800)
	ParticleEffect("hcea_flood_carrier_death", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
	//ParticleEffectAttach("hcea_flood_inf_death",PATTACH_POINT_FOLLOW,self,0)
	for k=1, self.infFormCount do
		self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
		self.infForm:SetPos(self:GetPos())
		self.infForm:SetOwner(self)
		self.infForm:Spawn()
		local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 200))
		self.infForm:SetVelocity(velocity)
		self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
		self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
	end
	-- local posone = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector1 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector1:SetPos(posone)
	-- infector1:SetAngles(self:GetAngles())
	-- infector1:Spawn()
	-- infector1:Activate()
	-- infector1:SetOwner(self)
	-- infector1:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local postwo = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector2 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector2:SetPos(postwo)
	-- infector2:SetAngles(self:GetAngles())
	-- infector2:Spawn()
	-- infector2:Activate()
	-- infector2:SetOwner(self)
	-- infector2:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local posthree = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector3 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector3:SetPos(posthree)
	-- infector3:SetAngles(self:GetAngles())
	-- infector3:Spawn()
	-- infector3:Activate()
	-- infector3:SetOwner(self)
	-- infector3:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local posfour = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector4 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector4:SetPos(posfour)
	-- infector4:SetAngles(self:GetAngles())
	-- infector4:Spawn()
	-- infector4:Activate()
	-- infector4:SetOwner(self)
	-- infector4:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
	
	-- local posfive = self:LocalToWorld(Vector(math.random(-20, 20),math.random(-20,20),0))
	-- local infector5 = ents.Create("npc_vj_halo_flood_spv3_infection")
	-- infector5:SetPos(posfive)
	-- infector5:SetAngles(self:GetAngles())
	-- infector5:Spawn()
	-- infector5:Activate()
	-- infector5:SetOwner(self)
	-- infector5:SetVelocity(Vector(math.random(-100,100), math.random(-100, 100), math.random(200, 500)))
		end
	end)
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter.IsCarrier = true
	self.imposter:SetOwner(self)
	self.imposter.Sequence = "Die_Airborne"
	local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
	if (dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()) then
		velocity = velocity * 0.3
	end
	self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
	self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
	self.imposter:Spawn()
end