AddCSLuaFile("shared.lua")
include('shared.lua')
include('bases/spv3_snpc_base/init.lua')/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/elite/elite_cov.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100
ENT.ShieldMaxHealth = 100
ENT.ShieldDelay = 6
ENT.ShieldRecharge = 1
ENT.Appearance = {
	Color = Color(40,60,200),
	Bodygroups = {0, 1, 2, 4},
	Skin = 1,
}
ENT.HasSword = false
ENT.BerserkChance = 20
ENT.HeadHitgroup = 507
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 50
	-- ====== Blood-Related Variables ====== --
ENT.BloodColor = "Purple" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack

-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.AnimTbl_MoveToCover = {ACT_RUN} -- The animation it plays when moving to a covered position
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_WeaponReload = {ACT_RELOAD} -- Animations that play when the SNPC reloads
-- ENT.AnimTbl_CallForHelp = {} -- Call For Help Animations
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.TimeUntilGrenadeIsReleased = 0.97 -- Time until the grenade is released
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Kill_F_Gut"} -- Death Animations
ENT.MaxJumpLegalDistance = VJ_Set(400,550) -- The max distance the NPC can jump (Usually from one node to another) | ( UP, DOWN )

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations

ENT.TimeUntilMeleeAttackDamage = 0.8 -- This counted in seconds | This calculates the time until it hits something
ENT.NextAnyAttackTime_Melee = 1.3333333333333 -- How much time until it can use any attack again? | Counted in Seconds
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.DropWeaponOnDeathAttachment = "Cannon" -- Which attachment should it use for the weapon's position
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.CanFlinch = 0 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 1
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"hit_f_chest", "hit_f_gut"}},
	{HitGroup = {501}, Animation = {"hit_f_left_thigh"}},
	{HitGroup = {502}, Animation = {"hit_f_left_foot"}},
	{HitGroup = {503}, Animation = {"hit_f_right_thigh"}},
	{HitGroup = {504}, Animation = {"hit_f_right_foot"}},
	{HitGroup = {505}, Animation = {"hit_f_left_arm"}},
	{HitGroup = {506}, Animation = {"hit_f_left_hand"}},
	{HitGroup = {508}, Animation = {"hit_f_right_arm"}},
	{HitGroup = {509}, Animation = {"hit_f_right_hand"}},
}
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
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true, npc_vj_halo_flood_spv3_carrier=true}
function ENT:CustomOnPreInitialize()
	self.voicePermutation = tostring(math.random(1,2))
	self.SoundTbl_Alert = {
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (1).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (2).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (3).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (4).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (5).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (6).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (7).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (8).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (9).ogg",
	"elite/elite0"..self.voicePermutation.."/seeFoe/seeFoe (10).ogg",
}
self.SoundTbl_AllyDeath = {
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (1).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (2).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (3).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (4).ogg",
	"elite/elite0"..self.voicePermutation.."/ally_death/ally_death (5).ogg",
}
self.SoundTbl_Berserk = {
	"elite/shared/berserk/berserk (1).ogg",
	"elite/shared/berserk/berserk (2).ogg",
}
self.SoundTbl_CallForHelp = {
	"elite/elite0"..self.voicePermutation.."/call_help (1).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (2).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (3).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (4).ogg",
	"elite/elite0"..self.voicePermutation.."/call_help (5).ogg",
}
self.SoundTbl_CombatIdle = {
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (1).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (2).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (3).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (4).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (5).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (6).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (7).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (8).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (9).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (10).ogg",
	"elite/elite0"..self.voicePermutation.."/combat_idle/combat_idle (11).ogg",
}
self.SoundTbl_Death = {
	"elite/elite0"..self.voicePermutation.."/death/death (1).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (2).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (3).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (4).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (5).ogg",
	"elite/elite0"..self.voicePermutation.."/death/death (6).ogg",
}
self.SoundTbl_Fall = {
	"elite/elite0"..self.voicePermutation.."/fall/fall (1).ogg",
	"elite/elite0"..self.voicePermutation.."/fall/fall (2).ogg",
	"elite/elite0"..self.voicePermutation.."/fall/fall (3).ogg",
	"elite/elite0"..self.voicePermutation.."/fall/fall (4).ogg",
}
self.SoundTbl_GrenadeAttack = {
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (1).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (2).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (3).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (4).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (5).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (6).ogg",
	"elite/elite0"..self.voicePermutation.."/throwGrenade/throwGrenade (7).ogg",
}
self.SoundTbl_Investigate = {
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (1).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (2).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (3).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (4).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (5).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (6).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (7).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (8).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (9).ogg",
	"elite/elite0"..self.voicePermutation.."/investigate/investigate (10).ogg",
}
self.SoundTbl_LostEnemy = {
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (1).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (2).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (3).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (4).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (5).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (6).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (7).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (8).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (9).ogg",
	"elite/elite0"..self.voicePermutation.."/lost_enemy/lost_enemy (10).ogg",
}
self.SoundTbl_OnGrenadeSight = {
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (1).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (2).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (3).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (4).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (5).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (6).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (7).ogg",
	"elite/elite0"..self.voicePermutation.."/seeGrenade/seeGrenade (8).ogg",
}
self.SoundTbl_OnKilledEnemy = {
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (1).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (2).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (3).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (4).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (5).ogg",
	"elite/elite0"..self.voicePermutation.."/killed_enemy/killed_enemy (6).ogg",
}
self.SoundTbl_OnReceiveOrder = {
	"elite/elite0"..self.voicePermutation.."/ok/ok (1).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (2).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (3).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (4).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (5).ogg",
	"elite/elite0"..self.voicePermutation.."/ok/ok (6).ogg",
}
self.SoundTbl_Pain = {
	"elite/elite0"..self.voicePermutation.."/pain/pain (1).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (2).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (3).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (4).ogg",
	"elite/elite0"..self.voicePermutation.."/pain/pain (5).ogg",
}
self.SoundTbl_Stuck = {
	"elite/elite0"..self.voicePermutation.."/stuck/stuck (1).ogg",
	"elite/elite0"..self.voicePermutation.."/stuck/stuck (2).ogg",
	"elite/elite0"..self.voicePermutation.."/stuck/stuck (3).ogg",
}
self.SoundTbl_Suppressing = {
	"elite/elite0"..self.voicePermutation.."/firing/firing (1).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (2).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (3).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (4).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (5).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (6).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (7).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (8).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (9).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (10).ogg",
	"elite/elite0"..self.voicePermutation.."/firing/firing (11).ogg",
}
self.SoundTbl_Transform = {
	"elite/elite0"..self.voicePermutation.."/transform/transform (1).ogg",
	"elite/elite0"..self.voicePermutation.."/transform/transform (2).ogg",
	"elite/elite0"..self.voicePermutation.."/transform/transform (3).ogg",
}
self.SoundTbl_WeaponReload = {
	"elite/elite0"..self.voicePermutation.."/cover/cover (1).ogg",
	"elite/elite0"..self.voicePermutation.."/cover/cover (2).ogg",
	"elite/elite0"..self.voicePermutation.."/cover/cover (3).ogg",
}
end

