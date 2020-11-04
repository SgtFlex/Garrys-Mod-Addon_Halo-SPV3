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
function ENT:Initialize()
	self:SetSolid(SOLID_OBB)
	self:PhysicsInitBox(Vector(-25, -25, -12), Vector(25, 25, 12))
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
	self:Remove()
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