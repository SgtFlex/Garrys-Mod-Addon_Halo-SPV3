AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 70
ENT.ShieldMaxHealth = 25
local headsOnly = {1, "C", "H"}
ENT.BodyGroups = "0"..table.concat({headsOnly[math.random(1, 3)], 3, 7, 2})

ENT.ExtraWeapons = {
	"weapon_vj_cov_spv3_plasmapistol",
	"weapon_vj_cov_spv3_plasmapistolBrute",
	"weapon_vj_cov_spv3_piercer"
}
ENT.Cooldown = 0
function ENT:CustomOnThink()
	if CurTime() < self.NextTalkTime then
		if self.MouthOpenness == 0 then
			self.MouthOpenness = math.random(10,70)
		else
			self.MouthOpenness = 0
		end
		self:SetPoseParameter("move_mouth", self.MouthOpenness)
	else
		self:SetPoseParameter("move_mouth",0)
	end
	self.Cooldown = self.Cooldown + 0.1
	if (math.random(1,25)==1 and self.Cooldown>=2 and self:GetEnemy() and self.KeyesBuff!=true) then
		self:VJ_ACT_PLAYACTIVITY("Cower_idle",true,1,false)
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Cower))
		self.Cooldown = 0
	end
end
function ENT:CustomOnPreInitialize()
	self.SoundTbl_OnKilledEnemy = {
		"crewman/killed_enemy/killed_enemy (1).ogg",
		"crewman/killed_enemy/killed_enemy (2).ogg",
		"crewman/killed_enemy/killed_enemy (3).ogg",
		"crewman/killed_enemy/killed_enemy (4).ogg",
		"crewman/killed_enemy/killed_enemy (5).ogg",
	}
	self.SoundTbl_Alert = {
		"crewman/seeFoe/seeFoe (1).ogg",
		"crewman/seeFoe/seeFoe (2).ogg",
		"crewman/seeFoe/seeFoe (3).ogg",
		"crewman/seeFoe/seeFoe (4).ogg",
		"crewman/seeFoe/seeFoe (5).ogg",
	}
	self.SoundTbl_Pain = {
		"crewman/pain/pain (1).ogg",
		"crewman/pain/pain (2).ogg",
		"crewman/pain/pain (3).ogg",

	}
	self.SoundTbl_Death = {
		"marine/death/death (1).ogg",
		"marine/death/death (2).ogg",
		"marine/death/death (3).ogg",
		"marine/death/death (4).ogg",
		"marine/death/death (5).ogg",
		"marine/death/death (6).ogg",
		"marine/death/death (7).ogg",
		"marine/death/death (8).ogg",
		"marine/death/death (9).ogg",
		"marine/death/death (10).ogg",
		"marine/death/death (11).ogg",
		"marine/death/death (12).ogg",
		"marine/death/death (13).ogg",
	}
	self.SoundTbl_OnGrenadeSight = {
	}
	self.SoundTbl_GrenadeAttack = {
		"crewman/firing/firing (1).ogg",
		"crewman/firing/firing (2).ogg",
		"crewman/firing/firing (3).ogg",
		"crewman/firing/firing (4).ogg",
	}
	self.SoundTbl_LostEnemy = {
		
	}
	self.SoundTbl_Investigate = {
		
	}
	self.SoundTbl_WeaponReload = {
		"crewman/cover/cover (1).ogg",
		"crewman/cover/cover (2).ogg",
		"crewman/cover/cover (3).ogg",
		"crewman/cover/cover (4).ogg",
		"crewman/cover/cover (5).ogg",
	}
	self.SoundTbl_AllyDeath = {
		"marine/ally_death/ally_death.ogg",
	}
	self.SoundTbl_Stuck = {
		"marine/stuck/stuck (1).ogg",
		"marine/stuck/stuck (2).ogg",
		"marine/stuck/stuck (3).ogg",
		"marine/stuck/stuck (4).ogg",
		"marine/stuck/stuck (5).ogg",
		"marine/stuck/stuck (6).ogg",
	}

	self.SoundTbl_Transform = {
		"marine/transform/transform (1).ogg",
		"marine/transform/transform (2).ogg",
		"marine/transform/transform (3).ogg",
		"marine/transform/transform (4).ogg",
		"marine/transform/transform (5).ogg",
		"marine/transform/transform (6).ogg",
		"marine/transform/transform (7).ogg",
	}
	self.SoundTbl_Suppressing = {
		"crewman/firing/firing (1).ogg",
		"crewman/firing/firing (2).ogg",
		"crewman/firing/firing (3).ogg",
		"crewman/firing/firing (4).ogg",
	}
	self.SoundTbl_Cower = {
		"crewman/cower/cower (1).ogg",
		"crewman/cower/cower (2).ogg",
		"crewman/cower/cower (3).ogg",
		"crewman/cower/cower (4).ogg",
	}
end

function ENT:SetPhysicalAppearance()
	self:SetColor(Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)))
	self:SetBodyGroups("0"..table.concat({headsOnly[math.random(1, 3)], 3, 7, 2}))
	self:SetSkin(self.Skins[math.random(1, 5)])
end