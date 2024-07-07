AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/flood/infector/infectionform.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 1
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Yellow"
ENT.CustomBlood_Decal = {"VJ_SPV3_Blood_Flood2"}
	-- ====== Gibs ====== --
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
ENT.HasGibOnDeathSounds = false -- Does it have gib sounds? | Mostly used for the settings menu

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.HasMeleeAttack = false-- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {ACT_JUMP} -- Melee Attack Animations
ENT.LeapDistance = 300 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump

ENT.LeapToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.TimeUntilLeapAttackDamage = 0.5 -- How much time until it runs the leap damage code?
ENT.LeapAttackAngleRadius = 180 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.NextLeapAttackTime = 0.5 -- How much time until it can use a leap attack?
ENT.NextAnyAttackTime_Leap = 0.5 -- How much time until it can use any attack again? | Counted in Seconds
ENT.LeapAttackReps = 8 -- How many times does it run the leap attack code?
ENT.LeapAttackVelocityForward = -150 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 200 -- How much upward force should it apply?
ENT.LeapAttackDamage = 10
ENT.LeapAttackDamageDistance = 125 -- How far does the damage go?
ENT.LeapAttackDamageType = DMG_DIRECT -- Type of Damage
ENT.DisableDefaultLeapAttackDamageCode = true -- Disables the default leap attack damage code
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?

ENT.MeleeAttackDamage = ENT.LeapAttackDamage
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.PushProps = false -- Should it push props when trying to move?
--Prevent blocking of infection forms but also don't block the way of other combat forms
--Player no collide does affect how it behaves, even though the wiki states it doesn't

--Adding no collide to other infection forms causes signifigant FPS drop
-- ENT.EntitiesToNoCollide = {
-- 	"player",
-- 	"npc_vj_halo_flood_spv3_elite", 
-- 	"npc_vj_halo_flood_spv3_elite_ran", 
-- 	"npc_vj_halo_flood_spv3_elite_runner", 
-- 	"npc_vj_halo_flood_spv3_elite_hg", 
-- 	"npc_vj_halo_flood_spv3_elite_suicide",
-- 	"npc_vj_halo_flood_spv3_elite_oss",
-- 	"npc_vj_halo_flood_spv3_marine", 
-- 	"npc_vj_halo_flood_spv3_odst", 
-- 	"npc_vj_halo_flood_spv3_carrier", 
-- 	"npc_vj_halo_flood_spv3_wolf", 
-- 	"npc_vj_halo_flood_spv3_jackal", 
-- 	"npc_vj_halo_flood_spv3_brute", 
-- }
ENT.FindEnemy_UseSphere = true -- Should the SNPC be able to see all around him? (360) | Objects and walls can still block its sight!
ENT.OnlyDoKillEnemyWhenClear = false -- If set to true, it will only play the OnKilledEnemy sound when there isn't any other enemies
ENT.canFlinch = 0
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.DeathAnimationTime = 2
ENT.AnimTbl_Death = {"Melee_1"}

ENT.SoundTbl_Idle = {
"infection_form/infector_sound/infector/loop/infector_sound1.ogg",
"infection_form/infector_sound/infector/loop/infector_sound2.ogg",
"infection_form/infector_sound/infector/loop/infector_sound3.ogg",
"infection_form/infector_sound/infector/loop/infector_sound4.ogg",
"infection_form/infector_sound/infector/loop/infector_sound5.ogg",
"infection_form/infector_sound/infector/loop/infector_sound6.ogg",
"infection_form/infector_sound/infector/loop/infector_sound7.ogg",
"infection_form/infector_sound/infector/loop/infector_sound8.ogg",
"infection_form/infector_sound/infector/loop/infector_sound9.ogg",
"infection_form/infector_sound/infector/loop/infector_sound10.ogg",
"infection_form/infector_sound/infector/loop/infector_sound11.ogg",
"infection_form/infector_sound/infector/loop/infector_sound12.ogg",
"infection_form/infector_sound/infector/loop/infector_sound13.ogg",
"infection_form/infector_sound/infector/loop/infector_sound14.ogg",
"infection_form/infector_sound/infector/loop/infector_sound15.ogg",
"infection_form/infector_sound/infector/loop/infector_sound16.ogg",
"infection_form/infector_sound/infector/loop/infector_sound17.ogg",
"infection_form/infector_sound/infector/loop/infector_sound18.ogg",
"infection_form/infector_sound/infector/loop/infector_sound19.ogg",
"infection_form/infector_sound/infector/loop/infector_sound20.ogg",
"infection_form/infector_sound/infector/loop/infector_sound21.ogg",
"infection_form/infector_sound/infector/loop/infector_sound22.ogg",
"infection_form/infector_sound/infector/loop/infector_sound23.ogg",
"infection_form/infector_sound/infector/loop/infector_sound24.ogg",
"infection_form/infector_sound/infector/loop/infector_sound25.ogg",
"infection_form/infector_sound/infector/loop/infector_sound26.ogg",
"infection_form/infector_sound/infector/loop/infector_sound27.ogg",
"infection_form/infector_sound/infector/loop/infector_sound28.ogg",
"infection_form/infector_sound/infector/loop/infector_sound29.ogg",
"infection_form/infector_sound/infector/loop/infector_sound30.ogg"
}

