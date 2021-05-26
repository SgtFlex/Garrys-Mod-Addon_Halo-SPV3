AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/brute/Brute.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(100,120,180)
ENT.bodyGroupTable = {
	1,
	1,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
}
ENT.helmet = "models/hce/spv3/cov/brute/garbage/minor_helmet.mdl"
ENT.Skin = 1
ENT.StartHealth = 200
//25 shields
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldMaxHealth = 0
ENT.ShieldCurrentHealth = ENT.ShieldMaxHealth
ENT.ShieldActivated = false
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?

ENT.ExtraShotCount = 3
ENT.WeaponProfficiency = 60
	-- ====== Blood-Related Variables ====== --
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:

ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_WeaponReload = {ACT_RELOAD} -- Animations that play when the SNPC reloads
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
ENT.AnimTbl_WeaponAttackFiringGesture = {ACT_GESTURE_RANGE_ATTACK1} -- Firing Gesture animations used when the SNPC is firing the weapon
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {} -- Death Animations
ENT.AnimTbl_CallForHelp = {"Warn"} -- Call For Help Animations
ENT.HasLostWeaponSightAnimation = true -- Set to true if you would like the SNPC to play a different animation when it has lost sight of the enemy and can't fire at it
ENT.AnimTbl_LostWeaponSight = {} -- The animations that it will play if the variable above is set to true
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDamage = 70
ENT.DisableMeleeAttackAnimation = false -- if true, it will disable the animation code
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the melee attack animation?
ENT.MeleeAttackDistance = 80 -- How close does it have to be until it attacks?
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 120 -- How far does the damage go?
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.TimeUntilMeleeAttackDamage = 0.8 -- This counted in seconds | This calculates the time until it hits something
ENT.NextAnyAttackTime_Melee = 1.3333333333333 -- How much time until it can use any attack again? | Counted in Seconds
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_Run = {ACT_RUN}
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.ExtraShotCount = 0
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.DropWeaponOnDeathAttachment = "Cannon" -- Which attachment should it use for the weapon's position

ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades
ENT.GrenadeAttackThrowDistanceClose = 250 -- How close until it stops throwing grenades
ENT.GrenadeAttackEntity = "obj_vj_cov_spv3_needler_nade" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeTypes = {
	"obj_vj_cov_spv3_gravity_nade",
	"obj_vj_cov_spv3_plasma_nade",
	"obj_vj_cov_spv3_cluster_nade",
	"obj_vj_cov_spv3_needler_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
}
ENT.GrenadeAttackModel = nil -- The model for the grenade entity
ENT.TimeUntilGrenadeIsReleased = 1 -- Time until the grenade is released
	-- ====== Animation Variables ====== --
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.HasWeaponBackAway = false -- Should the SNPC back away if the enemy is close?
ENT.NoWeapon_UseScaredBehavior = false -- Should it use the scared behavior when it sees an enemy and doesn't have a weapon?
ENT.CanThrowBackDetectedGrenades = false-- Should it try to pick up the detected grenade and throw it back to the enemy?
ENT.MaxJumpLegalDistance = VJ_Set(400,550) -- The max distance the NPC can jump (Usually from one node to another) | ( UP, DOWN )
ENT.UseTheSameGeneralSoundPitch = false
ENT.BruteSelector = math.Rand(0,2)
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_ar",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
}
ENT.CanFlinch = 1
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true, npc_vj_halo_flood_spv3_carrier=true}

