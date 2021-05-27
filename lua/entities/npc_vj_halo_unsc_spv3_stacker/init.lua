AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 200
ENT.Appearance = {
	Color = Color(255,255,255),
	Bodygroups = {10, 1, 5, 1},
	Skin = 3,
}
ENT.otherInit = function(entity) end
ENT.ExtraWeapons = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
}

function ENT:CustomOnPreInitialize()
	self.SoundTbl_OnKilledEnemy = {
		"stacker/end_combat/end_combat (1).ogg",
		"stacker/end_combat/end_combat (2).ogg",
		"stacker/end_combat/end_combat (3).ogg",
		"stacker/end_combat/end_combat (4).ogg",
		"stacker/end_combat/end_combat (5).ogg",
		"stacker/end_combat/end_combat (6).ogg",
		"stacker/end_combat/end_combat (7).ogg",
		"stacker/end_combat/end_combat (8).ogg",
	}
	self.SoundTbl_Alert = {
		"stacker/seeFoe/seeFoe (1).ogg",
		"stacker/seeFoe/seeFoe (2).ogg",
		"stacker/seeFoe/seeFoe (3).ogg",
		"stacker/seeFoe/seeFoe (4).ogg",
		"stacker/seeFoe/seeFoe (5).ogg",
		"stacker/seeFoe/seeFoe (6).ogg",
		"stacker/seeFoe/seeFoe (7).ogg",
		"stacker/seeFoe/seeFoe (8).ogg",
		"stacker/seeFoe/seeFoe (9).ogg",
	}
	self.SoundTbl_Pain = {
		"stacker/pain/pain (1).ogg",
		"stacker/pain/pain (2).ogg",
		"stacker/pain/pain (3).ogg",
		"stacker/pain/pain (4).ogg",
	}
	self.SoundTbl_Death = {
		"stacker/death/death (1).ogg",
		"stacker/death/death (2).ogg",
		"stacker/death/death (3).ogg",
		"stacker/death/death (4).ogg",
		"stacker/death/death (5).ogg",
		"stacker/death/death (6).ogg",
		"stacker/death/death (7).ogg",
		"stacker/death/death (8).ogg",
		"stacker/death/death (9).ogg",
		"stacker/death/death (10).ogg",
	}
	self.SoundTbl_Fall = {
		"stacker/fall/fall (1).ogg",
		"stacker/fall/fall (2).ogg",
		"stacker/fall/fall (3).ogg",
		"stacker/fall/fall (4).ogg",
	}
	self.SoundTbl_OnGrenadeSight = {
		"stacker/seeGrenade/seeGrenade (1).ogg",
		"stacker/seeGrenade/seeGrenade (2).ogg",
		"stacker/seeGrenade/seeGrenade (3).ogg",
		"stacker/seeGrenade/seeGrenade (4).ogg",
		"stacker/seeGrenade/seeGrenade (5).ogg",
	}
	self.SoundTbl_GrenadeAttack = {
		"stacker/throwGrenade/throwGrenade (1).ogg",
		"stacker/throwGrenade/throwGrenade (2).ogg",
		"stacker/throwGrenade/throwGrenade (3).ogg",
		"stacker/throwGrenade/throwGrenade (4).ogg",
		"stacker/throwGrenade/throwGrenade (5).ogg",
		"stacker/throwGrenade/throwGrenade (6).ogg",
	}
	self.SoundTbl_LostEnemy = {
		
	}
	self.SoundTbl_Investigate = {
		
	}
	self.SoundTbl_WeaponReload = {
		"stacker/cover/cover (1).ogg",
		"stacker/cover/cover (2).ogg",
		"stacker/cover/cover (3).ogg",

	}
	self.SoundTbl_AllyDeath = {
		"stacker/ally_death/ally_death (1).ogg",
		"stacker/ally_death/ally_death (2).ogg",
		"stacker/ally_death/ally_death (3).ogg",
		"stacker/ally_death/ally_death (4).ogg",
		"stacker/ally_death/ally_death (5).ogg",
		"stacker/ally_death/ally_death (6).ogg",
	}
	self.SoundTbl_Stuck = {
		"stacker/stuck/stuck (1).ogg",
		"stacker/stuck/stuck (2).ogg",
	}

	self.SoundTbl_Transform = {
		"stacker/transform/transform.ogg",
	}
	self.SoundTbl_Suppressing = {
		"stacker/firing/firing (1).ogg",
		"stacker/firing/firing (2).ogg",
		"stacker/firing/firing (3).ogg",
		"stacker/firing/firing (4).ogg",
		"stacker/firing/firing (5).ogg",
		"stacker/firing/firing (6).ogg",
		"stacker/firing/firing (7).ogg",
		"stacker/firing/firing (8).ogg",
		"stacker/firing/firing (9).ogg",
	}
end