ENT.StartHealth = 1
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldMaxHealth = 0
ENT.ShieldCurrentHealth = ENT.ShieldMaxHealth
ENT.ShieldRecharge = 1
ENT.ShieldDelay = 6
ENT.ShieldProjMaxHealth = 0 
ENT.ShieldProjCurrentHealth = ENT.ShieldProjMaxHealth
ENT.ShieldProjDelay = 6
ENT.ShieldProjRecharge = 1
ENT.IsInvis = false
ENT.HasCloak = ENT.IsInvis
ENT.CanFlee = false
ENT.ShieldIsArmor = false
ENT.DisableBackBreak = false
ENT.DisableForceDeath = false
ENT.HeadHitgroup = nil
ENT.IsCarrier = false
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it

ENT.MeleeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the melee attack animation?ENT.MeleeAttackDamage = 70
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 90
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.ExtraWeapons = {}
ENT.GrenadeWeps = {
	"weapon_vj_unsc_spv3_frag_nade",
	"weapon_vj_unsc_spv3_plasma_nade",
	"weapon_vj_unsc_spv3_gravity_nade",
	"weapon_vj_unsc_spv3_cluster_nade",
	"weapon_vj_unsc_spv3_needler_nade",
}
ENT.Faction = "Covenant"
ENT.RemovableParts = {
	--[500] = {Health = 15, Bodygroup = "Head", Execute = function(entity, dmginfo) end}, Example of a removable bodygroup. Key must be hitgroup, Health is how much dmg it takes, Bodygroup is which part is removed
}
ENT.Appearance = {
	Color = Color(255, 255, 255),
	Bodygroups = {},
	Skin = 0,
}
ENT.otherInit = function(entity) end
ENT.CustomCollision = {Min = Vector(-18,-18,0), Max = Vector(18,18,85)}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true}
function ENT:CustomOnInitialize()
	self.otherInit(self)
	self:SetCollisionBounds(self.CustomCollision["Min"], self.CustomCollision["Max"])
	self:RandomizeTraits()
	self:SetPhysicalAppearance()
	self:UseConVars()
	timer.Simple(0.01, function()
		self:SetInvisibility(self.IsInvis)
	end)
end

function ENT:UseConVars()
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self.ShieldMaxHealth = self.ShieldMaxHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	self.ShieldCurrentHealth = self.ShieldMaxHealth
	self.CurrentHealth = self.StartHealth
	self.ShieldActivated = (self.ShieldCurrentHealth > 0)
	self.HasCloak = self.IsInvis
	if (self.IsCarrier) then self.HasDeathRagdoll = false end
	self.Bleeds = (self.ShieldCurrentHealth <= 0 or self.ShieldIsArmor == true)
	self:SetHealth(self.ShieldMaxHealth + self.StartHealth)
	-- for k, v in pairs(self.RemovableParts) do
	-- 	v["Health"] = v["Health"] * GetConVar("vj_spv3_HealthModifier"):GetInt()
	-- end
	self.ShieldProjMaxHealth = self.ShieldProjMaxHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	self.ShieldProjCurrentHealth = self.ShieldProjMaxHealth
	self.ShieldProjActivated = (self.ShieldProjCurrentHealth > 0)
	if (self.ShieldProjActivated) then
		self:SetBodygroup(self:FindBodygroupByName("Shield"), 1)
		self:SetHitboxSet("Shielded")
	else
		self:SetBodygroup(self:FindBodygroupByName("Shield"), 0)
		self:SetHitboxSet("noShield")
	end
	self:SetHealth(self.ShieldMaxHealth + self.StartHealth)
	timer.Simple(0.01, function() 
		if (math.random(0,100) <= GetConVar("vj_spv3_"..self.Faction.."ExtraWeaponChance"):GetInt() and #self.ExtraWeapons > 0) then
			if (IsValid(self:GetActiveWeapon())) then
				self:GetActiveWeapon():Remove()
			end
			self:Give(VJ_PICKRANDOMTABLE(self.ExtraWeapons))
		end
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1) then
			table.insert(self.GrenadeTypes, "obj_vj_unsc_spv3_frag_nade")
			table.insert(self.GrenadeWeps, "weapon_vj_unsc_spv3_frag_nade")
		end
		self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	end)
	if (GetConVarNumber("vj_spv3_ffretal")==0) then 
		self.BecomeEnemyToPlayer = false -- Should the friendly SNPC become enemy towards the player if it's damaged by a player?
	end
end

function ENT:SetPhysicalAppearance()
	for k, v in pairs(self.Appearance["Bodygroups"]) do
		self:SetBodygroup(k, v)
	end
	self:SetColor(self.Appearance["Color"])
	self:SetSkin(self.Appearance["Skin"])
