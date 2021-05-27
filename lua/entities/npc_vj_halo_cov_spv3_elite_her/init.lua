AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/elite/elite2.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.VJ_NPC_Class = {"CLASS_HER"} -- NPCs with the same class with be allied to each other
ENT.Appearance = {
	Color = Color(127,111,63),
	Bodygroups = {2, 2, 1, 1},
	Skin = 3,
}
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 150
ENT.ExtraShotCount = 2