function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_AGITATED
    	self.WeaponAnimTranslations[ACT_COVER_LOW]					= ACT_COVER_LOW
    elseif (htype == "ar2") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_RIFLE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    	self.WeaponAnimTranslations[ACT_COVER_LOW]					= ACT_COVER_MED
    elseif (htype == "melee") then
    	self.WeaponAnimTranslations[ACT_IDLE]                 		= ACT_IDLE_MELEE
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_MP_RUN_MELEE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_MELEE_ATTACK2
    end
	return true
end

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("elite/shared/walk/walk ("..math.random(1,6)..").ogg", 80, 100, 1)
	elseif key == "Melee1" then
		self:EmitSound("elite/shared/stand_pistol_melee/stand_pistol_melee"..math.random(1,2)..".ogg", 80, 100, 1)
		self:EmitSound("elite/elite0"..self.voicePermutation.."/melee/melee ("..math.random(1,5)..").ogg", 80, 100, 1)
	elseif key == "Hit" then
		self:MeleeAttackCode()
	elseif key == "EvadeR" then
		self:EmitSound("elite/shared/stand_pistol_evade_right/stand_pistol_evade_right.ogg", 80, 100, 1)
		self:EmitSound("elite/elite0"..self.voicePermutation.."/dodge/dodge ("..math.random(1,4)..").ogg", 80, 100, 1)
	elseif key == "EvadeL" then
		self:EmitSound("elite/shared/stand_pistol_evade_left/stand_pistol_evade_left.ogg", 80, 100, 1)
		self:EmitSound("elite/elite0"..self.voicePermutation.."/dodge/dodge ("..math.random(1,4)..").ogg", 80, 100, 1)
	elseif key == "Pain" then
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Pain))
	end
end

