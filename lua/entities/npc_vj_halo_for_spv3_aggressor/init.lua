AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/

--[[-------------------------------------------------------------------------
Sections:
1) Variables
2) Spawn Related
3) Combat & Movement Related
4) Damage Related
5) Death Related
6) Modified Existing Functions
---------------------------------------------------------------------------]]

/* copy-paste used to test certain variables
PrintMessage(3, "-------------------")
PrintMessage(3, "[var]: "..tostring([var]))
PrintMessage(3, "-------------------")
*/

--[[-------------------------------------------------------------------------
1) Variables
---------------------------------------------------------------------------]]
ENT.soundTable = {
	engineSoundObject = "",
	engineSound = "npc_vj_sent_sentinel/sent_eng1loop.wav",
	enginePitch = 100,
	engineVolume = 0.4,
	firingSoundObject = "",
	firingSound = "npc_vj_sent_sentinel/sentinel_gun/sentGunLoop1.wav",
	firingPitch = 100,
	firingVolume = 1,
	firingIn = "npc_vj_sent_sentinel/sentinel_gun/in.ogg",
	firingOut = "npc_vj_sent_sentinel/sentinel_gun/out.ogg"
}
ENT.defensiveStats = {
	shieldMax = 50,
	shieldCurrent = 50,
	shieldRegen = 1,
	shieldSpeed = .1,
	shieldDelay = 5,
	hullMax = 25,
	hullCurrent = 25,
	hullArmor = 10,
}
ENT.StartHealth = (ENT.defensiveStats["hullMax"] * GetConVarNumber("vj_spv3_HealthModifier")) + (ENT.defensiveStats["shieldMax"] * GetConVarNumber("vj_spv3_ShieldModifier"))
ENT.attackStats = {
	damage = 90,
	beamDuration = 1.5,
	beamTickRate = 0.045,
	reload = 2,
}
ENT.Colors = {
	modelColor = Color(255, 255, 255, 255),
	shieldColor = Color(255, 255, 255, 255),
	corpseColor = Color(100, 100, 100, 255),
	trailColor = Color(100,170,225,150)
}
ENT.flyVars = {
	minRadiusAroundTarget = 600,
	maxRadiusAroundTarget = 1200,
	minHeightAboveTarget = 250, //How far above should we aim to be above the target
	maxHeightAboveTarget = 700, //How far above should we aim to be above the target
	maxPitch = 40,
	maxRoll = 40,
	DecelerationTime = 1,
	AccelerationTime = 1,
	minTravelTime = 1,
	maxTravelTime = 5
}
ENT.gibTable = {
}
ENT.lights = {
	RightLight = {Object = "", Attachment = "root", Color = "0 180 255", Scale = .25, Offset = Vector(8, 16, -1)},
	LeftLight = {Object = "", Attachment = "root", Color = "0 180 255", Scale = .25, Offset = Vector(8, -16, -1)},
	EngineLight = {Object = "", Attachment = "root", Color = "200 240 240", Scale = .7, Offset = Vector(7, 0, 11)},
	GunLight = {Object = "", Attachment = "barrel", Color = "255 50 50", Scale = .25, Offset = Vector(8, 0, -2)},
	HeadLight = {Object = "", Attachment = "eye", Color = "0 155 255", Scale = .25, Offset = Vector(20, 0, 7)}
}
ENT.limbs = {
}
ENT.spriteTrail = {
	Object = "",
	startWidth = 50,
	endWidth = 10,
	lifetime = 2
}
ENT.models = {
	BaseModel = "models/hce/spv3/forerunner/aggressor/aggressor.mdl",
	CorpseModel = "models/hce/spv3/forerunner/aggressor/aggressor.mdl",
	ShieldModel = "models/sentinels/sentinel_a_shield.mdl",
}
ENT.Model = ENT.models["BaseModel"]

ENT.HasHull = false -- Set to false to disable HULL
ENT.HullSizeNormal = false -- set to false to cancel out the self:SetHullSizeNormal()
ENT.MovementType = VJ_MOVETYPE_AERIAL -- How does the SNPC move?
ENT.VJ_NPC_Class = {"CLASS_SENTINEL", "CLASS_PLAYER_ALLY", "CLASS_HUMAN_PASSIVE", "CLASS_EARTH_FAUNA"} -- NPCs with the same class with be allied to each other
ENT.SoundTbl_Breath = {} 
ENT.Aerial_AnimTbl_Calm = {"idleRelaxed"} -- Animations it plays when it's wandering around while idle
ENT.Aerial_AnimTbl_Alerted = {"idleCombat"} -- Animations it plays when it's moving while alerted
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_CallForHelp = {} -- Call For Help Animations
ENT.AnimTbl_Flinch = {"hurt01", "hurt02", "hurt03"}
--Damaged
ENT.Bleeds = false -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
ENT.BloodColor = "Oil"
ENT.HasGibDeathParticles = false -- Does it spawn particles on death or when it gibs? | Mostly used for the settings menu
ENT.HasDeathRagdoll = true -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.DeathCorpseModel = {""} -- The corpse model that it will spawn when it dies | Leave empty to use the NPC's model | Put as many models as desired, the base will pick a random one.
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 4 -- How many times does the player have to hit the SNPC for it to become enemy?
ENT.SoundTbl_Death = {"npc_vj_sent_sentinel/sentinel_death/expl_1.ogg","npc_vj_sent_sentinel/sentinel_death/expl_2.ogg","npc_vj_sent_sentinel/sentinel_death/expl_3.ogg","npc_vj_sent_sentinel/sentinel_death/expl_4.ogg","npc_vj_sent_sentinel/sentinel_death/expl_5.ogg","npc_vj_sent_sentinel/sentinel_death/expl_6.ogg","npc_vj_sent_sentinel/sentinel_death/expl_7.ogg","npc_vj_sent_sentinel/sentinel_death/expl_8.ogg","npc_vj_sent_sentinel/sentinel_death/expl_9.ogg","npc_vj_sent_sentinel/sentinel_death/expl_10.ogg","npc_vj_sent_sentinel/sentinel_death/expl_11.ogg","npc_vj_sent_sentinel/sentinel_death/expl_12.ogg","npc_vj_sent_sentinel/sentinel_death/expl_13.ogg","npc_vj_sent_sentinel/sentinel_death/expl_14.ogg","npc_vj_sent_sentinel/sentinel_death/expl_15.ogg","npc_vj_sent_sentinel/sentinel_death/expl_16.ogg","npc_vj_sent_sentinel/sentinel_death/expl_17.ogg","npc_vj_sent_sentinel/sentinel_death/expl_18.ogg"}
ENT.SoundTbl_PreDeath = {""}
ENT.HasItemDropsOnDeath = false -- Should it drop items on death?
ENT.AnimTbl_Death = {""}
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 0
--Vision--
ENT.NoChaseAfterCertainRange = false -- Should the SNPC not be able to chase when it's between number x and y?
ENT.SightDistance = 10000 -- How far it can see
ENT.SightAngle = 240 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
ENT.ConstantlyFaceEnemy = true
ENT.ConstantlyFaceEnemy_IfAttacking = true -- Should it face the enemy when attacking?
ENT.RangeAttackAnimationFaceEnemy = false
--Movement--
ENT.Aerial_FlyingSpeed_Calm = 160 -- The speed it should fly with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aerial_FlyingSpeed_Alerted = 160 --
ENT.TurningSpeed = 15 -- How fast it can turn
ENT.AA_ConstantlyMove = true
ENT.PoseParameterLooking_TurningSpeed = 15 -- How fast does the parameter turn?
ENT.DecelerationTime = 1 -- How long does it take the sentinel to Decelerate?
ENT.AccelerationTime = 1 -- How long does it take the sentinel to Accelerate?
ENT.TravelTime = 3 --How long does the sentinel travel before moving again?
ENT.minTravelTime = 1
ENT.maxTravelTime = 5
ENT.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
--Ranged Attack--
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = {}
ENT.RangeDistance = ENT.flyVars["maxRadiusAroundTarget"]*1.25
ENT.TimeUntilRangeAttackProjectileRelease = ENT.attackStats["beamTickRate"] -- How much time until the projectile code is ran?
ENT.RangeAttackReps = (ENT.attackStats["beamDuration"]/ENT.attackStats["beamTickRate"])
ENT.NextRangeAttackTime = ENT.attackStats["reload"] - 0.5 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = ENT.attackStats["reload"] + 0.5 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RangeAttackAnimationDecreaseLengthAmount = 2 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
ENT.ConstantlyFaceEnemyDistance = 10000 -- How close does it have to be until it starts to face the enemy?
ENT.ConstantlyFaceEnemy_IfVisible = false -- Should it only face the enemy if it's visible?
ENT.canFireAbove = false
ENT.FollowPlayerCloseDistance = 7500 -- If the SNPC is that close to the player then stand still until the player goes farther away
ENT.RangeAttackExtraTimers = {}
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.AnimTbl_RangeAttack = {} -- Range Attack Animations
ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?
--Fly Variables
ENT.TargetOffsetVector = Vector(0, 0, 0) //changed at spawn
ENT.enableAI = true
ENT.PlayerFriendly = true
ENT.FriendsWithAllPlayerAllies = true
--Death Variables
ENT.dead = false
ENT.fall = false
ENT.gib = false
ENT.timeDeath = false
ENT.ignite = false
ENT.randomFire = false
ENT.uniqueId = ""
ENT.VJ_IgnoreFloodInfection = true
--Variant Code--
ENT.shieldRegen = false
ENT.timeToDie = 0
ENT.dropExtraWeapons = {}
local attacker = ""
local spawnParticles = true

