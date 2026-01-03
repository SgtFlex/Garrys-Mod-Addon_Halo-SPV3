AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
ENT.Model = {"models/hce/spv3/unsc/marine/marine.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 90
ENT.HeadHitgroup = 504
ENT.ShieldMaxHealth = 55
ENT.ShieldIsArmor = true
ENT.Skins = {
	1,
	2,
	4,
	5,
	6,
}
ENT.Color = Color(255,255,255)
ENT.BodyGroups = "0"..table.concat({math.random(0,23), math.random(0,2), math.random(0,6), math.random(0,1)})
ENT.Skin = ENT.Skins[math.random(1, 5)]

//55 Shield
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.EntitiesToNoCollide = {"npc_vj_halo_flood_spv3_infection"}
ENT.CanCrouchOnWeaponAttack = true -- Can it crouch while shooting?
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.PlayerFriendly=true
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_UNSC", "CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it?
ENT.NextMoveOutOfFriendlyPlayersWayTime = 1 -- How much time until it can moves out of the player's way?
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player?
ENT.BecomeEnemyToPlayerLevel = 8 -- How many times does the player have to hit the SNPC for it to become enemy?
ENT.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
ENT.FollowPlayerChat = true -- Should the SNPCs say things like "They stopped following you"
ENT.FollowPlayerKey = "Use" -- The key that the player presses to make the SNPC follow them
ENT.FollowPlayerCloseDistance = 150 -- If the SNPC is that close to the player then stand still until the player goes farther away
ENT.NextFollowPlayerTime = 1 -- Time until it runs to the player again
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 3
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut","h_f_chest"}},
	{HitGroup = {501}, Animation = {"h_f_l_leg"}},
	{HitGroup = {502}, Animation = {"h_f_r_leg"}},
	{HitGroup = {503}, Animation = {"h_f_l_arm"}},
	{HitGroup = {505}, Animation = {"h_f_r_arm"}},
}
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4", "Die_5"}
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.DropWeaponOnDeathAttachment = "Cannon" -- Which attachment should it use for the weapon's position

ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.TimeUntilGrenadeIsReleased = 0.97 -- Time until the grenade is released
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_Run = {ACT_RUN}
ENT.AnimTbl_WeaponReload = {ACT_ARM} -- Animations that play when the SNPC reloads

ENT.GrenadeTypes = {
	"obj_vj_unsc_spv3_frag_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_unsc_spv3_frag_nade"
}

ENT.Faction = "UNSC"
ENT.ExtraWeapons = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
}

ENT.SoundTbl_Step = {
	"marine/shared/step/step (1).ogg",
	"marine/shared/step/step (2).ogg",
	"marine/shared/step/step (3).ogg",
	"marine/shared/step/step (4).ogg",
	"marine/shared/step/step (5).ogg",
	"marine/shared/step/step (6).ogg",
}
function ENT:SetPhysicalAppearance()
	self:SetColor(Color(255,255,255))
	local body = "0"..tostring(table.concat({0, math.random(0,2), math.random(0,6), math.random(0,1)}))
	self:SetBodyGroups(body)
	self:SetBodygroup(0, math.random(0, 23))
	self:SetSkin(self.Skins[math.random(1, 5)])
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol" and !string.find(tostring(self:GetActiveWeapon()), "cov")) then
        self.WeaponAnimTranslations[ACT_IDLE_ANGRY]                 = ACT_IDLE_PISTOL
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_PISTOL
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_PISTOL
    end
	return true
end

