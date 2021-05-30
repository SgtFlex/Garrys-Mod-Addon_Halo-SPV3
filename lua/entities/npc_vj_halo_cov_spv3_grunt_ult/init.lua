AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_spc/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(255,255,255),
	Bodygroups = {1, 2},
	Skin = 0,
}
ENT.StartHealth = 105
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 60
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_rl",
}