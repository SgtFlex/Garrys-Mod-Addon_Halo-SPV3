AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 50
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldHealth = 150
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.ShieldActivated=true
ENT.ShieldDelay = 6
ENT.CanFlinch = 0 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages

ENT.BGs = {
	4,
	4,
}
ENT.Skins = {
	9
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_particleCarbine",
}

ENT.GrenadeTypes = {
	"obj_vj_cov_spv3_gravity_nade",
	"obj_vj_cov_spv3_plasma_nade",
	"obj_vj_cov_spv3_cluster_nade",
	"obj_vj_unsc_spv3_frag_nade",
	"obj_vj_cov_spv3_needler_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
	"weapon_vj_unsc_spv3_frag_nade",
}

ENT.ColorRange = {Vector (170,200,120), Vector (170,200,120)}
function ENT:CustomOnPreInitialize()
self.SoundTbl_OnKilledEnemy = {

}
self.SoundTbl_Alert = {

}
self.SoundTbl_Pain = {

}
self.SoundTbl_Death = {
	"chief/death/death (1).ogg",
	"chief/death/death (2).ogg",
	"chief/death/death (3).ogg",
	"chief/death/death (4).ogg",
	"chief/death/death (5).ogg",
	"chief/death/death (6).ogg",
	"chief/death/death (7).ogg",
	"chief/death/death (8).ogg",
	"chief/death/death (9).ogg",
	"chief/death/death (10).ogg",
	"chief/death/death (11).ogg",
	"chief/death/death (12).ogg",
	"chief/death/death (13).ogg",
	"chief/death/death (14).ogg",
	"chief/death/death (15).ogg",
	"chief/death/death (16).ogg",
}
self.SoundTbl_OnGrenadeSight = {

}
self.SoundTbl_GrenadeAttack = {

}
self.SoundTbl_LostEnemy = {
	
}
self.SoundTbl_Investigate = {
	
}
self.SoundTbl_WeaponReload = {


}
self.SoundTbl_AllyDeath = {

}
self.SoundTbl_Stuck = nil
self.SoundTbl_Transform = nil
self.SoundTbl_Suppressing = {

}
end
function ENT:CustomOnInitialize()
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_UNSCCovWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.CovWeps))
		end
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	end)
	if (GetConVarNumber("vj_spv3_ffretal")==0) then 
		self.BecomeEnemyToPlayer = false -- Should the friendly SNPC become enemy towards the player if it's damaged by a player?
	end
	self:SetSkin(VJ_PICKRANDOMTABLE(self.Skins))
	self:SetCollisionBounds(Vector(20, 20, 75), Vector(-20, -20, 0))
	self:SetColor(Color(math.random(self.ColorRange[1].x, self.ColorRange[2].x),math.random(self.ColorRange[1].y, self.ColorRange[2].y) ,math.random(self.ColorRange[1].z, self.ColorRange[2].z)))
	self:SetBodygroup(0, self.BGs[1])
	self:SetBodygroup(1, self.BGs[2])
	-- Shields & Health --
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self.ShieldHealth = self.ShieldHealth * GetConVarNumber("vj_spv3_ShieldModifier")
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
	if self.ShieldActivated == true then
		self.Bleeds=false
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
		self.ShieldCurrentHealth = (self.ShieldCurrentHealth - dmginfo:GetDamage())
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	
end
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	self:SetHealth((self.ShieldCurrentHealth + self.CurrentHealth))
	if (self.ShieldCurrentHealth<=0) then
		self:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
		self.ShieldActivated=false
		self.Bleeds=true
	end
	if (timer.Exists("ShieldDelay"..self:GetCreationID())) then
		timer.Adjust("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1)
	else
		timer.Create("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1, function() 
			if (IsValid(self)) then
				self:StopParticles()
				self:EmitSound(Sound("ambient/energy/whiteflash.ogg"),80,115)
				ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				self.ShieldActivated = true
				self.ShieldCurrentHealth = self.ShieldHealth
				self:SetHealth(self.CurrentHealth + self.ShieldCurrentHealth)
				self.Bleeds=false
			end
		end)
	end
end

function ENT:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
	if self.ShieldActivated == false then return end
	self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
	self:EmitSound(Sound("ambient/energy/weld" .. math.random(1,2) .. ".ogg"),80,100)
	self:StopParticles()
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	ParticleEffectAttach("hcea_shield_enabled",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	self.ShieldActivated = false
end

function ENT:CheckForGrenades()
	if self.CanDetectGrenades == false or self.ThrowingGrenade == true or self.HasSeenGrenade == true or self.VJ_IsBeingControlled == true then return end
	local FindNearbyGrenades = ents.FindInSphere(self:GetPos(),self.RunFromGrenadeDistance)
	for _,v in pairs(FindNearbyGrenades) do
		local IsFriendlyGrenade = false
		if self.EntitiesToRunFrom[v:GetClass()] && self:Visible(v) then
			if IsValid(v:GetOwner()) && v:GetOwner().IsVJBaseSNPC == true && (self:Disposition(v:GetOwner()) == D_LI or self:Disposition(v:GetOwner()) == D_NU) then
				IsFriendlyGrenade = true
			end
			if IsFriendlyGrenade == false then
				self.HasSeenGrenade = true
				self.TakingCoverT = CurTime() + 4
				if /*IsValid(self:GetEnemy()) &&*/v.VJHumanNoPickup != true && v.VJHumanTossingAway != true && self.CanThrowBackDetectedGrenades == true && self.HasGrenadeAttack == true && v:GetVelocity():Length() < 400 && self:VJ_GetNearestPointToEntityDistance(v) < 100 && self.EntitiesToThrowBack[v:GetClass()] then
					self.NextGrenadeAttackSoundT = CurTime() + 3
					self:ThrowGrenadeCode(v,true)
					v.VJHumanTossingAway = true
					//v:Remove()
				end
				//if self.VJ_PlayingSequence == false then self:VJ_SetSchedule(SCHED_RUN_FROM_ENEMY) end
				self:SetAngles(Angle(self:GetAngles().x, (self:GetPos()-v:GetPos()):Angle().y,self:GetAngles().z))
				self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH",function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
				timer.Simple(4,function() if IsValid(self) then self.HasSeenGrenade = false end end)
				break;
				//else
				//self.HasSeenGrenade = false
				//return
			end
		end
	end
end