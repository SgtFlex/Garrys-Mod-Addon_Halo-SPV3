AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/elite/elite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(0,0,0)
ENT.bodyGroupTable = {
	1,
	2,
	0,
	7
}
ENT.StartHealth = 120
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldMaxHealth = 0
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.IsInvis = true

ENT.ExtraShotCount = 0
ENT.Skin=0
ENT.HasSword = true