AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(0,0,0),
	Bodygroups = {1, 2, 0, 7},
	Skin = 0,
}
ENT.HasSword = true
ENT.StartHealth = 120
ENT.ShieldMaxHealth = 0
ENT.IsInvis = true
ENT.ExtraShotCount = 0
