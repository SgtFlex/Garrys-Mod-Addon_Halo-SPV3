AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(170,200,110),
	Bodygroups = {},
	Skin = 0,
}
ENT.StartHealth = 50
ENT.ShieldMaxHealth = 150
ENT.ShieldIsArmor = false
ENT.CanFlinch = 0 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.Model = {"models/hce/spv3/unsc/chief/chief.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.ExtraWeapons = {
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

ENT.otherInit = function(entity) end