ENT.SoundTbl_OnKilledEnemy = {
	"brute/killEnemy/killEnemy (1).ogg",
	"brute/killEnemy/killEnemy (2).ogg",
	"brute/killEnemy/killEnemy (3).ogg",
	"brute/killEnemy/killEnemy (4).ogg",
	"brute/killEnemy/killEnemy (5).ogg",
	"brute/killEnemy/killEnemy (6).ogg",
	"brute/killEnemy/killEnemy (7).ogg",
	"brute/killEnemy/killEnemy (8).ogg",
	"brute/killEnemy/killEnemy (9).ogg",
	"brute/killEnemy/killEnemy (10).ogg",
	"brute/killEnemy/killEnemy (11).ogg",
	"brute/killEnemy/killEnemy (12).ogg",
	"brute/killEnemy/killEnemy (13).ogg",
}
ENT.SoundTbl_Alert = {
	"brute/sightPlayer/seefoe (1).ogg",
	"brute/sightPlayer/seefoe (2).ogg",
	"brute/sightPlayer/seefoe (3).ogg",
	"brute/sightPlayer/seefoe (4).ogg",
	"brute/sightPlayer/seefoe (5).ogg",
	"brute/sightPlayer/seefoe (6).ogg",
	"brute/sightPlayer/seefoe (7).ogg",
	"brute/sightPlayer/seefoe (8).ogg",
	"brute/sightPlayer/seefoe (9).ogg",
	"brute/sightPlayer/seefoe (10).ogg",
	"brute/sightPlayer/seefoe (11).ogg",
	"brute/sightPlayer/seefoe (12).ogg",
	"brute/sightPlayer/seefoe (13).ogg",
}
ENT.SoundTbl_Pain = {
	"brute/pain/pain (1).ogg",
	"brute/pain/pain (2).ogg",
	"brute/pain/pain (3).ogg",
	"brute/pain/pain (4).ogg",
	"brute/pain/pain (5).ogg",
}
ENT.SoundTbl_CallForHelp = {

}
ENT.SoundTbl_Death = {
	"brute/selfDeath/selfDeath (1).ogg",
	"brute/selfDeath/selfDeath (2).ogg",
	"brute/selfDeath/selfDeath (3).ogg",
	"brute/selfDeath/selfDeath (4).ogg",
	"brute/selfDeath/selfDeath (5).ogg",
	"brute/selfDeath/selfDeath (6).ogg",
	"brute/selfDeath/selfDeath (7).ogg",
}
ENT.SoundTbl_OnGrenadeSight = {
	"brute/sightGrenade/sightGrenade (1).ogg",
	"brute/sightGrenade/sightGrenade (2).ogg",
	"brute/sightGrenade/sightGrenade (3).ogg",
	"brute/sightGrenade/sightGrenade (4).ogg",
	"brute/sightGrenade/sightGrenade (5).ogg",
	"brute/sightGrenade/sightGrenade (6).ogg",
	"brute/sightGrenade/sightGrenade (7).ogg",
	"brute/sightGrenade/sightGrenade (8).ogg",
	"brute/sightGrenade/sightGrenade (9).ogg",
	"brute/sightGrenade/sightGrenade (10).ogg",
	"brute/sightGrenade/sightGrenade (11).ogg",
	"brute/sightGrenade/sightGrenade (12).ogg",
	"brute/sightGrenade/sightGrenade (13).ogg",
	"brute/sightGrenade/sightGrenade (14).ogg",
	"brute/sightGrenade/sightGrenade (15).ogg",
}
ENT.SoundTbl_Fall = {
	"brute/fall/fall (1).ogg",
	"brute/fall/fall (2).ogg",
	"brute/fall/fall (3).ogg",
	"brute/fall/fall (4).ogg",
}
ENT.SoundTbl_GrenadeAttack = {
	"brute/throwGrenade/throwGrenade (1).ogg",
	"brute/throwGrenade/throwGrenade (2).ogg",
	"brute/throwGrenade/throwGrenade (3).ogg",
	"brute/throwGrenade/throwGrenade (4).ogg",
	"brute/throwGrenade/throwGrenade (5).ogg",
	"brute/throwGrenade/throwGrenade (6).ogg",
	"brute/throwGrenade/throwGrenade (7).ogg",
	"brute/throwGrenade/throwGrenade (8).ogg",
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"brute/meleeGrunt/melee (1).ogg",
	"brute/meleeGrunt/melee (2).ogg",
	"brute/meleeGrunt/melee (3).ogg",
	"brute/meleeGrunt/melee (4).ogg",
	"brute/meleeGrunt/melee (5).ogg",
	"brute/meleeGrunt/melee (6).ogg",
	"brute/meleeGrunt/melee (7).ogg",
	"brute/meleeGrunt/melee (8).ogg",
	"brute/meleeGrunt/melee (9).ogg",
	"brute/meleeGrunt/melee (10).ogg",
	"brute/meleeGrunt/melee (11).ogg",
}
ENT.SoundTbl_LostEnemy = {
	"brute/lostEnemy/taunt (1).ogg",
	"brute/lostEnemy/taunt (2).ogg",
	"brute/lostEnemy/taunt (3).ogg",
	"brute/lostEnemy/taunt (4).ogg",
	"brute/lostEnemy/taunt (5).ogg",
	"brute/lostEnemy/taunt (6).ogg",
	"brute/lostEnemy/taunt (7).ogg",
	"brute/lostEnemy/taunt (8).ogg",
	"brute/lostEnemy/taunt (9).ogg",
	"brute/lostEnemy/taunt (10).ogg",
	"brute/lostEnemy/taunt (11).ogg",
	"brute/lostEnemy/taunt (12).ogg",
	"brute/lostEnemy/taunt (13).ogg",
	"brute/lostEnemy/taunt (14).ogg",
	"brute/lostEnemy/taunt (15).ogg",
}
ENT.SoundTbl_Investigate = {
	"brute/investigate/investigate (1).ogg",
	"brute/investigate/investigate (2).ogg",
	"brute/investigate/investigate (3).ogg",
	"brute/investigate/investigate (4).ogg",
	"brute/investigate/investigate (5).ogg",
	"brute/investigate/investigate (6).ogg",
}
ENT.SoundTbl_OnReceiveOrder = {
	"brute/orderRe/orderRe (1).ogg",
	"brute/orderRe/orderRe (2).ogg",
	"brute/orderRe/orderRe (3).ogg",
	"brute/orderRe/orderRe (4).ogg",
	"brute/orderRe/orderRe (5).ogg",
	"brute/orderRe/orderRe (6).ogg",
}
ENT.SoundTbl_WeaponReload = {
	"brute/reload/reload (1).ogg",
	"brute/reload/reload (2).ogg",
	"brute/reload/reload (3).ogg",
	"brute/reload/reload (4).ogg",
	"brute/reload/reload (5).ogg",

}
ENT.SoundTbl_AllyDeath = {
	"brute/allyDeath/allyDeath (1).ogg",
	"brute/allyDeath/allyDeath (2).ogg",
	"brute/allyDeath/allyDeath (3).ogg",
	"brute/allyDeath/allyDeath (4).ogg",
	"brute/allyDeath/allyDeath (5).ogg",
	"brute/allyDeath/allyDeath (6).ogg",
	"brute/allyDeath/allyDeath (7).ogg",
}
ENT.SoundTbl_Berserk = {
	"brute/berserk/berserk (1).ogg",
	"brute/berserk/berserk (2).ogg",
	"brute/berserk/berserk (3).ogg",
}
ENT.SoundTbl_Stuck = {
	"brute/stuck/stuck (1).ogg",
	"brute/stuck/stuck (2).ogg",
	"brute/stuck/stuck (3).ogg",
	"brute/stuck/stuck (4).ogg",
	"brute/stuck/stuck (5).ogg",
	"brute/stuck/stuck (6).ogg",
	"brute/stuck/stuck (7).ogg",
	"brute/stuck/stuck (8).ogg",
	"brute/stuck/stuck (9).ogg",
	"brute/stuck/stuck (10).ogg",
	"brute/stuck/stuck (11).ogg",
	"brute/stuck/stuck (12).ogg",
}
ENT.SoundTbl_Transform = {
	"brute/transform/transform (1).ogg",
	"brute/transform/transform (2).ogg",
	"brute/transform/transform (3).ogg",
}

