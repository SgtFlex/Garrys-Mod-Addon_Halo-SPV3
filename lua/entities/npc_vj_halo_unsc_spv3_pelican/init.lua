AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/unsc/pelican/pelican.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 5000
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = false-- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.ConstantlyFaceEnemy_IfVisible = false -- Should it only face the enemy if it's visible?
ENT.CallForHelpAnimationFaceEnemy = false-- Should it face the enemy when playing the animation?
-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.AnimTbl_MoveToCover = {ACT_RUN} -- The animation it plays when moving to a covered position
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_WeaponReload = {ACT_ARM} -- Animations that play when the SNPC reloads
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.UnitCost = {
	{Name = "marine", Cost = 1},
	{Name = "odst", Cost = 5},
	{Name = "stacker", Cost = 12},
	{Name = "johnson", Cost = 12},
	{Name = "chief", Cost = 15},
}
ENT.lights = {
	LeftLight1 = {Object = "", Attachment = "Thruster_L_F_1", Color = "0 180 255", Scale = 2, Offset = Vector(0, 0, 0)},
	LeftLight2 = {Object = "", Attachment = "Thruster_L_F_2", Color = "255 0 0", Scale = 2, Offset = Vector(0, 0, 0)},
	RightLight1 = {Object = "", Attachment = "Thruster_R_F_1", Color = "0 180 255", Scale = 2, Offset = Vector(0, 0, 0)},
	RightLight2 = {Object = "", Attachment = "Thruster_R_F_2", Color = "255 0 0", Scale = 2, Offset = Vector(0, 0, 0)},
	BLeftLight1 = {Object = "", Attachment = "Thruster_L_B_1", Color = "0 180 255", Scale = 2, Offset = Vector(0, 0, 0)},
	BLeftLight2 = {Object = "", Attachment = "Thruster_L_B_2", Color = "255 0 0", Scale = 2, Offset = Vector(0, 0, 0)},
	BRightLight1 = {Object = "", Attachment = "Thruster_R_B_1", Color = "0 180 255", Scale = 2, Offset = Vector(0, 0, 0)},
	BRightLight2 = {Object = "", Attachment = "Thruster_R_B_2", Color = "255 0 0", Scale = 2, Offset = Vector(0, 0, 0)},
	TailLight1 = {Object = "", Attachment = "Tail_L", Color = "0 180 255", Scale = 0.5, Offset = Vector(0, 0, 0)},
	TailLight2 = {Object = "", Attachment = "Tail_R", Color = "0 180 255", Scale = 0.5, Offset = Vector(0, 0, 0)},
	WindowLight1 = {Object = "", Attachment = "Window_L", Color = "0 180 255", Scale = 0.5, Offset = Vector(0, 0, 0)},
	WindowLight2 = {Object = "", Attachment = "Window_R", Color = "0 180 255", Scale = 0.5, Offset = Vector(0, 0, 0)},
	EngineLight1 = {Object = "", Attachment = "Engine_L", Color = "255 0 0", Scale = 0.5, Offset = Vector(0, 0, 0)},
	EngineLight2 = {Object = "", Attachment = "Engine_R", Color = "255 0 0", Scale = 0.5, Offset = Vector(0, 0, 0)},
}

ENT.AnimTbl_Spawn = {
	"Spawn_1",
}

ENT.AnimTbl_Leave = {
	"Leave_1",
}
function ENT:CustomOnPreInitialize()
	self.SpawnAnim = VJ_PICKRANDOMTABLE(self.AnimTbl_Spawn)
	self.LeaveAnim = VJ_PICKRANDOMTABLE(self.AnimTbl_Leave)

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
		self.lights[k]["Object"]:SetKeyValue("GlowProxySize","10")
		self.lights[k]["Object"]:SetKeyValue("rendercolor",tostring(self.lights[k]["Color"]))
		self.lights[k]["Object"]:SetKeyValue("scale",tostring(self.lights[k]["Scale"]))
		self.lights[k]["Object"]:Spawn()
		self.lights[k]["Object"]:Activate()
	end
