AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(60,10,10),
	Bodygroups = {2, 1, 0, 0, 1, 0, 1, 0, 0},
	Skin = 2,
}
ENT.helmet = "models/hce/spv3/cov/brute/garbage/major_helmet.mdl"
ENT.StartHealth = 250
ENT.RemovableParts[500]["Health"] = GetConVar("vj_spv3_PrecisionThreshold"):GetInt()*2
//35 shields
ENT.ExtraShotCount = 2
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
}