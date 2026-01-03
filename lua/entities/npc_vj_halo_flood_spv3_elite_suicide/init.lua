AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_elite/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Color = Color(127,0,0)
ENT.BodyGroups = "0011110"
ENT.Skin = 2

ENT.StartHealth = 120
ENT.ShieldMaxHealth = 0
ENT.IsBomber = true