--[[-------------------------------------------------------------------------
2) Spawn Related
---------------------------------------------------------------------------]]
function ENT:CustomOnInitialize()

	self.uniqueId = tostring(self:GetCreationID()) //convenient unique identifier for timers
	self.TargetOffsetVector = Vector(
		(math.random(self.flyVars["minRadiusAroundTarget"],self.flyVars["maxRadiusAroundTarget"])) * self:PosOrNeg(), 
		(math.random(self.flyVars["minRadiusAroundTarget"],self.flyVars["maxRadiusAroundTarget"])) * self:PosOrNeg(),  
		math.random(self.flyVars["minHeightAboveTarget"],self.flyVars["maxHeightAboveTarget"]))
	self:VariantCode()
	self:Accelerate()
	self:RandomPosition1()
	self.models["corpseModel"] = self:GetModel()
	self.attackStats["damage"] = self.attackStats["damage"] * GetConVarNumber("vj_spv3_DamageModifier")
	self:UseConvars()
	self:SpawnLights()
	self:TypeOfDeath()
	self:InitializeSound()
	self:SetColor(self.Colors["modelColor"])
	self.spriteTrail["Object"] = util.SpriteTrail(self, 0,self.Colors["trailColor"],true,self.spriteTrail["startWidth"],self.spriteTrail["endWidth"],self.spriteTrail["lifetime"],20,"trails/smoke")
end


function ENT:VariantCode()

end

local TravelTime = 0
function ENT:InitializeSound() 
	self:EmitSound("npc_vj_sent_sentinel/sentinel_gun/impact.ogg",0,0,0)
	TravelTime = math.random(self.flyVars["minTravelTime"], self.flyVars["maxTravelTime"])
	self.soundTable["firingSoundObject"] = CreateSound(self, self.soundTable["firingSound"])
	self.soundTable["engineSoundObject"] = CreateSound(self, self.soundTable["engineSound"])
	self.soundTable["engineSoundObject"]:Play()
	self.soundTable["engineSoundObject"]:ChangePitch(self.soundTable["enginePitch"])
	self.soundTable["engineSoundObject"]:ChangeVolume(self.soundTable["engineVolume"])
end

function ENT:TypeOfDeath()
	self.fall=true
end

function ENT:UseConvars()
-- 	if (GetConVar("vj_sent_sentinelsFriendly"):GetInt() == 1) then
-- 	elseif (GetConVar("vj_sent_sentinelsFriendly"):GetInt() == 0) then
-- 		self.PlayerFriendly = false
-- 		self.FriendsWithAllPlayerAllies = false
-- 		self.VJ_NPC_Class = {"CLASS_SENTINEL", "CLASS_EARTH_FAUNA"}
-- 		for _,v in pairs(ents.GetAll()) do
--         if v:IsNPC() && (v.PlayerFriendly) then
--         	if (string.StartWith(v:GetClass(), "npc_vj_sent")) then
--             	table.insert(v.VJ_AddCertainEntityAsEnemy,self)
--             	v:VJ_DoSetEnemy(self,true,true)
--             	v:SetEnemy(self)
--             end
--         end
--         //test code for making sentinels hunt each other
--     end
-- 	end
end

function ENT:SpawnLights() //Spawn any light sprites around the sentinel
	for k,v in pairs(self.lights) do
		self.lights[k]["Object"] = ents.Create("env_sprite")
		if (self.lights[k]["Attachment"]!="") then
			self.lights[k]["Object"]:SetParent(self, self:LookupAttachment(self.lights[k]["Attachment"]))
			self.lights[k]["Object"]:SetPos(self:GetAttachment(self:LookupAttachment(self.lights[k]["Attachment"]))["Pos"] + self:GetForward()*self.lights[k]["Offset"].x + self:GetRight()*self.lights[k]["Offset"].y + self:GetUp()*self.lights[k]["Offset"].z)
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

--[[-------------------------------------------------------------------------
3) Combat & Movement Related
---------------------------------------------------------------------------]]
function ENT:CustomOn_PoseParameterLookingCode(pitch,yaw,roll) //helicopter-like movement, finally working!
	if (!IsValid(self) or self.dead or (!IsValid(self:GetEnemy()))) then return end
	//if (!self:GetEnemy():Visible(self)) then return end
	if (self.VJ_IsBeingControlled) then return end
	//if (self:GetVelocity():Length() <= 0) then return end
	//if (self:GetAimVector():Length() <= 0) then return end
	if (self:GetVelocity():Length() > 0) then
		local forwardFlat = Vector(self:GetVelocity().x, self:GetVelocity().y, 0) + Vector(1, 1, 0)
		local rightOrLeft = 1
		local aimFlat = Vector(self:GetAimVector().x, self:GetAimVector().y, 0) Vector(1.1, 1, 0) //adding something stops a nil math error, needs fixing
		if ((forwardFlat:Cross(aimFlat)).z > 0) then
			rightOrLeft = 1
		elseif ((forwardFlat:Cross(aimFlat)).z <= 0) then
			rightOrLeft = -1
		end
		local totResult = math.deg(math.acos((forwardFlat:Dot(aimFlat))/(forwardFlat:Length()*aimFlat:Length())))
		self:SetAngles(Angle(
			(math.Clamp((self:GetAngles().x + self:Lerp3(totResult/180, self.flyVars["maxPitch"], 0, -self.flyVars["maxPitch"])), -self.flyVars["maxPitch"], self.flyVars["maxPitch"])) * (self:GetVelocity():Length()/self.Aerial_FlyingSpeed_Alerted), //pitch
			self:GetAngles().y, //yaw
			(math.Clamp((self:GetAngles().z + self:Lerp3((totResult)/180, 0, self.flyVars["maxRoll"]*rightOrLeft, 0)), -self.flyVars["maxRoll"], self.flyVars["maxRoll"])) * (self:GetVelocity():Length()/self.Aerial_FlyingSpeed_Alerted))) //roll
	end
