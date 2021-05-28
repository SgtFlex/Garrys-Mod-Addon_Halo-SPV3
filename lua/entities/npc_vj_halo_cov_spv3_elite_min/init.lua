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
ENT.Model = {"models/hce/spv3/cov/elite/elite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
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
ENT.AnimTbl_WeaponReload = {ACT_ARM} -- Animations that play when the SNPC reloads
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
ENT.MeleeAttackDamage = 70
ENT.DisableMeleeAttackAnimation = false -- if true, it will disable the animation code
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the melee attack animation?
ENT.MeleeAttackDistance = 80 -- How close does it have to be until it attacks?
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 90 -- How far does the damage go?
ENT.MeleeAttackDamageAngleRadius = 45 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
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

function ENT:SelectSchedule() //Line (this + 164) changed last param from true to false to fix sword melee
	if self.VJ_IsBeingControlled == true then return end
	self:CustomOnSchedule()
	if self.DisableSelectSchedule == true or self.Dead == true then return end
	
	if !IsValid(self:GetEnemy()) then -- Idle Behavior --
		if self.ThrowingGrenade == false then
			self:DoIdleAnimation()
		end
		if self.Alerted == false then
			self.TakingCoverT = 0
		end
		self:IdleSoundCode()
		self.NoWeapon_UseScaredBehavior_Active = false
	else -- Combat Behavior --
		local wep = self:GetActiveWeapon()
		local ene = self:GetEnemy()
		
		if self.LatestEnemyDistance < self.SightDistance then -- If the enemy is in sight then continue
			self:IdleSoundCode()
			
			-- Scared behavior system
			if !IsValid(wep) && self.NoWeapon_UseScaredBehavior == true && CurTime() > self.NextChaseTime then
				self.NoWeapon_UseScaredBehavior_Active = true -- Tells the idle system to use the scared behavior animation
				if self.FollowingPlayer == false then
					if self:Visible(ene) then
						self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
						return
					else
						self:DoIdleAnimation(2)
					end
				end
			else -- Not scared, return back to normal
				self.NoWeapon_UseScaredBehavior_Active = false
			end
			
			local enepos_eye = ene:EyePos()
			local enedist_eye = self:EyePos():Distance(enepos_eye)
			local dontshoot = false
			
			-- Back away from the enemy if it's to close
			if self.HasWeaponBackAway == true && (IsValid(wep) && (!wep.IsMeleeWeapon)) && self.LatestEnemyDistance <= self.WeaponBackAway_Distance && CurTime() > self.TakingCoverT && CurTime() > self.NextChaseTime && self.MeleeAttacking == false && self.FollowingPlayer == false && self.ThrowingGrenade == false && self.VJ_PlayingSequence == false && ene.Behavior != VJ_BEHAVIOR_PASSIVE && self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos()+self:OBBCenter()),enepos_eye) == false then
				local checkDist = self:VJ_CheckAllFourSides(200)
				local randmove = {}
				if checkDist.Backward == true then randmove[#randmove+1] = "Backward" end
				if checkDist.Right == true then randmove[#randmove+1] = "Right" end
				if checkDist.Left == true then randmove[#randmove+1] = "Left" end
				local pickmove = VJ_PICK(randmove)
				if pickmove == "Backward" then self:SetLastPosition(self:GetPos() + self:GetForward()*math.random(-200,-200)) end
				if pickmove == "Right" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(200,200)) end
				if pickmove == "Left" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(-200,-200)) end
				if pickmove == "Backward" or pickmove == "Right" or pickmove == "Left" then
					self.IsReloadingWeapon = false
					self.TakingCoverT = CurTime() + 2
					dontshoot = true
					self:VJ_TASK_GOTO_LASTPOS("TASK_RUN_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
				end
			end
			
			if dontshoot == false && self:IsAbleToShootWeapon(false, false, enedist_eye) == true && self:GetState() != VJ_STATE_ONLY_ANIMATION_NOATTACK then
				if enedist_eye > self.Weapon_FiringDistanceFar or CurTime() < self.NextWeaponAttackT then -- Enemy to far away or not allowed to fire a weapon
					self:DoChaseAnimation()
					self.AllowToDo_WaitForEnemyToComeOut = false
				elseif self:IsAbleToShootWeapon(true, true, enedist_eye) == true then -- Check if enemy is in sight, then continue...
					//self:VJ_ForwardIsHidingZone(self:EyePos(), enepos_eye, true, {Debug=true})
					-- If I can't see the enemy then either wait for it or charge at the enemy
					if self:VJ_ForwardIsHidingZone(self:EyePos(), enepos_eye, true) == true && self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() + self:OBBCenter()) + self:GetUp()*30, enepos_eye + self:GetUp()*30, true) /*or self:VJ_ForwardIsHidingZone(util.VJ_GetWeaponPos(self),enepos_eye) == true*/ /*or (!self:Visible(ene))*/ then -- Chase enemy or wait for enemy if hiding
						if self.WaitForEnemyToComeOut == true && (!wep.IsMeleeWeapon) && self.AllowToDo_WaitForEnemyToComeOut == true && self.IsReloadingWeapon == false && self.Weapon_TimeSinceLastShot <= 5 && self.WaitingForEnemyToComeOut == false && (enedist_eye < self.Weapon_FiringDistanceFar) && (enedist_eye > self.WaitForEnemyToComeOutDistance) then
						-- Wait for the enemy to come out
							self.WaitingForEnemyToComeOut = true
							if self.HasLostWeaponSightAnimation == true then
								self:VJ_ACT_PLAYACTIVITY(self.AnimTbl_LostWeaponSight, false, 0, true)
							end
							self.NextChaseTime = CurTime() + math.Rand(self.WaitForEnemyToComeOutTime.a, self.WaitForEnemyToComeOutTime.b)
						elseif /*self.DisableChasingEnemy == false &&*/ self.IsReloadingWeapon == false && CurTime() > self.LastHiddenZoneT then
						-- Go after the enemy!
							self.DoingWeaponAttack = false
							self.DoingWeaponAttack_Standing = false
							self:DoChaseAnimation()
						end
					else -- I can see the enemy...
						self.AllowToDo_WaitForEnemyToComeOut = true
						if (wep.IsVJBaseWeapon) then -- VJ Base weapons
							self:FaceCertainEntity(ene,true)
							local dontattack = false
							// self:DoChaseAnimation()
							-- if covered, try to move forward by calculating the distance between the prop and the NPC
							local covered_npc, covertr = self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() + self:OBBCenter()), enepos_eye, false, {SetLastHiddenTime=true})
							local covered_wep, guncovertr = self:VJ_ForwardIsHidingZone(wep:GetNW2Vector("VJ_CurBulletPos"), enepos_eye, false)
							//print("Is covered? ",covered_npc)
							//print("Is gun covered? ",covered_wep)
							local covered_isobj = true
							if covered_npc == false or (IsValid(covertr.Entity) && (covertr.Entity:IsNPC() or covertr.Entity:IsPlayer())) then
								covered_isobj = false
							end
							if !wep.IsMeleeWeapon then
								-- If ally in line of fire, then move
								if covered_isobj == false && self.DoingWeaponAttack_Standing == true && CurTime() > self.TakingCoverT && IsValid(guncovertr.Entity) && guncovertr.Entity:IsNPC() && guncovertr.Entity != self && (self:Disposition(guncovertr.Entity) == D_LI or self:Disposition(guncovertr.Entity) == D_NU) && guncovertr.HitPos:Distance(guncovertr.StartPos) <= 3000 then
									local checkDist = self:VJ_CheckAllFourSides(40)
									local randmove = {}
									if checkDist.Right == true then randmove[#randmove+1] = "Right" end
									if checkDist.Left == true then randmove[#randmove+1] = "Left" end
									local pickmove = VJ_PICK(randmove)
									if pickmove == "Right" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(30,40)) end
									if pickmove == "Left" then self:SetLastPosition(self:GetPos() + self:GetRight()*math.random(-40,-30)) end
									if pickmove == "Right" or pickmove == "Left" then
										self:StopMoving()
										self.NextChaseTime = CurTime() + 1
										self:VJ_TASK_GOTO_LASTPOS("TASK_WALK_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
									end
								end
								
								-- If the NPC is behind cover...
								if covered_npc == true then
									self.WeaponUseEnemyEyePos = true -- Make the bullet direction go towards the head of the enemy
									if CurTime() < self.TakingCoverT then dontattack = true end -- Behind cover and is taking cover, don't fire!
									
									if dontattack == false && CurTime() > self.NextMoveOnGunCoveredT && ((covertr.HitPos:Distance(self:GetPos()) > 150 && covered_isobj == true) or (covered_wep == true && !guncovertr.Entity:IsNPC() && !guncovertr.Entity:IsPlayer())) then
										local calc;
										local enepos;
										if IsValid(covertr.Entity) then
											calc = self:VJ_GetNearestPointToEntity(covertr.Entity, true)
											enepos = calc.EnemyPosition - self:GetForward()*15
										else
											calc = self:VJ_GetNearestPointToVector(covertr.HitPos, true)
											enepos = calc.PointPosition - self:GetForward()*15
										end
										if calc.MyPosition:Distance(enepos) <= 1000 then
											self:SetLastPosition(enepos)
											//VJ_CreateTestObject(enepos, self:GetAngles(), Color(0,255,255))
											local vsched = ai_vj_schedule.New("vj_goto_cover")
											vsched:EngTask("TASK_GET_PATH_TO_LASTPOSITION", 0)
											vsched:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
											vsched.IsMovingTask = true
											vsched.ConstantlyFaceEnemy = true
											vsched.StopScheduleIfNotMoving_Any = true
											local coveranim = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_MoveToCover))
											if VJ_AnimationExists(self, coveranim) == true then
												self:SetMovementActivity(coveranim)
											else
												vsched.CanShootWhenMoving = true
												vsched.MoveType = 1
											end
											self:StartSchedule(vsched)
											//self:VJ_TASK_GOTO_LASTPOS("TASK_WALK_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
										end
										self.NextMoveOnGunCoveredT = CurTime() + 2
									end
								else -- NPC not covered
									self.WeaponUseEnemyEyePos = false -- Make the bullet direction go towards the center of the enemy rather then its head
								end
							end
							
							if dontattack == false && CurTime() > self.NextWeaponAttackT && CurTime() > self.NextWeaponAttackT_Base /*&& self.DoingWeaponAttack == false*/ then
								-- Melee weapons
								if (wep.IsMeleeWeapon) then
									self:CustomOnWeaponAttack()
									local finalAnim = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_WeaponAttack))
									if CurTime() > self.NextMeleeWeaponAttackT && VJ_AnimationExists(self, finalAnim) == true /*&& VJ_IsCurrentAnimation(self, finalAnim) == false*/ then
										local animDur = VJ_GetSequenceDuration(self, finalAnim)
										wep.NPC_NextPrimaryFire = animDur -- Make melee weapons dynamically change the next primary fire
										VJ_EmitSound(self, wep.NPC_BeforeFireSound, wep.NPC_BeforeFireSoundLevel, math.Rand(wep.NPC_BeforeFireSoundPitch.a, wep.NPC_BeforeFireSoundPitch.b))
										self.NextMeleeWeaponAttackT = CurTime() + animDur
										self.CurrentWeaponAnimation = finalAnim
										self:VJ_ACT_PLAYACTIVITY(finalAnim, true, false, false)
									end
								-- Normal weapons
								else
									-- If the current animation is already a firing animation, then imply just tell the base It's already firing and don't restart the animation
									if VJ_IsCurrentAnimation(self, self:TranslateToWeaponAnim(self.CurrentWeaponAnimation)) == true then
										self.DoingWeaponAttack = true
										self.DoingWeaponAttack_Standing = true
									-- If the current activity isn't the last weapon animation and it's not a transition, then continue
									elseif self:GetActivity() != self.CurrentWeaponAnimation && self:GetActivity() != ACT_TRANSITION then
										self:CustomOnWeaponAttack()
										self.WaitingForEnemyToComeOut = false
										self.Weapon_TimeSinceLastShot = 0
										//self.NextMoveRandomlyWhenShootingT = CurTime() + 2
										local finalAnim;
										local anim_crouch = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_WeaponAttackCrouch))
										if self.CanCrouchOnWeaponAttack == true && covered_npc == false && covered_wep == false && enedist_eye > 500 && VJ_AnimationExists(self, anim_crouch) == true && ((math.random(1, self.CanCrouchOnWeaponAttackChance) == 1) or (CurTime() <= self.Weapon_DoingCrouchAttackT)) && self:VJ_ForwardIsHidingZone(wep:GetNW2Vector("VJ_CurBulletPos") + self:GetUp()*-18, enepos_eye, false) == false then
											finalAnim = anim_crouch
											self.Weapon_DoingCrouchAttackT = CurTime() + 2 -- Asiga bedke vor vestah elank yed votgi cheler hemen
										else -- Not crouching
											finalAnim = self:TranslateToWeaponAnim(VJ_PICK(self.AnimTbl_WeaponAttack))
										end
										if VJ_AnimationExists(self, finalAnim) == true && VJ_IsCurrentAnimation(self, finalAnim) == false then
											VJ_EmitSound(self, wep.NPC_BeforeFireSound, wep.NPC_BeforeFireSoundLevel, math.Rand(wep.NPC_BeforeFireSoundPitch.a, wep.NPC_BeforeFireSoundPitch.b))
											self.CurrentWeaponAnimation = finalAnim
											self.NextWeaponAttackT_Base = CurTime() + 0.2
											self:VJ_ACT_PLAYACTIVITY(finalAnim, false, 0, true)
											self.DoingWeaponAttack = true
											self.DoingWeaponAttack_Standing = true
										end
									end
								end
							end
							-- Move randomly when shooting
							if covered_npc == false && self.IsGuard != true && self.FollowingPlayer == false && self.MoveRandomlyWhenShooting == true && (!wep.IsMeleeWeapon) && (!wep.NPC_StandingOnly) && self.DoingWeaponAttack == true && self.DoingWeaponAttack_Standing == true && CurTime() > self.NextMoveRandomlyWhenShootingT && (CurTime() - self.TimeSinceEnemyAcquired) > 2 && (enedist_eye < (self.Weapon_FiringDistanceFar / 1.25)) && self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() +self:OBBCenter()),enepos_eye) == false && self:CustomOnMoveRandomlyWhenShooting() != false then
								local randpos = math.random(150,400)
								local checkDist = self:VJ_CheckAllFourSides(randpos)
								local randmove = {}
								if checkDist.Backward == true then randmove[#randmove+1] = "Backward" end
								if checkDist.Right == true then randmove[#randmove+1] = "Right" end
								if checkDist.Left == true then randmove[#randmove+1] = "Left"end
								local pickmove = VJ_PICK(randmove)
								if pickmove == "Backward" then self:SetLastPosition(self:GetPos() + self:GetForward()*-randpos) end
								if pickmove == "Right" then self:SetLastPosition(self:GetPos() + self:GetRight()*randpos) end
								if pickmove == "Left" then self:SetLastPosition(self:GetPos() + self:GetRight()*-randpos) end
								if pickmove == "Backward" or pickmove == "Right" or pickmove == "Left" then
									self:StopMoving()
									self:VJ_TASK_GOTO_LASTPOS(VJ_PICK({"TASK_RUN_PATH","TASK_WALK_PATH"}),function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
								end
								self.NextMoveRandomlyWhenShootingT = CurTime() + math.Rand(self.NextMoveRandomlyWhenShootingTime1,self.NextMoveRandomlyWhenShootingTime2)
							end
						else -- None VJ Base weapons
							self:FaceCertainEntity(ene, true)
							self.WaitingForEnemyToComeOut = false
							self.DoingWeaponAttack = true
							self.DoingWeaponAttack_Standing = true
							self:CustomOnWeaponAttack()
							self.Weapon_TimeSinceLastShot = 0
							//wep:SetClip1(99999)
							self:VJ_SetSchedule(SCHED_RANGE_ATTACK1)
						end
					end
				end
			end
		elseif IsValid(ene) then
			self:ResetEnemy(false)
		end
		self.LatestEnemyDistance = ene:GetPos():Distance(self:GetPos())
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/