function ENT:CustomOnAlert(ent) 
	if (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_energysword") then
		self:Berserk()
	end
end

ENT.HasStuck=false
ENT.Berserked=false
function ENT:Berserk()
	if self.Berserked==true or self.Dead==true then return end
	self:StopAllCommonSpeechSounds()
	self:PlaySoundSystem("GeneralSpeech", self.SoundTbl_Berserk)
	if (self.HasSword and IsValid(self:GetActiveWeapon()) and self:GetActiveWeapon():GetClass()!="weapon_vj_cov_spv3_energysword") then
		self:DropWeapon()
		timer.Simple(0.5, function() 
			if IsValid(self) and self.Dead==false then
				self:Give("weapon_vj_cov_spv3_energysword")
			end
		end)
	end
	self.Berserked=true
	self.MoveRandomlyWhenShooting = false
	self.AllowWeaponReloading = false -- If false, the SNPC will no longer reload
	self.WaitForEnemyToComeOut = false
	self.NoWeapon_UseScaredBehavior = false
	self:VJ_ACT_PLAYACTIVITY("Berserk", true, 2, false)
end

function ENT:MeleeAttackCode() //Setting melee damage type to DMG_CLUB
	if self.Dead == true or self.vACT_StopAttacks == true or self.Flinching == true or self.ThrowingGrenade == true then return end
	if self.StopMeleeAttackAfterFirstHit == true && self.AlreadyDoneMeleeAttackFirstHit == true then return end
	if /*self.VJ_IsBeingControlled == false &&*/ self.MeleeAttackAnimationFaceEnemy == true then self:FaceCertainEntity(self:GetEnemy(),true) end
	//self.MeleeAttacking = true
	local FindEnts = ents.FindInSphere(self:SetMeleeAttackDamagePosition(),self.MeleeAttackDamageDistance)
	local hitentity = false
	local HasHitNonPropEnt = false
	if FindEnts != nil then
		for _,v in pairs(FindEnts) do
			if (self.VJ_IsBeingControlled == true && self.VJ_TheControllerBullseye == v) or (v:IsPlayer() && v.IsControlingNPC == true) then continue end
			if (v:IsNPC() or (v:IsPlayer() && v:Alive() && GetConVar("ai_ignoreplayers"):GetInt() == 0)) && (self:Disposition(v) != D_LI) && (v != self) && (v:GetClass() != self:GetClass()) or (v:GetClass() == "prop_physics") or v:GetClass() == "func_breakable_surf" or v:GetClass() == "func_breakable" && (self:GetSightDirection():Dot((v:GetPos() -self:GetPos()):GetNormalized()) > math.cos(math.rad(self.MeleeAttackDamageAngleRadius))) then
				local doactualdmg = DamageInfo()
				doactualdmg:SetDamage(self:VJ_GetDifficultyValue(self.MeleeAttackDamage))
				if v:IsNPC() or v:IsPlayer() then doactualdmg:SetDamageForce(self:GetForward()*((doactualdmg:GetDamage()+100)*70)) end
				doactualdmg:SetInflictor(self)
				doactualdmg:SetDamageType(DMG_CLUB)
				doactualdmg:SetAttacker(self)
				v:TakeDamageInfo(doactualdmg, self)
				if v:IsPlayer() then
					v:ViewPunch(Angle(math.random(-1,1)*10,math.random(-1,1)*10,math.random(-1,1)*10))
				end
				VJ_DestroyCombineTurret(self,v)
				if v:GetClass() != "prop_physics" then HasHitNonPropEnt = true end
				if v:GetClass() == "prop_physics" && HasHitNonPropEnt == false then
					//if VJ_HasValue(self.EntitiesToDestoryModel,v:GetModel()) or VJ_HasValue(self.EntitiesToPushModel,v:GetModel()) then
					//hitentity = true else hitentity = false end
					hitentity = false
				else
					hitentity = true
				end
			end
		end
	end
	if hitentity == true then
		self:PlaySoundSystem("MeleeAttack")
		if self.StopMeleeAttackAfterFirstHit == true then self.AlreadyDoneMeleeAttackFirstHit = true /*self:StopMoving()*/ end
	else
		self:CustomOnMeleeAttack_Miss()
		self:PlaySoundSystem("MeleeAttackMiss", {}, VJ_EmitSound)
	end
	if self.AlreadyDoneFirstMeleeAttack == false && self.TimeUntilMeleeAttackDamage != false then
		self:MeleeAttackCode_DoFinishTimers()
	end
	self.AlreadyDoneFirstMeleeAttack = true
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/