AddCSLuaFile("shared.lua")
include('shared.lua')

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM

ENT.Model = {"models/hce/spv3/unsc/marine/marine.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(255,255,255)
ENT.StartHealth = 90
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.EntitiesToNoCollide = {"npc_vj_halo_flood_spv3_infection"}
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.PlayerFriendly=true
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_UNSC", "CLASS_PLAYER_ALLY"} -- NPCs with the same class with be allied to each other
ENT.FriendsWithAllPlayerAllies = true -- Should this SNPC be friends with all other player allies that are running on VJ Base?
ENT.MoveOutOfFriendlyPlayersWay = true -- Should the SNPC move out of the way when a friendly player comes close to it?
ENT.NextMoveOutOfFriendlyPlayersWayTime = 1 -- How much time until it can moves out of the player's way?
ENT.BecomeEnemyToPlayer = true -- Should the friendly SNPC become enemy towards the player if it's damaged by a player?
ENT.BecomeEnemyToPlayerLevel = 8 -- How many times does the player have to hit the SNPC for it to become enemy?
ENT.FollowPlayer = true -- Should the SNPC follow the player when the player presses a certain key?
ENT.FollowPlayerChat = true -- Should the SNPCs say things like "They stopped following you"
ENT.FollowPlayerKey = "Use" -- The key that the player presses to make the SNPC follow them
ENT.FollowPlayerCloseDistance = 150 -- If the SNPC is that close to the player then stand still until the player goes farther away
ENT.NextFollowPlayerTime = 1 -- Time until it runs to the player again
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 3
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut","h_f_chest"}},
	{HitGroup = {501}, Animation = {"h_f_l_leg"}},
	{HitGroup = {502}, Animation = {"h_f_r_leg"}},
	{HitGroup = {503}, Animation = {"h_f_l_arm"}},
	{HitGroup = {505}, Animation = {"h_f_r_arm"}},
}
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3"} -- Death Animations
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.TimeUntilGrenadeIsReleased = 0.97 -- Time until the grenade is released
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_PISTOL} -- Animation played when the SNPC does weapon attack
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN_PISTOL} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_PISTOL} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_Run = {ACT_RUN_PISTOL}
ENT.AnimTbl_WeaponReload = {ACT_ARM} -- Animations that play when the SNPC reloads

ENT.GrenadeTypes = {
	"obj_vj_unsc_spv3_frag_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_unsc_spv3_frag_nade"
}
ENT.CovWeps = {
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_plasmarifleBrute",
	"weapon_vj_cov_spv3_plasmapistol",
	"weapon_vj_cov_spv3_plasmapistolBrute",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_piercer",
	"weapon_vj_cov_spv3_shredder",
	"weapon_vj_cov_spv3_needler",
}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true}
ENT.BGs = {
	1,
	1,
}
ENT.Skins = {
	0,
	1,
	2,
	4,
	5,
	6,
}
ENT.ColorRange = {Vector (255,255,255), Vector(255,255,255)}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_UNSCCovWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.CovWeps))
		end
		if (self:GetActiveWeapon().HoldType!="pistol" or string.find(tostring(self:GetActiveWeapon()), "cov")) then
			self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
			self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
			self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
			self.AnimTbl_Run = {ACT_RUN_RIFLE}
		end
	end)
	if (GetConVarNumber("vj_spv3_ffretal")==0) then 
		self.BecomeEnemyToPlayer = false -- Should the friendly SNPC become enemy towards the player if it's damaged by a player?
	end
	self:SetSkin(VJ_PICKRANDOMTABLE(self.Skins))
	self:SetCollisionBounds(Vector(20, 20, 75), Vector(-20, -20, 0))
	self:SetColor(Color(math.random(self.ColorRange[1].x, self.ColorRange[2].x),math.random(self.ColorRange[1].y, self.ColorRange[2].y) ,math.random(self.ColorRange[1].z, self.ColorRange[2].z)))
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self:SetHealth(self.StartHealth)
	self:SetBodygroup(0, self.BGs[1])
	self:SetBodygroup(1, self.BGs[2])
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

