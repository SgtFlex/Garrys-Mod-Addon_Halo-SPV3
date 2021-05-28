AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_flood_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
ENT.otherInit = function(entity) 
	entity.Appearance = {
		Color = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255)),
		Bodygroups = {1, 1, 1, 0, 1},
		Skin = 0,
	}
end
ENT.IsCarrier = true
ENT.StartHealth = 150
ENT.RemovableParts = {
	[500] = {Health = 15, Bodygroup = "Head", Execute = function(entity, dmginfo) 
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floododst_head.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[500]["Bodygroup"]), 2)
	end},
	[502] = {Health = 25, Bodygroup = "Right Arm", Execute = function(entity, dmginfo)
		local pos, ang = entity:GetBonePosition(27)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floododst_rightarm.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[502]["Bodygroup"]), 2)
		entity:DropWeapon()
	end},
	[503] = {Health = 25, Bodygroup = "Left Arm", Execute = function(entity, dmginfo)
		local pos, ang = entity:GetBonePosition(11)
		entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/flood/human/floodHuman_leftArm.mdl", {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodskin_xl.mdl", "models/hce/spv3/flood/human/floodskin_lg.mdl", "models/hce/spv3/flood/human/floodskin_md.mdl", "models/hce/spv3/flood/human/floodskin_sm.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:CreateGibEntity("obj_vj_gib", {"models/hce/spv3/flood/human/floodinnard_bone.mdl", "models/hce/spv3/flood/human/floodinnard_large.mdl", "models/hce/spv3/flood/human/floodinnard_largest.mdl"}, {Pos = pos, Ang = ang, BloodType = "Yellow"})
		entity:RemoveAllDecals()
		entity:SetBodygroup(entity:FindBodygroupByName(entity.RemovableParts[503]["Bodygroup"]), 1)
		entity.HasMeleeAttack = false
	end},
}