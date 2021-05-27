AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_spc/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(255,255,255),
	Bodygroups = {1, 2},
	Skin = 0,
}
ENT.StartHealth = 105
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 60
ENT.ExtraWeapons = {
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_rl",
}
ENT.RemovableParts[505]["Execute"] = function(entity, dmginfo) 
	entity:Flee()
	entity:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
	entity:EmitSound("grunt/shared/grunt_mask_destroyed/grunt_backpack_steam"..math.random(1,3)..".ogg", 80, 100, 1)
	local pos, ang = entity:GetBonePosition(13)
	pos = pos + entity:GetRight()*35
	helmet = entity:CreateGibEntity("obj_vj_metal_gib", {"models/hce/spv3/cov/grunt/garbage/major_mask.mdl"}, {Pos = pos, Ang = ang})
	ParticleEffect("GruntMaskGas", pos - entity:GetRight()*35 , ang, entity)
end
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