ENT.SoundTbl_OnKilledEnemy = {
	"marine/killed_enemy/killed_enemy (1).wav",
	"marine/killed_enemy/killed_enemy (2).wav",
	"marine/killed_enemy/killed_enemy (3).wav",
	"marine/killed_enemy/killed_enemy (4).wav",
	"marine/killed_enemy/killed_enemy (5).wav",
	"marine/killed_enemy/killed_enemy (6).wav",
	"marine/killed_enemy/killed_enemy (7).wav",
}
ENT.SoundTbl_Alert = {
	"marine/seeFoe/seeFoe (1).wav",
	"marine/seeFoe/seeFoe (2).wav",
	"marine/seeFoe/seeFoe (3).wav",
	"marine/seeFoe/seeFoe (4).wav",
	"marine/seeFoe/seeFoe (5).wav",
	"marine/seeFoe/seeFoe (6).wav",
	"marine/seeFoe/seeFoe (7).wav",
	"marine/seeFoe/seeFoe (8).wav",
	"marine/seeFoe/seeFoe (9).wav",
	"marine/seeFoe/seeFoe (10).wav",
	"marine/seeFoe/seeFoe (11).wav",
	"marine/seeFoe/seeFoe (12).wav",
	"marine/seeFoe/seeFoe (13).wav",
	"marine/seeFoe/seeFoe (14).wav",
	"marine/seeFoe/seeFoe (15).wav",
	"marine/seeFoe/seeFoe (16).wav",
	"marine/seeFoe/seeFoe (17).wav",
	"marine/seeFoe/seeFoe (18).wav",
}
ENT.SoundTbl_Pain = {
	"marine/pain/pain (1).wav",
	"marine/pain/pain (2).wav",
	"marine/pain/pain (3).wav",
	"marine/pain/pain (4).wav",
	"marine/pain/pain (5).wav",
	"marine/pain/pain (6).wav",
	"marine/pain/pain (7).wav",
	"marine/pain/pain (8).wav",
	"marine/pain/pain (9).wav",
	"marine/pain/pain (10).wav",
	"marine/pain/pain (11).wav",
	"marine/pain/pain (12).wav",

}
ENT.SoundTbl_Death = {
	"marine/death/death (1).wav",
	"marine/death/death (2).wav",
	"marine/death/death (3).wav",
	"marine/death/death (4).wav",
	"marine/death/death (5).wav",
	"marine/death/death (6).wav",
	"marine/death/death (7).wav",
	"marine/death/death (8).wav",
	"marine/death/death (9).wav",
	"marine/death/death (10).wav",
	"marine/death/death (11).wav",
	"marine/death/death (12).wav",
	"marine/death/death (13).wav",
}
ENT.SoundTbl_OnGrenadeSight = {
	"marine/seeGrenade/seeGrenade (1).wav",
	"marine/seeGrenade/seeGrenade (2).wav",
	"marine/seeGrenade/seeGrenade (3).wav",
	"marine/seeGrenade/seeGrenade (4).wav",
	"marine/seeGrenade/seeGrenade (5).wav",
	"marine/seeGrenade/seeGrenade (6).wav",
	"marine/seeGrenade/seeGrenade (7).wav",
	"marine/seeGrenade/seeGrenade (8).wav",
	"marine/seeGrenade/seeGrenade (9).wav",
	"marine/seeGrenade/seeGrenade (10).wav",
	"marine/seeGrenade/seeGrenade (11).wav",
	"marine/seeGrenade/seeGrenade (12).wav",
	"marine/seeGrenade/seeGrenade (13).wav",
	"marine/seeGrenade/seeGrenade (14).wav",
}
ENT.SoundTbl_GrenadeAttack = {
	"marine/throwGrenade/throwGrenade (1).wav",
	"marine/throwGrenade/throwGrenade (2).wav",
	"marine/throwGrenade/throwGrenade (3).wav",
	"marine/throwGrenade/throwGrenade (4).wav",
	"marine/throwGrenade/throwGrenade (5).wav",
	"marine/throwGrenade/throwGrenade (6).wav",
	"marine/throwGrenade/throwGrenade (7).wav",
	"marine/throwGrenade/throwGrenade (8).wav",
	"marine/throwGrenade/throwGrenade (9).wav",
	"marine/throwGrenade/throwGrenade (10).wav",
	"marine/throwGrenade/throwGrenade (11).wav",
	"marine/throwGrenade/throwGrenade (12).wav",
	"marine/throwGrenade/throwGrenade (13).wav",
}
ENT.SoundTbl_LostEnemy = {
	
}
ENT.SoundTbl_Investigate = {
	
}
ENT.SoundTbl_WeaponReload = {
	"marine/cover/cover (1).wav",
	"marine/cover/cover (2).wav",
	"marine/cover/cover (3).wav",
	"marine/cover/cover (4).wav",
	"marine/cover/cover (5).wav",
	"marine/cover/cover (6).wav",

}
ENT.SoundTbl_AllyDeath = {
	"marine/ally_death/ally_death (1).wav",
	"marine/ally_death/ally_death (2).wav",
	"marine/ally_death/ally_death (3).wav",
	"marine/ally_death/ally_death (4).wav",
}
ENT.SoundTbl_Stuck = {
	"marine/stuck/stuck (1).wav",
	"marine/stuck/stuck (2).wav",
	"marine/stuck/stuck (3).wav",
	"marine/stuck/stuck (4).wav",
	"marine/stuck/stuck (5).wav",
	"marine/stuck/stuck (6).wav",
}

