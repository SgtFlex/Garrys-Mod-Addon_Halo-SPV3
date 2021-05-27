AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(127,0,0),
	Bodygroups = {0, 0, 2, 5},
	Skin = 2,
}
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 150
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 60