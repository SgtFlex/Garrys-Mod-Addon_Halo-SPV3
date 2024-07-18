AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Color = Color(40,60,200)
ENT.BodyGroups = "03223"
ENT.Skin = 1
ENT.HasSword = true
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 150
//In SPV3 their shields are immune to ballistic weapons but the same as a sheild minor aside from that
//I think it would be better to just have 1.5x shields perhaps?
ENT.ExtraShotCount = 3
ENT.WeaponProfficiency = 100