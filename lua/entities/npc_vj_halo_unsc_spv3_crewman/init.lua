AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 45
ENT.BGs = {
	0,
	0,
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_plasmapistol",
	"weapon_vj_cov_spv3_plasmapistolBrute",
	"weapon_vj_cov_spv3_piercer"
}
ENT.ColorRange = {Vector (0,0,0), Vector(255,255,255)}
ENT.Cooldown = 0
function ENT:CustomOnThink()
	self.Cooldown = self.Cooldown + 0.1
	if (math.random(1,25)==1 and self.Cooldown>=2 and self:GetEnemy()) then
		self:VJ_ACT_PLAYACTIVITY("Cower_idle",true,1,false)
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Cower))
		self.Cooldown = 0
	end
end

ENT.SoundTbl_OnKilledEnemy = {
	"crewman/killed_enemy/killed_enemy (1).ogg",
	"crewman/killed_enemy/killed_enemy (2).ogg",
	"crewman/killed_enemy/killed_enemy (3).ogg",
	"crewman/killed_enemy/killed_enemy (4).ogg",
	"crewman/killed_enemy/killed_enemy (5).ogg",
}
ENT.SoundTbl_Alert = {
	"crewman/seeFoe/seeFoe (1).ogg",
	"crewman/seeFoe/seeFoe (2).ogg",
	"crewman/seeFoe/seeFoe (3).ogg",
	"crewman/seeFoe/seeFoe (4).ogg",
	"crewman/seeFoe/seeFoe (5).ogg",
}
ENT.SoundTbl_Pain = {
	"crewman/pain/pain (1).ogg",
	"crewman/pain/pain (2).ogg",
	"crewman/pain/pain (3).ogg",

}
ENT.SoundTbl_Death = {
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
ENT.SoundTbl_OnGrenadeSight = {
}
ENT.SoundTbl_GrenadeAttack = {
	"crewman/firing/firing (1).ogg",
	"crewman/firing/firing (2).ogg",
	"crewman/firing/firing (3).ogg",
	"crewman/firing/firing (4).ogg",
}
ENT.SoundTbl_LostEnemy = {
	
}
ENT.SoundTbl_Investigate = {
	
}
ENT.SoundTbl_WeaponReload = {
	"crewman/cover/cover (1).ogg",
	"crewman/cover/cover (2).ogg",
	"crewman/cover/cover (3).ogg",
	"crewman/cover/cover (4).ogg",
	"crewman/cover/cover (5).ogg",
}
ENT.SoundTbl_AllyDeath = {
	"marine/ally_death/ally_death.ogg",
}
ENT.SoundTbl_Stuck = {
	"marine/stuck/stuck (1).wav",
	"marine/stuck/stuck (2).wav",
	"marine/stuck/stuck (3).wav",
	"marine/stuck/stuck (4).wav",
	"marine/stuck/stuck (5).wav",
	"marine/stuck/stuck (6).wav",
}

ENT.SoundTbl_Transform = {
	"marine/transform/transform (1).wav",
	"marine/transform/transform (2).wav",
	"marine/transform/transform (3).wav",
	"marine/transform/transform (4).wav",
	"marine/transform/transform (5).wav",
	"marine/transform/transform (6).wav",
	"marine/transform/transform (7).wav",
}
ENT.SoundTbl_Suppressing = {
	"crewman/firing/firing (1).ogg",
	"crewman/firing/firing (2).ogg",
	"crewman/firing/firing (3).ogg",
	"crewman/firing/firing (4).ogg",
}
ENT.SoundTbl_Cower = {
	"crewman/cower/cower (1).ogg",
	"crewman/cower/cower (2).ogg",
	"crewman/cower/cower (3).ogg",
	"crewman/cower/cower (4).ogg",
}