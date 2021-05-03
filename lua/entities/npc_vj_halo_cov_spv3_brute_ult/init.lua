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
ENT.Skin = 0
ENT.helmet = "models/hce/spv3/cov/brute/garbage/major_helmet.mdl"
ENT.StartHealth = 250
ENT.ShieldHealth = 75
ENT.BodyArmor = true
//made up
//250 health
//75 shields
//325 total health
ENT.ExtraShotCount = 3
ENT.modelColor = Color(155,155,155)

ENT.bodyParts = {
	Head = {Health = 0, Bodygroup = "Head", Removed = true},
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
	if self.ShieldActivated == true then
		self.Bleeds=false
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
		if (dmginfo:GetDamageType()==DMG_PLASMA or dmginfo:GetDamageType()==DMG_BURN or dmginfo:GetDamageType()==DMG_SLOWBURN) then
			self.ShieldCurrentHealth = math.Clamp((self.ShieldCurrentHealth - (dmginfo:GetDamage()*2)), 0, (self.ShieldCurrentHealth - (dmginfo:GetDamage()*2)))
		else
			self.ShieldCurrentHealth = math.Clamp((self.ShieldCurrentHealth - (dmginfo:GetDamage())), 0, (self.ShieldCurrentHealth - (dmginfo:GetDamage())))
		end
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	if (self.bodyParts["Head"]["Removed"]==true and hitgroup==500 and dmginfo:GetDamage() >= GetConVarNumber("vj_spv3_PrecisionThreshold") and self.ShieldCurrentHealth < dmginfo:GetDamage()) then
		dmginfo:SetDamage(self:Health())
	end
	if (hitgroup==500 and dmginfo:GetDamage()>=GetConVar("vj_spv3_PrecisionThreshold"):GetInt() and self.bodyParts["Head"]["Removed"]==false and self.ShieldCurrentHealth <= 0) then
		self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
		if (self.bodyParts["Head"]["Health"] <= 0) then
			self.bodyParts["Head"]["Removed"]=true
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 0)
			self:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
			local pos, ang = self:GetBonePosition(14)
			pos = pos + self:GetRight() * 75
			helmet = self:CreateGibEntity("obj_vj_metal_gib", {self.helmet}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3 + Vector(0,0,300)})
			helmet:SetColor(self:GetColor())
			helmet:SetSkin(self:GetSkin())
			self:EmitSound("brute/fx/brute_armor_destroyed/cov_damage_small.wav")
			if (math.abs(self.bodyParts["Head"]["Health"]) >= GetConVar("vj_spv3_PrecisionThreshold"):GetInt()) then
				dmginfo:SetDamage(self:Health())
			end
		end
	end
	
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
	if dmginfo:GetAttacker():IsPlayer() && dmginfo:GetDamageType()==DMG_CLUB && Vector((dmginfo:GetDamagePosition() - self:GetPos()).x, (dmginfo:GetDamagePosition() - self:GetPos()).y, 0):Dot(Vector(self:GetForward().x, self:GetForward().y, 0)) < 0 then
		self.AlertFriendsOnDeath = false
		self:TakeDamage(self:Health(), dmginfo:GetAttacker(), dmginfo:GetInflictor())
	end
end

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup) 
	self:SetHealth((self.ShieldCurrentHealth + self.CurrentHealth))
	if (self.ShieldCurrentHealth<=0 and self.ShieldActivated==true) then
		self.ShieldActivated=false
		self.Bleeds=true
		if (self.BodyArmor==true) then
			self.BodyArmor = false
			for k, v in pairs(self:GetBodyGroups()) do
				self:SetBodygroup(k, 0)
			end
			self:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
		end
		if (self.Berserked==false) then
			self:Berserk()
			self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Berserk), 80, 100, 1)
			self.Berserked=true
		end
		ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	end
end