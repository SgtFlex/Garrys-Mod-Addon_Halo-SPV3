AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/hunter/hunter.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250 * GetConVarNumber("vj_spv3_HealthModifier")
ENT.Skin = 2
ENT.HullType = HULL_MEDIUM
---------------------------------------------------------------------------------------------------------------------------------------------
-- Custom
ENT.HUNTER_BlockWalking = false
ENT.NextBlockWalkingT = 0

ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 1600 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 400 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "OnlyRange" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Orange" -- The blood type, this will detemine what it should use (decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 80
ENT.AnimTbl_MeleeAttack = {"Melee_1"}
ENT.MeleeAttackAngleRadius = 40 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 110
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextAnyAttackTime_Melee = 1.9666666197777
ENT.MeleeAttackAnimationFaceEnemy = false
ENT.MeleeAttackDamage = 30 * GetConVarNumber("vj_spv3_damagemodifier")
ENT.MeleeAttackDamageType = DMG_CLUB

	-- Range Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.RangeDistance = 2000
ENT.AnimTbl_RangeAttack = {""} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_spv3_beam_proj" -- The entity that is spawned when range attacking
ENT.TimeUntilRangeAttackProjectileRelease = 0.8 -- How much time until the projectile code is ran?
ENT.NextAnyAttackTime_Range = 3 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime = 0 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = 5 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "cannon_1" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.RangeAttackExtraTimers = {0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.RangeAttackAngleRadius = 40 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC


ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4", "Die_5", "Die_6"} -- Death Animations
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true}