function ENT:CustomOnInitialize()
	self:RandomizeTraits()
	self:SetSkin(self.Skin)
	self:SetColor(self.modelColor)
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end
	self:SetCollisionBounds(Vector(-20, -20, 0), Vector(20, 20, 80))
	self:UseConVars()
end

function ENT:UseConVars()
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self.ShieldMaxHealth = self.ShieldMaxHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	self.ShieldCurrentHealth = self.ShieldMaxHealth
	self.CurrentHealth = self.StartHealth
	self:SetHealth(self.ShieldMaxHealth + self.StartHealth)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.UNSCWeps))
		end
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1) then
			self.GrenadeTypes = {
				"obj_vj_cov_spv3_gravity_nade",
				"obj_vj_cov_spv3_plasma_nade",
				"obj_vj_cov_spv3_cluster_nade",
				"obj_vj_unsc_spv3_frag_nade",
				"obj_vj_cov_spv3_needler_nade",
			}
			self.GrenadeWeps = {
				"weapon_vj_cov_spv3_needler_nade",
				"weapon_vj_cov_spv3_plasma_nade",
				"weapon_vj_cov_spv3_gravity_nade",
				"weapon_vj_cov_spv3_cluster_nade",
				"weapon_vj_unsc_spv3_frag_nade",
			}
		end
		self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	end)
	self.bodyParts = {
		Head = {Health = GetConVarNumber("vj_spv3_PrecisionThreshold"), Bodygroup = "Head", Removed = false},
	}