ENT.SoundTbl_Transform = {
	"marine/transform/transform (1).wav",
	"marine/transform/transform (2).wav",
	"marine/transform/transform (3).wav",
	"marine/transform/transform (4).wav",
	"marine/transform/transform (5).wav",
	"marine/transform/transform (6).wav",
	"marine/transform/transform (7).wav",
}
ENT.SoundTbl_Suppressing = {
	"marine/firing/firing (1).wav",
	"marine/firing/firing (2).wav",
	"marine/firing/firing (3).wav",
	"marine/firing/firing (4).wav",
	"marine/firing/firing (5).wav",
	"marine/firing/firing (6).wav",
	"marine/firing/firing (7).wav",
	"marine/firing/firing (8).wav",
	"marine/firing/firing (9).wav",
	"marine/firing/firing (10).wav",
	"marine/firing/firing (11).wav",
	"marine/firing/firing (12).wav",
	"marine/firing/firing (13).wav",
	"marine/firing/firing (14).wav",
	"marine/firing/firing (15).wav",
	"marine/firing/firing (16).wav",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("npc/footsteps/hardboot_generic"..math.random(1,6)..".wav", 60, 100, 1)
		
	end
end

function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false then return end
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

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	-- if (dmginfo:GetDamageType()==DMG_BLAST) then
	-- 	dmginfo:ScaleDamage(3.5)
	-- 	if (dmginfo:GetDamage()>=self:Health()) then
	-- 		self:FlyingDeath(dmginfo,hitgroup)
	-- 	end
	-- end
end

ENT.HasCollided=false
function ENT:FlyingDeath(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		self.HasDeathanimation=false
		self.HasDeathRagdoll=false
		self:SetHealth(9999)
		self:SetNoDraw(true)
		self.imposter = ents.Create("prop_dynamic")
		self.imposter:SetModel(self:GetModel())
		for k, v in pairs(self:GetBodyGroups()) do
			self.imposter:SetBodygroup(self:GetBodyGroups()[k]["id"], self:GetBodygroup(self:GetBodyGroups()[k]["id"]))
		end
		self.imposter:SetColor(self:GetColor())
		self.imposter:SetSkin(self:GetSkin())
		self.imposter:SetPos(self:GetPos())
		self.imposter:Spawn()
		self.imposter:ResetSequenceInfo()
		self.imposter:SetSequence("Die_Airborne")
		self.imposter:PhysicsInit(2)
		self.imposter:GetPhysicsObject():SetVelocity(Vector(dmginfo:GetDamageForce():GetNormalized().x*1000,dmginfo:GetDamageForce():GetNormalized().y*1000,dmginfo:GetDamageForce():GetNormalized().z*1500))
		self.imposter:SetAngles(Angle(0,dmginfo:GetDamageForce():GetNormalized():Angle().y,0))
		self.imposter:AddCallback("PhysicsCollide", function()
		if (self.HasCollided==true) then return end
			self.HasCollided=true
			self.deathRagdoll = ents.Create("prop_ragdoll")
			self.deathRagdoll:SetModel(self.imposter:GetModel())
			self.deathRagdoll:SetPos(self.imposter:GetPos())
			self.deathRagdoll:SetAngles(self.imposter:GetAngles())
			self.deathRagdoll:Spawn()
			for k, v in pairs(self:GetBodyGroups()) do
				self.deathRagdoll:SetBodygroup(self.deathRagdoll:GetBodyGroups()[k]["id"], self.imposter:GetBodygroup(self.imposter:GetBodyGroups()[k]["id"]))
			end
			self.deathRagdoll:SetColor(self.imposter:GetColor())
			self.deathRagdoll:SetSkin(self.imposter:GetSkin())
			self.deathRagdoll:SetVelocity(self.imposter:GetPhysicsObject():GetVelocity()*1.5)
			self.imposter:Remove()
			self:Remove()
		end)
		
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

/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/