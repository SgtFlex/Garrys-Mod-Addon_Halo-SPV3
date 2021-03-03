AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/flood/elite/floodelite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(127,0,0)
ENT.bodyGroupTable = {0, 1, 2, 2, 2}
ENT.Skin = 2
ENT.StartHealth = 75
ENT.ShieldHealth = 75
