

-- ENT.GrenadeAttackVelForward1 = 300 -- Grenade attack velocity up | The first # in math.random

-- function ENT:ThrowGrenadeCode(customEnt, noOwner)
-- 	if self.Dead == true or self.Flinching == true or self.MeleeAttacking == true /*or (IsValid(self:GetEnemy()) && !self:Visible(self:GetEnemy()))*/ then return end
-- 	//if self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() +self:OBBCenter()),self:GetEnemy():EyePos()) == true then return end
-- 	noOwner = noOwner or false
-- 	local getIsCustom = false
-- 	local gerModel = self.GrenadeAttackModel
-- 	local gerClass = self.GrenadeAttackEntity
-- 	local gerFussTime = self.GrenadeAttackFussTime
	
-- 	if IsValid(self:GetEnemy()) && !self:Visible(self:GetEnemy()) then
-- 		if self:VisibleVec(self.LatestVisibleEnemyPosition) && self:GetEnemy():GetPos():Distance(self.LatestVisibleEnemyPosition) <= 600 then
-- 			self:FaceCertainPosition(self.LatestVisibleEnemyPosition)
-- 		else
-- 			return
-- 		end
-- 	end
	
-- 	local getSpawnPos = self.GrenadeAttackAttachment
-- 	local getSpawnAngle;
-- 	if getSpawnPos == false then
-- 		getSpawnPos = self:CustomOnGrenadeAttack_SpawnPosition()
-- 		getSpawnAngle = getSpawnPos:Angle()
-- 	else
-- 		getSpawnPos = self:GetAttachment(self:LookupAttachment(self.GrenadeAttackAttachment)).Pos
-- 		getSpawnAngle = self:GetAttachment(self:LookupAttachment(self.GrenadeAttackAttachment)).Ang
-- 	end
	
-- 	if self.DisableGrenadeAttackAnimation == false then
-- 		self.CurrentAttackAnimation = VJ_PICK(self.AnimTbl_GrenadeAttack)
-- 		self.CurrentAttackAnimationDuration = self:DecideAnimationLength(self.CurrentAttackAnimation, false, 0.2)
-- 		self.PlayingAttackAnimation = true
-- 		timer.Create("timer_act_playingattack"..self:EntIndex(), self.CurrentAttackAnimationDuration, 1, function() self.PlayingAttackAnimation = false end)
-- 		self:VJ_ACT_PLAYACTIVITY(self.CurrentAttackAnimation, self.GrenadeAttackAnimationStopAttacks, self:DecideAnimationLength(self.CurrentAttackAnimation, self.GrenadeAttackAnimationStopAttacksTime), true, self.GrenadeAttackAnimationDelay, {PlayBackRateCalculated=true})
-- 	end

-- 	if IsValid(customEnt) then -- Custom nernagner gamal nernagner vor yete bidi nede
-- 		getIsCustom = true
-- 		gerModel = customEnt:GetModel()
-- 		gerClass = customEnt:GetClass()
-- 		customEnt:SetMoveType(MOVETYPE_NONE)
-- 		customEnt:SetParent(self)
-- 		if self.GrenadeAttackAttachment == false then
-- 			customEnt:SetPos(getSpawnPos)
-- 		else
-- 			customEnt:Fire("SetParentAttachment",self.GrenadeAttackAttachment)
-- 		end
-- 		customEnt:SetAngles(getSpawnAngle)
-- 		if gerClass == "obj_vj_grenade" then
-- 			gerFussTime = math.abs(customEnt.FussTime - customEnt.TimeSinceSpawn)
-- 		elseif gerClass == "obj_handgrenade" or gerClass == "obj_spore" then
-- 			gerFussTime = 1
-- 		elseif gerClass == "npc_grenade_frag" or gerClass == "doom3_grenade" or gerClass == "fas2_thrown_m67" or gerClass == "cw_grenade_thrown" or gerClass == "cw_flash_thrown" or gerClass == "cw_smoke_thrown" then
-- 			gerFussTime = 1.5
-- 		elseif gerClass == "obj_cpt_grenade" then
-- 			gerFussTime = 2
-- 		end
-- 	end