end

function ENT:CustomOnInitialize()
	self:SpawnLights()
	self.engineSound = CreateSound(self, "pelican/engine_loop.wav")
	self.engineSound:SetSoundLevel(105)
	self.engineSound:Play()
	self.engineSound:ChangeVolume(0)
	self.engineSound:ChangeVolume(1, 5)
	self.engineSound:ChangePitch(150)
	self.windSound = CreateSound(self, "pelican/wind_loop.wav")
	self.windSound:SetSoundLevel(80)
	self.windSound:Play()
	self.windSound:ChangeVolume(0)
	self:SetCollisionBounds(Vector(-500, -300, -50), Vector(500, 300, 400))
	self:SetAngles(Angle(0, math.random(0, 360), 0))
	local trace = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetUp()*-10000,
		filter = self,
	})
	if (trace.Hit) then
		self:SetPos(trace.HitPos + Vector(0,0,math.random(400, 700)))
	end
	local random=math.random(0,1)
	if (random==0) then
		self.turret = ents.Create("npc_vj_halo_unsc_spv3_pelican_turret")
		self.turret:SetParent(self, 2)
		self.turret:SetPos(self:GetAttachment(self:LookupAttachment("Turret_Main"))["Pos"] + Vector(0,0,-55))
		self.turret:SetAngles(self:GetAngles())
		self.turret:SetOwner(self)
		self.turret:Spawn()
		self.turret:SetNoDraw(true)
	end
	random=math.random(0,1)
	if (random==0) then
		self.turret2 = ents.Create("npc_vj_halo_unsc_spv3_pelican_turret")
		self.turret2.RangeAttackAngleRadius = 90
		self.turret2:SetParent(self, 2)
		self.turret2:SetPos(self:GetAttachment(self:LookupAttachment("Turret_Back"))["Pos"] + Vector(0,0,-55))
		self.turret2:SetAngles(self:GetAngles() + Angle(0,180,0))
		self.turret2:SetOwner(self)
		self.turret2:Spawn()
		self.turret2:SetNoDraw(true)
	end
	local random=math.random(0,2)
	if (random==0) then
		self.turret3 = ents.Create("npc_vj_halo_unsc_spv3_rocket_pod")
		self.turret3.RangeAttackAngleRadius = 90
		self.turret3:SetParent(self, 2)
		self.turret3:SetPos(self:GetAttachment(self:LookupAttachment("Rocket_Right"))["Pos"])
		self.turret3:SetAngles(self:GetAngles())
		self.turret3:SetOwner(self)
		self.turret3:Spawn()
		self.turret3:SetNoDraw(true)

		self.turret4 = ents.Create("npc_vj_halo_unsc_spv3_rocket_pod")
		self.turret4.RangeAttackAngleRadius = 90
		self.turret4:SetParent(self, 2)
		self.turret4:SetPos(self:GetAttachment(self:LookupAttachment("Rocket_Left"))["Pos"])
		self.turret4:SetAngles(self:GetAngles())
		self.turret4:SetOwner(self)
		self.turret4:Spawn()
		self.turret4:SetNoDraw(true)
	elseif (random==1) then
		self.turret3 = ents.Create("npc_vj_halo_unsc_spv3_pelican_turret")
		self.turret3.RangeAttackAngleRadius = 90
		self.turret3:SetParent(self, 2)
		self.turret3:SetPos(self:GetAttachment(self:LookupAttachment("Rocket_Right"))["Pos"] + Vector(0,0,-55))
		self.turret3:SetAngles(self:GetAngles())
		self.turret3:SetOwner(self)
		self.turret3:Spawn()
		self.turret3:SetNoDraw(true)

		self.turret4 = ents.Create("npc_vj_halo_unsc_spv3_pelican_turret")
		self.turret4.RangeAttackAngleRadius = 90
		self.turret4:SetParent(self, 2)
		self.turret4:SetPos(self:GetAttachment(self:LookupAttachment("Rocket_Left"))["Pos"] + Vector(0,0,-55))
		self.turret4:SetAngles(self:GetAngles())
		self.turret4:SetOwner(self)
		self.turret4:Spawn()
		self.turret4:SetNoDraw(true)
	end

	self:VJ_ACT_PLAYACTIVITY(self.SpawnAnim,true,self:SequenceDuration(self:LookupSequence(self.SpawnAnim)),false)	
	self:SetNoDraw(true)
	timer.Simple(0.3, function()
		if (IsValid(self)) then
			self:SetNoDraw(false)
			if IsValid(self.turret) then
				self.turret:SetNoDraw(false)
			end
			if IsValid(self.turret2) then
				self.turret2:SetNoDraw(false)
			end
			if IsValid(self.turret3) then
				self.turret3:SetNoDraw(false)
			end
			if IsValid(self.turret4) then
				self.turret4:SetNoDraw(false)
			end
			
		end
	end)
	timer.Simple(self:SequenceDuration(self:LookupSequence(self.SpawnAnim)), function()
		if (IsValid(self)) then
			self:VJ_ACT_PLAYACTIVITY("Idle",true,3,false)	
			self:SpawnUNSC()
		end
	end)
