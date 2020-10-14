AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 200
ENT.BGs = {
	1,
	2,
}
ENT.Skins = {
	3
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_plasmapistolBrute",
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
}
ENT.ColorRange = {Vector (255,255,255), Vector(255,255,255)}

ENT.SoundTbl_OnKilledEnemy = {
	"stacker/end_combat/end_combat (1).wav",
	"stacker/end_combat/end_combat (2).wav",
	"stacker/end_combat/end_combat (3).wav",
	"stacker/end_combat/end_combat (4).wav",
	"stacker/end_combat/end_combat (5).wav",
	"stacker/end_combat/end_combat (6).wav",
	"stacker/end_combat/end_combat (7).wav",
	"stacker/end_combat/end_combat (8).wav",
}
ENT.SoundTbl_Alert = {
	"stacker/seeFoe/seeFoe (1).wav",
	"stacker/seeFoe/seeFoe (2).wav",
	"stacker/seeFoe/seeFoe (3).wav",
	"stacker/seeFoe/seeFoe (4).wav",
	"stacker/seeFoe/seeFoe (5).wav",
	"stacker/seeFoe/seeFoe (6).wav",
	"stacker/seeFoe/seeFoe (7).wav",
	"stacker/seeFoe/seeFoe (8).wav",
	"stacker/seeFoe/seeFoe (9).wav",
}
ENT.SoundTbl_Pain = {
	"stacker/pain/pain (1).wav",
	"stacker/pain/pain (2).wav",
	"stacker/pain/pain (3).wav",
	"stacker/pain/pain (4).wav",
}
ENT.SoundTbl_Death = {
	"stacker/death/death (1).wav",
	"stacker/death/death (2).wav",
	"stacker/death/death (3).wav",
	"stacker/death/death (4).wav",
	"stacker/death/death (5).wav",
	"stacker/death/death (6).wav",
	"stacker/death/death (7).wav",
	"stacker/death/death (8).wav",
	"stacker/death/death (9).wav",
	"stacker/death/death (10).wav",
}
ENT.SoundTbl_OnGrenadeSight = {
	"stacker/seeGrenade/seeGrenade (1).wav",
	"stacker/seeGrenade/seeGrenade (2).wav",
	"stacker/seeGrenade/seeGrenade (3).wav",
	"stacker/seeGrenade/seeGrenade (4).wav",
	"stacker/seeGrenade/seeGrenade (5).wav",
}
ENT.SoundTbl_GrenadeAttack = {
	"stacker/throwGrenade/throwGrenade (1).wav",
	"stacker/throwGrenade/throwGrenade (2).wav",
	"stacker/throwGrenade/throwGrenade (3).wav",
	"stacker/throwGrenade/throwGrenade (4).wav",
	"stacker/throwGrenade/throwGrenade (5).wav",
	"stacker/throwGrenade/throwGrenade (6).wav",
}
ENT.SoundTbl_LostEnemy = {
	
}
ENT.SoundTbl_Investigate = {
	
}
ENT.SoundTbl_WeaponReload = {
	"stacker/cover/cover (1).wav",
	"stacker/cover/cover (2).wav",
	"stacker/cover/cover (3).wav",

}
ENT.SoundTbl_AllyDeath = {
	"stacker/ally_death/ally_death (1).wav",
	"stacker/ally_death/ally_death (2).wav",
	"stacker/ally_death/ally_death (3).wav",
	"stacker/ally_death/ally_death (4).wav",
	"stacker/ally_death/ally_death (5).wav",
	"stacker/ally_death/ally_death (6).wav",
}
ENT.SoundTbl_Stuck = {
	"stacker/stuck/stuck (1).wav",
	"stacker/stuck/stuck (2).wav",
}

ENT.SoundTbl_Transform = {
	"stacker/transform/transform.wav",
}
ENT.SoundTbl_Suppressing = {
	"stacker/firing/firing (1).wav",
	"stacker/firing/firing (2).wav",
	"stacker/firing/firing (3).wav",
	"stacker/firing/firing (4).wav",
	"stacker/firing/firing (5).wav",
	"stacker/firing/firing (6).wav",
	"stacker/firing/firing (7).wav",
	"stacker/firing/firing (8).wav",
	"stacker/firing/firing (9).wav",
}