ENT.SoundTbl_LeapAttackDamage = {
"infection_form/infector_bite/infector_bite1.ogg",
"infection_form/infector_bite/infector_bite2.ogg",
"infection_form/infector_bite/infector_bite3.ogg",
"infection_form/infector_bite/infector_bite4.ogg",
"infection_form/infector_bite/infector_bite5.ogg",
"infection_form/infector_bite/infector_bite6.ogg",
"infection_form/infector_bite/infector_bite7.ogg",
"infection_form/infector_bite/infector_bite8.ogg",
"infection_form/infector_bite/infector_bite9.ogg",
"infection_form/infector_bite/infector_bite10.ogg",
"infection_form/infector_bite/infector_bite11.ogg"
}
ENT.LeapAttackDamageSoundLevel = 30

ENT.SoundTbl_Death = {
"infection_form/infection_pop/pop1.ogg",
"infection_form/infection_pop/pop2.ogg",
"infection_form/infection_pop/pop3.ogg",
"infection_form/infection_pop/pop4.ogg",
"infection_form/infection_pop/pop5.ogg",
"infection_form/infection_pop/pop6.ogg",
"infection_form/infection_pop/pop7.ogg",
"infection_form/infection_pop/pop8.ogg",
"infection_form/infection_pop/pop9.ogg",
"infection_form/infection_pop/pop10.ogg"
}
ENT.NextSoundTime_Idle1 = 1
ENT.NextSoundTime_Idle2 = 2
---------------------------------------------------------------------------------------------------------------------------------------------



function ENT:CustomOnInitialize()
	print("phantom spawned")
	self:SetCustomCollisionCheck(true)
	hook.Add( "ShouldCollide", "CustomCollisions", function( ent1, ent2 )
		if (ent1:GetClass()=="npc_vj_halo_flood_spv3_infection" and (ent1:GetClass()==ent2:GetClass()) and ent1:GetGroundSpeedVelocity():Length()==0 and ent2:GetGroundSpeedVelocity():Length()==0) then
			ent1:SetVelocity((ent1:GetPos() - ent2:GetPos()):GetNormalized()*3) --Push each other apart to prevent the AI from getting stuck
			return false
		end
	end )
	self.NextProcessTime = self.NextProcessTime + 2
	--We need the Inf form to:
	--No collide with each other
	--No collide with the player
	--Collide with projectiles

	--No collides are unfortunately very costly in terms of performance when we talk about hordes of NPCs
	--	so the only real solution is some sort of hack involving collision groups that gets the desired effects
	--	of allowing infs to pass through each other while no colliding with the player AND still registering projectiles

	--Every collision group seems to have it's downsides at this point
	--1 and 2 are good, except that projectiles ignore the NPCs
	--3, 4, 16, 19 are good, except that if they stop at the same spot they don't know how to move
	self:SetCollisionGroup(19)

	self.MovingSound = CreateSound(self, "infection_form/infector_sound/infector/move/move"..math.random(1,3)..".wav")
	timer.Simple(0.1, function() 
		if (IsValid(self)) then
			self:SetGravity(0.5)
			self:SetFriction(0.3)
		end
	end)
	self.LeapAttackDamage = self.LeapAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.inflictor = nil
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup) //Perhaps giving errors because inflictor is dead?
	ParticleEffect("InfDeath", self:GetPos() + self:OBBCenter(), self:GetAngles(), nil)
	self.inflictor = self
	self.vector = self:GetPos()
	self:SetNoDraw(true)
	for k, v in pairs(ents.FindInSphere(self:GetPos(), 500)) do
		if (v:GetClass()=="npc_vj_halo_flood_spv3_infection") then
			v:AddFlags(FL_NOTARGET)
			timer.Simple(0.3, function()
				if (IsValid(v)) then
					v:RemoveFlags(FL_NOTARGET)
				end
			end)
		end
	end
	timer.Simple(0.2, function()
		for k, v in pairs(ents.FindInSphere(self:GetPos(), 30)) do
			if (v:GetClass() == "npc_vj_halo_flood_spv3_infection") then
				v:TakeDamage(v:GetMaxHealth())
			end
		end
	end)
