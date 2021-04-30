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
ENT.bodyGroups = {1,1,1,0,0}
ENT.StartHealth = 150

ENT.infFormCount = 5
local spreadRadius = 50

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
	self:EmitSound("carrier/hkillbackgut/hkillbackgut.ogg")
	timer.Simple(1.3,function() 
		if self:IsValid() then
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
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			if (self.bodyParts["Right_Arm"]["Removed"] == false) then
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floododst_rightarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			end
			if (self.bodyParts["Left_Arm"]["Removed"] == false) then
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodhuman_leftarm.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			end
			if (self.bodyParts["Head"]["Removed"] == false) then
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floododst_head.mdl", {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300)), BloodType = "Yellow"})
			end
			//Vector(math.random(-150, 150), math.random(-150, 150), math.random(150, 300))
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



function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	self:EmitSound("infested_shared/hit/floodflesh_hit_small"..math.random(1,11)..".ogg", 80, 100, 1)
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
	if (hitgroup==502 and self.bodyParts["Right_Arm"]["Removed"]==false) then
		self.bodyParts["Right_Arm"]["Health"] = self.bodyParts["Right_Arm"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Right_Arm"]["Health"] <= 0) then
			self.bodyParts["Right_Arm"]["Removed"]=true
			local pos, ang = self:GetBonePosition(27)
			self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floododst_rightarm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Right_Arm"]["Bodygroup"]), 2)
			if (IsValid(self:GetActiveWeapon())) then
				local wep = ents.Create(self:GetActiveWeapon():GetClass())
				wep:SetPos(self:GetActiveWeapon():GetPos())
				wep:SetAngles(self:GetActiveWeapon():GetAngles())
				wep:Spawn()
				wep:GetPhysicsObject():SetVelocity(dmginfo:GetDamageForce()*0.3)
				self:GetActiveWeapon():Remove()
			end
		end
	elseif (hitgroup==503 and self.bodyParts["Left_Arm"]["Removed"]==false) then
		self.bodyParts["Left_Arm"]["Health"] = self.bodyParts["Left_Arm"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Left_Arm"]["Health"] <= 0) then
			self.bodyParts["Left_Arm"]["Removed"]=true
			
			local pos, ang = self:GetBonePosition(11)
			self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodHuman_leftArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Left_Arm"]["Bodygroup"]), 1)
			self.HasMeleeAttack = false
		end
	elseif (hitgroup==500 and self.bodyParts["Head"]["Removed"]==false) then
		self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Head"]["Health"] <= 0) then
			self.bodyParts["Head"]["Removed"]=true
			local pos, ang = self:GetBonePosition(24)
			self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floododst_head.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
			self:RemoveAllDecals()
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 2)
		end
	end
end