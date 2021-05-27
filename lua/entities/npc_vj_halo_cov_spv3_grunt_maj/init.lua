AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(127,63,63),
	Bodygroups = {1, 1},
	Skin = 0,
}
ENT.StartHealth = 75
-- ENT.ShieldHealth = 0
ENT.ExtraShotCount = 1
ENT.WeaponProfficiency = 40
ENT.RemovableParts[508]["Execute"] = function(entity, dmginfo)
	entity:Flee()
	entity:VJ_ACT_PLAYACTIVITY("h_b_gut", true, 1, false)
	entity:EmitSound("grunt/shared/grunt_backpack_destroyed/grunt_backpack_steam"..math.random(1,3)..".ogg", 80, 100, 1)
	local pos = entity:GetAttachment(entity:LookupAttachment("Backpack"))["Pos"] + entity:GetRight()*35 //Corrective position
	local ang = entity:GetAttachment(entity:LookupAttachment("Backpack"))["Ang"]
	local backpack = nil
	backpack = entity:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/grunt/garbage/tank_two.mdl"}, {Pos = pos, Ang = ang})
	backpack:SetColor(entity:GetColor())
	ParticleEffectAttach("GruntBackGasTank",PATTACH_POINT_FOLLOW,entity,entity:LookupAttachment("Backpack"))
end