ENT.lights = {
	Light1 = {Object = "", Attachment = "Head_Light1", Color = "255 120 0", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light2 = {Object = "", Attachment = "Head_Light2", Color = "255 120 0", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light3 = {Object = "", Attachment = "Head_Light3", Color = "255 120 0", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light4 = {Object = "", Attachment = "Head_Light4", Color = "255 120 0", Scale = 0.15, Offset = Vector(0, 0, 0)},
	Light5 = {Object = "", Attachment = "Arm_Light1", Color = "255 120 0", Scale = 0.3, Offset = Vector(0, 0, 0)},
	Light6 = {Object = "", Attachment = "Arm_Light2", Color = "255 120 0", Scale = 0.3, Offset = Vector(0, 0, 0)},
	Light7 = {Object = "", Attachment = "Arm_Light3", Color = "255 120 0", Scale = 0.3, Offset = Vector(0, 0, 0)},
	Light8 = {Object = "", Attachment = "Arm_Light4", Color = "255 120 0", Scale = 0.3, Offset = Vector(0, 0, 0)},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer()
	ParticleEffectAttach("hcea_hunter_ab_charge",PATTACH_POINT_FOLLOW,self,1)
	timer.Simple(0.8,function() if self:IsValid() then 
		self:EmitSound("hunter/hunter_cannon/hunter_cannon_loop/hunter_cannon/in.ogg", 80, 100, 1) 
		end 
	end)
	self:EmitSound("hunter/hunter_cannon/hunter_charge.ogg", 80, 100, 1)
	timer.Simple(1.8,function() if self:IsValid() then 
		self:StopParticles() 
		self:EmitSound("hunter/hunter_cannon/hunter_cannon_loop/hunter_cannon/out.ogg", 80, 100, 1) 
		end 
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(TheProjectile)
	ParticleEffectAttach("hcea_hunter_ab_muzzle",PATTACH_POINT_FOLLOW,self,1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Berserked=false
function ENT:CustomOnThink_AIEnabled()
	if self:GetEnemy() != nil && self.VJ_IsBeingControlled == false then	
		if self.Berserked==true or (self:GetPos():Distance(self:GetEnemy():GetPos()) < 300 && self.VJ_IsBeingControlled == false) then
			self.HUNTER_BlockWalking = true
			self.ConstantlyFaceEnemy = false
			self.FootStepSoundLevel = 60
			self.AnimTbl_IdleStand = {ACT_IDLE}
			self.AnimTbl_Run = {ACT_RUN}
		else
			self.HUNTER_BlockWalking = false
			self.ConstantlyFaceEnemy = true
			self.FootStepSoundLevel = 70
			self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
			self.AnimTbl_Run = {ACT_WALK_CROUCH}
		end
	end
	
	if self.VJ_IsBeingControlled == true then
		self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	end
	if CurTime() > self.NextProcessT then
		self:CheckForGrenades()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SpawnLights()
	self:SetColor(Color(30,50,90))
	self:SetBodygroup(2, 1)
	self:SetBodygroup(3, 0)
	self:SetSkin(self.Skin)
	self:SetCollisionBounds(Vector(35, 35, 100), Vector(-35, -35, 0))
end

function ENT:SpawnLights() //Spawn any light sprites around the sentinel
	for k,v in pairs(self.lights) do
		self.lights[k]["Object"] = ents.Create("env_sprite")
		if (self.lights[k]["Attachment"]!="") then
			self.lights[k]["Object"]:SetParent(self, self:LookupAttachment(self.lights[k]["Attachment"]))
			self.lights[k]["Object"]:SetPos(self:GetAttachment(self:LookupAttachment(self.lights[k]["Attachment"]))["Pos"])
		else
			self.lights[k]["Object"]:SetParent(self)
			self.lights[k]["Object"]:SetPos(self:GetPos() + self:GetForward()*self.lights[k]["Offset"].x + self:GetRight()*self.lights[k]["Offset"].y + self:GetUp()*self.lights[k]["Offset"].z)
		end
		self.lights[k]["Object"]:SetKeyValue("rendermode", "9")
		self.lights[k]["Object"]:SetKeyValue("renderamt", "255")
		self.lights[k]["Object"]:SetKeyValue("model","blueflare1_noz.vmt")
		self.lights[k]["Object"]:SetKeyValue("GlowProxySize","3")
		self.lights[k]["Object"]:SetKeyValue("rendercolor",tostring(self.lights[k]["Color"]))
		self.lights[k]["Object"]:SetKeyValue("scale",tostring(self.lights[k]["Scale"]))
		self.lights[k]["Object"]:Spawn()
		self.lights[k]["Object"]:Activate()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (hitgroup != 12 and !(dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageType()==DMG_DIRECT)) then
		dmginfo:ScaleDamage(0)
		self:EmitSound("hunter/hard_metal_thick_cov_hunter/hard_metal_thick_cov_hunter"..math.random(1,4)..".ogg", 80, 100, 1)
	end
	if (hitgroup == 12 and dmginfo:GetDamage() >= GetConVarNumber("vj_spv3_PrecisionThreshold")) then
		dmginfo:ScaleDamage(5)
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST) then
			self:FlyingDeath(dmginfo)
		end
	end
	-- if (dmginfo:GetDamageType()!=DMG_BLAST and dmginfo:GetDamageForce():Length()>=5000) then
	-- 	dmginfo:SetDamage(5)
	-- end
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.HasDeathSounds = false -- If set to false, it won't play the death sounds
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter:SetOwner(self)
	self.imposter.Sequence = "Die_Airborne"
	local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
	if (dmginfo:GetDamageType()==DMG_CLUB) then
		velocity = velocity * 0.3
	end
	self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
	self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
	self.imposter:Spawn()
end


function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if (self:Health()<= self:GetMaxHealth()*.4) then
		self:Berserk()
	end
end

function ENT:Berserk()
	if (self.Berserked==true or self.HasStuck==true) then return end
	self.Berserked=true
	self.NoChaseAfterCertainRange_CloseDistance = 4000 -- Should the SNPC not be able to chase when it's between number x and y?
	self.WaitForEnemyToComeOut = false
	self:VJ_ACT_PLAYACTIVITY("Berserk", true, 2, false)
	self:EmitSound("hunter/melee/melee12.ogg")
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Alert = {
"hunter/seefoe/warn1.ogg",
"hunter/seefoe/warn2.ogg",
"hunter/seefoe/warn3.ogg",
"hunter/seefoe/warn4.ogg",
"hunter/seefoe/warn5.ogg",
"hunter/seefoe/warn6.ogg",
"hunter/seefoe/warn7.ogg",
"hunter/seefoe/warn8.ogg",
"hunter/seefoe/warn9.ogg"
}

ENT.SoundTbl_MeleeAttack = {
"hunter/hunter_melee_hits/hunter_melee_hit1.ogg",
"hunter/hunter_melee_hits/hunter_melee_hit2.ogg",
"hunter/hunter_melee_hits/hunter_melee_hit3.ogg",
"hunter/hunter_melee_hits/hunter_melee_hit4.ogg",
"hunter/hunter_melee_hits/hunter_melee_hit5.ogg",
"hunter/hunter_melee_hits/hunter_melee_hit6.ogg"
}

ENT.SoundTbl_Death = {
"hunter/dth/death1.ogg",
"hunter/dth/death2.ogg",
"hunter/dth/death3.ogg",
"hunter/dth/death4.ogg",
"hunter/dth/death5.ogg",
"hunter/dth/death6.ogg",
"hunter/dth/death7.ogg",
"hunter/dth/death8.ogg",
"hunter/dth/death9.ogg",
"hunter/dth/death10.ogg",
"hunter/dth/death11.ogg",
"hunter/dth/death12.ogg",
"hunter/dth/death13.ogg",
"hunter/dth/death14.ogg",
"hunter/dth/death15.ogg",
"hunter/dth/death16.ogg",
"hunter/dth/death17.ogg",
"hunter/dth/death18.ogg",
}

ENT.SoundTbl_Pain = {
	"hunter/pain/16.ogg",
	"hunter/pain/dth1.ogg",
	"hunter/pain/dth13.ogg",
	"hunter/pain/dth2.ogg",
	"hunter/pain/dth_mjr11.ogg",
	"hunter/pain/dth_mjr20.ogg",
	"hunter/pain/lift1.ogg",
	"hunter/pain/lift2.ogg",
	"hunter/pain/meleeleap1.ogg",
	"hunter/pain/meleeleap12.ogg",
	"hunter/pain/pain1.ogg",
	"hunter/pain/pain2.ogg",
	"hunter/pain/pain4.ogg",
	"hunter/pain/pain5.ogg",
	"hunter/pain/pain7.ogg",
	"hunter/pain/pain8.ogg",
	"hunter/pain/pain9.ogg",
}

ENT.SoundTbl_Investigate = {
	"hunter/tnt/dwn11.ogg",
	"hunter/tnt/dwn12.ogg",
	"hunter/tnt/pain_mdm10.ogg",
	"hunter/tnt/pain_mjr1.ogg",
	"hunter/tnt/rmd23.ogg",
	"hunter/tnt/rmd25.ogg",
	"hunter/tnt/rmd34.ogg",
	"hunter/tnt/rmd35.ogg",
	"hunter/tnt/rmd5.ogg",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()-self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos):GetNormal()*1500
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("hunter/run/walk"..math.random(1,6)..".ogg", 80, 90, 1)
		self:EmitSound("hunter/standunarmedmovefront/hunter_run_"..math.random(1,8)..".ogg", 80, 90, 1)
	elseif key == "Melee1" then
		self:EmitSound("hunter/unarmed_melee/hunter_shield_swing_"..math.random(1,3)..".ogg", 80, 100, 1)
		self:EmitSound("hunter/melee/melee"..math.random(5,28)..".ogg", 80, 100, 1)
	elseif key == "Hit" then
		self:MeleeAttackCode()
	end
end
ENT.HunterBro = nil
function ENT:CustomOnInitialize()
	local allies = ents.FindInSphere(self:GetPos(), 3000)
	for k, v in pairs(allies) do
		if (v != self and v:IsNPC() and string.find(tostring(v:GetClass()), "hunter") and v.HunterBro == nil) then
			self.HunterBro = v
			v.HunterBro = self
			return
		end
	end
end


function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if (IsValid(self.HunterBro)) then
		self.HunterBro:Berserk()
	end
end



ENT.RunFromGrenadeDistance = 400
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
				local rand = math.random(0, 2)
				if (rand==0) then
					self:SetAngles(Angle(self:GetAngles().x, (v:GetPos() - self:GetPos()):Angle().y,self:GetAngles().z))
					self:VJ_ACT_PLAYACTIVITY("Brace", 2, false)
				elseif (rand==1) then
					self:SetAngles(Angle(self:GetAngles().x, (self:GetPos() - v:GetPos()):Angle().y,self:GetAngles().z))
					self:VJ_ACT_PLAYACTIVITY("EvadeForward", 2, false)
				end
				timer.Simple(4,function() if IsValid(self) then self.HasSeenGrenade = false end end)
				break;
				//else
				//self.HasSeenGrenade = false
				//return
			end
		end
	end
end




/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/