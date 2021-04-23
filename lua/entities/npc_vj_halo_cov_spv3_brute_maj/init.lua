AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.bodyGroupTable = {
	2,
	1,
	0,
	0,
	1,
	0,
	1,
	0,
	0,
}
ENT.Skin = 2
ENT.StartHealth = 250
//35 shields
ENT.ExtraShotCount = 2
ENT.modelColor = Color(60,10,10)

ENT.bodyParts = {
	Head = {Health = GetConVarNumber("vj_spv3_PrecisionThreshold")*2, Bodygroup = "Head", Removed = false},
}
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
}