end

ENT.marines = {}
ENT.leaving = false
function ENT:SpawnUNSC()
	local unit
	self.Resource = math.random(20, 35)
	timer.Create("Spawn"..self:GetCreationID(), 2, 0, function()
		if (IsValid(self)) then
			if (self.Resource > 0) then
				repeat
					unit = VJ_PICK(self.UnitCost)
				until unit["Cost"] <= self.Resource
				local marine = ents.Create("npc_vj_halo_unsc_spv3_"..unit["Name"])
				self.Resource = self.Resource - unit["Cost"]
				marine:SetPos(self:GetAttachment(self:LookupAttachment("Spawn"))["Pos"] + Vector(0,0,-50))
				marine:SetAngles(self:GetAngles() + Angle(0,180,0))
				marine:Spawn()
				timer.Simple(0.5, function()
					if (IsValid(self) and IsValid(marine)) then
						marine:SetVelocity(Vector(math.random(-150, 150),math.random(-150, 150), 0))
					end
				end)	
				timer.Simple(2, function() if (IsValid(self) and IsValid(marine)) then marine:VJ_TASK_COVER_FROM_ENEMY() end end)
				constraint.NoCollide(self, marine, 0, 0)
				if (list.Get("NPC")[marine:GetClass()].Weapons != nil) then
					marine:Give(VJ_PICK(list.Get("NPC")[marine:GetClass()].Weapons))
				end
				-- PrintMessage(3, tostring("Cost: "..unit["Cost"]))
				-- PrintMessage(3, tostring("Resource: "..self.Resource))
			elseif (self.depletedTime==nil) then
				self.depletedTime = CurTime()
			elseif (self.Resource <= 0 and self.leaving==false and (CurTime() >= self.depletedTime + GetConVarNumber("vj_spv3_phantomAssistTime") or !IsValid(self.turret))) then
				self.leaving = true
					if (IsValid(self)) then
						self:VJ_ACT_PLAYACTIVITY(self.LeaveAnim,true,self:SequenceDuration(self:LookupSequence(self.LeaveAnim)),false)
						self.engineSound:ChangeVolume(0, 5)	
						timer.Simple(self:SequenceDuration(self:LookupSequence(self.LeaveAnim)), function()
							if (IsValid(self)) then
								self:Remove()
							end
						end)
					end
				end
			end
	end)
end

function ENT:CustomOnRemove()
	self.engineSound:Stop()
end

function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Engine_moving"then
		self.engineSound:ChangePitch(150, 3)
		self.windSound:ChangeVolume(0, 3)
	elseif key == "Engine_hovering" then
		self.engineSound:ChangePitch(100, 3)
		self.windSound:ChangeVolume(1, 3)
	end
end