-- 	if !IsValid(self:GetEnemy()) then
-- 		local iamarmo = self:VJ_CheckAllFourSides()
-- 		local facepos = false
-- 		if iamarmo.Forward then facepos = self:GetPos() + self:GetForward()*200; doit = true;
-- 		elseif iamarmo.Right then facepos = self:GetPos() + self:GetRight()*200;  doit = true;
-- 		elseif iamarmo.Left then facepos = self:GetPos() + self:GetRight()*-200;  doit = true;
-- 		elseif iamarmo.Backward then facepos = self:GetPos() + self:GetForward()*-200;  doit = true;
-- 		end
-- 		if facepos != false then
-- 			self:FaceCertainPosition(facepos, self.CurrentAttackAnimationDuration or 1.5)
-- 		end
-- 	end

-- 	self.ThrowingGrenade = true
-- 	self:CustomOnGrenadeAttack_BeforeStartTimer()
-- 	self:PlaySoundSystem("GrenadeAttack")

-- 	timer.Simple(self.TimeUntilGrenadeIsReleased, function()
-- 		if getIsCustom == true && !IsValid(customEnt) then return end
-- 		if IsValid(customEnt) then customEnt.VJHumanTossingAway = false customEnt:Remove() end
-- 		if IsValid(self) && self.Dead == false /*&& IsValid(self:GetEnemy())*/ then -- Yete SNPC ter artoon e...
-- 			local greTargetPos = self:GetPos() + self:GetForward()*200
-- 			if IsValid(self:GetEnemy()) then
-- 				if !self:Visible(self:GetEnemy()) && self:VisibleVec(self.LatestVisibleEnemyPosition) && self:GetEnemy():GetPos():Distance(self.LatestVisibleEnemyPosition) <= 600 then
-- 					greTargetPos = self.LatestVisibleEnemyPosition
-- 					self:FaceCertainPosition(greTargetPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
-- 				else
-- 					greTargetPos = self:GetEnemy():GetPos()
-- 				end
-- 			else -- Yete teshnami chooni, nede amenan lav goghme
-- 				local iamarmo = self:VJ_CheckAllFourSides()
-- 				if iamarmo.Forward then greTargetPos = self:GetPos() + self:GetForward()*200; self:FaceCertainPosition(greTargetPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
-- 				elseif iamarmo.Right then greTargetPos = self:GetPos() + self:GetRight()*200; self:FaceCertainPosition(greTargetPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
-- 				elseif iamarmo.Left then greTargetPos = self:GetPos() + self:GetRight()*-200; self:FaceCertainPosition(greTargetPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
-- 				elseif iamarmo.Backward then greTargetPos = self:GetPos() + self:GetForward()*-200; self:FaceCertainPosition(greTargetPos, self.CurrentAttackAnimationDuration - self.TimeUntilGrenadeIsReleased)
-- 				end
-- 			end
-- 			local gent = ents.Create(gerClass)
-- 			if noOwner == false then gent:SetOwner(self) end
-- 			gent:SetPos(getSpawnPos)
-- 			gent:SetAngles(getSpawnAngle)
-- 			gent:SetModel(Model(gerModel))
-- 			local getThrowVel = self:CustomOnGrenadeAttack_ThrowVelocity(gent, greTargetPos, getSpawnPos)
-- 			-- Set the timers for all the different grenade entities
-- 				if gerClass == "obj_vj_grenade" then
-- 					gent.FussTime = gerFussTime
-- 				elseif gerClass == "obj_cpt_grenade" then
-- 					gent:SetTimer(gerFussTime)
-- 				elseif gerClass == "obj_spore" then
-- 					gent:SetGrenade(true)
-- 				elseif gerClass == "ent_hl1_grenade" then
-- 					gent:ShootTimed(customEnt, getThrowVel, gerFussTime)
-- 				elseif gerClass == "doom3_grenade" or gerClass == "obj_handgrenade" then
-- 					gent:SetExplodeDelay(gerFussTime)
-- 				elseif gerClass == "cw_grenade_thrown" or gerClass == "cw_flash_thrown" or gerClass == "cw_smoke_thrown" then
-- 					gent:SetOwner(self)
-- 					gent:Fuse(gerFussTime)
-- 				end
-- 			gent:Spawn()
-- 			gent:Activate()
-- 			if gerClass == "npc_grenade_frag" then gent:Input("SetTimer",self:GetOwner(),self:GetOwner(),gerFussTime) end
-- 			local phys = gent:GetPhysicsObject()
-- 			if IsValid(phys) then
-- 				phys:Wake()
-- 				phys:AddAngleVelocity(Vector(math.Rand(500, 500), math.Rand(500, 500), math.Rand(500, 500)))
-- 				phys:SetVelocity(getThrowVel)
-- 			end
-- 			self:CustomOnGrenadeAttack_OnThrow(gent)
-- 		end
-- 		self.ThrowingGrenade = false
-- 	end)
-- end

function ENT:RandomizeTraits()
	self.CanThrowBackDetectedGrenades = false
	self.CanDetectGrenades = (math.random(0,1) >= 0.2)
	self.WaitForEnemyToComeOutTime = VJ_Set(0,7)
	self.NextThrowGrenadeTime = VJ_Set(7, 60) -- Time until it can throw a grenade again
	self.ThrowGrenadeChance = math.Rand(2, 7) -- Chance that it will throw the grenade | Set to 1 to throw all the time
	self.GrenadeAttackThrowDistance = math.Rand(1000, 6500) -- How far it can throw grenades
	self.GrenadeAttackThrowDistanceClose = math.Rand(0, 500) -- How close until it stops throwing grenades
	self.NextMoveRandomlyWhenShootingTime1 = math.Rand(0,6) -- How much time until it can move randomly when shooting? | First number in math.random
	self.NextMoveRandomlyWhenShootingTime2 = self.NextMoveRandomlyWhenShootingTime1 + (math.Rand(0, 3)) -- How much time until it can move randomly when shooting? | Second number in math.random
	self.CanCrouchOnWeaponAttack = (math.random(0,1) >= 0.35)
	self.CanCrouchOnWeaponAttackChance = (math.Rand(2,5))
	self.HasWeaponBackAway = (math.random(0,1) >= 0.35)
	self.MoveOrHideOnDamageByEnemy = (math.random(0,1) >= 0.35) -- Should the SNPC move or hide when being damaged by an enemy?
	self.MoveOrHideOnDamageByEnemy_OnlyMove = (math.random(0,1) <= 0.35) -- Should it only move and not hide?
	self.MoveOrHideOnDamageByEnemy_HideTime = VJ_Set(1,8) -- How long should it hide?
	self.NextMoveOrHideOnDamageByEnemy1 = math.random(1, 3) -- How much time until it moves or hides on damage by enemy? | The first # in math.random
	self.NextMoveOrHideOnDamageByEnemy2 = self.NextMoveOrHideOnDamageByEnemy1 + math.random(0.5, 3) -- How much time until it moves or hides on damage by enemy? | The second # in math.random
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

function ENT:CustomOnGrenadeAttack_BeforeThrowTime() 
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
end


function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false || GetConVarNumber("vj_spv3_dropGrenades")==0 then return end
	for i=1, math.random(1,4) do
		self.ThingsToDrop[i] = self.GrenadeWeps[math.random(1,5)]
	end
	if math.random(1,self.ItemDropsOnDeathChance) == 1 then
		self:CustomRareDropsOnDeathCode(dmginfo,hitgroup)
		for k,v in pairs(self.ThingsToDrop) do
			local entlist = self.ThingsToDrop[k]
			if entlist != false then
				local randdrop = ents.Create(entlist)
				randdrop:SetPos(self:GetPos() + self:OBBCenter())
				randdrop:SetAngles(self:GetAngles())
				randdrop:Spawn()
				randdrop:Activate()
				local phys = randdrop:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetMass(60)
					phys:ApplyForceCenter(dmginfo:GetDamageForce()*.01)
				end
			end
		end
	end
end

function ENT:CustomOnGrenadeAttack_ThrowVelocity(grEnt, grTargetPos) 
	return (grTargetPos - grEnt:GetPos()) + (self:GetUp()*(grEnt:GetPos():Distance(grTargetPos)/3) + self:GetForward()*300 + self:GetRight()*math.random(-20, 20))
end