end

function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_PISTOL
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_PISTOL
    	self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1]		= ACT_GESTURE_RANGE_ATTACK_PISTOL
    elseif (htype == "ar2") then
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    	self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1]		= ACT_GESTURE_RANGE_ATTACK_AR2
    	self.WeaponAnimTranslations[ACT_RUN_PISTOL]					= ACT_RUN_RIFLE
    end
	return true
end

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("brute/footstep/footstep ("..math.random(1,2)..").ogg", 80, math.random(50,125), 0.5)
	elseif key == "Melee1" then
		self:EmitSound("elite/stand_pistol_melee/stand_pistol_melee"..math.random(1,2)..".ogg", 80, 100, 1)
		self:EmitSound("elite/melee/melee"..math.random(1,12)..".ogg", 80, 100, 1)
	elseif key == "Hit" then
		self:MeleeAttackCode()
	elseif key == "EvadeR" then
		self:EmitSound("elite/stand_pistol_evade_right/stand_pistol_evade_right.ogg", 80, 100, 1)
		self:EmitSound("elite/dodge/dodge"..math.random(1,6)..".ogg", 80, 100, 1)
	elseif key == "EvadeL" then
		self:EmitSound("elite/stand_pistol_evade_left/stand_pistol_evade_left.ogg", 80, 100, 1)
		self:EmitSound("elite/dodge/dodge"..math.random(1,6)..".ogg", 80, 100, 1)
	end
end

ENT.Berserked = false
ENT.EvadeCooldown = 0
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	self:VJ_ACT_PLAYACTIVITY(ACT_FLINCH_PHYSICS, false, false, false, 0, {AlwaysUseGesture=true})
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (math.random(0,2) == 2) then
		if (self.EvadeCooldown <= CurTime()) then
			if (math.random(0,1)==1) then
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false)
			end
			self.EvadeCooldown = CurTime() + 4
		end
	end
	if (self.ShieldActivated==true) then
		self:DamageShield(dmginfo)
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	if (hitgroup==500 and dmginfo:GetDamage()>=GetConVar("vj_spv3_PrecisionThreshold"):GetInt() and self.ShieldActivated==false) then
		self:DamageSpecialPart("Head", dmginfo)
	end
	self.DeathType = self:CheckForSpecialDeaths(dmginfo, hitgroup)
	if (self.DeathType != nil) then
		self:DoSpecialDeath(self.DeathType, dmginfo)
	end
end

function ENT:DamageShield(dmginfo)
	if (dmginfo:GetDamageType()==DMG_PLASMA or dmginfo:GetDamageType()==DMG_BURN or dmginfo:GetDamageType()==DMG_SLOWBURN) then
		dmginfo:ScaleDamage(2)
	end
	self.ShieldCurrentHealth = math.max(self.ShieldCurrentHealth - dmginfo:GetDamage(), 0)
	ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
	if (self.ShieldCurrentHealth <= 0 and self.ShieldActivated==true) then
		self:DisperseShield()
		self.CanFlinch = 1
		self:DoFlinch(dmginfo, hitgroup)
		self.CanFlinch = 0
	end
