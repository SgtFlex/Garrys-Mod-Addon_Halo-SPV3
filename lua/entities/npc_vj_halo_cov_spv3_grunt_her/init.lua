AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/grunt/grunt2.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.VJ_NPC_Class = {"CLASS_HER"} -- NPCs with the same class with be allied to each other
ENT.modelColor = Color(145,160,120)
ENT.bodyGroupTable = {
	1,
	1,
}
ENT.StartHealth = 35
-- ENT.ShieldHealth = 0
ENT.ExtraShotCount = 1