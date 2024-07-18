AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Color = Color(0,0,0)
ENT.BodyGroups = "012"
ENT.Skin = 0
ENT.StartHealth = 75
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 50
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
	entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/cov/grunt/garbage/major_mask.mdl", 
		{
			Pos = pos, 
			Ang = ang,
			BloodDecal="",
			CollideSound={"phx/epicmetal_hard.wav", "phx/epicmetal_hard1.wav", "phx/epicmetal_hard2.wav", "phx/epicmetal_hard3.wav", "phx/epicmetal_hard4.wav", "phx/epicmetal_hard5.wav", "phx/epicmetal_hard6.wav", "phx/epicmetal_hard7.wav"},
		},
		function(gib) 
			gib:SetColor(entity:GetColor())
			gib:SetSkin(entity:GetSkin()) 
		end
	)
	ParticleEffect("GruntMaskGas", pos - entity:GetRight()*35 , ang, entity)
	if ((dmginfo:GetDamage() - entity.PreviousHealth) >= GetConVar("vj_spv3_PrecisionThreshold"):GetInt()) then
		dmginfo:SetDamage(entity:Health())
	end
end