end

function ENT:DisperseShield(dmginfo)
	if (self.ShieldActivated == false) then return false end
	self.ShieldActivated = false
	self.Bleeds = true
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	return true
end

function ENT:DamageSpecialPart(specialPart, dmginfo)
	if (self.bodyParts[specialPart]["Removed"]==false) then
		self.bodyParts[specialPart]["Health"] = math.max(self.bodyParts[specialPart]["Health"] - dmginfo:GetDamage(), 0)
		if (self.bodyParts[specialPart]["Health"] <= 0) then
			self.bodyParts[specialPart]["Removed"]=true
			self:SetBodygroup(self:FindBodygroupByName(self.bodyParts[specialPart]["Bodygroup"]), 0)
			self:EmitSound("brute/fx/brute_armor_destroyed/cov_damage_small.wav")
			if (specialPart=="Head") then
				self:VJ_ACT_PLAYACTIVITY("Hit_Head", true, 1, false)
				local pos, ang = self:GetBonePosition(14)
				pos = pos + self:GetRight() * 75
				helmet = self:CreateGibEntity("obj_vj_metal_gib", {self.helmet}, {Pos = pos, Ang = ang, Vel = dmginfo:GetDamageForce()*0.3 + Vector(0,0,300)})
				helmet:SetColor(self:GetColor())
				helmet:SetSkin(self:GetSkin())
				self:EmitSound("brute/fx/brute_armor_destroyed/cov_damage_small.wav")
				if (math.abs(self.bodyParts["Head"]["Health"]) >= GetConVar("vj_spv3_PrecisionThreshold"):GetInt()) then
					dmginfo:SetDamage(self:Health())
				end
			end
		end
	end
end

function ENT:CheckForSpecialDeaths(dmginfo, hitgroup)
	if (hitgroup == 500 and dmginfo:GetDamage() >= GetConVarNumber("vj_spv3_PrecisionThreshold") and self.ShieldActivated==false and self.bodyParts["Head"]["Removed"]==true) then
		return "Headshot"
	elseif (dmginfo:GetAttacker():IsPlayer() && dmginfo:GetDamageType()==DMG_CLUB && Vector((dmginfo:GetDamagePosition() - self:GetPos()).x, (dmginfo:GetDamagePosition() - self:GetPos()).y, 0):Dot(Vector(self:GetForward().x, self:GetForward().y, 0)) < 0) then
		return "BackBreak"
	elseif (dmginfo:GetDamage() >= self:Health() and (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB)) then
		return "LargeForce"
	else
		return nil
	end
end

function ENT:DoSpecialDeath(typeDeath, dmginfo)
	if (typeDeath==nil) then
		return
	elseif (typeDeath=="BackBreak") then --Do the following when taking damage via DMG_CLUB to the back
		self.AlertFriendsOnDeath = false
		self:TakeDamage(self:Health(), dmginfo:GetAttacker(), dmginfo:GetInflictor())
	elseif (typeDeath=="Headshot") then --Do the following when dying via a headshot (above the precisionThreshold)
		dmginfo:SetDamage(self:Health())
	elseif (typeDeath=="LargeForce") then --Do the following when dying to DMG_CLUB with high force or DMG_BLAST
		self.HasDeathRagdoll = false
		self.HasDeathAnimation = false
		self.imposter = ents.Create("obj_vj_imposter")
		self.imposter:SetOwner(self)
		self.imposter.Sequence = "Die_Airborne"
		local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
		if (dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()) then
			velocity = velocity * 0.3
		end
		self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
		self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
		self.imposter:Spawn()
	end
end

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup) 
	if (self:Health()<self:GetMaxHealth()*.4 and self.Berserked==false) then
		self:Berserk()
	end
end

