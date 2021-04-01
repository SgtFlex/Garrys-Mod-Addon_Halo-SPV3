AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 160
ENT.BGs = {
	3,
	3,
}
ENT.Skins = {
	9
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_plasmapistol",
	"weapon_vj_cov_spv3_plasmapistolBrute",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_piercer",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
}
ENT.ColorRange = {Vector (255,255,255), Vector(255,255,255)}
ENT.Cooldown = 0
function ENT:CustomOnThink()
	self.Cooldown = self.Cooldown + 0.1
	if (self.Cooldown>=5) then
		self.Cooldown = 0
		local allies = ents.FindInSphere(self:GetPos(), 3000)
		for k, v in pairs(allies) do
			if (v!=self and v:IsNPC() and string.find(tostring(v:GetClass()), "unsc")) then
				if (v.KeyesBuff == nil or v.KeyesBuff == false) then
					v.KeyesBuff = true
					v:SetHealth(v:Health() + v:GetMaxHealth()*0.35)
				end
				timer.Create("HealthReset"..v:GetCreationID(), 20, 1, function()
					if (IsValid(self) and IsValid(v)) then
						v:SetHealth(v:Health() - v:GetMaxHealth()*0.35)
						v.KeyesBuff = false
					end
				end)
			end

		end
		
	end
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	local allies = ents.FindInSphere(self:GetPos(), 3000)
	for k, v in pairs(allies) do
		if (string.find(tostring(v:GetClass()), "unsc") and v.KeyesBuff == true) then
			v:SetHealth(v:Health() - v:GetMaxHealth()*0.35)
			v.KeyesBuff = false
		end
	end
end

function ENT:CustomOnPreInitialize()
		self.BGs = {
		24,
		4,
		8,
		3,
	}
self.SoundTbl_OnKilledEnemy = {

}
self.SoundTbl_Alert = {

}
self.SoundTbl_Pain = {
	"keyes/pain/pain (1).ogg",
	"keyes/pain/pain (2).ogg",
	"keyes/pain/pain (3).ogg",
	"keyes/pain/pain (4).ogg",
	"keyes/pain/pain (5).ogg",

}
self.SoundTbl_Death = {
	"keyes/death/death (1).ogg",
	"keyes/death/death (2).ogg",
	"keyes/death/death (3).ogg",
	"keyes/death/death (4).ogg",
	"keyes/death/death (5).ogg",
	"keyes/death/death (6).ogg",
	"keyes/death/death (7).ogg",
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