end

function ENT:Lerp3(t, a, b, c)
	if (t < 0.5) then
		return Lerp(t*2, a, b)
	elseif (t >= 0.5) then
		return Lerp((t-0.5)*2, b, c)
	end
end

function ENT:CustomOnAlert(argent) 
	self:VJ_ACT_PLAYACTIVITY("idleToCombat",true,1,false)
end

function ENT:PosOrNeg()
	if (math.random(0, 1)==0) then
		return 1
	else
		return -1
	end
end

ENT.PlayerToFollow = ""
function ENT:CustomOnFollowPlayer(key,activator,caller,data) 
	self:AA_MoveToPos(activator, false, {PosForward=self.vAd_PosForward,PosUp=self.vAd_PosUp,PosRight=self.vAd_PosRight})
	self.playerToFollow = activator
end




ENT.fireTrace = 0
ENT.Accuracy = 0
ENT.predictedPos = Vector(0, 0, 0)
ENT.difference = 0
ENT.currentEnemy = ""
ENT.currentEnemyPos = ""
ENT.expPos = 0
ENT.enemies = 0
function ENT:CustomOnRangeAttack_BeforeStartTimer()
	if (self.VJ_IsBeingControlled==true) then
		self.fireTrace = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos() + self:GetAimVector()*10000,
			filter = self,
		})
		self.enemies = ents.FindInSphere(self.fireTrace.HitPos, 50)
		for k,v in pairs(self.enemies) do
			if (string.StartWith(v:GetClass(), "npc_")) && (self.enemies[k]!=self) then
				self.currentEnemy = self.enemies[k]
				self.currentEnemyPos = self.currentEnemy:GetPos()
				break
			end
		end
	else
		self.currentEnemy = self:GetEnemy()
	end
	if (self.currentEnemy =="") then return false end
	if (!IsValid(self.currentEnemy)) then return false end
	self.predictedPos = self.currentEnemy:GetPos() + self:PredictPos(self.currentEnemy, 1)
	if (self:PredictPos(self.currentEnemy, 1)!=Vector(0, 0, 0)) then
		self.StartingAccuracyPos = (self.currentEnemy:GetPos()-self.predictedPos)*1.35 //So sentinel doesn't begin it's beam right on its enemy
	else
		self.StartingAccuracyPos = Vector(math.random(50, 100)*self:PosOrNeg(),math.random(50, 100)*self:PosOrNeg(),0)
	end
	self.Accuracy = self.StartingAccuracyPos
end

//USE SELF:GETFORWARD PLUS PREDICTPOS TO GET END POSITION OF BEAM
function ENT:CustomRangeAttackCode()
	if (self.currentEnemy =="") then return false end
	if (hitgroup == 500) then
		
	elseif (hitgroup == 501) then

	end
	if (self.predictedPos.z >= self:GetPos().z) && (self.canFireAbove==false) then
		return false
	end
	self.Accuracy = self.Accuracy + (self.StartingAccuracyPos*-self.attackStats["beamTickRate"])
	self.expPos = ((self.predictedPos + self.Accuracy) - self:GetPos()) * 10000
	if (self.dead) then self:BeamThing(false) return end
	self.fireTrace = util.TraceHull({
		start = self:GetPos(),
		endpos = self.expPos,
		filter = self,
		mins = Vector( -5, -5, -5 ),
		maxs = Vector( 5, 5, 5 ),
	})
	util.Decal("FadingScorch", self.fireTrace.HitPos, self.fireTrace.HitPos + self:GetAimVector()*50)
	self:SetNWVector("SentinelBeam1",self.fireTrace.HitPos) --used to draw a beam from current pos to enemy pos in cl_init.lua
	sound.Play("npc_vj_sent_sentinel/sentinel_gun/impact.ogg", self.fireTrace.HitPos, 60, 100, 1)
	-- if IsValid(self.currentEnemy) && !self.currentEnemy:Visible(self) then
	-- 	return false
	-- end
	-- if (self.fireTrace.Entity!=self.currentEnemy) then //Currently causes tremendous lag
	-- 	return false
	-- end
	if (self.fireTrace.Entity) then
		self.fireTrace.Entity:TakeDamage((self.attackStats["beamTickRate"]*self.attackStats["damage"]/self.attackStats["beamDuration"]),self,self)
	end
	if (!timer.Exists("firing"..self.uniqueId)) then
		self:BeamThing(true)
		timer.Create("firing"..self.uniqueId, self.attackStats["beamDuration"],0, function()  //purely visual
			if (IsValid(self)) then
				self:BeamThing(false)
				timer.Destroy("firing"..self.uniqueId)
			end
		end)
	end
	return false
end

function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return (((self:GetEnemy():GetPos() + self:PredictPos(self:GetEnemy(), 2)) -self:LocalToWorld(Vector(0,0,0))) *0.5 + self:GetUp()*400) //Get enemy coordinate, then get my coordinate in the world * 0.7, and then subtract the two and
end

function ENT:PredictPos(entity, multiplier)
	if ((entity:IsPlayer()) && (IsValid(entity:GetVehicle())==false)) then
		return (self:GetEnemy():GetVelocity()*multiplier)
	elseif ((entity:IsPlayer() == false)) then
		return  (self:GetEnemy():GetGroundSpeedVelocity()*multiplier)
	elseif (IsValid(self:GetEnemy():GetVehicle():GetParent())) then
		return (self:GetEnemy():GetVehicle():GetParent():GetVelocity()*multiplier)
	else
		return (self:GetEnemy():GetVehicle():GetVelocity()*multiplier)
	end
end

function ENT:BeamThing(beamOn)
	if (beamOn) then
		self:SetNWVector("MyPosition",self:GetPos())
		self:SetNWBool("firing",true)
		self:EmitSound(self.soundTable["firingIn"]) 
		self.soundTable["firingSoundObject"]:Play()
		self.soundTable["firingSoundObject"]:ChangePitch(self.soundTable["firingPitch"])
		self.soundTable["firingSoundObject"]:ChangeVolume(self.soundTable["firingVolume"])
	elseif (!beamOn) then
		self:SetNWBool("firing", false)
		self.soundTable["firingSoundObject"]:Stop()
		self:EmitSound(self.soundTable["firingOut"]) 
	end
end

ENT.savedVelocity = 0
function ENT:Decelerate() //Linear Deceleration
if (VJ_IsBeingControlled) then return false end
self.savedVelocity = self:GetVelocity()
if (self.VJ_IsBeingControlled==true) then self.flyVars["DecelerationTime"] = 0.1 end
	if (timer.Exists("AccelerateTimer"..self.uniqueId)) then timer.Destroy("AccelerateTimer"..self.uniqueId) end
	timer.Create("DecelerateTimer"..self.uniqueId, 0.1, self.flyVars["DecelerationTime"] * 10, function() if (IsValid(self)) then
		self:SentinelEngineSound()
			self:SetLocalVelocity(self:GetVelocity() - (self.savedVelocity * 0.1/self.flyVars["DecelerationTime"]))
	end end)
end

function ENT:Controller_Initialize(ply) 
	self:Decelerate()
	self:StopMoving()
	self.flyVars["minTravelTime"] = 1.5
	self.flyVars["maxTravelTime"] = 1.5
	self.flyVars["AccelerationTime"] = 0.1
	self.flyVars["DecelerationTime"] = 0
	self.DisableWandering = true
	self.TargetOffsetVector = Vector(0, 0, 0)
end