ENT.HasStuck=false
function ENT:Berserk()
	if self.Berserked==true or self.Dead==true then return end
	timer.Simple(0.1, function()
		if (!IsValid(self)) then return end
		self:PlaySoundSystem("GeneralSpeech", self.SoundTbl_Berserk)
	end)
	self.Berserked=true
	self.MoveRandomlyWhenShooting = false
	self.AllowWeaponReloading = false -- If false, the SNPC will no longer reload
	self.WaitForEnemyToComeOut = false
	self.NoWeapon_UseScaredBehavior = false
	self:VJ_ACT_PLAYACTIVITY("Berserk", true, 2, false)
	timer.Simple(2, function() 
		if (IsValid(self)) then
			timer.Create("Berserk"..self:GetCreationID(), 0.5, 0, function ()
				if (IsValid(self) and (IsValid(self:GetEnemy()))) then
					self:SetTarget(self:GetEnemy())
					self:VJ_TASK_GOTO_TARGET(movetype, function(x)
						x.CanShootWhenMoving = true
						x.ConstantlyFaceEnemyVisible = (IsValid(self:GetActiveWeapon()) and true) or false
					end)
				end
			end)
			timer.Create("Scream"..self:GetCreationID(), 4.5, 0, function()
				if (self.HasStuck==false and (IsValid(self:GetEnemy()))) then
					self:PlaySoundSystem("GeneralSpeech", self.SoundTbl_Berserk)
				end
			end)
		end
	end)
end

ENT.NextTalkTime = 0
ENT.MouthOpenness = 0
function ENT:CustomOnThink() //Is pretty much HL:Resurgence talk system. Maybe more complexity in the future?
	if CurTime() < self.NextTalkTime then
		if self.MouthOpenness == 0 then
			self.MouthOpenness = math.random(10,70)
		else
			self.MouthOpenness = 0
		end
		self:SetPoseParameter("move_mouth", self.MouthOpenness)
	else
		self:SetPoseParameter("move_mouth",0)
	end
end

function ENT:OnPlayCreateSound(sdData, sdFile)
	self.NextTalkTime = CurTime() + SoundDuration(sdFile)*3.5 --For some reason the soundduration is wrong. perhaps a bug with .ogg format?
end

