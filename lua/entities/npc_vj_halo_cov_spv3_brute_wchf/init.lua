AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_brute_min/init.lua')

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Color = Color(255,191,0)
ENT.BodyGroups = "0522033211"
ENT.Skin = 3
ENT.helmet = "models/hce/spv3/cov/brute/garbage/warchieftain_helmet.mdl"
ENT.StartHealth = 250
ENT.RemovableParts[500]["Health"] = GetConVar("vj_spv3_PrecisionThreshold"):GetInt()*4
ENT.ExtraShotCount = 3
ENT.ShieldMaxHealth = 300
//250 health
//300 shields
//550 total health
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_sg",
	"weapon_vj_unsc_spv3_sr",
	"weapon_vj_unsc_spv3_rl",
}