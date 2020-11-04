AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.modelColor = Color(36,36,36)
ENT.bodyGroupTable = {
	1,
	2,
}
ENT.StartHealth = 50
ENT.ShieldHealth = 135
ENT.ExtraShotCount = 3
ENT.Skin=0
ENT.HasSword = true