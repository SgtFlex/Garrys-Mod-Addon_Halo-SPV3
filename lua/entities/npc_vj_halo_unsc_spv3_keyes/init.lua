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

ENT.SoundTbl_OnKilledEnemy = {

}
ENT.SoundTbl_Alert = {

}
ENT.SoundTbl_Pain = {
	"keyes/pain/pain (1).ogg",
	"keyes/pain/pain (2).ogg",
	"keyes/pain/pain (3).ogg",
	"keyes/pain/pain (4).ogg",
	"keyes/pain/pain (5).ogg",

}
ENT.SoundTbl_Death = {
	"keyes/death/death (1).ogg",
	"keyes/death/death (2).ogg",
	"keyes/death/death (3).ogg",
	"keyes/death/death (4).ogg",
	"keyes/death/death (5).ogg",
	"keyes/death/death (6).ogg",
	"keyes/death/death (7).ogg",
}
ENT.SoundTbl_OnGrenadeSight = {

}
ENT.SoundTbl_GrenadeAttack = {

}
ENT.SoundTbl_LostEnemy = {
	
}
ENT.SoundTbl_Investigate = {
	
}
ENT.SoundTbl_WeaponReload = {


}
ENT.SoundTbl_AllyDeath = {

}
ENT.SoundTbl_Stuck = nil
ENT.SoundTbl_Transform = nil
ENT.SoundTbl_Suppressing = {

}