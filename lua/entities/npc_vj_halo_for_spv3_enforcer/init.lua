AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile("shared.lua")
include('entities/npc_vj_halo_for_spv3_aggressor/init.lua')
/*-----------------------------------------------
*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/

--Base
ENT.models = {
	BaseModel = "models/hce/spv3/forerunner/enforcer/enforcer.mdl",
	CorpseModel = "models/hce/spv3/forerunner/enforcer/enforcer.mdl",
	ShieldModel = "models/hce/spv3/forerunner/enforcer/enforcer.mdl",
}
ENT.Model = ENT.models["BaseModel"]
ENT.defensiveStats = {
	shieldMax = 0,
	shieldCurrent = 0,
	shieldRegen = 1,
	shieldSpeed = .1,
	shieldDelay = 5,
	hullMax = 500,
	hullCurrent = 500,
	hullArmor = 25,
}
-- ENT.hullMaxHealth = 500
-- ENT.hullHealth = ENT.hullMaxHealth
-- ENT.shieldMaxHealth = 0
-- ENT.shieldHealth = ENT.shieldMaxHealth
-- ENT.shieldRegenAmount = 1
-- ENT.shieldRegenSpeed = .1
-- ENT.shieldRegenDelay = 5
-- ENT.shieldRegen = false
-- ENT.HullType = HULL_LARGE_CENTERED
ENT.HasHull = false
ENT.HullSizeNormal = false -- set to false to cancel out the self:SetHullSizeNormal()
ENT.StartHealth = ENT.defensiveStats["hullMax"] + ENT.defensiveStats["shieldMax"]
ENT.MovementType = VJ_MOVETYPE_AERIAL -- How does the SNPC move?
ENT.VJ_NPC_Class = {"CLASS_SENTINEL", "CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
ENT.ItemDropsOnDeath_EntityList = {}
ENT.AA_ConstantlyMove = true
--Vision--
ENT.SightDistance = 10000 -- How far it can see
ENT.SightAngle = 240 -- The sight angle | Example: 180 would make the it see all around it | Measured in degrees and then converted to radians
--Movement--
ENT.Aerial_FlyingSpeed_Calm = 90 -- The speed it should fly with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
ENT.Aerial_FlyingSpeed_Alerted = 90 --
ENT.RangeDistance = ENT.flyVars["maxRadiusAroundTarget"]*1.25
--ENT.SoundTbl_RangeAttack = {""}
ENT.TimeUntilRangeAttackProjectileRelease = .4 -- How much time until the projectile code is ran?
ENT.RangeAttackReps = 1
ENT.NextRangeAttackTime = 1 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = 4 -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.RangeAttackExtraTimers = {}
ENT.NoChaseAfterCertainRange = false -- Should the SNPC not be able to chase when it's between number x and y?

ENT.dead = false
ENT.fall = false
ENT.gib = false
ENT.timeDeath = false
ENT.uniqueId = ""
--Variant Code--
ENT.spriteTrail = {
	Object = "",
	startWidth = 150,
	endWidth = 50,
	lifetime = 5
}
ENT.flyVars = {
	minRadiusAroundTarget = 1000,
	maxRadiusAroundTarget = 2000,
	minHeightAboveTarget = 300, //How far above should we aim to be above the target
	maxHeightAboveTarget = 1000, //How far above should we aim to be above the target
	maxPitch = 10,
	maxRoll = 15,
	DecelerationTime = 3,
	AccelerationTime = 3,
	minTravelTime = 3,
	maxTravelTime = 10
}
ENT.shield = false
ENT.countAttacks = 0
ENT.attackSequence = 0
ENT.altRocket = false

ENT.soundTable = {
	engineSoundObject = "",
	engineSound = "npc_vj_sent_sentinel/sent_eng1loop.wav",
	enginePitch = 80,
	engineVolume = 0.7,
	firingSoundObject = "",
	firingSound = "npc_vj_sent_sentinel/sentinel_gun/sentGunLoop1.wav",
	firingPitch = 125,
	firingVolume = 0.7,
	firingIn = "npc_vj_sent_sentinel/sentinel_gun/in.wav",
	firingOut = "npc_vj_sent_sentinel/sentinel_gun/out.wav",
}
ENT.gibTable = {
"models/sentinels/sentinel_enforcer_hull.mdl",
"models/gibs/metal_gib5.mdl",
"models/gibs/metal_gib5.mdl",
"models/gibs/metal_gib5.mdl",
"models/combine_helicopter/bomb_debris_3.mdl",
"models/combine_helicopter/bomb_debris_3.mdl",
"models/combine_helicopter/bomb_debris_3.mdl"
}
ENT.dropExtraWeapons = {
}
ENT.lights = {
	MainEyeLight = {Object = "", Attachment = "root", Color = "255 125 100", Scale = 3, Offset = Vector(60, 0, 60)},
	ThrusterLight_l = {Object = "", Attachment = "left_thruster", Color = "0 180 255", Scale = 2, Offset = Vector(0, -3, -13)},
	ThrusterLight_r = {Object = "", Attachment = "right_thruster", Color = "0 180 255", Scale = 2, Offset = Vector(0, 3, -13)},
	Eye1_l = {Object = "", Attachment = "left_eye", Color = "0 180 255", Scale = .25, Offset = Vector(0, 2, 0)},
	Eye2_l = {Object = "", Attachment = "left_eye", Color = "0 180 255", Scale = .25, Offset = Vector(-10, 3, 12)},
	Eye3_l = {Object = "", Attachment = "left_eye", Color = "0 180 255", Scale = .25, Offset = Vector(-15, 9, 17)},
	Eye1_r = {Object = "", Attachment = "right_eye", Color = "0 180 255", Scale = .25, Offset = Vector(0, -2, 0)},
	Eye2_r = {Object = "", Attachment = "right_eye", Color = "0 180 255", Scale = .25, Offset = Vector(-10, -3, 12)},
	Eye3_r = {Object = "", Attachment = "right_eye", Color = "0 180 255", Scale = .25, Offset = Vector(-15, -9, 17)},
	Arm_l = {Object = "", Attachment = "left_arm", Color = "255 75 75", Scale = .55, Offset = Vector(0, 0, 0)},
	Arm_r = {Object = "", Attachment = "right_arm", Color = "255 75 75", Scale = .55, Offset = Vector(0, 0, 0)},


}
ENT.limbs = {
	left_eye = 			{Removed = false, Health = 50, Lights = {"Eye1_l","Eye2_l","Eye3_l"}, Hitgroup = 507, Bodygroups = {"left_eye"}, Gibs = {"models/sentinels/sentinel_enforcer_shieldgenerator.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	middle_eye =		{Removed = false, Health = 50, Lights = {"MainEyeLight"}, Hitgroup = 505, Bodygroups = {"middle_eye"}, Gibs = {"models/sentinels/sentinel_enforcer_maineye.mdl","models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	right_eye = 		{Removed = false, Health = 50, Lights = {"Eye1_r","Eye2_r","Eye3_r"}, Hitgroup = 506, Bodygroups = {"right_eye"}, Gibs = {"models/sentinels/sentinel_enforcer_shieldgenerator.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	left_arm = 			{Removed = false, Health = 75, Lights = {"Arm_l"}, Hitgroup = 509, Bodygroups = {"left_arm"}, Gibs = {"models/sentinels/sentinel_enforcer_arm.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	right_arm = 		{Removed = false, Health = 75, Lights = {"Arm_r"}, Hitgroup = 508, Bodygroups = {"right_arm"}, Gibs = {"models/sentinels/sentinel_enforcer_arm.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	left_thruster = 	{Removed = false, Health = 150, Lights = {"ThrusterLight_l"}, Hitgroup = 501, Bodygroups = {"left_leg"}, Gibs = {"models/sentinels/sentinel_enforcer_thruster.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	right_thruster = 	{Removed = false, Health = 150, Lights = {"ThrusterLight_r"}, Hitgroup = 502, Bodygroups = {"right_leg"}, Gibs = {"models/sentinels/sentinel_enforcer_thruster.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	left_rocket = 		{Removed = false, Health = 25, Lights = {}, Hitgroup = 504, Bodygroups = {"left_rocket"}, Gibs = {"models/combine_helicopter/bomb_debris_3.mdl","models/combine_helicopter/bomb_debris_3.mdl","models/combine_helicopter/bomb_debris_3.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
	right_rocket = 		{Removed = false, Health = 25, Lights = {}, Hitgroup = 503, Bodygroups = {"right_rocket"}, Gibs = {"models/combine_helicopter/bomb_debris_3.mdl","models/combine_helicopter/bomb_debris_3.mdl","models/combine_helicopter/bomb_debris_3.mdl", "models/gibs/metal_gib5.mdl", "models/gibs/metal_gib5.mdl"}},
}
//Melee attack code for Enforcers as part of sentinels. Unneeded here
-- ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
-- ENT.DisableDefaultMeleeAttackDamageCode = true -- Disables the default melee attack damage code
-- ENT.MeleeAttackDistance = 1400 -- How close does it have to be until it attacks?
-- ENT.NextMeleeAttackTime = 10 -- How much time until it can use a melee attack?
-- ENT.MeleeAttackAnimationAllowOtherTasks = true -- If set to true, the animation will not stop other tasks from playing, such as chasing | Useful for gesture attacks!
-- ENT.DisableMeleeAttackAnimation = true -- if true, it will disable the animation code
-- ENT.DisableRangeAttackAnimation = false -- if true, it will disable the animation code
-- ENT.MeleeAttackReps = 1 -- How many times does it run the melee attack code?
-- ENT.RangeToMeleeDistance = 0 -- How close does it have to be until it uses melee?

function ENT:VariantCode()
	if (self.shield) then
		self:CreateShield()
	self:SetCollisionBounds(Vector(100, 100, 100), Vector(-100, -100, -100))

	end
end


ENT.leftShield=""
ENT.rightShield=""
function ENT:CreateShield()
	-- self.leftShield = ents.Create("obj_vj_sent_shield")
	-- self.leftShield:SetModel( "models/sentinels/enf_lshield.mdl" )
	-- self.leftShield:SetMoveParent(self)
	-- self.leftShield:SetPos(self:GetShootPos() + self:GetRight()*-27 + self:GetForward()*150 + Vector(0, 0, -20))
	-- self.leftShield:SetOwner(self)
	-- self.leftShield:Spawn()
	-- self.rightShield = ents.Create("obj_vj_sent_shield")
	-- self.rightShield:SetModel( "models/sentinels/enf_rshield.mdl" )
	-- self.rightShield:SetMoveParent(self)
	-- self.rightShield:SetPos(self:GetShootPos() + self:GetRight()*27 + self:GetForward()*150 + Vector(0, 0, -20))
	-- self.rightShield:SetOwner(self)
	-- self.rightShield:Spawn()
end


function ENT:RandomFire()
end

function ENT:AttackMode(mode)
	if (mode == 1) then
		timer.Destroy("timer_range_start"..self:EntIndex())
		self.attackSequence = 1
		self.TimeUntilRangeAttackProjectileRelease=0.35
		self.RangeAttackReps = 10
		self.countAttacks = 0
	elseif (mode == 0) then
		timer.Destroy("timer_range_start"..self:EntIndex())
		self.attackSequence = 0
		self.TimeUntilRangeAttackProjectileRelease=0.4
		self.RangeAttackReps = 1
		self.countAttacks = 0
	end
end

local rocketCanSpawn = true
ENT.accuracyPenalty = 0
function ENT:CustomRangeAttackCode()
	if (self.dead) then return end
	self.countAttacks = self.countAttacks + 1
	if (self.attackSequence == 0) then
		local ang = self:GetAngles();
		local enemyPos = self:GetEnemy():GetPos()
		local myPos = self:GetPos()
		local distanceXY = math.Distance(enemyPos.x, enemyPos.y, myPos.x, myPos.y)
		local lookAt = math.atan(distanceXY/(myPos.z-enemyPos.z))
		ang.x = 80-math.deg(lookAt)
		local rocket = ents.Create("obj_vj_spv3_enforcer_rocket")
		local rocket2 = ents.Create("obj_vj_spv3_enforcer_rocket")
		rocket:SetPos(self:GetAttachment(self:LookupAttachment("root"))["Pos"] + (Vector(0,0,50) ) + self:GetRight()*-25 + self:GetForward()*-100)
		rocket2:SetPos(self:GetAttachment(self:LookupAttachment("root"))["Pos"] + (Vector(0,0,50) ) + self:GetRight()*25 + self:GetForward()*-100)
		rocket:SetOwner( self )
		rocket2:SetOwner( self )
		rocket:Spawn()
		rocket:GetPhysicsObject():SetVelocity(self:RangeAttackCode_GetShootPos() + Vector(0,0,200)) //used self:GetForward()*(distanceXY*.3) + Vector(0,0,300) previously
		rocket2:Spawn()
		rocket2:GetPhysicsObject():SetVelocity(self:RangeAttackCode_GetShootPos() + Vector(0,0,200)) //used self:GetForward()*(distanceXY*.3) + Vector(0,0,300) previously
	elseif (self.attackSequence == 1) then
		if (self.limbs["left_arm"]["Removed"]==false) then
		local bolt1 = ents.Create("obj_vj_enforcer_bolt")
			bolt1:SetPos(self:GetAttachment(self:LookupAttachment("left_arm"))["Pos"])
			bolt1:SetOwner(self)
			bolt1:Spawn()
			bolt1:GetPhysicsObject():ApplyForceCenter(((self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter() - bolt1:GetPos() +  Vector(math.random(-self.accuracyPenalty, self.accuracyPenalty), math.random(-self.accuracyPenalty, self.accuracyPenalty), math.random(-self.accuracyPenalty, self.accuracyPenalty))):GetNormalized()*1500  + self:PredictPos(self:GetEnemy(), 1)))
			-- ParticleEffect("hcea_hunter_needler_pistol_impact",bolt1:GetPos(),Angle(0,0,0),nil)
			-- ParticleEffectAttach("hcea_hunter_needler_proj", PATTACH_ABSORIGIN_FOLLOW, bolt1, 0)
		end
		if (self.limbs["right_arm"]["Removed"]==false) then
			local bolt2 = ents.Create("obj_vj_enforcer_bolt")
			bolt2:SetPos(self:GetAttachment(self:LookupAttachment("right_arm"))["Pos"])
			bolt2:SetOwner(self)
			bolt2:Spawn()
			bolt2:GetPhysicsObject():ApplyForceCenter(((self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter() - bolt2:GetPos() + Vector(math.random(-self.accuracyPenalty, self.accuracyPenalty), math.random(-self.accuracyPenalty, self.accuracyPenalty), math.random(-self.accuracyPenalty, self.accuracyPenalty))):GetNormalized()*1500  + self:PredictPos(self:GetEnemy(), 1)))
			-- ParticleEffect("hcea_hunter_needler_pistol_impact",bolt2:GetPos(),Angle(0,0,0),nil)
			-- ParticleEffectAttach("hcea_hunter_needler_proj", PATTACH_ABSORIGIN_FOLLOW, bolt2, 0)
		end
	end
	if (self.attackSequence == 0 && self.countAttacks >= self.RangeAttackReps) then
		self:AttackMode(1)
	elseif (self.attackSequence == 1 && self.countAttacks >= self.RangeAttackReps * 2) then
		self:AttackMode(0)
	end

end


function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return (((self:GetEnemy():GetPos() + Vector(math.random(-self.accuracyPenalty, self.accuracyPenalty), math.random(-self.accuracyPenalty, self.accuracyPenalty), 0) + self:PredictPos(self:GetEnemy(), 2)) -self:LocalToWorld(Vector(0,0,0))) *0.5 + self:GetUp()*400) //Get enemy coordinate, then get my coordinate in the world * 0.7, and then subtract the two and
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

function ENT:OnPartRemoved(bodypart, dmginfo)
	if (bodypart == self.limbs["right_eye"]) then
		self.accuracyPenalty = self.accuracyPenalty + 75
		if (self.rightShield!="") then
			self.rightShield:Remove()
		end
	elseif (bodypart == self.limbs["left_eye"]) then
		self.accuracyPenalty = self.accuracyPenalty + 75
		if (self.leftShield!="") then
			self.leftShield:Remove()
		end
	elseif (bodypart == self.limbs["middle_eye"]) then
		self.accuracyPenalty = self.accuracyPenalty + 75
	elseif (bodypart == self.limbs["left_arm"]) or (bodypart == self.limbs["right_arm"]) then
		local weapon = ents.Create("weapon_vj_sent_h2needleweapon")
		weapon:SetPos(dmginfo:GetDamagePosition())
		weapon:Spawn()
	elseif (bodypart == self.limbs["left_rocket"]) or (bodypart == self.limbs["right_rocket"]) then
		local weapon = ents.Create("weapon_vj_sent_h2rocketweapon")
		weapon:SetPos(dmginfo:GetDamagePosition())
		weapon:Spawn()
	elseif (bodypart == self.limbs["left_thruster"]) or (bodypart == self.limbs["right_thruster"]) then
		self.Aerial_FlyingSpeed_Calm = 45 -- The speed it should fly with, when it's wandering, moving slowly, etc. | Basically walking campared to ground SNPCs
		self.Aerial_FlyingSpeed_Alerted = 45
		self.HasMeleeAttack=false
		if (self.meleeEntity!="" and IsValid(self.axisConstraint)) then
			self.axisConstraint:Remove()
			self.meleeEntity=""
			timer.Destroy("Melee"..self:GetCreationID())
			timer.Destroy("Release"..self:GetCreationID())
			self.CanFlinch = 1
			self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
			self.ConstantlyFaceEnemy = true
			self.canMelee = false
		end
	end
	if ((self.limbs["right_eye"]["Removed"]==true and self.limbs["middle_eye"]["Removed"]==true and self.limbs["left_eye"]["Removed"]==true) or (self.limbs["right_thruster"]["Removed"]==true and self.limbs["left_thruster"]["Removed"]==true)) then
		self:FallDeath()
	end
end

ENT.meleeEntity = ""
ENT.axisConstraint = ""
ENT.canMelee = true
function ENT:CustomOnMeleeAttack_BeforeChecks(IsPropAttack,AttackDist,CustomEnt)
	if (self.canMelee==false) then 
		return
	end
	if !(IsValid(self:GetEnemy())) then return end
	if (self:GetEnemy():IsNPC()==true and IsValid(self:GetEnemy():GetParent())) then
		self.meleeEntity=self:GetEnemy():GetParent()
	elseif	(self:GetEnemy():IsPlayer()==true and IsValid(self:GetEnemy():GetVehicle()) and IsValid(self:GetEnemy():GetVehicle():GetParent())) then
		self.meleeEntity = self:GetEnemy():GetVehicle():GetParent()
	elseif	(self:GetEnemy():IsPlayer()==true and IsValid(self:GetEnemy():GetVehicle())) then
		self.meleeEntity = self:GetEnemy():GetVehicle()
	elseif (self:GetEnemy().IsVJBaseSNPC_Tank) then
		self.meleeEntity = self:GetEnemy()
	else
		return
	end
	self:SetCollisionGroup(20)
	self.canMelee=false
	self.meleeVelocity = (self.meleeEntity:GetPos() + self.meleeEntity:OBBMaxs() - self:GetPos()):GetNormalized()*400+ self:PredictPos(self:GetEnemy(), 1)
	self:SetVelocity(self.meleeVelocity)
	timer.Simple(self:GetPos():Distance(self.meleeEntity:GetPos())*0.75/self.meleeVelocity:Length(), function()
	if !(IsValid(self)) then return end
	self:SetVelocity(Vector(0,0,150))
	self:SentinelTransitionAcceleration()
		if !(table.HasValue(ents.FindInSphere(self:GetPos(), 300), self.meleeEntity)) then
			self.canMelee = true
			return
		elseif(self.meleeEntity.IsVJBaseSNPC_Tank) then
			self.meleeEntity:AddEFlags(EFL_NO_THINK_FUNCTION)
		end
	self.CanFlinch = 0
	self.Behavior = VJ_BEHAVIOR_PASSIVE
	self.meleeEntity:SetPos(self:GetPos() + Vector(0, 0, -100))
	self.axisConstraint = constraint.Ballsocket(self.meleeEntity,self,0,0, Vector(0,0,-100),0,0,1)
	self:VJ_ACT_PLAYACTIVITY("melee",true,3,false)
	timer.Simple(1.75, function() 
				if (IsValid(self.meleeEntity)) then
					self:EmitSound("npc_vj_sent_sentinel/sentinel_death/expl_1.wav")
					self.meleeEntity:TakeDamage(3000, self, self)
					-- ParticleEffectAttach("doom_rev_missile_blast", PATTACH_ABSORIGIN_FOLLOW, self.meleeEntity, 0)
					local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos() + Vector(0,0,-100))
					util.Effect( "explSmoke", effectdata )
					util.ScreenShake( self:GetPos(), 50, 500, 1.2, 650 )
				end
			end)
	timer.Create("Melee"..self:GetCreationID(), 3, 4, function()
		if (IsValid(self.meleeEntity)) then
			self:VJ_ACT_PLAYACTIVITY("melee",true,3,false)
			timer.Simple(1.75, function() 
				if (self.meleeEntity!="" and (IsValid(self.meleeEntity))) then
					self:EmitSound("npc_vj_sent_sentinel/sentinel_death/expl_1.wav")
					self.meleeEntity:TakeDamage(3000, self, self)
					-- ParticleEffectAttach("doom_rev_missile_blast", PATTACH_ABSORIGIN_FOLLOW, self.meleeEntity, 0)
					local effectdata = EffectData()
					effectdata:SetOrigin(self:GetPos() + Vector(0,0,-100))
					util.Effect( "explSmoke", effectdata )
					util.ScreenShake( self:GetPos(), 50, 500, 1.2, 650 )
				end
			end)
		end
	end)
	timer.Create("Release"..self:GetCreationID(), 15, 0, function()
		if !(IsValid(self)) then return end
		self:SetCollisionGroup(0)
		self.CanFlinch = 1
		self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
		self.canMelee = true
		if (IsValid(self) and IsValid(self.meleeEntity) and IsValid(self.axisConstraint)) then
			self.axisConstraint:Remove()
			self.meleeEntity:RemoveEFlags(EFL_NO_THINK_FUNCTION)
		end
	end)
end)
end

/*-----------------------------------------------
*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-------------------------------------------------*/