function ENT:Accelerate()
if (VJ_IsBeingControlled) then return false end
	if (self:GetCurrentSchedule()==73) then	return end
	timer.Create("AccelerateTimer"..self.uniqueId, 0.1, self.flyVars["AccelerationTime"] * 10, function() if (IsValid(self)) then 
		self:SentinelEngineSound()
		self:SetLocalVelocity(self:GetVelocity() + self.velocity * (0.1/self.flyVars["AccelerationTime"])) //is 0.5 so it reaches 1 over 20 iterations
	end end)
end

function ENT:SentinelTransitionAcceleration()
	self:Decelerate()
	timer.Create("DecAccTimer"..self.uniqueId, self.flyVars["DecelerationTime"], 1, function() if (IsValid(self)) then self:Accelerate() end end)
end

function ENT:RandomPosition1()
	if (VJ_IsBeingControlled) then return false end
	timer.Create("PositionNearEnemy"..self.uniqueId, self.flyVars["DecelerationTime"] + self.flyVars["AccelerationTime"] + TravelTime, 1, function() 
		if (IsValid(self)) then
			self.TargetOffsetVector = 
			Vector(
				(math.random(self.flyVars["minRadiusAroundTarget"],self.flyVars["maxRadiusAroundTarget"])) * self:PosOrNeg(), 
				(math.random(self.flyVars["minRadiusAroundTarget"],self.flyVars["maxRadiusAroundTarget"])) * self:PosOrNeg(),  
				math.random(self.flyVars["minHeightAboveTarget"],self.flyVars["maxHeightAboveTarget"]))
			self:SentinelTransitionAcceleration()
			if (self.VJ_IsBeingControlled == true) then self.TargetOffsetVector = Vector(0, 0, 0) end
		self:RandomPosition2()
		end
	end)
end

function ENT:RandomPosition2()
	if (VJ_IsBeingControlled) then return false end
	TravelTime = math.random(self.flyVars["minTravelTime"], self.flyVars["maxTravelTime"])
	timer.Create("PositionNearEnemy"..self.uniqueId, self.flyVars["DecelerationTime"] + self.flyVars["AccelerationTime"] + TravelTime, 1, function() 
		if (IsValid(self)) then
			x = (math.random(0, 1) == 1) and 1 or -1
			y = (math.random(0, 1) == 1) and 1 or -1
			self.TargetOffsetVector = 
			Vector(
				(math.random(self.flyVars["minRadiusAroundTarget"],self.flyVars["maxRadiusAroundTarget"])) * x, 
				(math.random(self.flyVars["minRadiusAroundTarget"],self.flyVars["maxRadiusAroundTarget"])) * y,  
				math.random(self.flyVars["minHeightAboveTarget"],self.flyVars["maxHeightAboveTarget"]))
			self:SentinelTransitionAcceleration()
			if (self.VJ_IsBeingControlled == true) then self.TargetOffsetVector = Vector(0, 0, 0) end
		self:RandomPosition1()
		end
	end)
end

function ENT:SentinelEngineSound()
	self.soundTable["engineSoundObject"]:ChangePitch(math.Clamp(self.soundTable["enginePitch"] * (self:GetVelocity():Length()/(self.Aerial_FlyingSpeed_Alerted-40)), self.soundTable["enginePitch"] * 0.75, self.soundTable["enginePitch"]))
	self.soundTable["engineSoundObject"]:ChangeVolume(math.Clamp(self.soundTable["engineVolume"] * (self:GetVelocity():Length()/(self.Aerial_FlyingSpeed_Alerted-40)), self.soundTable["engineVolume"] * 0.25, self.soundTable["engineVolume"]))
end


--[[-------------------------------------------------------------------------
4) Damage Related
---------------------------------------------------------------------------]]
ENT.vAlive = 0
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (self:Health()<=0) then return false end
	self.vAlive = self:GetVelocity() * 2
	attacker = dmginfo:GetAttacker()
	self.shieldRegen = false //disable any current active shield regen
	if (self.defensiveStats["shieldCurrent"] <= dmginfo:GetDamage() && self.defensiveStats["shieldCurrent"] > 0) && !(self:Health() > self.defensiveStats["shieldMax"]+self.defensiveStats["hullMax"]) then
		if (spawnParticles == true) then 
			self:SphereEffect(true)
			timer.Simple(0.1, function()
			if (IsValid(self)) then 
				self:SphereEffect(false)
				local effect = EffectData()
				effect:SetOrigin(self:GetPos())
				util.Effect("shieldBreakFX", effect) 
			end
			end)

		end
	end
	//Above lines only pertain to shield FX

	if (self.defensiveStats["shieldCurrent"] > 0) && !(self:Health() > self.defensiveStats["shieldMax"]+self.defensiveStats["hullMax"]) then
		if (dmginfo:GetDamageType()==DMG_PLASMA or dmginfo:GetDamageType()==DMG_BURN or dmginfo:GetDamageType()==DMG_SLOWBURN) then
			self.defensiveStats["shieldCurrent"] = math.Clamp(self.defensiveStats["shieldCurrent"] - (dmginfo:GetDamage()*2), 0, self.defensiveStats["shieldMax"])
		else
			self.defensiveStats["shieldCurrent"] = math.Clamp(self.defensiveStats["shieldCurrent"] - dmginfo:GetDamage(), 0, self.defensiveStats["shieldMax"])
		end
		
	elseif (self.defensiveStats["shieldCurrent"] <= 0 or (self:Health() < dmginfo:GetDamage())) && !(self:Health() > self.defensiveStats["shieldMax"]+self.defensiveStats["hullMax"]) then
		self:RemoveBodypart(hitgroup, dmginfo)
		self.defensiveStats["hullCurrent"] = self.defensiveStats["hullCurrent"] - dmginfo:GetDamage()
	end
	if ((self.defensiveStats["shieldCurrent"] > 0) && (self.defensiveStats["shieldCurrent"] > dmginfo:GetDamage()) && !self.dead && !(self:Health() > (self.defensiveStats["shieldMax"]+self.defensiveStats["hullMax"]))) then
		self:SphereEffect(true)
	elseif (self:Health() <= dmginfo:GetDamage() && !self.dead && self.fall) && !(self:Health() > self.defensiveStats["shieldMax"]+self.defensiveStats["hullMax"]) then	
		self:RemoveBodypart(hitgroup, dmginfo)
		self:FallDeath()
	end
	if (timer.Exists("regendelay"..self.uniqueId)) then
		timer.Destroy("regendelay"..self.uniqueId)
	end
	timer.Create("regendelay"..self.uniqueId, self.defensiveStats["shieldDelay"],0, function() if(IsValid(self)) then self:RegenShield() end end)
end

function ENT:RemoveBodypart(hitgroup, dmginfo)
	local gibs = {}
	for k, v in pairs(self.limbs) do
		if (hitgroup == self.limbs[k]["Hitgroup"]) then
			if ((self.limbs[k]["Health"]-dmginfo:GetDamage()) > 0) or (self.limbs[k]["Removed"]==true) then
				self.limbs[k]["Health"]=self.limbs[k]["Health"]-dmginfo:GetDamage()
				return false
			end
			self.limbs[k]["Removed"]=true
			self:RemoveAllDecals()
			local part = self.limbs[k]
			for i, j in pairs(part["Gibs"]) do
				gibs[i] = self:CreateGibEntity("obj_vj_sent_gib", part["Gibs"][i])
				gibs[i]:SetModel(part["Gibs"][i])
				gibs[i]:SetPos(dmginfo:GetDamagePosition())
				gibs[i]:SetColor(self.Colors["modelColor"])
				gibs[i]:Spawn()
				gibs[i]:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
				gibs[i]:GetPhysicsObject():AddVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
				gibs[i]:GetPhysicsObject():AddVelocity(self.vAlive)
				timer.Create("FireFallFXSmall"..self.uniqueId..i..(math.random(0, 25)), 0.075, 300, function() 
				if (IsValid(gibs[i]))&&(i==1) then 
					local effect = EffectData()
					effect:SetOrigin(gibs[i]:GetPos()) 
					util.Effect("fireFallFXSmall", effect)
					end 
				end) 
			end
			for i, j in pairs(part["Bodygroups"]) do
				self:SetBodygroup(self:FindBodygroupByName(part["Bodygroups"][i]), 1)
			end
			for i, j in pairs(part["Lights"]) do 
				self.lights[part["Lights"][i]]["Object"]:Remove()
			end
			self:OnPartRemoved(part, dmginfo)
		end
