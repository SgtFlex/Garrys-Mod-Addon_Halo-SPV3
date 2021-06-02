AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_grunt_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.otherInit = function(entity) 
	entity.Appearance = {
		Color = Color(math.random(0, 255),math.random(0, 255),math.random(0, 255)),
		Bodygroups = {math.random(1, 2), math.random(1, 2)},
		Skin = 0,
	}
	if (entity.Appearance["Bodygroups"][1]==1) then
		entity.RemovableParts[508]["Execute"] = function(entity, dmginfo)
			entity:Flee()
			entity:VJ_ACT_PLAYACTIVITY("h_b_gut", true, 1, false)
			entity:EmitSound("grunt/shared/grunt_backpack_destroyed/grunt_backpack_steam"..math.random(1,3)..".ogg", 80, 100, 1)
			local pos = entity:GetAttachment(entity:LookupAttachment("Backpack"))["Pos"] + entity:GetRight()*35 //Corrective position
			local ang = entity:GetAttachment(entity:LookupAttachment("Backpack"))["Ang"]
			entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/cov/grunt/garbage/tank_two.mdl", 
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
			backpack:SetColor(entity:GetColor())
			ParticleEffectAttach("GruntBackGasTank",PATTACH_POINT_FOLLOW,entity,entity:LookupAttachment("Backpack"))
		end
	end
	if (entity.Appearance["Bodygroups"][2]==2) then
		entity.RemovableParts[505]["Execute"] = function(entity, dmginfo) 
			entity:Flee()
			entity:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
			entity:EmitSound("grunt/shared/grunt_mask_destroyed/grunt_backpack_steam"..math.random(1,3)..".ogg", 80, 100, 1)
			local pos, ang = entity:GetBonePosition(13)
			pos = pos + entity:GetRight()*35
			entity:CreateGibEntity("obj_vj_gib", "models/hce/spv3/cov/grunt/garbage/tank_two.mdl", 
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
	end
	entity.StartHealth = math.random(45, 105)
	if (math.random(0, 4)==0) then
		entity.ShieldMaxHealth = math.random(0, 100)
		entity.ShieldRecharge = (math.random(0.5, 2))
		entity.ShieldDelay = (math.random(1, 10))
	end
	entity.ExtraShotCount = math.random(0, 4)
	entity.WeaponProfficiency = math.random(50, 100)
	if (math.random(0,4)==0) then
		entity.IsInvis = true
	else
		entity.IsInvis = false
	end
end