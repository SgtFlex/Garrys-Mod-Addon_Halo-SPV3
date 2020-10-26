AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/flood/infector/infectionform.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 5
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
	-- ====== Gibs ====== --
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
ENT.HasGibOnDeathSounds = false -- Does it have gib sounds? | Mostly used for the settings menu

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.HasMeleeAttack = false-- Should the SNPC have a leap attack?

ENT.AnimTbl_LeapAttack = {ACT_GLIDE} -- Melee Attack Animations
ENT.LeapDistance = 200 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 0 -- How close does it have to be until it uses melee?
ENT.TimeUntilLeapAttackDamage = 0.4 -- How much time until it runs the leap damage code?
ENT.NextLeapAttackTime = 0.4 -- How much time until it can use a leap attack?
ENT.NextAnyAttackTime_Leap = 0.4 -- How much time until it can use any attack again? | Counted in Seconds
ENT.LeapAttackExtraTimers = {0.2,0.6} -- Extra leap attack timers | it will run the damage code after the given amount of seconds
ENT.LeapAttackVelocityForward = 50 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 250 -- How much upward force should it apply?
ENT.LeapAttackDamage = 5
ENT.LeapAttackDamageDistance = 100 -- How far does the damage go?
ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.PushProps = false -- Should it push props when trying to move?
//Prevent blocking of infection forms but also don't block the way of other combat forms
ENT.EntitiesToNoCollide = {"npc_vj_halo_flood_spv3_infection", "npc_vj_halo_flood_spv3_elite", "npc_vj_halo_flood_spv3_elite_runner", "npc_vj_halo_flood_spv3_elite_hg", "npc_vj_halo_flood_spv3_marine", "npc_vj_halo_flood_spv3_odst", "npc_vj_halo_flood_spv3_carrier"}
ENT.FindEnemy_UseSphere = true -- Should the SNPC be able to see all around him? (360) | Objects and walls can still block its sight!
ENT.OnlyDoKillEnemyWhenClear = false -- If set to true, it will only play the OnKilledEnemy sound when there isn't any other enemies
ENT.canFlinch = 0
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {
"infection_form/infector_sound/infector/loop/infector_sound1.wav",
"infection_form/infector_sound/infector/loop/infector_sound2.wav",
"infection_form/infector_sound/infector/loop/infector_sound3.wav",
"infection_form/infector_sound/infector/loop/infector_sound4.wav",
"infection_form/infector_sound/infector/loop/infector_sound5.wav",
"infection_form/infector_sound/infector/loop/infector_sound6.wav",
"infection_form/infector_sound/infector/loop/infector_sound7.wav",
"infection_form/infector_sound/infector/loop/infector_sound8.wav",
"infection_form/infector_sound/infector/loop/infector_sound9.wav",
"infection_form/infector_sound/infector/loop/infector_sound10.wav",
"infection_form/infector_sound/infector/loop/infector_sound11.wav",
"infection_form/infector_sound/infector/loop/infector_sound12.wav",
"infection_form/infector_sound/infector/loop/infector_sound13.wav",
"infection_form/infector_sound/infector/loop/infector_sound14.wav",
"infection_form/infector_sound/infector/loop/infector_sound15.wav",
"infection_form/infector_sound/infector/loop/infector_sound16.wav",
"infection_form/infector_sound/infector/loop/infector_sound17.wav",
"infection_form/infector_sound/infector/loop/infector_sound18.wav",
"infection_form/infector_sound/infector/loop/infector_sound19.wav",
"infection_form/infector_sound/infector/loop/infector_sound20.wav",
"infection_form/infector_sound/infector/loop/infector_sound21.wav",
"infection_form/infector_sound/infector/loop/infector_sound22.wav",
"infection_form/infector_sound/infector/loop/infector_sound23.wav",
"infection_form/infector_sound/infector/loop/infector_sound24.wav",
"infection_form/infector_sound/infector/loop/infector_sound25.wav",
"infection_form/infector_sound/infector/loop/infector_sound26.wav",
"infection_form/infector_sound/infector/loop/infector_sound27.wav",
"infection_form/infector_sound/infector/loop/infector_sound28.wav",
"infection_form/infector_sound/infector/loop/infector_sound29.wav",
"infection_form/infector_sound/infector/loop/infector_sound30.wav"
}