function ENT:CustomOnPreInitialize()
	self.voicePermutation = tostring(math.random(1,9))
	self.SoundTbl_OnKilledEnemy = {
		"marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (1).ogg",
		"marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (2).ogg",
		-- "marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (3).ogg",
		-- "marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/killed_enemy/killed_enemy (7).ogg",
	}
	self.SoundTbl_Alert = {
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (1).ogg",
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (2).ogg",
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (3).ogg",
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (4).ogg",
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (5).ogg",
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (6).ogg",
		"marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (7).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (8).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (9).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (10).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (11).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (12).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (13).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (14).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (15).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (16).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (17).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeFoe/seeFoe (18).ogg",
	}
	self.SoundTbl_Pain = {
		"marine/marine0"..self.voicePermutation.."/pain/pain (1).ogg",
		"marine/marine0"..self.voicePermutation.."/pain/pain (2).ogg",
		"marine/marine0"..self.voicePermutation.."/pain/pain (3).ogg",
		"marine/marine0"..self.voicePermutation.."/pain/pain (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (7).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (8).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (9).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (10).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (11).ogg",
		-- "marine/marine0"..self.voicePermutation.."/pain/pain (12).ogg",

	}
	self.SoundTbl_Death = {
		"marine/marine0"..self.voicePermutation.."/death/death (1).ogg",
		"marine/marine0"..self.voicePermutation.."/death/death (2).ogg",
		"marine/marine0"..self.voicePermutation.."/death/death (3).ogg",
		"marine/marine0"..self.voicePermutation.."/death/death (4).ogg",
		"marine/marine0"..self.voicePermutation.."/death/death (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (7).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (8).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (9).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (10).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (11).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (12).ogg",
		-- "marine/marine0"..self.voicePermutation.."/death/death (13).ogg",
	}
	self.SoundTbl_Fall = {
		"marine/marine0"..self.voicePermutation.."/fall/fall (1).ogg",
		"marine/marine0"..self.voicePermutation.."/fall/fall (2).ogg",
	}
	self.SoundTbl_OnGrenadeSight = {
		"marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (1).ogg",
		"marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (2).ogg",
		"marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (3).ogg",
		"marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (7).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (8).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (9).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (10).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (11).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (12).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (13).ogg",
		-- "marine/marine0"..self.voicePermutation.."/seeGrenade/seeGrenade (14).ogg",
	}
	self.SoundTbl_GrenadeAttack = {
		"marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (1).ogg",
		"marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (2).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (3).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (7).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (8).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (9).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (10).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (11).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (12).ogg",
		-- "marine/marine0"..self.voicePermutation.."/throwGrenade/throwGrenade (13).ogg",
	}

	self.SoundTbl_WeaponReload = {
		"marine/marine0"..self.voicePermutation.."/cover/cover (1).ogg",
		"marine/marine0"..self.voicePermutation.."/cover/cover (2).ogg",
		-- "marine/marine0"..self.voicePermutation.."/cover/cover (3).ogg",
		-- "marine/marine0"..self.voicePermutation.."/cover/cover (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/cover/cover (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/cover/cover (6).ogg",

	}
	self.SoundTbl_AllyDeath = {
		"marine/marine0"..self.voicePermutation.."/ally_death/ally_death (1).ogg",
		"marine/marine0"..self.voicePermutation.."/ally_death/ally_death (2).ogg",
		-- "marine/marine0"..self.voicePermutation.."/ally_death/ally_death (3).ogg",
		-- "marine/marine0"..self.voicePermutation.."/ally_death/ally_death (4).ogg",
	}
	self.SoundTbl_Stuck = {
		"marine/marine0"..self.voicePermutation.."/stuck/stuck (1).ogg",
		"marine/marine0"..self.voicePermutation.."/stuck/stuck (2).ogg",
		-- "marine/marine0"..self.voicePermutation.."/stuck/stuck (3).ogg",
		-- "marine/marine0"..self.voicePermutation.."/stuck/stuck (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/stuck/stuck (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/stuck/stuck (6).ogg",
	}

	self.SoundTbl_Transform = {
		"marine/marine0"..self.voicePermutation.."/transform/transform (1).ogg",
		-- "marine/marine0"..self.voicePermutation.."/transform/transform (2).ogg",
		-- "marine/marine0"..self.voicePermutation.."/transform/transform (3).ogg",
		-- "marine/marine0"..self.voicePermutation.."/transform/transform (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/transform/transform (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/transform/transform (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/transform/transform (7).ogg",
	}
	self.SoundTbl_Suppressing = {
		"marine/marine0"..self.voicePermutation.."/firing/firing (1).ogg",
		"marine/marine0"..self.voicePermutation.."/firing/firing (2).ogg",
		"marine/marine0"..self.voicePermutation.."/firing/firing (3).ogg",
		"marine/marine0"..self.voicePermutation.."/firing/firing (4).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (5).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (6).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (7).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (8).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (9).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (10).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (11).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (12).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (13).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (14).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (15).ogg",
		-- "marine/marine0"..self.voicePermutation.."/firing/firing (16).ogg",
	}
end
ENT.CustomCollision = {Min = Vector(-15,-15,0), Max = Vector(15,15,70)}
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound(VJ_PICK(self.SoundTbl_Step), 60, 100, 1)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/