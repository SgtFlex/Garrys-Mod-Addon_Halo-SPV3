AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_hg_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Color = Color(182,182,182)
ENT.BodyGroups = "03223"
ENT.Skin = 0
ENT.HasSword = true
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 300
//Exception here, 375 just seems too high
ENT.ExtraShotCount = 4
ENT.WeaponProfficiency = 100