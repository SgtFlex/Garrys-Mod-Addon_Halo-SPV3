AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/grunt/grunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(255,255,255)
ENT.bodyGroupTable = {
	1,
	1,
}
ENT.StartHealth = 100
-- ENT.ShieldHealth = 0
ENT.ExtraShotCount = 5

ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_rl",
}