end



ENT.combatForm =""
ENT.enemyModel = ""
ENT.enemyPos = ""
ENT.enemyHealth = 150
ENT.imposter = ""
function ENT:CustomOnDoKilledEnemy(argent,attacker,inflictor)
	if (self.Host) then
		-- self.Host.HasDeathSounds = false
		-- table.RemoveByValue(self.Host.Pods, self)
		-- table.insert(self.Host.Pods, 1, self) //We put the killing infection form at the front of the table
		-- self:UnlatchOthers(self.Host)
		-- SPV3.TransformNPC(self, self.Host)
	end
end

function ENT:UnlatchOthers(targetEnt)
	if (!self.Host) then return end
	if (self.Host.Pods) then
		for k=2, #self.Host.Pods do
			self.Host.Pods[2]:Unlatch()
		end
	end
end

//Possibly unnecessary, but I found carrier forms blowing up large amounts of infection forms too frequently without this
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if ((IsValid(dmginfo:GetInflictor())) and (dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_carrier" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_elite_runner" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_odst" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_jackal" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_wolf" or dmginfo:GetInflictor():GetClass()=="sent_vj_flood_spv3_biomass")) then
		dmginfo:SetDamage(0)
	end
	if (dmginfo:GetInflictor()==self.Host) then
		dmginfo:SetDamage(0)
	end
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
end

ENT.Host = nil
ENT.HitShield = false
function ENT:CustomOnLeapAttack_AfterChecks(TheHitEntity)
	
	self:PostAttack(TheHitEntity)
	return true
end

function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt) 
	self:PostAttack(hitEnt)
	return true 
end -- return true to disable the attack and move onto the next entity!

-- function ENT:OnTakeDamage(dmginfo)
-- 	print("took damage")
-- end

ENT.HitEnemy = nil
function ENT:PostAttack(TheHitEntity)
	if (self.Host) then return end
	if (self.HitEnemy) then return end
	print("Running")
	self.HitEnemy = TheHitEntity
	if (!TheHitEntity:IsNPC() and !TheHitEntity:IsPlayer()) then return end
	if ((TheHitEntity.ShieldCurrentHealth && TheHitEntity.ShieldIsArmor==false && TheHitEntity.ShieldCurrentHealth > 0) || (TheHitEntity:IsPlayer() && TheHitEntity:Armor() > 0)) then
		if (GetConVarNumber("vj_spv3_InfFormsExplode")==0) then
			TheHitEntity:TakeDamage(self.LeapAttackDamage, self, self)
		end
		self:TakeDamage(self.LeapAttackDamage, TheHitEntity, TheHitEntity)
		self.HitShield = true
		return
	end
	self:Latch(TheHitEntity)
end

ENT.LatchedBone = nil
function ENT:Latch(Host)	
	self.Host = Host
	if (!Host.AttachedForm) then
		Host.AttachedForm = self
		Host.PrevOnTakeDamage = Host.OnTakeDamage
		Host.PrevOnRemove = Host.OnRemove
		Host.HasDeathAnimation = false
		
		function Host:OnRemove()
			if (!self.Transformed) then
				self.Transformed = true
				self.AttachedForm:UnlatchOthers(self)
				SPV3.TransformNPC(self.AttachedForm, self)
				self:Remove()
			end
			self.AttachedForm:UnlatchOthers()
			self.AttachedForm:Unlatch()
			self:PrevOnRemove()
			--oldRemoved(self)
		end

		function Host:OnTakeDamage(damage)
			print("Health: "..self:Health())
			print("Damage: "..damage:GetDamage())

			if (damage:GetDamage() > self:Health()) then
				if (!self.Transformed) then
					self.Transformed = true
					self.AttachedForm:UnlatchOthers(self)
					SPV3.TransformNPC(self.AttachedForm, self)
					self:Remove()
				end
				self.AttachedForm:UnlatchOthers()
				self.AttachedForm:Unlatch()
				self:Remove()
			else 
				self:PrevOnTakeDamage(damage)
			end
			--oldRemoved(self)
			
			

		end
	end

	
	if (!IsValid(self.Host) or !IsValid(self)) then return end
	if (self.Host.Pods==nil) then
		self.Host.Pods = {}
	end
	if (self.Host:GetBoneCount() > 0) then
		-- for i=0, self.Host:GetBoneCount()-1 do
		-- 	if (self.LatchedBone == nil or 
		-- 		self.Host:GetBonePosition(i):Distance(self:GetPos()) < 
		-- 		self.Host:GetBonePosition(self.LatchedBone):Distance(self:GetPos())) then
		-- 		self.LatchedBone = i
		-- 	end
		-- end
		-- for k, v in pairs(self.Host.Pods) do
		-- 	if v.LatchedBone == self.LatchedBone then
		-- 		self.LatchedBone = self.LatchedBone - 1
		-- 	end
		-- 	if (self.LatchedBone <= 0 or self.LatchedBone > self.Host:GetBoneCount()-1) then
		-- 		self.LatchedBone = self.Host:GetBoneCount()-1
		-- 	end
		-- end
		self.LatchedBone = math.random(0, self.Host:GetBoneCount()-1)
		self:SetPos(select(1, self.Host:GetBonePosition(self.LatchedBone)))
		self:SetMoveType(MOVETYPE_NONE)
		self:FollowBone(self.Host, self.LatchedBone)
		self:SetMoveType(MOVETYPE_NONE)
		self:SetPos(select(1, self.Host:GetBonePosition(self.LatchedBone)))
		self:SetAngles(select(2, self.Host:GetBonePosition(self.LatchedBone)) + Angle(90, 0, 0))
		self:SetVelocity(Vector(0,0,0))
	else
		self:SetParent(self.Host)
		self:SetMoveType(8)
	end
	if (string.find(tostring(self.Host), "npc_vj_halo_cov_spv3_grunt_")) then
		self.Host:Flee()
	end
	table.insert(self.Host.Pods, self)
	if (#self.Host.Pods<=1 and self.Host.OnStuckByHost) then
		self.Host:OnStuckByHost()
	end
	self:VJ_ACT_PLAYACTIVITY("Melee_1",true,30,false)	
	self:SetMoveType(MOVETYPE_NONE)
	self.Host:SetSequence(27)
	if (self.Host:IsPlayer()) then
		timer.Simple(3, function()
			if (IsValid(self) and IsValid(self.Host)) then
				self:Unlatch()
			end
		end)
	end
	timer.Create("Damage"..self:GetCreationID(), 0.5, 0, function()
		if (IsValid(self)) then
			if (IsValid(self.Host) and self.Dead==false) then
				local d = DamageInfo()
				d:SetDamage((self.LeapAttackDamage * GetConVarNumber("vj_spv3_DamageModifier"))/5)
				d:SetAttacker(self)
				d:SetInflictor(self)
				d:SetDamageType(DMG_DIRECT)
				self.Host:TakeDamageInfo(d)
			else
				timer.Destroy("Damage"..self:GetCreationID())
			end
		end
	end)
	timer.Simple(3, function() 
		if (IsValid(self)) then
			self:Unlatch()
		end
	end)
	return true
end

function ENT:Unlatch()
	if (!IsValid(self.Host)) then return end
	self.HitEnemy = nil
	timer.Destroy("Damage"..self:GetCreationID())
	table.RemoveByValue(self.Host.Pods, self)
	if (table.IsEmpty(self.Host.Pods)) then
		self.Host.OnTakeDamage = self.Host.PrevOnTakeDamage
		self.Host.OnRemove = self.Host.PrevOnRemove
		self.Host.AttachedForm = nil
	end
	self.Host = nil
	self:FollowBone(NULL, 0)
	self:SetAngles(Angle(0,0,0))
	self:SetMoveType(3)
	local spreadRadius = 20
	local velocity = Vector(math.random(-spreadRadius, spreadRadius),math.random(-spreadRadius, spreadRadius),math.random(100, 175))
	self:GetPhysicsObject():SetVelocity(velocity)
	self:SetAngles(Angle(self:GetAngles().x, velocity:Angle().y, self:GetAngles().z))
	self:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)
	
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup) 
	if (self.Host!=nil) then
		self:Unlatch()
	end
end -- Ran the moment the NPC dies!


function ENT:CustomOnLeapAttack_BeforeStartTimer() 
	constraint.NoCollide(self, self:GetEnemy(), 0, 0)
	self.NextLeapAttackTime = math.random(2.5, 4.5) -- How much time until it can use a leap attack?
	self.LeapAttackVelocityRight = math.random(-50, 50) -- How much right force should it apply?
	self.LeapAttackVelocityUp = math.random(150, 230) -- How much upward force should it apply?
	self.LeapDistance = math.random(400, 600)-- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
end

function ENT:MultipleMeleeAttacks() end

ENT.isMoving = false
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Moving" and self.isMoving == false then
		self.MovingSound:PlayEx(math.random(0.2, 0.6), math.random(80, 170))
		self.isMoving = true
	elseif key == "StopMoving" then
		self.MovingSound:Stop()
		self.isMoving = false
	end
end

function ENT:CustomOnRemove() 
	self.MovingSound:Stop()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/