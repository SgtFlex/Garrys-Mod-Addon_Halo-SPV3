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