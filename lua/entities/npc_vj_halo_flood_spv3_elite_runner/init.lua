AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(127,0,0),
	Bodygroups = {0, 2, 0, 0, 0, 0},
	Skin = 0,
}
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 0
ENT.IsCarrier = true