end
end

function ENT:OnPartRemoved(bodypart, dmginfo)
	if (bodypart == self.limbs["head"]) then
		self:FallDeath()
	elseif (bodypart == self.limbs["gun"]) then
		self:BeamThing(false)
		timer.Destroy("timer_range_start"..self:EntIndex())
		self.HasRangeAttack=false
		local weapon = ents.Create("weapon_vj_sent_sentinelbeam")
		weapon:SetPos(dmginfo:GetDamagePosition())
		weapon:Spawn()
		self.HasItemDropsOnDeath = false
	end
end

function ENT:SphereEffect(FXOn) //Spawn a sphere around sentinel when taking damage and quickly remove it
	if (FXOn==true) then
		if (self.shieldIsOn==false) then
			self.shieldIsOn=true
			self.shieldFXEnt = ents.Create("prop_physics")
			self.shieldFXEnt:SetModel(self.models["ShieldModel"])
			self.shieldFXEnt:SetMaterial("models/alyx/emptool_glow")
			self.shieldFXEnt.RenderGroup = RENDERGROUP_TRANSLUCENT
			self.shieldFXEnt:SetColor(self.Colors["shieldColor"])
			self.shieldFXEnt:SetModelScale(1.2,0)
			self.shieldFXEnt:SetCollisionGroup(10) //allows NPC to see through it's shield
			self.shieldFXEnt:SetMoveParent(self)
			if (self.shieldRegen) then 
				self.shieldFXEnt:SetMaterial("models/props_combine/portalball001_sheet") 
			end
			self.shieldFXEnt:SetPos(self:GetPos())
			self.shieldFXEnt:Spawn()
			//timer.Simple(.5,function() if (IsValid(self)) then self.shieldFXEnt:Remove() end end)	
		end
		if (timer.Exists("shieldFX"..self.uniqueId)) then
			timer.Remove("shieldFX"..self.uniqueId)
			timer.Create("shieldFX"..self.uniqueId, .5, 1, function() 
				if (IsValid(self) && IsValid(self.shieldFXEnt)) then 
					self.shieldFXEnt:Remove()
					self.shieldIsOn=false 
				end 
			end)
		else
			timer.Create("shieldFX"..self.uniqueId, .5, 1, function() 
				if (IsValid(self) && IsValid(self.shieldFXEnt)) then 
					self.shieldFXEnt:Remove()
					self.shieldIsOn=false 
				end 
			end)
		end
	elseif (FXOn==false) then
		if (IsValid(self.shieldFXEnt)) then self.shieldFXEnt:Remove() self.shieldIsOn=false end	
	end
end


ENT.shieldFXEnt = ""
ENT.shieldIsOn = false

function ENT:RegenShield() //Regenerate the shield
	self.shieldRegen = true
	timer.Create("regen"..self.uniqueId, self.defensiveStats["shieldSpeed"], (self.defensiveStats["shieldMax"] - self.defensiveStats["shieldCurrent"])/self.defensiveStats["shieldRegen"] , function() 
		if (self.shieldRegen && !self.dead && (self.defensiveStats["shieldCurrent"] < self.defensiveStats["shieldMax"])) then
			self.defensiveStats["shieldCurrent"] = self.defensiveStats["shieldCurrent"] + self.defensiveStats["shieldRegen"]
			self:SetHealth(self:Health() + self.defensiveStats["shieldRegen"])
			self:SphereEffect(true) 
		end
	end)
end
--[[-------------------------------------------------------------------------
5) Death Related
---------------------------------------------------------------------------]]
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup) //spark effects messing up

	util.BlastDamage(self,self,self:GetPos()+ Vector(0,0,self:BoundingRadius()/2 + 10),250,200) 
	self.vAlive = self:GetVelocity()
	if (spawnParticles == true) then 
		local effect = EffectData()
		effect:SetOrigin(self:GetPos())
		util.Effect("deathFireFX", effect) 
		util.Effect("cball_explode",effect)
	end
	ParticleEffect("explosion_turret_break",self:GetPos(),Angle(0,0,0),nil)
	if (!self.gib) then
		self:CreateCustomCorpse()
	end
end

function ENT:DropExtraWeapons()
	for k, v in pairs(self.dropExtraWeapons) do
		local weapon = ents.Create(self.dropExtraWeapons[k])
		weapon:SetPos(self:GetPos())
		weapon:Spawn()
	end
end

function ENT:CreateCustomCorpse()
	self:DropExtraWeapons()
	local corpse = ents.Create("prop_ragdoll")
	corpse:SetModel(self.models["corpseModel"])
	corpse:SetMaterial(self:GetMaterial())
	local bodygroups = self:GetBodyGroups()
	for k, v in pairs(bodygroups) do
		corpse:SetBodygroup(bodygroups[k]["id"], self:GetBodygroup(bodygroups[k]["id"]))
	end
	corpse:SetBodyGroups(self:GetBodyGroups())
	corpse:SetBodygroup(self:FindBodygroupByName("gun"), 1)
	corpse:SetPos(self:GetPos())
	corpse:SetAngles(self:GetAngles())
	corpse:Spawn()
	corpse:Activate()
	corpse.VJ_IgnoreFloodInfection = true
	corpse:SetColor(self.Colors["corpseColor"])
	-- corpse:PhysicsInit(SOLID_VPHYSICS)
	
	corpse:GetPhysicsObject():AddAngleVelocity(Vector(math.random(0, 500), math.random(0, 500), math.random(0, 500)))
	corpse:GetPhysicsObject():SetVelocity(self.vAlive)
	-- corpse.RenderGroup = RENDERGROUP_BOTH
	corpse.ignite = self.ignite
	local sparks = CreateSound(corpse, "npc_vj_sent_sentinel/sentinel_death/spark_loop.wav")
	sparks:Play()
	sparks:ChangeVolume(0.3)
	local effect = EffectData()
	effect:SetOrigin(corpse:GetPos())
	timer.Create("FireFallFXCorpse"..self.uniqueId, .15, 3000, function() if (IsValid(corpse)) then effect:SetOrigin(corpse:GetPos()) util.Effect("fireFallFX", effect) end end)
	timer.Create("corpseSparks"..self.uniqueId,2.5,16,function () if (IsValid(corpse)) then effect:SetOrigin(corpse:GetPos())  util.Effect("cball_explode",effect) end corpse:EmitSound(Sound("npc_vj_sent_sentinel/sentinel_welder_impact/weld13.ogg")) end)
	timer.Simple(2.5,function() if (IsValid(corpse) && corpse.ignite) then corpse:Ignite()  end end)
	timer.Simple(40, function () if (IsValid(corpse)) then  corpse:Remove() sparks:Stop() end end)
end

