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
	"johnson/killed_enemy/killed_enemy (1).ogg",
	"johnson/killed_enemy/killed_enemy (2).ogg",
	"johnson/killed_enemy/killed_enemy (3).ogg",
	"johnson/killed_enemy/killed_enemy (4).ogg",
}
self.SoundTbl_Alert = {
	"johnson/seeFoe/seeFoe (1).ogg",
	"johnson/seeFoe/seeFoe (2).ogg",
	"johnson/seeFoe/seeFoe (3).ogg",
	"johnson/seeFoe/seeFoe (4).ogg",
	"johnson/seeFoe/seeFoe (5).ogg",
	"johnson/seeFoe/seeFoe (6).ogg",
	"johnson/seeFoe/seeFoe (7).ogg",
	"johnson/seeFoe/seeFoe (8).ogg",
	"johnson/seeFoe/seeFoe (9).ogg",
}
self.SoundTbl_Pain = {
	"johnson/pain/pain (1).ogg",
	"johnson/pain/pain (2).ogg",
	"johnson/pain/pain (3).ogg",
	"johnson/pain/pain (4).ogg",
	"johnson/pain/pain (5).ogg",
	"johnson/pain/pain (6).ogg",
	"johnson/pain/pain (7).ogg",
	"johnson/pain/pain (8).ogg",
	"johnson/pain/pain (9).ogg",
	"johnson/pain/pain (10).ogg",
	"johnson/pain/pain (11).ogg",
	"johnson/pain/pain (12).ogg",
	"johnson/pain/pain (13).ogg",
	"johnson/pain/pain (14).ogg",
	"johnson/pain/pain (15).ogg",
	"johnson/pain/pain (16).ogg",
	"johnson/pain/pain (17).ogg",
	"johnson/pain/pain (18).ogg",

}
self.SoundTbl_Death = {
	"johnson/death/death (1).ogg",
	"johnson/death/death (2).ogg",
	"johnson/death/death (3).ogg",
	"johnson/death/death (4).ogg",
	"johnson/death/death (5).ogg",
}
self.SoundTbl_Fall = {
	"johnson/fall/fall (1).ogg",
	"johnson/fall/fall (2).ogg",
	"johnson/fall/fall (3).ogg",
	"johnson/fall/fall (4).ogg",
	"johnson/fall/fall (5).ogg",
	"johnson/fall/fall (6).ogg",
	"johnson/fall/fall (7).ogg",
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
	"johnson/cover/cover (1).ogg",
	"johnson/cover/cover (2).ogg",
	"johnson/cover/cover (3).ogg",
	"johnson/cover/cover (4).ogg",

}
self.SoundTbl_AllyDeath = {
	"johnson/ally_death/ally_death (1).ogg",
	"johnson/ally_death/ally_death (2).ogg",
	"johnson/ally_death/ally_death (3).ogg",
	"johnson/ally_death/ally_death (4).ogg",
	"johnson/ally_death/ally_death (5).ogg",
}
self.SoundTbl_Stuck = nil
self.SoundTbl_Transform = nil
self.SoundTbl_Suppressing = {
	"johnson/firing/firing (1).ogg",
	"johnson/firing/firing (2).ogg",
	"johnson/firing/firing (3).ogg",
	"johnson/firing/firing (4).ogg",
	"johnson/firing/firing (5).ogg",
	"johnson/firing/firing (6).ogg",
	"johnson/firing/firing (7).ogg",
	"johnson/firing/firing (8).ogg",
	"johnson/firing/firing (9).ogg",
}
end