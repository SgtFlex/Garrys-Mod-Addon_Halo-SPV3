AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 250
ENT.BGs = {
	1,
	2,
}
ENT.Skins = {
	8
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
}
ENT.ColorRange = {Vector (255,255,255), Vector(255,255,255)}

function ENT:CustomOnPreInitialize()

self.SoundTbl_OnKilledEnemy = {
	"johnson/killed_enemy/killed_enemy (1).wav",
	"johnson/killed_enemy/killed_enemy (2).wav",
	"johnson/killed_enemy/killed_enemy (3).wav",
	"johnson/killed_enemy/killed_enemy (4).wav",
}
self.SoundTbl_Alert = {
	"johnson/seeFoe/seeFoe (1).wav",
	"johnson/seeFoe/seeFoe (2).wav",
	"johnson/seeFoe/seeFoe (3).wav",
	"johnson/seeFoe/seeFoe (4).wav",
	"johnson/seeFoe/seeFoe (5).wav",
	"johnson/seeFoe/seeFoe (6).wav",
	"johnson/seeFoe/seeFoe (7).wav",
	"johnson/seeFoe/seeFoe (8).wav",
	"johnson/seeFoe/seeFoe (9).wav",
}
self.SoundTbl_Pain = {
	"johnson/pain/pain (1).wav",
	"johnson/pain/pain (2).wav",
	"johnson/pain/pain (3).wav",
	"johnson/pain/pain (4).wav",
	"johnson/pain/pain (5).wav",
	"johnson/pain/pain (6).wav",
	"johnson/pain/pain (7).wav",
	"johnson/pain/pain (8).wav",
	"johnson/pain/pain (9).wav",
	"johnson/pain/pain (10).wav",
	"johnson/pain/pain (11).wav",
	"johnson/pain/pain (12).wav",
	"johnson/pain/pain (13).wav",
	"johnson/pain/pain (14).wav",
	"johnson/pain/pain (15).wav",
	"johnson/pain/pain (16).wav",
	"johnson/pain/pain (17).wav",
	"johnson/pain/pain (18).wav",

}
self.SoundTbl_Death = {
	"johnson/death/death (1).wav",
	"johnson/death/death (2).wav",
	"johnson/death/death (3).wav",
	"johnson/death/death (4).wav",
	"johnson/death/death (5).wav",
}
self.SoundTbl_Fall = {
	"johnson/fall/fall (1).wav",
	"johnson/fall/fall (2).wav",
	"johnson/fall/fall (3).wav",
	"johnson/fall/fall (4).wav",
	"johnson/fall/fall (5).wav",
	"johnson/fall/fall (6).wav",
	"johnson/fall/fall (7).wav",
}
self.SoundTbl_OnGrenadeSight = {
	"johnson/seeGrenade/seeGrenade (1).ogg",
	"johnson/seeGrenade/seeGrenade (2).ogg",
	"johnson/seeGrenade/seeGrenade (3).ogg",
}
self.SoundTbl_GrenadeAttack = {
	"johnson/throwGrenade/throwGrenade (1).ogg",
	"johnson/throwGrenade/throwGrenade (2).ogg",
	"johnson/throwGrenade/throwGrenade (3).ogg",
}
self.SoundTbl_LostEnemy = {
	
}
self.SoundTbl_Investigate = {
	
}
self.SoundTbl_WeaponReload = {
	"johnson/cover/cover (1).wav",
	"johnson/cover/cover (2).wav",
	"johnson/cover/cover (3).wav",
	"johnson/cover/cover (4).wav",

}
self.SoundTbl_AllyDeath = {
	"johnson/ally_death/ally_death (1).wav",
	"johnson/ally_death/ally_death (2).wav",
	"johnson/ally_death/ally_death (3).wav",
	"johnson/ally_death/ally_death (4).wav",
	"johnson/ally_death/ally_death (5).wav",
}
self.SoundTbl_Stuck = nil
self.SoundTbl_Transform = nil
self.SoundTbl_Suppressing = {
	"johnson/firing/firing (1).wav",
	"johnson/firing/firing (2).wav",
	"johnson/firing/firing (3).wav",
	"johnson/firing/firing (4).wav",
	"johnson/firing/firing (5).wav",
	"johnson/firing/firing (6).wav",
	"johnson/firing/firing (7).wav",
	"johnson/firing/firing (8).wav",
	"johnson/firing/firing (9).wav",
}
end