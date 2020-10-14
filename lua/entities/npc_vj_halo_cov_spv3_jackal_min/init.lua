AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/jackal/jackal.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50
ENT.HullType = HULL_LARGE
ENT.bodyGroupTable = {
	1,
	0,
}
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Purple" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 2
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut","h_f_chest"}},
	{HitGroup = {501}, Animation = {"h_f_l_foot"}},
	{HitGroup = {502}, Animation = {"h_f_r_leg"}},
	{HitGroup = {503}, Animation = {"h_f_r_foot"}},
	{HitGroup = {504}, Animation = {"h_f_l_arm"}},
	{HitGroup = {505}, Animation = {"h_f_l_hand1","h_f_l_hand2"}},
	{HitGroup = {507}, Animation = {"h_f_r_arm"}},
	{HitGroup = {508}, Animation = {"h_f_r_hand"}},
}
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"} -- Death Animations

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasDeathBodyGroup = false -- Set to true if you want to put a bodygroup when it dies
ENT.HasItemDropsOnDeath = false -- Should it drop items on death?
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true}
ENT.Color = Color(100,100,140)
---------------------------------------------------------------------------------------------------------------------------------------------

function ENT:CustomOnInitialize()
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end

	timer.Simple(0.1, function()
	if (self:GetActiveWeapon().HoldType=="ar2") then
		self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
		self.AnimTbl_Run = {ACT_RUN_RIFLE}
	end
end)

	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self:SetHealth(self.StartHealth)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.UNSCWeps))
		end
		if (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_plasmapistol") then
			self:SetSkin(0)
		elseif (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_needler") then
			self:SetSkin(1)
		elseif (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_plasmapistolbrute") then
			self:SetSkin(2)
		else
			self:SetSkin(3)
		end
	end)
	self:SetColor(self.Color)
	self:SetCollisionBounds(Vector(20, 20, 75), Vector(-20, -20, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	-- Detection --
	if self:GetEnemy() != nil then
	self.AnimTbl_IdleStand = {ACT_IDLE}
	else
	self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if hitgroup == 11 then
		dmginfo:ScaleDamage(0)
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.SoundTbl_OnKilledEnemy = {
"jackal/tnt/tnt9.wav",
"jackal/tnt/tnt10.wav",
"jackal/tnt/tnt11.wav",
"jackal/tnt/tnt12.wav",
"jackal/tnt/tnt13.wav",
"jackal/tnt/tnt14.wav"
}

ENT.SoundTbl_Alert = {
"jackal/seefoe/seefoe1.wav",
"jackal/seefoe/seefoe2.wav",
"jackal/seefoe/seefoe3.wav",
"jackal/seefoe/seefoe4.wav",
"jackal/seefoe/seefoe5.wav",
"jackal/seefoe/seefoe6.wav",
"jackal/seefoe/seefoe7.wav",
"jackal/seefoe/seefoe8.wav",
"jackal/seefoe/seefoe9.wav"
}

ENT.SoundTbl_Pain = {
"jackal/pain/pain1.wav",
"jackal/pain/pain2.wav",
"jackal/pain/pain3.wav",
"jackal/pain/pain4.wav",
"jackal/pain/pain5.wav",
"jackal/pain/pain6.wav",
"jackal/pain/pain7.wav",
"jackal/pain/pain8.wav",
"jackal/pain/pain9.wav",
"jackal/pain/pain10.wav",
"jackal/pain/pain11.wav",
"jackal/pain/pain12.wav",
"jackal/pain/pain13.wav",
"jackal/pain/pain14.wav",
"jackal/pain/pain15.wav",
"jackal/pain/pain16.wav",
"jackal/pain/pain17.wav",
"jackal/pain/pain18.wav",
"jackal/pain/pain19.wav",
"jackal/pain/pain20.wav"
}

ENT.SoundTbl_CallForHelp = {

}

ENT.SoundTbl_Death = {
"jackal/dth/dth1.wav",
"jackal/dth/dth2.wav",
"jackal/dth/dth3.wav",
"jackal/dth/dth4.wav",
"jackal/dth/dth5.wav",
"jackal/dth/dth6.wav",
"jackal/dth/dth7.wav",
"jackal/dth/dth8.wav",
"jackal/dth/dth9.wav",
"jackal/dth/dth10.wav",
"jackal/dth/dth11.wav",
"jackal/dth/dth12.wav",
"jackal/dth/dth13.wav",
"jackal/dth/dth14.wav",
"jackal/dth/dth15.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("elite/shared/walk/walk ("..math.random(1,6)..").wav", 80, 100, 1)
	elseif key == "Pain" then
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Pain))
	end
end

function ENT:CheckForGrenades()
	if self.CanDetectGrenades == false or self.ThrowingGrenade == true or self.HasSeenGrenade == true or self.VJ_IsBeingControlled == true then return end
	local FindNearbyGrenades = ents.FindInSphere(self:GetPos(),self.RunFromGrenadeDistance)
	for _,v in pairs(FindNearbyGrenades) do
		local IsFriendlyGrenade = false
		if self.EntitiesToRunFrom[v:GetClass()] && self:Visible(v) then
			if IsValid(v:GetOwner()) && v:GetOwner().IsVJBaseSNPC == true && (self:Disposition(v:GetOwner()) == D_LI or self:Disposition(v:GetOwner()) == D_NU) then
				IsFriendlyGrenade = true
			end
			if IsFriendlyGrenade == false then
				self.HasSeenGrenade = true
				self.TakingCoverT = CurTime() + 4
				if /*IsValid(self:GetEnemy()) &&*/v.VJHumanNoPickup != true && v.VJHumanTossingAway != true && self.CanThrowBackDetectedGrenades == true && self.HasGrenadeAttack == true && v:GetVelocity():Length() < 400 && self:VJ_GetNearestPointToEntityDistance(v) < 100 && self.EntitiesToThrowBack[v:GetClass()] then
					self.NextGrenadeAttackSoundT = CurTime() + 3
					self:ThrowGrenadeCode(v,true)
					v.VJHumanTossingAway = true
					//v:Remove()
				end
				//if self.VJ_PlayingSequence == false then self:VJ_SetSchedule(SCHED_RUN_FROM_ENEMY) end
				self:SetAngles(Angle(self:GetAngles().x, (self:GetPos()-v:GetPos()):Angle().y,self:GetAngles().z))
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL3, true, 2, false)
				self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH",function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end)
				timer.Simple(4,function() if IsValid(self) then self.HasSeenGrenade = false end end)
				break;
				//else
				//self.HasSeenGrenade = false
				//return
			end
		end
	end
end
ENT.HasProtector=false
function ENT:CustomOnAllyDeath(argent) 
	if ((string.find(tostring(argent), "elite")) or (string.find(tostring(argent), "brute"))) and (argent:GetPos():DistToSqr(self:GetPos()) <= 700000) then
		timer.Simple(2.5, function() 
			if (!IsValid(self)) then return end
			self.HasProtector=false
			for k, v in pairs(ents.FindInSphere(self:GetPos(), 50000)) do
				if (string.find(tostring(v), "elite") or string.find(tostring(v), "brute")) and (v:IsNPC()) then
					self.HasProtector = true
				end
			end
			if (self.HasProtector==false or (math.random(0,10) < 3)) then
				self.Behavior = VJ_BEHAVIOR_PASSIVE
				self.AnimTbl_Walk = {ACT_RUN_SCARED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
				self.AnimTbl_Run = {ACT_RUN_SCARED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
				self.AnimTbl_MoveToCover = {ACT_RUN_SCARED}
				timer.Create("Scared"..self:GetCreationID(), math.random(1.5,3), 5, function()
					if !(IsValid(self)) then return end 
					self.AnimTbl_Walk = {ACT_RUN_SCARED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_Run = {ACT_RUN_SCARED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_MoveToCover = {ACT_RUN_SCARED}
					self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
				end)
				timer.Simple(10, function()
					if !(IsValid(self)) then return end
					self.Behavior = VJ_BEHAVIOR_PASSIVE
					self.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_Run = {ACT_RUN} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_MoveToCover = {ACT_RUN}
				end)
			end
	end)
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/