//Brought over from sentinels addon, possibly old/outdated?
function ENT:CreateGibEntity(Ent,Models,Tbl_Features,CustomCode)
	// self:CreateGibEntity("prop_ragdoll","",{Pos=self:LocalToWorld(Vector(0,3,0)),Ang=self:GetAngles(),Vel=})
	if self.AllowedToGib == false then return end
	Ent = Ent or "prop_ragdoll"
	if Models == "UseAlien_Small" then Models = {"models/gibs/xenians/sgib_01.mdl","models/gibs/xenians/sgib_02.mdl","models/gibs/xenians/sgib_03.mdl"} end
	if Models == "UseAlien_Big" then Models = {"models/gibs/xenians/mgib_01.mdl","models/gibs/xenians/mgib_02.mdl","models/gibs/xenians/mgib_03.mdl","models/gibs/xenians/mgib_04.mdl","models/gibs/xenians/mgib_05.mdl","models/gibs/xenians/mgib_06.mdl","models/gibs/xenians/mgib_07.mdl"} end
	if Models == "UseHuman_Small" then Models = {"models/gibs/humans/sgib_01.mdl","models/gibs/humans/sgib_02.mdl","models/gibs/humans/sgib_03.mdl"} end
	if Models == "UseHuman_Big" then Models = {"models/gibs/humans/mgib_01.mdl","models/gibs/humans/mgib_02.mdl","models/gibs/humans/mgib_03.mdl","models/gibs/humans/mgib_04.mdl","models/gibs/humans/mgib_05.mdl","models/gibs/humans/mgib_06.mdl","models/gibs/humans/mgib_07.mdl"} end
	Models = VJ_PICKRANDOMTABLE(Models)
	local vTbl_BloodType = "Green"
	if VJ_HasValue({"models/gibs/xenians/sgib_01.mdl","models/gibs/xenians/sgib_02.mdl","models/gibs/xenians/sgib_03.mdl","models/gibs/xenians/mgib_01.mdl","models/gibs/xenians/mgib_02.mdl","models/gibs/xenians/mgib_03.mdl","models/gibs/xenians/mgib_04.mdl","models/gibs/xenians/mgib_05.mdl","models/gibs/xenians/mgib_06.mdl","models/gibs/xenians/mgib_07.mdl"},Models) then
		vTbl_BloodType = "Yellow"
	end
	vTbl_Features = Tbl_Features or {}
	vTbl_Position = vTbl_Features.Pos or self:GetPos() +self:OBBCenter()
	vTbl_Angle = vTbl_Features.Ang or Angle(math.Rand(-180,180),math.Rand(-180,180),math.Rand(-180,180)) //self:GetAngles()
	vTbl_Velocity_NoDamageForce = vTbl_Features.Vel_NoDmgForce or false -- If set to true, it won't add the damage force to the given velocity
	vTbl_Velocity = vTbl_Features.Vel or Vector(math.Rand(-100,100),math.Rand(-100,100),math.Rand(150,250)) -- Used to set the velocity | "UseDamageForce" = To use the damage's force only
	if self.LatestDmgInfo != nil then
		local dmgforce = self.LatestDmgInfo:GetDamageForce()/70
		if vTbl_Velocity_NoDamageForce == false && vTbl_Features.Vel != "UseDamageForce" then
			vTbl_Velocity = vTbl_Velocity + dmgforce
		end
		if vTbl_Features.Vel == "UseDamageForce" then
			vTbl_Velocity = dmgforce
		end
	end
	vTbl_AngleVelocity = vTbl_Features.AngVel or Vector(math.Rand(-200,200),math.Rand(-200,200),math.Rand(-200,200)) -- Angle velocity, how fast it rotates as it's flying
	vTbl_BloodType = vTbl_Features.BloodType or vTbl_BloodType -- Certain entities such as the VJ Gib entity, you can use this to set its gib type
	vTbl_BloodDecal = vTbl_Features.BloodDecal or "Default" -- The decal it spawns when it collides with something, leave empty to let the base decide
	vTbl_NoFade = vTbl_Features.NoFade or false -- Should it fade away and delete?
	vTbl_RemoveOnCorpseDelete = vTbl_Features.RemoveOnCorpseDelete or false -- Should the entity get removed if the corpse is removed?
	local gib = ents.Create(Ent)
	gib:SetModel(Models)
	gib:SetPos(vTbl_Position)
	gib:SetAngles(vTbl_Angle)
	if gib:GetClass() == "obj_vj_gib" then
		gib.BloodType = vTbl_BloodType
		gib.Collide_Decal = vTbl_BloodDecal
	end
	gib:Spawn()
	gib:Activate()
	gib.IsVJBase_Gib = true
	gib.RemoveOnCorpseDelete = vTbl_RemoveOnCorpseDelete
	if GetConVarNumber("vj_npc_gibcollidable") == 0 then gib:SetCollisionGroup(1) end
	local phys = gib:GetPhysicsObject()
	if IsValid(phys) then
		//phys:SetMass(60)
		phys:AddVelocity(vTbl_Velocity)
		phys:AddAngleVelocity(vTbl_AngleVelocity)
	end
	cleanup.ReplaceEntity(gib)
	if GetConVarNumber("vj_npc_fadegibs") == 1 && vTbl_NoFade == false then
		if gib:GetClass() == "prop_ragdoll" then gib:Fire("FadeAndRemove","",GetConVarNumber("vj_npc_fadegibstime")) end
		if gib:GetClass() == "prop_physics" then gib:Fire("kill","",GetConVarNumber("vj_npc_fadegibstime")) end
	end
	if vTbl_RemoveOnCorpseDelete == true then//self.Corpse:DeleteOnRemove(extraent)
		self.ExtraCorpsesToRemove_Transition[#self.ExtraCorpsesToRemove_Transition+1] = gib
	end
	if (CustomCode) then CustomCode(gib) end
	return gib
end