function ENT:FallDeath() //Make NPC limp and fall to their death
	if (self:GetNWVector("firing")==true) then
		self.HasRangeAttack=false
		timer.Destroy("timer_range_start"..self:EntIndex())
		self:BeamThing(false)
		timer.Destroy("firing"..self.uniqueId)
	end
	self:AddEFlags(EFL_NO_THINK_FUNCTION)
	local moreVelocity = 5
	self.enableAI=false
	self:StopMoving()
	self:SetSchedule(73)
	self:AddCallback("PhysicsCollide", function()
		if (self.dead && !self.timeDeath) then
			self:TakeDamage(99999, attacker)
			util.ScreenShake( self:GetPos(), 50, 500, 1.2, 500 )
		elseif (self.dead && self.timeDeath) then
			self.timeToDie = math.random(3.5, 6.5)
			if !(timer.Exists("destroy"..self.uniqueId)) then
				timer.Simple(self.timeToDie - 3, function() if (IsValid(self)) then
				timer.Create("randomImpulse"..self.uniqueId, 0.1, 0, function() if (IsValid(self)) then 
					moreVelocity = moreVelocity + 1.5
					self:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-125- moreVelocity, 125+ moreVelocity), math.random(-125- moreVelocity, 125+ moreVelocity), math.random(-125- moreVelocity, 125+ moreVelocity)))
					self:GetPhysicsObject():AddVelocity(Vector(math.random(-25 - moreVelocity, 25 + moreVelocity), math.random(-25- moreVelocity, 25 + moreVelocity), math.random(-25- moreVelocity, 25 + moreVelocity)))
				end
				end) end end)
				timer.Create("preDeath"..self.uniqueId, self.timeToDie - 3, 1, function() if (IsValid(self)) then self:EmitSound("npc_vj_sent_sentinel/sentinel_death/SentinelPreDestroyed.ogg") end end)
				timer.Create("destroy"..self.uniqueId,self.timeToDie,1,function() if (IsValid(self)) then self:TakeDamage(99999, attacker) util.ScreenShake( self:GetPos(), 50, 500, 1.2, 500 ) end end)
			end
		end end)
	local effect = EffectData()
	if (IsValid(self.spriteTrail["Object"])) then self.spriteTrail["Object"]:Remove() end
	timer.Create("FireFallFX"..self.uniqueId, 0.05, 300, function() if (IsValid(self) && self:GetVelocity().z<-100) then effect:SetOrigin(self:GetPos()) util.Effect("fireFallFX", effect) end end)
	if (self.randomFire) then self:RandomFire() end
	self.CanFlinch = 0
	self.dead = true
	self:SetHealth(99999)
	self.RangeAttackReps = 0 //stop any current attacks
	self.ConstantlyFaceEnemy = false
	self.Behavior = VJ_BEHAVIOR_PASSIVE
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:GetPhysicsObject():Wake()
	self:GetPhysicsObject():AddAngleVelocity(Vector(math.random(0, 500), math.random(0, 500), math.random(0, 500)))
	self:GetPhysicsObject():AddVelocity(self.vAlive)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
end

function ENT:SetUpGibesOnDeath(dmginfo,hitgroup) //Gib a bunch on death
	for k,v in pairs(self.limbs) do
		if (self.limbs[k]["Removed"]==false) then
			for i, j in pairs(self.limbs[k]["Gibs"]) do
				table.insert(self.gibTable, self.limbs[k]["Gibs"][i])
			end
		end
	end
	self:DropExtraWeapons()
	local ent = {}
	if (self.gib) then 
		for k,v in pairs(self.gibTable) do
			ent[k] = self:CreateGibEntity("obj_vj_sent_gib",self.gibTable[k])
			ent[k]:SetColor(self.Colors["corpseColor"])
			ent[k]:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
			ent[k]:GetPhysicsObject():AddVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
			ent[k]:GetPhysicsObject():AddVelocity(self.vAlive)
			local effect=EffectData()
			timer.Create("FireFallFXSmall"..self.uniqueId..k, 0.075, 300, function() 
				if (IsValid(ent[k])) && (math.fmod(k, 2)==0) then 
					effect:SetOrigin(ent[k]:GetPos()) 
					util.Effect("fireFallFXSmall", effect)
					end 
				end) 
			
		end
	if (self.ignite) then ent[1]:Ignite() end
end
end

// Code to force the sentinel to look at the enemy (in pitch). Doesn't work while actively firing at the enemy currently and/or if the sentinel is falling.
//Test for pitch, yaw when moving
function ENT:RandomFire()
	local timesToFire = math.random(3, 12)
	timer.Create("RandomFireOn"..self.uniqueId, .4, timesToFire, function()
		if (IsValid(self)) then
			self:SetNWVector("SentinelBeam1", self:GetShootPos() + self:GetForward()*1500)
			self:BeamThing(true)
		end
	end)
	timer.Create("RandomFireOff"..self.uniqueId, .5, timesToFire, function() 
		if (IsValid(self)) then
			self:BeamThing(false)
		end
	end)
end

function ENT:CustomOnRemove()
	if (self.soundTable["firingSoundObject"]:IsPlaying()) then 
	self:BeamThing(false)
	end
	self.soundTable["engineSoundObject"]:Stop()
	self:DestroyTimers()
end

local timerTable = {
	"randomImpulse",
	"preDeath",
	"PositionNearEnemy",
	"DecAccTimer",
	"firing",
	"DecelerateTimer",
	"AccelerateTimer",
	"regenDelay",
	"shieldFX",
	"regen",
	//"corpse",
	//"destroy",
	"FireFallFX",
	"FireFallFXSmall",
	"RandomFireOn",
	"RandomFireOff"
}

function ENT:DestroyTimers()
	for k,v in pairs(timerTable) do
		if (timer.Exists(v..self.uniqueId)) then 
			timer.Destroy(v..self.uniqueId) 
		end
	end
end
--[[-------------------------------------------------------------------------
6) Modified Existing Functions
---------------------------------------------------------------------------]]
function ENT:CreateGibEntity(Ent,Models,Tbl_Features,CustomCode)
	// self:CreateGibEntity("prop_ragdoll","",{Pos=self:LocalToWorld(Vector(0,3,0)),Ang=self:GetAngles(),Vel=})
	if self.AllowedToGib == false then return end
	Ent = Ent or "prop_ragdoll"
	if Models == "UseAlien_Small" then Models = {"models/gibs/xenians/sgib_01.mdl","models/gibs/xenians/sgib_02.mdl","models/gibs/xenians/sgib_03.mdl"} end
	if Models == "UseAlien_Big" then Models = {"models/gibs/xenians/mgib_01.mdl","models/gibs/xenians/mgib_02.mdl","models/gibs/xenians/mgib_03.mdl","models/gibs/xenians/mgib_04.mdl","models/gibs/xenians/mgib_05.mdl","models/gibs/xenians/mgib_06.mdl","models/gibs/xenians/mgib_07.mdl"} end
	if Models == "UseHuman_Small" then Models = {"models/gibs/humans/sgib_01.mdl","models/gibs/humans/sgib_02.mdl","models/gibs/humans/sgib_03.mdl"} end
	if Models == "UseHuman_Big" then Models = {"models/gibs/humans/mgib_01.mdl","models/gibs/humans/mgib_02.mdl","models/gibs/humans/mgib_03.mdl","models/gibs/humans/mgib_04.mdl","models/gibs/humans/mgib_05.mdl","models/gibs/humans/mgib_06.mdl","models/gibs/humans/mgib_07.mdl"} end
	Models = VJ_PICKRANDOMTABLE(Models)
	local vTbl_BloodType = "Red"
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

