AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_jackal_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.ExtraShotCount = 0
ENT.Model = {"models/hce/spv3/cov/skirmisher/skirmisher.mdl"}
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
}
ENT.WeaponProfficiency = 70
ENT.ExtraShotCount = 1
ENT.StartHealth = 45
ENT.ShieldProjMaxHealth = 0
ENT.Appearance = {
	Color = Color(255,255,255),
	Bodygroups = {0, 0},
	Skin = 0,
}