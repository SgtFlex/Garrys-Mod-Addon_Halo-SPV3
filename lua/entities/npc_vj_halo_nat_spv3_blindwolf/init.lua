AddCSLuaFile("shared.lua")
include('shared.lua')
include('bases/spv3_snpc_base/init.lua')/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/nature/blindwolf/blindwolf.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.HullType = HULL_MEDIUM
ENT.Appearance = {
	Color = Color(255,255, 255),
	Bodygroups = {0, 0},
	Skin = 0,
}
ENT.DisableBackBreak = true
ENT.StartHealth = 60
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.BloodColor = "Red" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.HasBloodPool = true -- Does it have a blood pool?
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by it or it witnesses another ally killed by it
ENT.BecomeEnemyToPlayerLevel = 0 -- Any time the player does something bad, the NPC's anger level raises by 1, if it surpasses this, it will become enemy!
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_EARTH_FAUNA"} -- NPCs with the same class with be allied to each other
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_Front", "Die_Left", "Die_Right"} -- Death Animations
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Behavior = VJ_BEHAVIOR_NEUTRAL
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------

ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 20
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.TimeUntilMeleeAttackDamage = 0.6 -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttack_NoProps = true -- If set to true, it won't attack or push any props (Mostly used with multiple melee attacks)
ENT.MeleeAttackDamage = 25
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackExtraTimers = {}
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 1.7
ENT.MeleeAttackDamageType = DMG_SLASH

ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {ACT_JUMP} -- Melee Attack Animations
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.canFlinch = 0
ENT.NextLeapAttackTime = 0 -- How much time until it can use a leap attack?

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".ogg", 70, 100, 1)
	elseif key == "Pain" then
		self:EmitSound((self.SoundTbl_Pain[math.random(1, #(self.SoundTbl_Pain))]))
	end
end

ENT.SoundTbl_Idle = {
"blindwolf/idle/idle (1).ogg",
"blindwolf/idle/idle (2).ogg",
"blindwolf/idle/idle (3).ogg",
}

ENT.SoundTbl_MeleeAttack = {
	"blindwolf/melee/melee (1).ogg",
	"blindwolf/melee/melee (2).ogg",
	"blindwolf/melee/melee (3).ogg",
}

ENT.SoundTbl_Death = {
	"blindwolf/death/death (1).ogg",
	"blindwolf/death/death (2).ogg",
	"blindwolf/death/death (3).ogg",
}
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/