end

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

ENT.ThingsToDrop = {}
function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false || GetConVarNumber("vj_spv3_dropGrenades")==0 then return end
	for i=1, math.random(2,4) do
		table.insert(self.ThingsToDrop, self.GrenadeWeps[math.random(1,#self.GrenadeWeps)])
	end
	if math.random(1,self.ItemDropsOnDeathChance) == 1 then
		self:CustomRareDropsOnDeathCode(dmginfo,hitgroup)
		for k,v in pairs(self.ThingsToDrop) do
			local randdrop = ents.Create(self.ThingsToDrop[k])
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

function ENT:CustomOnGrenadeAttack_ThrowVelocity(grEnt, grTargetPos) 
	return (grTargetPos - grEnt:GetPos()) + (self:GetUp()*(grEnt:GetPos():Distance(grTargetPos)/3) + self:GetForward()*300 + self:GetRight()*math.random(-20, 20))
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

function ENT:DropWeapon()
	local wep = ents.Create(self:GetActiveWeapon():GetClass())
	wep:SetPos(self:GetAttachment(self:LookupAttachment("Cannon"))["Pos"])
	wep:SetAngles(self:GetActiveWeapon():GetAngles())
	wep:Spawn()
	self:GetActiveWeapon():Remove()
end

ENT.EvadeCooldown = 0
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (math.random(0,2) == 2) then
		if (self.EvadeCooldown <= CurTime()) then
			if (math.random(0,1)==1) then
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false)
			end
			self.EvadeCooldown = CurTime() + 4
		end
	end
	if (self.HasCloak) then
		if (self.IsInvis==true) then
			self:SetInvisibility(false)
		end
		timer.Create("Recloak"..self:GetCreationID(), 1, 1, function() 
			if (!IsValid(self) or self.Dead==true) then return end
			self:SetInvisibility(true)
		end)
	end
	self.DeathType = self:CheckForSpecialDeaths(dmginfo, hitgroup)
	if (self.DeathType != nil) then
		self:DoSpecialDeath(self.DeathType, dmginfo)
	end
	if self.ShieldProjActivated == true and hitgroup == 509 then
		self:DamageShieldProj(dmginfo)
	end
	if self.ShieldActivated == true then
		self:DamageShield(dmginfo)
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
		if (self.RemovableParts[hitgroup]) then
			self:DamageSpecialPart(hitgroup, dmginfo)
		end
		if (math.random(1,20) == 1) then
			self:Berserk()
		end
	end
	if (self.ShieldRecharge > 0) then
		timer.Destroy("RegenShield"..self:GetCreationID())
		timer.Create("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1, function() --Timers will reset everytime damage is applied, no need to adjust
			if (IsValid(self) and self.ShieldCurrentHealth < self.ShieldMaxHealth) then
				self:RegenerateShield()
			end
		end)
	end
end

function ENT:SetInvisibility(bInvis)
	if (self.IsInvis!=true) then
		self.material = self:GetMaterial()
		if (IsValid(self:GetActiveWeapon())) then
			self.weaponMaterial = self:GetActiveWeapon():GetMaterial()
		end
	end
	if (bInvis==true) then
		if (IsValid(self:GetActiveWeapon())) then
			self:GetActiveWeapon():SetMaterial("effects/spv3/cloak")
		end
		self:SetMaterial("effects/spv3/cloak")
		self:AddFlags(FL_NOTARGET)
		self:DrawShadow(false)
		self:AddEffects(EF_NOSHADOW)
		self:RemoveAllDecals()
		self.IsInvis = true
	else
		hook.Remove("EntityFireBullets", "RevealPos")
		self:SetMaterial(self.material)
		self:RemoveFlags(FL_NOTARGET)
		if (IsValid(self:GetActiveWeapon())) then
			self:GetActiveWeapon():SetMaterial(self.weaponMaterial)
		end
		self:DrawShadow(true)
		self:RemoveEffects(EF_NOSHADOW)
		self.IsInvis = false
	end
end

function ENT:DamageShield(dmginfo)
	if (dmginfo:GetDamageType()==DMG_PLASMA or dmginfo:GetDamageType()==DMG_BURN or dmginfo:GetDamageType()==DMG_SLOWBURN) then
		dmginfo:ScaleDamage(2)
	end
	if (self.ShieldIsArmor == false) then
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
		self:RemoveAllDecals()
	end
	self.ShieldCurrentHealth = math.max(self.ShieldCurrentHealth - dmginfo:GetDamage(), 0)
	if (self.ShieldCurrentHealth <= 0 and self.ShieldActivated==true) then
		self:DisperseShield()
		self.CanFlinch = 1
		self:DoFlinch(dmginfo, hitgroup)
		self.CanFlinch = 0
	end
end

function ENT:DisperseShield(dmginfo)
	if (self.ShieldActivated == false) then return false end
	self.ShieldActivated = false
	if (self.ShieldIsArmor == false) then
		ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		self:EmitSound("brute/fx/brute_shield_destroyed/brute_shield_destroyed ("..math.random(1, 3)..").ogg")
		self.Bleeds = true
	end
	return true
end

function ENT:RegenerateShield()
	self.ShieldActivated = true
	if (self.ShieldIsArmor == false) then
		self.Bleeds = false
		self:StopParticles()
		ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	end
	timer.Create("RegenShield"..self:GetCreationID(), 0.1, (self.ShieldMaxHealth - self.ShieldCurrentHealth)/self.ShieldRecharge, function()
		if (!IsValid(self)) then return end
		self.ShieldCurrentHealth = math.min(self.ShieldCurrentHealth + self.ShieldRecharge, self.ShieldMaxHealth)
		self:SetHealth(self.CurrentHealth + self.ShieldCurrentHealth)
	end)
end

function ENT:CheckForSpecialDeaths(dmginfo, hitgroup)
	if (hitgroup == self.HeadHitgroup and dmginfo:GetDamage() >= GetConVarNumber("vj_spv3_PrecisionThreshold") and (self.ShieldActivated==false or self.ShieldIsArmor==true) and (self.RemovableParts[self.HeadHitgroup] == nil or self.RemovableParts[self.HeadHitgroup]["Health"] <= 0)) then
		return "Headshot"
	elseif (self.DisableBackBreak == false && dmginfo:GetAttacker():IsPlayer() && dmginfo:GetDamageType()==DMG_CLUB && Vector((dmginfo:GetDamagePosition() - self:GetPos()).x, (dmginfo:GetDamagePosition() - self:GetPos()).y, 0):Dot(Vector(self:GetForward().x, self:GetForward().y, 0)) < 0) then
		return "BackBreak"
	elseif (self.DisableForceDeath == false and dmginfo:GetDamage() >= self:Health() and (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or !self:IsOnGround())) then
		return "LargeForce"
	else
		return nil
	end
end

function ENT:DoSpecialDeath(typeDeath, dmginfo)
	if (typeDeath==nil) then
		return
	elseif (typeDeath=="BackBreak") then --Do the following when taking damage via DMG_CLUB to the back
		self.AlertFriendsOnDeath = false
		self.HasPainSounds = false
		self.HasDeathSounds = false
		self:TakeDamage(self:Health(), dmginfo:GetAttacker(), dmginfo:GetInflictor())
		self:VJ_ACT_PLAYACTIVITY("Die_1", true, 2, false)
	elseif (typeDeath=="Headshot") then --Do the following when dying via a headshot (above the precisionThreshold)
		dmginfo:SetDamage(self:Health())
	elseif (typeDeath=="LargeForce") then --Do the following when dying to DMG_CLUB with high force or DMG_BLAST
		if (self.ShieldProjActivated==true) then
			self:DisperseShieldProj()
		end
		self:StopAllCommonSpeechSounds()
		self.HasPainSounds = false
		self.HasDeathSounds = false
		self:DropWeapon()
		self.HasDeathRagdoll = false
		self.HasDeathAnimation = false
		self.imposter = ents.Create("obj_vj_imposter")
		self.imposter.IsCarrier = self.IsCarrier
		self.imposter:SetOwner(self)
		self.imposter.Sequence = "Die_Airborne"
		if (dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageType()==DMG_BLAST) then
			local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
			if (dmginfo:GetDamageType()==DMG_CLUB) then
				velocity = velocity * 0.3
			end
			self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
			self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
		else
			self.imposter.Velocity = Vector(self:GetVelocity())
			self.imposter.Angle = Angle(0,self:GetAngles().y,0)
		end
		self.imposter:Spawn()
	end
end

function ENT:DamageSpecialPart(hitgroup, dmginfo)
	if (self.RemovableParts[hitgroup]["Health"] > 0) then
		self.PreviousHealth = math.max(self.RemovableParts[hitgroup]["Health"], 0)
		self.RemovableParts[hitgroup]["Health"] = math.max(self.RemovableParts[hitgroup]["Health"] - dmginfo:GetDamage(), 0)
		if (self.RemovableParts[hitgroup]["Health"] <= 0) then
			self:SetBodygroup(self:FindBodygroupByName(self.RemovableParts[hitgroup]["Bodygroup"]), 0)
			self:RemoveAllDecals()
			local a = self.RemovableParts[hitgroup]["Execute"]
			a(self, dmginfo)
		end
	end
end

function ENT:DamageShieldProj(dmginfo)
	if (dmginfo:GetDamageType()==DMG_PLASMA or dmginfo:GetDamageType()==DMG_BURN or dmginfo:GetDamageType()==DMG_SLOWBURN) then
		dmginfo:ScaleDamage(2)
	end
	self.ShieldProjCurrentHealth = math.max(self.ShieldProjCurrentHealth - dmginfo:GetDamage(), 0)
	dmginfo:ScaleDamage(0)
	ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
	if (self.ShieldProjCurrentHealth <= 0 and self.ShieldProjActivated==true) then
		self:DisperseShieldProj()
	end
	timer.Destroy("RegenShieldProj"..self:GetCreationID())
	timer.Create("ShieldProjDelay"..self:GetCreationID(), self.ShieldProjDelay, 1, function() --Timers will reset everytime damage is applied, no need to adjust
		if (IsValid(self) and self.ShieldProjCurrentHealth < self.ShieldProjMaxHealth) then
			self:RegenerateShieldProj()
		end
	end)
end

function ENT:DisperseShieldProj()
	if (self.ShieldProjActivated == false) then return false end
	if (math.random(0, 1)==0) then self:Flee() end
	self.ShieldProjActivated = false
	self:SetHitboxSet("noShield")
	self:SetBodygroup(1, 0)
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	return true
end

function ENT:RegenerateShieldProj()
	self.ShieldProjActivated = true
	timer.Create("RegenShield"..self:GetCreationID(), 0.1, (self.ShieldProjMaxHealth - self.ShieldProjCurrentHealth)/self.ShieldProjRecharge, function()
		if (!IsValid(self)) then return end
		self.ShieldProjCurrentHealth = math.min(self.ShieldProjCurrentHealth + self.ShieldProjRecharge, self.ShieldProjMaxHealth)
	end)
	self:SetHitboxSet("shielded")
	self:SetBodygroup(1, 1)
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
end

ENT.NextTalkTime = 0
ENT.MouthOpenness = 0
function ENT:CustomOnThink() //Is pretty much HL:Resurgence talk system. Maybe more complexity in the future?
	if CurTime() < self.NextTalkTime then
		if self.MouthOpenness == 0 then
			self.MouthOpenness = math.random(10,70)
		else
			self.MouthOpenness = 0
		end
		self:SetPoseParameter("move_mouth", self.MouthOpenness)
	else
		self:SetPoseParameter("move_mouth",0)
	end
end

function ENT:OnPlayCreateSound(sdData, sdFile)
	self.NextTalkTime = CurTime() + SoundDuration(sdFile)*3.5 --For some reason the soundduration is wrong. perhaps a bug with .ogg format?
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if (self.ShieldProjActivated==true) then
		self:DisperseShieldProj()
	end
end

function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)
	if (!self.IsCarrier or self.DeathType=="LargeForce") then return end
	if (GetConVarNumber("vj_spv3_bonusInfForms")==0) then
		self.HasDeathRagdoll = true
		return
	end
	self:DropInfForms()
	for k, v in pairs(self.RemovableParts) do
		if (v["Health"] > 0) then
			v["Execute"](self)
		end
	end
end

ENT.infFormCount = 5
ENT.spreadRadius = 75
function ENT:DropInfForms()
	self.infFormCount = math.Round(self.infFormCount*(GetConVarNumber("vj_spv3_infModifier")))
	self:EmitSound("carrier/kill_instant/kill_instant ("..math.random(1, 6)..").ogg")
	local BlastInfo = DamageInfo()
	BlastInfo:SetDamageType(DMG_BLAST)
	BlastInfo:SetDamage(20 * GetConVarNumber("vj_spv3_damageModifier"))
	BlastInfo:SetDamagePosition(self:GetPos())
	BlastInfo:SetInflictor(self)
	BlastInfo:SetReportedPosition(self:GetPos())
	util.BlastDamageInfo(BlastInfo, self:GetPos(), 250)
	util.ScreenShake(self:GetPos(),16,100,1,800)
	ParticleEffect("CarrierDeath", self:GetPos() + self:OBBCenter(), self:GetAngles(), nil)
	local spawnSpots = {
		Vector(self:OBBMins().x*1.5, self:OBBMins().y *1.5, self:OBBCenter().z), 
		Vector(self:OBBMaxs().x*1.5, self:OBBMaxs().y*1.5, self:OBBMaxs().z),
	}
	for k=1, self.infFormCount do
		self.infForm = ents.Create("npc_vj_halo_flood_spv3_infection")
		local pos = self:GetPos() + Vector(math.random(spawnSpots[1].x, spawnSpots[2].x), math.random(spawnSpots[1].y, spawnSpots[2].y), math.random(spawnSpots[1].z, spawnSpots[2].z))
		local velocity = (pos - (self:GetPos() + self:OBBCenter())):GetNormalized() * self.spreadRadius
		self.infForm:SetPos(pos) --Returns a random point within the upper bounds of the model
		self.infForm:SetOwner(self)
		self.infForm:Spawn()
		self.infForm:SetVelocity(velocity)
		self.infForm:SetAngles(Angle(self.infForm:GetAngles().x, velocity:Angle().y, self.infForm:GetAngles().z))
		self.infForm:VJ_ACT_PLAYACTIVITY("Melee_1",true,1.3,false)	
	end
end

function ENT:CustomOnAllyDeath(argent) 
	if (self.CanFlee!=true) then return end
	self.HasProtector = self:CheckForProtector()
	if (self.HasProtector == false) then
		if (math.random(1, 4)==1) then
			self:Flee()
		end
	end
end

function ENT:CheckForProtector()
	for k, v in pairs(ents.FindInSphere(self:GetPos(), 1000)) do
		if (string.find(tostring(v), "elite") or string.find(tostring(v), "brute")) and (v:IsNPC()) then
			return true
		end
	end
	return false
end

function ENT:Flee()
	if (self.CanFlee!=true or self.Dead==true) then return end
	self:SetEnemy(nil)
	if (self.SoundTbl_Scared) then
		self.ScaredSound = CreateSound(self, VJ_PICKRANDOMTABLE(self.SoundTbl_Scared))
		self.ScaredSound:Play()
	end
	self.Behavior = VJ_BEHAVIOR_PASSIVE
	self:SetupWeaponHoldTypeAnims("passive")
	self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
	if (timer.Exists("Scared"..self:GetCreationID())) then return end
	timer.Create("Scared"..self:GetCreationID(), math.random(1.5,3), 5, function()
		if !(IsValid(self) or self.Dead==true) then return end 
		self:Flee()
		if (timer.RepsLeft("Scared"..self:GetCreationID())==0) then
			self.Behavior = VJ_BEHAVIOR_AGGRESSIVE
			self:SetupWeaponHoldTypeAnims(self:GetActiveWeapon():GetHoldType())
		end
	end)
end

--------------------------------------------------------------------------------------------------------------------------------------------------
//Brought over from sentinels addon, possibly old/outdated?
function ENT:CreateGibEntity(Ent,Models,Tbl_Features,CustomCode)
	// self:CreateGibEntity("prop_ragdoll","",{Pos=self:LocalToWorld(Vector(0,3,0)),Ang=self:GetAngles(),Vel=})
	if self.AllowedToGib == false then return end
	Ent = Ent or "prop_ragdoll"
	if Models == "UseAlien_Small" then Models = {"models/gibs/xenians/sgib_01.mdl","models/gibs/xenians/sgib_02.mdl","models/gibs/xenians/sgib_03.mdl"} end
	if Models == "UseAlien_Big" then Models = {"models/gibs/xenians/mgib_01.mdl","models/gibs/xenians/mgib_02.mdl","models/gibs/xenians/mgib_03.mdl","models/gibs/xenians/mgib_04.mdl","models/gibs/xenians/mgib_05.mdl","models/gibs/xenians/mgib_06.mdl","models/gibs/xenians/mgib_07.mdl"} end
	if Models == "UseHuman_Small" then Models = {"models/gibs/humans/sgib_01.mdl","models/gibs/humans/sgib_02.mdl","models/gibs/humans/sgib_03.mdl"} end
	if Models == "UseHuman_Big" then Models = {"models/gibs/humans/mgib_01.mdl","models/gibs/humans/mgib_02.mdl","models/gibs/humans/mgib_03.mdl","models/gibs/humans/mgib_04.mdl","models/gibs/humans/mgib_05.mdl","models/gibs/humans/mgib_06.mdl","models/gibs/humans/mgib_07.mdl"} end
	Models = VJ_PICKRANDOMTABLE(Models)
	local vTbl_BloodType = "Green"
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

function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed) 
	if (self.IsInvis) then
		self:RemoveFlags(FL_NOTARGET)
		timer.Simple(0.5, function()
			if (IsValid(self)) then
				self:AddFlags(FL_NOTARGET)
			end
		end)
	end
end