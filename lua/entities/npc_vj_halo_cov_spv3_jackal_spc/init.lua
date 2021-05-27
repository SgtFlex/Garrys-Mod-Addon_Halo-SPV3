AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_jackal_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 75
ENT.ShieldProjMaxHealth = 450
ENT.Appearance = {
	Color = Color(80,80,80),
	Bodygroups = {1, 2},
	Skin = 0,
}
ENT.WeaponProfficiency = 80
ENT.ExtraShotCount = 4