ENT.SoundTbl_LeapAttackDamage = {
"infection_form/infector_bite/infector_bite1.wav",
"infection_form/infector_bite/infector_bite2.wav",
"infection_form/infector_bite/infector_bite3.wav",
"infection_form/infector_bite/infector_bite4.wav",
"infection_form/infector_bite/infector_bite5.wav",
"infection_form/infector_bite/infector_bite6.wav",
"infection_form/infector_bite/infector_bite7.wav",
"infection_form/infector_bite/infector_bite8.wav",
"infection_form/infector_bite/infector_bite9.wav",
"infection_form/infector_bite/infector_bite10.wav",
"infection_form/infector_bite/infector_bite11.wav"
}

ENT.SoundTbl_Death = {
"infection_form/infection_pop/pop1.wav",
"infection_form/infection_pop/pop2.wav",
"infection_form/infection_pop/pop3.wav",
"infection_form/infection_pop/pop4.wav",
"infection_form/infection_pop/pop5.wav",
"infection_form/infection_pop/pop6.wav",
"infection_form/infection_pop/pop7.wav",
"infection_form/infection_pop/pop8.wav",
"infection_form/infection_pop/pop9.wav",
"infection_form/infection_pop/pop10.wav"
}
ENT.NextSoundTime_Idle1 = 1
ENT.NextSoundTime_Idle2 = 2
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self:SetHealth(self.StartHealth)
	self.LeapAttackDamage = self.LeapAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*function ENT:CustomOnKilled(dmginfo,hitgroup)
	ParticleEffect("hcea_flood_inf_death", self:LocalToWorld(Vector(0,0,10)), self:GetAngles(), self)
	//ParticleEffectAttach("hcea_flood_inf_death",PATTACH_POINT_FOLLOW,self,0)
