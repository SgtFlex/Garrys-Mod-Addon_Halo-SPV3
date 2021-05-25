AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_unsc_spv3_marine/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100
ENT.ArmorMaxHealth = 65
//65 shields
ENT.BGs = {
	2,
	4,
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_particleCarbine",
}

function ENT:CustomOnPreInitialize()
	self.BGs = {
		25,
		5,
		9,
		4,
	}
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