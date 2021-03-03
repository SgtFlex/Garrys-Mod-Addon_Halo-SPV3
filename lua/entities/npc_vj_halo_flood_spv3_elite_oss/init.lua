AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/flood/elite/floodelite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(0,0,0)
ENT.bodyGroups = {0, 0, 0, 0, 0}

ENT.StartHealth = 63
ENT.ShieldHealth = 0
ENT.SpawnedFromInf=false
function ENT:CustomOnInitialize()
	self.material = self:GetMaterial()
	self:SetMaterial("models/props_c17/frostedglass_01a")
	self:AddFlags(FL_NOTARGET)
		timer.Simple(0.01, function() 
		if (math.random(0,100) <= GetConVarNumber("vj_spv3_floodWeps")) then
			self:Give(VJ_PICKRANDOMTABLE(self.WeaponTable))
		end
	end)
		timer.Simple(0.02, function()
		if (IsValid(self:GetActiveWeapon())) then
			self.weaponMaterial = self:GetActiveWeapon():GetMaterial()
			self:GetActiveWeapon():SetMaterial("models/props_c17/frostedglass_01a")
		end
	end)
	self:SetSkin(self.Skin)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_floodWeps")==1 and math.random(0,1)==1) then
			self:Give(VJ_PICKRANDOMTABLE(self.WeaponTable))
		end
	end)
	self:SetColor(self.modelColor)
	for i=0, #self.bodyGroupTable-1 do
		self:SetBodygroup(i, self.bodyGroupTable[i+1])
	end
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetCollisionBounds(Vector(30, 30, 80), Vector(-30, -30, 0))
	-- Shields --
	if (self.SpawnedFromInf==false) then
		self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
		self.ShieldHealth = self.ShieldHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	end
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self.ShieldActivated = true
	self:SetHealth(self.ShieldHealth + self.StartHealth)
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	self:SetMaterial(self.material)
	self:RemoveFlags(FL_NOTARGET)
	if (IsValid(self:GetActiveWeapon())) then
		self:GetActiveWeapon():SetMaterial(self.weaponMaterial)
	end
	timer.Create("Uncloak"..self:GetCreationID(), 1, 1, function()
		if (IsValid(self) and self:Health()>0) then
			self:SetMaterial("models/props_c17/frostedglass_01a")
			self:AddFlags(FL_NOTARGET)
			if (IsValid(self:GetActiveWeapon())) then
				self:GetActiveWeapon():SetMaterial("models/props_c17/frostedglass_01a")
			end
		end
	end)
	if (self.ShieldCurrentHealth <= 0) then
		if (hitgroup==502 and self.bodyParts["Right_Arm"]["Removed"]==false) then
			self.bodyParts["Right_Arm"]["Health"] = self.bodyParts["Right_Arm"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Right_Arm"]["Health"] <= 0) then
				self.bodyParts["Right_Arm"]["Removed"]=true
				local pos, ang = self:GetBonePosition(29)
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_leftArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Right_Arm"]["Bodygroup"]), 3)
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
				local pos, ang = self:GetBonePosition(13)
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_rightArm.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Left_Arm"]["Bodygroup"]), 3)
				self.HasMeleeAttack = false
			end
		elseif (hitgroup==500 and self.bodyParts["Head"]["Removed"]==false) then
			self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Head"]["Health"] <= 0) then

				self.bodyParts["Head"]["Removed"]=true
				local pos, ang = self:GetBonePosition(26)
				self:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/elite/floodElite_head.mdl", {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 1)
			end
		elseif (hitgroup==501 and self.bodyParts["Inf_Form"]["Removed"]==false) then
			self.bodyParts["Inf_Form"]["Health"] = self.bodyParts["Inf_Form"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Inf_Form"]["Health"] <= 0) then
				self.bodyParts["Inf_Form"]["Removed"]=true
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3, BloodType = "Yellow"})
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Inf_Form"]["Bodygroup"]), 1)
				self:EmitSound("infection_form/infection_pop/pop1.ogg")
				ParticleEffect("hcea_flood_infected_death", self:LocalToWorld(Vector(0,0,50)), self:GetAngles() + Angle(90,0,0), nil)
				self:TakeDamage(1000, dmginfo:GetAttacker(), dmginfo:GetInflictor())
			end
		end
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.imposter = ents.Create("obj_vj_imposter")
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

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
end