end*/
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if self.HasGibDeathParticles == true then
		ParticleEffect("hcea_flood_infected_death", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
		//ParticleEffect("doom_mancu_blast", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
		//ParticleEffect("hound_explosion", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
	end
	return true
end

ENT.combatForm =""
ENT.enemyModel = ""
ENT.enemyPos = ""
ENT.enemyHealth = 150
ENT.enemyShields = 0
ENT.enemySeqDur = 0
ENT.imposter = ""
function ENT:CustomOnDoKilledEnemy(argent,attacker,inflictor)
	if (self:GetEnemy():IsPlayer()==true) then self:Remove() return end
	self.enemyModel = self:GetEnemy():GetModel()
	self.enemyPos = self:GetEnemy():GetPos()
	self.enemyAng = self:GetEnemy():GetAngles()
	self.enemyCol = self:GetEnemy():GetColor()
	if (IsValid(self:GetEnemy():GetActiveWeapon())) then self.enemyWep = self:GetEnemy():GetActiveWeapon():GetClass() end
	if (self:GetEnemy().StartHealth) then self.enemyHealth = self:GetEnemy().StartHealth 
	else self.enemyHealth = self:GetEnemy():GetMaxHealth() end
	if (self:GetEnemy().ShieldHealth) then self.enemyShields = self:GetEnemy().ShieldHealth end
	if (GetConVarString("vj_spv3_floodOption") == "infect_nothing") then return end
	if ((GetConVarString("vj_spv3_floodOption") == "infect_onlyHalo") or (GetConVarString("vj_spv3_floodOption") == "infect_anything")) then
		if (string.find(tostring(argent), "unsc")) then
			if (string.find(tostring(argent), "marine")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_marine")
				self.enemyHealth = self:GetEnemy().StartHealth * 1.25
			elseif (string.find(tostring(argent), "odst")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_odst")
				self.enemyHealth = self:GetEnemy().StartHealth * 1.25
			end
		elseif (string.find(tostring(argent), "cov")) then
			if (string.find(tostring(argent), "elite")) and (string.find(tostring(argent), "hg")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_elite_hg")
				self.enemyHealth = self:GetEnemy().StartHealth * 1.25
				self.enemyShields = self:GetEnemy().ShieldHealth
			elseif (string.find(tostring(argent), "elite")) and (string.find(tostring(argent), "oss")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_elite_oss")
				self.enemyHealth = self:GetEnemy().StartHealth * 1.25
				self.enemyShields = self:GetEnemy().ShieldHealth
			elseif (string.find(tostring(argent), "elite")) then
				if ((math.random(0,1)) == 0) then
					self.combatForm = ents.Create("npc_vj_halo_flood_spv3_elite_runner")
					self.enemyHealth = self:GetEnemy().StartHealth * 1.25
					self.enemyShields = self:GetEnemy().ShieldHealth
				else
					self.combatForm = ents.Create("npc_vj_halo_flood_spv3_elite")
					self.enemyHealth = self:GetEnemy().StartHealth * 1.25
					self.enemyShields = self:GetEnemy().ShieldHealth
				end
			elseif (string.find(tostring(argent), "grunt")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_carrier")
				self.enemyHealth = self:GetEnemy().StartHealth * .35
			elseif (string.find(tostring(argent), "jackal")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_jackal")
				self.enemyHealth = self:GetEnemy().StartHealth * .35
			elseif (string.find(tostring(argent), "brute")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_brute")
				self.enemyHealth = self:GetEnemy().StartHealth * 1.25
			end
		elseif (string.find(tostring(argent), "nat")) then
			if (string.find(tostring(argent), "wolf")) then
				self.combatForm = ents.Create("npc_vj_halo_flood_spv3_wolf")
				self.enemyHealth = self:GetEnemy().StartHealth * 1.25
			end
		end
	end
	if ((GetConVarString("vj_spv3_floodOption") == "infect_anything")) and (self.combatForm == "") then
		self.combatForm = ents.Create("npc_vj_halo_flood_spv3_marine")
	end

	if (self.combatForm!="" and IsValid(self.combatForm)) then
		self:SetHealth(999999)
		self:SetNoDraw(true)
		timer.Simple(0.01, function()
			if (IsValid(self)) then
				for _,v in pairs(ents.FindInSphere(self:GetPos(),150)) do
					if (v:GetClass()=="prop_ragdoll" and v:GetModel()==self.enemyModel) then
						v:Remove()
					end
				end
			end
	    end)
	    if (self:GetEnemy().HasDeathRagdoll) then
			self:GetEnemy().HasDeathRagdoll=false
			self:GetEnemy().HasDeathAnimation=false
		end
		if (self:GetEnemy():LookupSequence("Transform")!=-1) then
			self.enemySeqDur = self:GetEnemy():SequenceDuration(self:GetEnemy():LookupSequence("Transform"))
			self.imposter = ents.Create("prop_dynamic")
			if (self:GetEnemy().SoundTbl_Transform) then
				self:GetEnemy():EmitSound(VJ_PICKRANDOMTABLE(self:GetEnemy().SoundTbl_Transform))
			end
			self.imposter:SetModel(self.enemyModel)
			self.imposter:SetAngles(self.enemyAng)
			self.imposter:SetPos(self.enemyPos)
			self.imposter:Spawn()
			local bodygroups = self:GetEnemy():GetBodyGroups()
			for k, v in pairs(bodygroups) do
				self.imposter:SetBodygroup(bodygroups[k]["id"], self:GetEnemy():GetBodygroup(bodygroups[k]["id"]))
			end
			self.imposter:SetColor(self.enemyCol)
			self:SetParent(self.imposter)
			self.imposter:ResetSequenceInfo()
			self.imposter:SetSequence("Transform")
			timer.Create("Transform"..self:GetCreationID(), self.enemySeqDur, 1, function()
				if (IsValid(self.imposter)) then self.imposter:Remove() end
				if (IsValid(self)) then
					ParticleEffect("hcea_flood_car_death", self.enemyPos, self.enemyAng, nil)
					self.combatForm = ents.Create(self.combatForm:GetClass()) //Has to be initialized again, otherwise spawned combat form doesn't attack
					self.combatForm.WeaponTable = {}
					table.insert(self.combatForm.WeaponTable, self.enemyWep)
					self.combatForm.SpawnedFromInf = true
					self.combatForm.StartHealth = self.enemyHealth
					self.combatForm.ShieldHealth = self.enemyShields
					self.combatForm:Spawn()
					self.combatForm:SetAngles(self.enemyAng)
					self.combatForm:SetPos(self.enemyPos)
					self.combatForm:SetColor(self.enemyCol)
					self.combatForm:VJ_ACT_PLAYACTIVITY(ACT_COVER_PISTOL_LOW,true,1.5,false)
					self:Remove()
				end
			end)
		else
			ParticleEffect("hcea_flood_car_death", self:LocalToWorld(Vector(0,0,20)), Angle(0,90,0), nil)
			self.combatForm = ents.Create(self.combatForm:GetClass()) //Has to be initialized again, otherwise spawned combat form doesn't attack
			self.combatForm.WeaponTable = {}
			table.insert(self.combatForm.WeaponTable, self.enemyWep)
			self.combatForm.SpawnedFromInf = true
			self.combatForm.StartHealth = self.enemyHealth
			self.combatForm.ShieldHealth = self.enemyShields
			self.combatForm:Spawn()
			self.combatForm:SetAngles(self.enemyAng)
			self.combatForm:SetPos(self.enemyPos)
			self.combatForm:SetColor(self.enemyCol)
			self.combatForm:VJ_ACT_PLAYACTIVITY(ACT_COVER_PISTOL_LOW,true,1.5,false)
			self:Remove()
		end
	end
end

//Possibly unnecessary, but I found carrier forms blowing up large amounts of infection forms too frequently without this
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if ((IsValid(dmginfo:GetInflictor())) and (dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_carrier" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_elite_runner" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_odst" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_jackal" or dmginfo:GetInflictor():GetClass()=="npc_vj_halo_flood_spv3_wolf")) then
		dmginfo:SetDamage(0)
	end
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
end

function ENT:CustomOnLeapAttack_AfterChecks(TheHitEntity) 
	if (IsValid(self) and IsValid(self:GetEnemy()) and !self:GetEnemy().HasLatch  and self:GetEnemy():Health() < self:GetEnemy():GetMaxHealth()*.4) then
		self:GetEnemy().HasLatch = true
		self:SetMoveType(MOVETYPE_NONE)
		self:AddFlags(FL_NOTARGET)
		self:SetCollisionGroup(0)
		self:SetNotSolid(true)
		self:SetPos(self:GetEnemy():GetPos()+self:GetForward()*-10 + self:GetEnemy():OBBCenter()*1.25)
		self:SetAngles(self:GetEnemy():GetAngles() + Angle(-90,0,0))
		self:SetParent(self:GetEnemy())
		if (self:GetEnemy().SoundTbl_Stuck) then
			self:GetEnemy():EmitSound(VJ_PICKRANDOMTABLE(self:GetEnemy().SoundTbl_Stuck))
		end
		self:SetVelocity(Vector(0,0,0))
		self:GetEnemy():SetSequence(27)
		timer.Create("Damage"..self:GetCreationID(), 1.25, 0, function()
			if (IsValid(self) and IsValid(self:GetEnemy())) then
				if (self:GetEnemy().SoundTbl_Stuck) then
					self:GetEnemy():EmitSound(VJ_PICKRANDOMTABLE(self:GetEnemy().SoundTbl_Stuck))
				end
				self:GetEnemy():TakeDamage(10, self, self)
			end
		end)
	end
end

function ENT:MultipleMeleeAttacks() end

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/