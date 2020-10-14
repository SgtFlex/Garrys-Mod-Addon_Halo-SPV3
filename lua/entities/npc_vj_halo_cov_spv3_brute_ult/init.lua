AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.bodyGroupTable = {
	3,
	2,
	1,
	0,
	2,
	1,
	2,
	0,
	1,
}
ENT.StartHealth = 230
ENT.ExtraShotCount = 3
ENT.modelColor = Color(155,155,155)

ENT.bodyParts = {
	Body = {Health = 0, Bodygroup = "Body", Removed = false},
}
ENT.Bleeds=false

ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
	"weapon_vj_unsc_spv3_sr",
}

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (self.bodyParts["Body"]["Removed"]==true and hitgroup==500) then
		dmginfo:ScaleDamage(3)
	end

end

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup) 
	if (self:Health()<self:GetMaxHealth()*.4 and self.Berserked==false) then
		self:Berserk()
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Berserk), 80, 100, 1)
		self.Berserked=true
	end
	if (self:Health()<self:GetMaxHealth()*.4 and self.bodyParts["Body"]["Removed"]==false) then
		self.bodyParts["Body"]["Removed"]=true
		self:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
		ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		self.Bleeds=true
		for k, v in pairs(self:GetBodyGroups()) do
			self:SetBodygroup(k, 0)
		end
	elseif self.bodyParts["Body"]["Removed"]==false then
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
	end
end