ENT.velocity = Vector(0, 0, 0)
function ENT:AA_ChaseEnemy(ShouldPlayAnim,UseCalmVariables)
	if self.Dead == true or (self.NextChaseTime > CurTime()) or !IsValid(self:GetEnemy()) then return end
	local ShouldPlayAnim = ShouldPlayAnim or false
	local UseCalmVariables = UseCalmVariables or false
	local Debug = self.AA_EnableDebug
	local MoveSpeed = self.Aerial_FlyingSpeed_Alerted
	if self.MovementType == VJ_MOVETYPE_AQUATIC then
		if Debug == true then
			print("--------")
			print("ME WL: "..self:WaterLevel())
			print("ENEMY WL: "..self:GetEnemy():WaterLevel())
		end
		-- Yete chouri e YEV leman marmine chourin mech-e che, ere vor gena yev kharen kal e
		if self:WaterLevel() <= 2 && self:GetVelocity():Length() > 0 then return end
		if self:WaterLevel() <= 1 && self:GetVelocity():Length() > 0 then self:AA_Wander(true,true) return end
		if self:GetEnemy():WaterLevel() == 0 then self:DoIdleAnimation(1) return end -- Yete teshnamin chouren tours e, getsour
		if self:GetEnemy():WaterLevel() <= 1 then -- Yete 0-en ver e, ere vor nayi yete gerna teshanmi-in gerna hasnil
			local trene = util.TraceLine({
				start = self:GetEnemy():GetPos() + self:OBBCenter(),
				endpos = (self:GetEnemy():GetPos() + self:OBBCenter()) + self:GetEnemy():GetUp()*-20,
				filter = self,
				mins = self:OBBMins(),
				maxs = self:OBBMaxs()
			})
			//PrintTable(trene)
			//VJ_CreateTestObject(trene.HitPos,self:GetAngles(),Color(0,255,0),5)
			if trene.Hit == true then return end
		end
		MoveSpeed = self.Aquatic_SwimmingSpeed_Alerted
	end
	
	if UseCalmVariables == true then
		if self.MovementType == VJ_MOVETYPE_AQUATIC then
			MoveSpeed = self.Aquatic_SwimmingSpeed_Calm
		else
			MoveSpeed = self.Aerial_FlyingSpeed_Calm
		end
	end
	self:FaceCertainEntity(self:GetEnemy(),true)

	if ShouldPlayAnim == true && self.NextChaseTime < CurTime() then
		self.AA_CanPlayMoveAnimation = true
		if UseCalmVariables == true then
			self.AA_CurrentMoveAnimationType = "Calm"
		else
			self.AA_CurrentMoveAnimationType = "Alert"
		end
	else
		self.AA_CanPlayMoveAnimation = false
	end

	-- Main Calculations
	local vel_for = 1
	local vel_stop = false
	local nearpos = self:VJ_GetNearestPointToEntity(self:GetEnemy())
	local startpos = nearpos.MyPosition // self:GetPos()
	local endpos = nearpos.EnemyPosition // self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()
	local tr = util.TraceHull({
		start = startpos,
		endpos = endpos,
		filter = self,
		mins = self:OBBMins(),
		maxs = self:OBBMaxs()
	})
	local tr_hitpos = tr.HitPos
	local dist_selfhit = startpos:Distance(tr_hitpos)
	if Debug == true then util.ParticleTracerEx("Weapon_Combine_Ion_Cannon_Beam",tr.StartPos,tr_hitpos,false,self:EntIndex(),0) end //vortigaunt_beam
	if dist_selfhit <= 16 && tr.HitWorld == true then
		if Debug == true then print("AA: Forward Blocked! [CHASE]") end
		vel_for = 1
		//vel_for = -200
		//vel_stop = true
	end
	local enepos = self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter() + self.TargetOffsetVector //probably how it should stay for units
	if self.MovementType == VJ_MOVETYPE_AQUATIC && self:GetEnemy():WaterLevel() < 3 then
		enepos = self:GetEnemy():GetPos()
	end
	
	-- X Calculations
		-- Coming soon!
	
	-- Z Calculations
	local vel_up = MoveSpeed
	local dist_selfhit_z = enepos.z - startpos.z -- Get the distance between the hit position and the start position
	if dist_selfhit_z > 0 then -- Yete 0-en ver e, ere vor 20-en minchev sahmani tive hasni
		if Debug == true then print("AA: GOING UP [CHASE]") end
		vel_up = math.Clamp(dist_selfhit_z, 20, MoveSpeed)
	elseif dist_selfhit_z < 0 then -- Yete 0-en var e, ere vor nevaz 20-en minchev nevaz sahmani tive hasni
		if Debug == true then print("AA: GOING DOWN [CHASE]") end
		vel_up = -math.Clamp(math.abs(dist_selfhit_z), 20, MoveSpeed)
	else
		vel_up = 0
	end
	
	if dist_selfhit < 100 then -- Yete 100-en var e tive, esel e vor modig e, ere vor gamatsna
		MoveSpeed = math.Clamp(dist_selfhit, 100, MoveSpeed)
	end
	-- Final velocity
	if vel_stop == false then
		self.CurrentTurningAngle = false
		local vel_set = ((enepos) - (self:GetPos() + self:OBBCenter())):GetNormal()*MoveSpeed + self:GetUp()*vel_up + self:GetForward()*vel_for
		self.velocity = Vector(vel_set.x, vel_set.y, vel_set.z * 0.3)
		//local vel_set_yaw = vel_set:Angle().y
		//self:Decelerate()
		//self:SetLocalVelocity(vel_set)
		local vel_len = CurTime() + (dist_selfhit / vel_set:Length())
		self.AA_MoveLength_Wander = 0
		if vel_len == vel_len then -- Check for NaN
			self.AA_MoveLength_Chase = vel_len
			self.NextIdleTime = vel_len
		end
		if Debug == true then ParticleEffect("vj_impact1_centaurspit", enepos, Angle(0,0,0), self) end
	else
		self:AA_Stop()
	end
	//self.NextChaseTime = CurTime() + 0.1
end


function ENT:AA_IdleWander(ShouldPlayAnim,NoFace)
	local moveSpeed = self.Aerial_FlyingSpeed_Calm
	local forceDown = forceDown or false
	if self.MovementType == VJ_MOVETYPE_AQUATIC then
		if self:WaterLevel() < 3 then
			self:AA_StopMoving()
			forceDown = true
			if self:WaterLevel() == 0 then
				return
			end
		end
		moveSpeed = self.Aquatic_SwimmingSpeed_Calm
	end
	
	local debug = self.AA_EnableDebug
	playAnim = playAnim or false
	noFace = noFace or false

	if playAnim == true then
		self.AA_CanPlayMoveAnimation = true
		self.AA_CurrentMoveAnimationType = "Calm"
	else
		self.AA_CanPlayMoveAnimation = false
	end
	//if noFace == false then self:SetLocalAngularVelocity(Angle(0,math.random(0,360),0)) end
	local x_neg = 1
	local y_neg = 1
	local z_neg = 1
	if math.random(1,2) == 1 then x_neg = -1 end
	if math.random(1,2) == 1 then y_neg = -1 end
	if math.random(1,2) == 1 then z_neg = -1 end
	local tr_startpos = self:GetPos()
	local tr_endpos = tr_startpos + self:GetForward()*((self:OBBMaxs().x + math.random(100,200))*x_neg) + self:GetRight()*((self:OBBMaxs().y + math.random(100,200))*y_neg) + self:GetUp()*((self:OBBMaxs().z + math.random(100,200))*z_neg)
	if forceDown == true then
		tr_endpos = tr_startpos + self:GetUp()*((self:OBBMaxs().z + math.random(100,150))*-1)
	end
	/*local tr_for = math.random(-300,300)
	local tr_up = math.random(-300,300)
	local tr_right = math.random(-300,300)
	local tr = util.TraceLine({start = tr_startpos, endpos = tr_startpos+self:GetForward()*tr_for+self:GetRight()*tr_up+self:GetUp()*tr_right, filter = self})*/
	local tr = util.TraceLine({start = tr_startpos, endpos = tr_endpos, filter = self})
	local finalpos = tr.HitPos
	//PrintTable(tr)
	if forceDown == false && self.MovementType == VJ_MOVETYPE_AERIAL then -- Yete ches estibergor vor var yerta YEV loghatsough SNPC che, sharnage...
		local tr_check = util.TraceLine({start = finalpos, endpos = finalpos + Vector(0, 0, -100), filter = self})
		if tr_check.HitWorld == true then -- Yete askharin zargav, ere vor shad var chishne
			finalpos = finalpos + self:GetUp()*(100 - tr_check.HitPos:Distance(finalpos))
		end
	end
	//self.AA_TargetPos = finalpos
	
	-- Angle time test (PHYSICS)
	/*local test1 = math.AngleDifference(tr.StartPos:Angle().y, self:GetFaceAngle((finalpos-tr.StartPos):Angle()).y)
	local test2 = (math.rad(test1) / math.rad(self:GetFaceAngle((finalpos-tr.StartPos):Angle()).y)) * 20
	self.yep = CurTime() + math.abs(test2)
	self.yep2 = self:GetFaceAngle((finalpos-tr.StartPos):Angle())*/
	
	if noFace == false then self.AA_CurrentTurnAng = self:GetFaceAngle((finalpos-tr.StartPos):Angle()) end //self:SetLocalAngularVelocity(self:GetFaceAngle((finalpos-tr.StartPos):Angle())) end
	if debug == true then
		VJ_CreateTestObject(finalpos, self:GetAngles(), Color(0,255,255), 5)
		util.ParticleTracerEx("Weapon_Combine_Ion_Cannon_Beam", tr.StartPos, finalpos, false, self:EntIndex(), 0)
	end

	-- Set the velocity
	//local myvel = self:GetVelocity()
	local vel_set = (finalpos-self:GetPos()):GetNormal()*moveSpeed
	local vel_len = CurTime() + (finalpos:Distance(tr_startpos) / vel_set:Length())
	self.AA_MoveLength_Chase = 0
	if vel_len == vel_len then -- Check for NaN
		self.AA_MoveLength_Wander = vel_len
		self.NextIdleTime = vel_len
	end
	self:SetLocalVelocity(vel_set)
	if debug == true then ParticleEffect("vj_impact1_centaurspit", finalpos, Angle(0,0,0), self) end
