if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
AddCSLuaFile("shared.lua")
include("shared.lua")
/*--------------------------------------------------
	=============== VJ Prop Animatable Entity ===============
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to make simple props and animate them, since prop_dynamic doesn't work properly in Garry's Mod...


ENT.Sequence = ""
ENT.Velocity = Vector(0, 0, 0)
ENT.Angle = Angle(0, 0, 0)

--------------------------------------------------*/
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsCarrier = false

function ENT:Initialize()
	self:SetSolid(SOLID_OBB)
	self:PhysicsInitBox(Vector(-25, -25, 60), Vector(25, 25, 12)) //Was -25 -25 -12 before, but this seems to fix bodies getting stuck in roofs
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup(1)
	self:CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetModel(self:GetOwner():GetModel())
	self:SetColor(self:GetOwner():GetColor())
	self:SetPos(self:GetOwner():GetPos())
	self:SetSkin(self:GetOwner():GetSkin())
	if (self:GetOwner().SoundTbl_Fall) then
		self:EmitSound(VJ_PICKRANDOMTABLE(self:GetOwner().SoundTbl_Fall))
	end
	local bodygroups = self:GetOwner():GetBodyGroups()
	for k, v in pairs(bodygroups) do
		self:SetBodygroup(bodygroups[k]["id"], self:GetOwner():GetBodygroup(bodygroups[k]["id"]))
	end
	self:ResetSequenceInfo()
	self:SetSequence(self.Sequence)
	if (IsValid(self:GetPhysicsObject())) then
		self:GetPhysicsObject():SetVelocity(self.Velocity)
	end
	self:SetAngles(self.Angle)
end

ENT.FirstCollision = true
ENT.infFormCount = 6
local spreadRadius = 175
 function ENT:PhysicsCollide( data, phys )
 	if (self.FirstCollision == false) then return end
 	self.FirstCollision = false
 	self.ragdoll = ents.Create("prop_ragdoll")
	self.ragdoll:SetModel(self:GetModel())
	self.ragdoll:SetPos(self:GetPos())
	self.ragdoll:SetAngles(self:GetAngles())
	self.ragdoll:Spawn()
	self.ragdoll:SetSkin(self:GetSkin())
	local bodygroups = self:GetBodyGroups()
	for k, v in pairs(bodygroups) do
		self.ragdoll:SetBodygroup(bodygroups[k]["id"], self:GetBodygroup(bodygroups[k]["id"]))
	end
	self.ragdoll:SetColor(self:GetColor())
	for bonelim = 0, self.ragdoll:GetPhysicsObjectCount() - 1 do -- 128 = Bone Limit
		local childphys_bonepos, childphys_boneang = self:GetBonePosition(self.ragdoll:TranslatePhysBoneToBone(bonelim))
		local childphys = self.ragdoll:GetPhysicsObjectNum(bonelim)
		if IsValid(childphys) then
			childphys:SetAngles(childphys_boneang)
			childphys:SetPos(childphys_bonepos)
			childphys:SetVelocity(self:GetVelocity() * 1.5)
		end
	end



	if (self.IsCarrier==false) then
		self:Remove()
	else
		self:SetNoDraw(true)
		self:EmitSound("carrier/hkillbackgut/hkillbackgut.wav")
		timer.Simple(1, function()
			if (GetConVarNumber("vj_spv3_bonusInfForms")==0) then
				self.HasDeathRagdoll = true 
				return
			end
			self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
			
			local BlastInfo = DamageInfo()
			BlastInfo:SetDamageType(DMG_BLAST)
			BlastInfo:SetDamage(20 * GetConVarNumber("vj_spv3_damageModifier"))
			BlastInfo:SetDamagePosition(self.ragdoll:GetPos())
			BlastInfo:SetInflictor(self.ragdoll)
			BlastInfo:SetReportedPosition(self.ragdoll:GetPos())
			util.BlastDamageInfo(BlastInfo, self.ragdoll:GetPos(), 250)
			util.ScreenShake(self.ragdoll:GetPos(),16,100,1,800)
			ParticleEffect("hcea_flood_carrier_death", self.ragdoll:LocalToWorld(Vector(0,0,20)), self.ragdoll:GetAngles(), nil)
			//ParticleEffectAttach("hcea_flood_inf_death",PATTACH_POINT_FOLLOW,self,0)
			for k=1, self.infFormCount do
				self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
				self.infForm:SetPos(self.ragdoll:GetPos())
				self.infForm:SetOwner(self.ragdoll)
				self.infForm:Spawn()
				local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 200))
				self.infForm:SetVelocity(velocity)
				self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
				self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)		
			end
			self:Remove()
			self.ragdoll:Remove()
		end)
	end
 end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
	self:NextThink(CurTime())
	return true
end
/*--------------------------------------------------
	=============== VJ Prop Animatable Entity ===============
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to make simple props and animate them, since prop_dynamic doesn't work properly in Garry's Mod...
--------------------------------------------------*/