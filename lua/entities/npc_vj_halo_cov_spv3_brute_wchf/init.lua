AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_ult/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.bodyGroupTable = {
	5,
	2,
	2,
	0,
	3,
	3,
	2,
	1,
	1,
}
ENT.helmet = "models/hce/spv3/cov/brute/garbage/warchieftain_helmet.mdl"
ENT.Skin = 3
ENT.StartHealth = 250
ENT.ExtraShotCount = 3
ENT.modelColor = Color(255,191,0)
ENT.ShieldHealth = 300
ENT.BodyArmor = false
//250 health
//300 shields
//550 total health
ENT.bodyParts = {
	Head = {Health = GetConVarNumber("vj_spv3_PrecisionThreshold")*3, Bodygroup = "Head", Removed = false},
}
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_sg",
	"weapon_vj_unsc_spv3_sr",
	"weapon_vj_unsc_spv3_rl",
}