end

function ENT:AAStop()
	if self.MovementType != VJ_MOVETYPE_AERIAL && self.MovementType != VJ_MOVETYPE_AQUATIC then return end
	if self:GetVelocity():Length() > 0 then
		self:Decelerate()
	end
end

function ENT:RangeAttackCode_DoFinishTimers() //Removed DoChaseAnimation() which caused jittering problems when attacking
	timer.Create( "timer_range_finished"..self:EntIndex(), self:DecideAttackTimer(self.NextAnyAttackTime_Range,self.NextAnyAttackTime_Range_DoRand,self.TimeUntilRangeAttackProjectileRelease,self.CurrentAttackAnimationDuration), 1, function()
		self:StopAttacks()
	end)
	timer.Create( "timer_range_finished_abletorange"..self:EntIndex(), self:DecideAttackTimer(self.NextRangeAttackTime,self.NextRangeAttackTime_DoRand), 1, function()
		self.IsAbleToRangeAttack = true
	end)
end

function ENT:StopAttacks(CheckTimers) //Removed DoChaseAnimation() which caused jittering problems when attacking
	if self:Health() <= 0 then return end
	//self:TaskComplete()
	if self.VJDEBUG_SNPC_ENABLED == true then if GetConVarNumber("vj_npc_printstoppedattacks") == 1 then print(self:GetClass().." Stopped all Attacks!") end end
	if CheckTimers == true then
		//self.IsAbleToMeleeAttack = true
		//self.IsAbleToRangeAttack = true
		//self.IsAbleToLeapAttack = true
		if self.MeleeAttacking == true && self.AlreadyDoneFirstMeleeAttack == false then self:MeleeAttackCode_DoFinishTimers() end
		if self.RangeAttacking == true && self.AlreadyDoneRangeAttackFirstProjectile == false then self:RangeAttackCode_DoFinishTimers() end
		if self.LeapAttacking == true && self.AlreadyDoneFirstLeapAttack == false then self:LeapAttackCode_DoFinishTimers() end
	end
	self.MeleeAttacking = false
	self.RangeAttacking = false
	self.LeapAttacking = false
	self.AlreadyDoneMeleeAttackFirstHit = false
	self.AlreadyDoneFirstMeleeAttack = false
	self.AlreadyDoneLeapAttackFirstHit = false
	self.AlreadyDoneFirstLeapAttack = false
	self.AlreadyDoneRangeAttackFirstProjectile = false
end

function ENT:FollowPlayerCode(key,activator,caller,data)
	if self.FollowPlayer == false or GetConVarNumber("ai_disabled") == 1 or GetConVarNumber("ai_ignoreplayers") == 1 then return end
	if key == self.FollowPlayerKey && activator:IsValid() && activator:Alive() && activator:IsPlayer() then
		if self:Disposition(activator) == D_HT then
			if self.AllowPrintingInChat == true && self.FollowPlayerChat == true then
				activator:PrintMessage(HUD_PRINTTALK, self:GetName().." doesn't like you, therefore it won't follow you.")
			end
			return
		elseif self:Disposition(activator) == D_NU then
			if self.AllowPrintingInChat == true && self.FollowPlayerChat == true then
				activator:PrintMessage(HUD_PRINTTALK, self:GetName().." is neutral to you, therefore it won't follow you.")
			end
			return
		end
		self:CustomOnFollowPlayer(key,activator,caller,data)
		if self.MovementType == VJ_MOVETYPE_STATIONARY or self.MovementType == VJ_MOVETYPE_PHYSICS then
			if self.AllowPrintingInChat == true && self.FollowPlayerChat == true then
				activator:PrintMessage(HUD_PRINTTALK, self:GetName().." is currently stationary, therefore it's unable follow you.")
			end
			return
		end
		if self.FollowingPlayer == false then
			//self:FaceCertainEntity(activator,false)
			if self.AllowPrintingInChat == true && self.FollowPlayerChat == true then
			activator:PrintMessage(HUD_PRINTTALK, self:GetName().." is now following you.") end
			-- self.FollowPlayer_WanderValue = self.DisableWandering
			self.FollowPlayer_ChaseValue = self.DisableChasingEnemy
			-- self.DisableWandering = true
			self.DisableChasingEnemy = true 
			self:SetTarget(activator)
			self.FollowPlayer_Entity = activator
			if self:BusyWithActivity() == false then
				self:StopMoving()
				self:VJ_TASK_FACE_X("TASK_FACE_TARGET",function(x) x.RunCode_OnFinish = function()
					local DistanceToPly = self:GetPos():Distance(self.FollowPlayer_Entity:GetPos())
					local movetype = "TASK_RUN_PATH"
					if DistanceToPly < 220 then
						movetype = "TASK_WALK_PATH"
					end
					self:VJ_TASK_GOTO_TARGET(movetype,function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy = true end) 
				end end)
			end
			//timer.Simple(0.15,function() if self:IsValid() && self.VJ_PlayingSequence == false then self:VJ_SetSchedule(SCHED_TARGET_FACE) end end)
			//if self.VJ_PlayingSequence == false then self:VJ_SetSchedule(SCHED_IDLE_STAND) end
			//timer.Simple(0.1,function() if self:IsValid() then self:VJ_TASK_GOTO_TARGET() end end)
			self:FollowPlayerSoundCode()
			self.FollowingPlayer = true
		else
			self:UnFollowPlayerSoundCode()
			if self:BusyWithActivity() == false then
				self:VJ_TASK_FACE_X("TASK_FACE_TARGET")
			end
			//if self.VJ_PlayingSequence == false then self:VJ_SetSchedule(SCHED_TARGET_FACE) end
			self:FollowPlayerReset()
		end
	end
end

