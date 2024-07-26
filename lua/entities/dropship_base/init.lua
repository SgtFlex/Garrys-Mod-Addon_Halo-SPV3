AddCSLuaFile("shared.lua")
include("shared.lua")

	-- ====Variant Variables==== --
ENT.Model = "models/hce/spv3/cov/phantom/phantom.mdl"

ENT.StartHealth = 5000 * GetConVarNumber("vj_spv3_HealthModifier")
-----------------Movement----------------
ENT.AccelerationSpeed = 3.5
ENT.DecelerateSpeed = 3
ENT.MaxSpeed = 1600
ENT.TurningFactor = 0.01
ENT.DecelerationDistance = 3500 --Distance at which we begin decelerating to stop at the target
ENT.StartAIEnabled = true
ENT.StartEngineOn = true
ENT.CustomSpawns = false
----Sounds----
ENT.LatchSFX = "pelican/latch.wav"
ENT.EngineIdleSFX = "phantom/engine_hover.wav"
ENT.EngineMoveSFX = "phantom/engine_moving.wav"
-----------------------------------------
ENT.TableSpawns = {}
ENT.StartHealth = 5000
ENT.DropHeight = 500
ENT.GibModels = nil
ENT.ChildUnitModels = nil
ENT.UseCustomSchedule = false
ENT.gibTable = {
	"models/gibs/metal_gib5.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/gibs/metal_gib5.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
	"models/combine_helicopter/bomb_debris_3.mdl",
}
ENT.EntClassToCarry = {"imp_halo_util_supplypod","imp_halo_util_supplypod","imp_halo_util_supplypod","imp_halo_util_supplypod","imp_halo_util_supplypod","imp_halo_util_supplypod",}
----AirNode generation----
ENT.AirNodeDirections = 8 --Determines how many directions we generate air nodes. Default is 4
ENT.LengthBetweenNodes = 5000 --Determines how far between nodes we generate. Shorter number is going to mean sharper turns. Default is 5000
ENT.MaxDepth = 30 --How many nodes we're allowed to generate in each direction


---------------------------




-------------Internal, Do not modify--------
ENT.DesiredControlRotation = nil
ENT.CurrentControlRotation = nil
ENT.MoveLocation = nil
ENT.DesiredSpeed = ENT.MaxSpeed
ENT.IsDead = false
ENT.FlySchedule = ai_schedule.New("Dropship")
ENT.Turrets = {}
ENT.CurAirNodeI = nil
ENT.SpawnedUnits = {}
ENT.leaving = false
ENT.SpawnedUnitCount = 1
ENT.Nodes = {}
ENT.EngineSound = nil
ENT.EngineIdleSound = nil
ENT.LatchConstraint = nil
ENT.BlowupTime = nil
ENT.CarriedEntsMass = 0
ENT.bAIEnabled = true
ENT.bEngineOn = true
ENT.CarriedEnts = {}
ENT.bIsUnloading = false
ENT.NextUnloadT = 0
ENT.DownT = 0
------------------------------------------------


function ENT:TaskStart_FlyToPos(data)
	self.MoveLocation = data.pos
end

function ENT:Task_FlyToPos(data)
	debugoverlay.Cross(self.MoveLocation, data.AcceptanceRadius, 0.25, Color(255, 0, 0))
	local rot = (self.MoveLocation - self:GetPos()):GetNormalized():Angle()
	if (data.Stop) then
		self.DesiredSpeed = Lerp(math.min(self:GetPos():Distance(self.MoveLocation)/self.DecelerationDistance, self.MaxSpeed), 0, self.MaxSpeed)
		self.DesiredControlRotation = LerpAngle(math.min(1, (self:GetPos() + self:GetPhysicsObject():GetVelocity()):Distance(self.MoveLocation)/1500), Angle(0, rot.Y, 0), rot)
	else
		self.DesiredSpeed = self.MaxSpeed
		self.DesiredControlRotation = rot
	end
	if (self:GetPos():Distance(data.pos) < data.AcceptanceRadius and (self:GetPhysicsObject():GetVelocity():Length() )) then
		self:TaskComplete()
	end
end
	
function ENT:TaskStart_SpawnVehicle(data)
	self:SetModelScale(1)
	self:SpawnEntities()
	self:TaskComplete()
end

function ENT:Task_SpawnVehicle(data)
	
end

function ENT:TaskStart_NavigatePath(data)
	self.CurAirNodeI = 1
end

function ENT:Task_NavigatePath(data)
	self.MoveLocation = data.Path[self.CurAirNodeI]
	self.DesiredControlRotation = ((self.MoveLocation - self:GetPos()):GetNormalized()):Angle()
	local SpeedFactor = 1
	if (self.CurAirNodeI < #data.Path) then
		SpeedFactor = math.max(0, self.CurrentControlRotation:Forward():Dot((data.Path[self.CurAirNodeI+1] - self:GetPos()):GetNormalized()))
	else
		SpeedFactor = math.max(0, self.CurrentControlRotation:Forward():Dot((data.Path[self.CurAirNodeI] - self:GetPos()):GetNormalized()))
	end
	self.DesiredSpeed = self.MaxSpeed*SpeedFactor
	if ((self:GetPos() + (self:GetPhysicsObject():GetVelocity())):Distance(data.Path[self.CurAirNodeI]) < data.AcceptanceRadius) then
		self:Decelerate()
		self.CurAirNodeI = self.CurAirNodeI + 1
		if (self.CurAirNodeI > #data.Path) then
			self:TaskComplete()
		end
	else
		self:Accelerate()
	end
	debugoverlay.Cross(self.MoveLocation, data.AcceptanceRadius, 0.25, Color(0, 255, 0))
	for k, v in pairs(data.Path) do
		debugoverlay.Cross(v, data.AcceptanceRadius, 0.25, Color(0, 0, 255))
		debugoverlay.Text(v, k, 0.25)
	end
end

function ENT:TaskStart_Touchdown(data)
	self.DesiredSpeed = 0
	self.DesiredControlRotation = Angle(0,0,0)
	self.DesiredControlRotation.Y = self:GetAngles().Y
end

function ENT:Task_Touchdown(data)
	if (self:GetSpeed() <= 10) then 
		self:TaskComplete() 
	end
end

function ENT:TaskStart_SpawnUnits(data)
	self:SpawnUnits()
	self.EndSpawnTime = CurTime() + 10
end

function ENT:Task_SpawnUnits(data)
	if (CurTime() > self.EndSpawnTime) then
	end
	--self:SpawnUnits()
	
	--self:ClearSchedule()
end

function ENT:TaskStart_SetSolid(data)
	self:SetSolid(data)
	self:TaskComplete()
end

function ENT:Task_SetSolid(data)

end

function ENT:TaskStart_DropEntity(data)

	self:StartDropping()
	
end

function ENT:Task_DropEntity(data)
	if (#self.CarriedEnts == 0) then
		self:TaskComplete()
	end
end

function ENT:TaskStart_StartDespawn(data)
	self.MoveLocation = data.pos
	self:SetModelScale(self:GetModelScale())
	self:SetModelScale(0, data.DespawnTime)
	for k, v in pairs(self.Turrets) do
		v:SetModelScale(v:GetModelScale())
		v:SetModelScale(1, data.DespawnTime)
	end
	self.StartDespawnTime = CurTime()
end

function ENT:Task_StartDespawn(data)
	if (CurTime() > self.StartDespawnTime + data.DespawnTime) then
		self:Remove()
	end
	self.DesiredControlRotation = (self.MoveLocation - self:GetPos()):GetNormalized():Angle()
	debugoverlay.Cross(data.pos, 500, .25)
end


function ENT:SelectSchedule()
	if (self.bAIEnabled) then
		self:StartSchedule(self.FlySchedule)
	end
end


function ENT:ConstructFlySchedule()
	--Entering
	if (#self.Nodes >= 3) then
		local TravelPath = table.Reverse(self.Nodes)
		table.remove(TravelPath, 1)
		table.remove(TravelPath, #TravelPath)
		self.FlySchedule:AddTask("FlyToPos", {pos = self.Nodes[#self.Nodes], AcceptanceRadius = 500, Stop = false})
		self.FlySchedule:AddTask("SpawnVehicle", 0)
		self.FlySchedule:AddTask("SetSolid", SOLID_VPHYSICS)
		self.FlySchedule:AddTask("NavigatePath", {Path = TravelPath, AcceptanceRadius = 1500})

		self.FlySchedule:AddTask("FlyToPos", {pos = self.Nodes[1], AcceptanceRadius = 100, Stop = true})
		self.FlySchedule:AddTask("Touchdown", 0)
		self.FlySchedule:AddTask("DropEntity", 0)
		self.FlySchedule:AddTask("SpawnUnits", 0)
		--Leaving
		self.FlySchedule:AddTask("NavigatePath", {Path = self.Nodes, AcceptanceRadius = 1500})
		self.FlySchedule:AddTask("SetSolid", SOLID_NONE)
		self.FlySchedule:AddTask("FlyToPos", {pos = self.SpawnPos, AcceptanceRadius = 1500, Stop = false})
		self.FlySchedule:AddTask("StartDespawn",  {pos = self.SpawnPos, DespawnTime = 5})
	else
		self.FlySchedule:AddTask("FlyToPos", {pos = self.Nodes[1], AcceptanceRadius = 100, Stop = true})
		self.FlySchedule:AddTask("SpawnVehicle", 0)
		self.FlySchedule:AddTask("SetSolid", SOLID_VPHYSICS)
		self.FlySchedule:AddTask("Touchdown", 0)
		self.FlySchedule:AddTask("DropEntity", 0)
		self.FlySchedule:AddTask("SpawnUnits", 0)
		--Leaving
		self.FlySchedule:AddTask("SetSolid", SOLID_NONE)
		self.FlySchedule:AddTask("FlyToPos", {pos = self.HitSkyPos, AcceptanceRadius = 1500, Stop = false})
		self.FlySchedule:AddTask("StartDespawn", {pos = self.SpawnPos, DespawnTime = 15})		
	end
	
end

function ENT:GeneratePathFromPos(StartPos)
	self:TraceForSkyboxRecursively(StartPos, StartPos + Vector(0,0,self.DropHeight), 0)
	--Did we hit the skybox?
	return self.Nodes
end

ENT.HitSkyPos = nil
function ENT:TraceForSkyboxRecursively(PosStart, PosEnd, depth)
	local trace = {start = PosStart, endpos = PosEnd, filter = self, ignoreworld = false}
	
	local tr = util.TraceLine(trace)
	debugoverlay.Line(PosStart, tr.HitPos, 5)
	if (!tr.Hit and depth <= self.MaxDepth) then
		table.insert(self.Nodes, PosEnd)
		debugoverlay.Cross(tr.HitPos, 500, 5)
		for i = 1, self.AirNodeDirections do
			local ParentYaw = (PosEnd - PosStart):Angle().Y
			tr = self:TraceForSkyboxRecursively(PosEnd, PosEnd + (Angle(-30, ((360/self.AirNodeDirections) * (i - 1)) + ParentYaw, 0):Forward()*self.LengthBetweenNodes), depth + 1)
			if (tr.HitSky) then
				--self.SpawnPos = self.Nodes[#self.Nodes]
				self.HitSkyPos = tr.HitPos
				debugoverlay.Cross(tr.HitPos, 1000,3, Color(0,255,255))
				break
			end
		end
	end
	return tr
end

function ENT:SpawnEntities()
	if (self.EntClassToCarry) then
		for k, v in pairs(self.EntClassToCarry) do
			local ent = ents.Create(v)
			if (IsValid(ent)) then
				ent:SetPos(self:GetAttachment(self:LookupAttachment("Latch"))["Pos"] + -(self:GetUp() * (ent:OBBMaxs().Z)))
				ent:Spawn()
				self:PickupEntity(ent)
			end
		end
	end
end

function ENT:Initialize()
	self:SetModel(self.Model)
	self:AddFlags(FL_OBJECT)
	self:AddFlags(FL_AIMTARGET)
	self:SetMaxHealth(self.StartHealth)
	self:SetHealth(self.StartHealth)
	self:AddCallback("PhysicsCollide", function(ent, data) self:PhysicsCollide(data, ent) end)
	
	self.EngineSound = CreateSound(self, self.EngineMoveSFX)
	self.EngineSound:SetSoundLevel(140)
	self.EngineIdleSound = CreateSound(self, self.EngineIdleSFX)
	self.EngineIdleSound:SetSoundLevel(105)
	self:InitializePhysics()
	self:SpawnTurrets()
	self:SetAIEnabled(self.StartAIEnabled and self.StartEngineOn)
	self:SetEngineOn(self.StartEngineOn)
	if (self.bAIEnabled and self.bEngineOn) then
		self:GeneratePathFromPos(self:GetPos())
		self.SpawnPos = self.Nodes[#self.Nodes] + (self.HitSkyPos - self.Nodes[1]):GetNormalized()*(16000 - self.Nodes[#self.Nodes]:Length()) --18K is the max map limit for physics-simulated entities. Spawn within those bounds
		self:SetPos(self.SpawnPos)
		self:SetAngles((self.Nodes[#self.Nodes] - self:GetPos()):Angle())
		self:GetPhysicsObject():SetVelocity((self.Nodes[#self.Nodes] - self:GetPos()):GetNormalized() * self.MaxSpeed)
		self:ConstructFlySchedule()
		self:SetSolid(SOLID_NONE)
		self:AddEFlags(EFL_IN_SKYBOX)
		self:SetModelScale(0)
		self:SetModelScale(1, 5)
		for k, v in pairs(self.Turrets) do
			v:SetModelScale(0)
			v:SetModelScale(1, 5)
		end
	else
		self:SpawnEntities()
	end
	self.DesiredControlRotation = self:GetAngles()
	if (!self.CustomSpawns) then self:SetupSpawnTable() end
	self:PrecacheGibModels()
	self:PrecacheChildUnitModels()


	
end

function ENT:Use(activator, caller, useType, value)
	if (useType == USE_ON and !self.bAIEnabled) then
		self:SetAIEnabled(false)
		drive.PlayerStartDriving(activator, self, "drive_example")
	end
end

function ENT:UpdateTransmitState()	
	return TRANSMIT_ALWAYS 
end

function ENT:PickupEntity(ent)
	if (table.HasValue(constraint.GetAllConstrainedEntities(ent), self) or self.bIsUnloading or ent==self or ent:IsWorld() or !IsValid(ent:GetPhysicsObject()) or ent:GetParent()==self or ent:GetMoveType()!=MOVETYPE_VPHYSICS) then
		return 
	end
	self:EmitSound(self.LatchSFX, 75, 120, 1)
	local mass = ent:GetPhysicsObject():GetMass()
	local ColGroup = ent:GetCollisionGroup()
	local function DisablePhysics(self, ent)
		if (!IsValid(ent:GetPhysicsObject())) then return end
		ent:GetPhysicsObject():Wake()
		ent:GetPhysicsObject():SetVelocity(self:GetPhysicsObject():GetVelocity())
		ent:GetPhysicsObject():SetMass(100)
		ent:PhysWake()
	end
	DisablePhysics(self, ent)
	for k, v in pairs(constraint.GetAllConstrainedEntities(ent)) do
		constraint.NoCollide(self, v, 0, 0)
		--DisablePhysics(self, v)
	end

	ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	local GridSize = 100
	local Rows = 4
	local Columns = 3
	local spacing = GridSize/#self.CarriedEnts
	local latch = self:GetAttachment(self:LookupAttachment("Latch"))
	local Carried = self.CarriedEnts
	self.CarriedEnts = {} --Reset our table
	table.insert(Carried, {
		["Entity"] = ent,
	})
	for k, v in pairs(Carried) do
		local entity = v["Entity"]
		if (v["Latch"]) then v["Latch"]:Remove() end
		local t = Vector(math.random(-100, 100),-50 + (50 * (k%Columns)), 0)
		t:Rotate(latch.Ang)
		entity:SetPos(latch.Pos + t - (latch.Ang:Up() * entity:OBBMaxs().Z))
		ent:SetAngles(latch.Ang)
		local LatchConstraint = constraint.AdvBallsocket(entity, self, 0, 0, Vector(0, 0, ent:OBBMaxs().Z), nil, -100, -100, -100, 100, 100, 100, 0, 0, 0, 0, 0, 0, 1)
		table.insert(self.CarriedEnts, {
			["Entity"] = entity,
			["Latch"] = LatchConstraint,
			["Mass"] = mass,
			["ColGroup"] = ColGroup,
		})
	end
	self:DeleteOnRemove(ent)
end

function ENT:DropAll()
	for i = 1, #self.CarriedEnts do
		self:PopCarriedEntity()
	end
end

function ENT:StartDropping()
	PrintTable(self.CarriedEnts)
	if (self.bIsUnloading == false) then
		self.bIsUnloading = true
	end
end

function ENT:PopCarriedEntity()
	if (!self.CarriedEnts or table.IsEmpty(self.CarriedEnts) ) then return end
	local ent = self.CarriedEnts[1]["Entity"]
	--self.CarriedEnts:GetPhysicsObject():SetMass(self.CarriedEntsMass)
	self:DontDeleteOnRemove(ent)
	self.CarriedEnts[1]["Latch"]:Remove()
	ent:GetPhysicsObject():SetMass(self.CarriedEnts[1]["Mass"])
	ent:SetCollisionGroup(self.CarriedEnts[1]["ColGroup"])
	constraint.ForgetConstraints(ent)
	table.remove(self.CarriedEnts, 1)
	if (#self.CarriedEnts == 0) then
		self.bIsUnloading = false
	end
	self:EmitSound(self.LatchSFX, 80, math.random(90, 110), 1)
end



function ENT:PrecacheGibModels()
	for k, v in pairs(self.GibModels) do
		util.PrecacheModel(v)
	end
end

function ENT:PrecacheChildUnitModels()
	for k, v in pairs(self.ChildUnitModels) do
		util.PrecacheModel(v)
	end
end

function ENT:SetupSpawnTable()
	if (GetConVar("vj_spv3_phantomSpawns"):GetInt()!=0) then
		local v = 1
		for k=3, (tonumber(string.sub(GetConVar("vj_spv3_phantomSpawns"):GetString(), 1, 2))*2)+1, 2 do
			self.TableSpawns[v] = self.UnitCost[tonumber(string.sub(tostring(GetConVar("vj_spv3_phantomSpawns"):GetString()), k, k+1))]
			v = v + 1
		end
	else
		self.Resource = math.random(GetConVar("vj_spv3_phantomMinReinfStr"):GetInt(), GetConVar("vj_spv3_phantomMaxReinfStr"):GetInt())
		local unit
		local k = 1
		local tries = 0
		while (self.Resource >= GetConVar("vj_spv3_phantomMinUnitStr"):GetInt()) do
			unit = VJ_PICK(self.UnitCost)
			if (unit["Cost"] <= self.Resource and unit["Cost"] <= GetConVar("vj_spv3_phantomMaxUnitStr"):GetInt() and unit["Cost"] >= GetConVar("vj_spv3_phantomMinUnitStr"):GetInt()) then
				self.Resource = self.Resource - unit["Cost"]
				self.TableSpawns[k] = unit["Name"]
				k = k + 1
			end
		end
	end
	PrintTable(self.TableSpawns)
end

function ENT:SpawnTurrets()
end

function ENT:SpawnTurret(class, socket)
	local turret = ents.Create(class)
	turret:SetPos(self:GetAttachment(self:LookupAttachment(socket))["Pos"])
	turret:SetAngles(self:GetAttachment(self:LookupAttachment(socket))["Ang"])
	turret:SetParent(self, self:LookupAttachment(socket))
	turret:SetOwner(self)
	turret:Spawn()
	table.insert(self.Turrets, turret)
	return turret
end

function ENT:InitializePhysics()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:GetPhysicsObject():EnableGravity(false)
end

function ENT:OnRemove()
	if (self.EngineSound) then self.EngineSound:Stop() end
	if (self.EngineIdleSound) then self.EngineIdleSound:Stop() end
end

function ENT:SetAIEnabled(HasDriver)
	self.bAIEnabled = HasDriver
end

function ENT:SetEngineOn(state)
	if (state) then
		self:GetPhysicsObject():EnableGravity(false)
		self:GetPhysicsObject():SetDragCoefficient(3)
		self.EngineSound:Play()
		self.EngineIdleSound:Play()
	else
		self:GetPhysicsObject():EnableGravity(true)
		self:GetPhysicsObject():SetDragCoefficient(0)
		if (self.EngineSound) then 
			self.EngineSound:ChangePitch(0, 1)
			self.EngineSound:FadeOut(1)
		end
		if (self.EngineIdleSound) then 
			self.EngineIdleSound:ChangePitch(0, 1)
			self.EngineIdleSound:FadeOut(1)
		end
	end
	self.bEngineOn = state
end

function ENT:Think()
	if (self.bIsUnloading and CurTime() >= self.NextUnloadT and #self.CarriedEnts > 0) then
		self:PopCarriedEntity()
		self.NextUnloadT = CurTime() + 0.5
	end
	if (self.BlowupTime and CurTime() > self.BlowupTime) then
		self:Blowup()
	end
	if (self.IsDead) then return end
	if (self.bEngineOn) then
		self.CurrentControlRotation = self:GetPhysicsObject():GetAngles()
		self:Drive()
		self:TurnToControlRotation()
	end
	
	if (self.bEngineOn) then
		self.EngineSound:ChangePitch(math.Clamp(80 + (30 * (self:GetSpeed()/self.MaxSpeed)), 80, 100))
	end

	self:NextThink( CurTime() )
	return true
end

function ENT:SetMoveLocation(location)
	self.MoveLocation = location
end

function ENT:GetSpeed()
	if (self:GetPhysicsObject()) then 
		return self:GetPhysicsObject():GetVelocity():Length()
	else 
		return self:GetVelocity():Length() 
	end
end

function ENT:OnTakeDamage(dmginfo)
	if (self.IsDead) then return end
	self:SetHealth(math.max(0, self:Health() - dmginfo:GetDamage()))
	if (self:Health() <= 0 and !IsDead) then self:Death(dmginfo) end
end

/*Known variables
d = Distance
a = Acceleration(Braking)
vi = Initial Velocity
vf = Final Velocity
m = mass

d = (0.5 * m * v^2)/(F)
*/

function ENT:Drive()
	if (!self.MoveLocation) then self:Decelerate() return end
	--print("Dot: "..math.deg(self.DesiredControlRotation:Forward():Dot(self:GetPhysicsObject():GetVelocity():GetNormalized())))
	if (self:GetSpeed() < self.DesiredSpeed) then
		self:Accelerate()
	else
		self:Decelerate()
	end
end

function ENT:Accelerate()
	if (self:GetSpeed() >= self.MaxSpeed) then return end
	--Might need to move this logic eventually? Should maybe have a seperate Strafe method
	if (self:GetSpeed() > 100) then
		self:GetPhysicsObject():AddVelocity(self.CurrentControlRotation:Forward() * self.AccelerationSpeed)
	else
		self:GetPhysicsObject():AddVelocity((self.MoveLocation - self:GetPos()):GetNormalized() * self.AccelerationSpeed)
	end
end

function ENT:Decelerate()
	self:GetPhysicsObject():AddVelocity(-self:GetVelocity():GetNormalized() * self.DecelerateSpeed)
end

function ENT:Strafe(Velocity)
	self:GetPhysicsObject():AddVelocity(Velocity * self.AccelerationSpeed)
end

function ENT:TurnToControlRotation()
	if (!self.DesiredControlRotation) then return end
	--self.DesiredControlRotation = ((self.MoveLocation - self:GetPos()):GetNormalized()):Angle()
	local AngDifference = self.DesiredControlRotation - self.CurrentControlRotation
	AngDifference:Normalize()
	
	local ForwardVelocity = self:GetPhysicsObject():WorldToLocalVector(self:GetPhysicsObject():GetVelocity())
	
	local TurnAmountYaw = AngDifference.Y - (self:GetPhysicsObject():GetAngleVelocity().Z)
	local TurnAmountPitch =  AngDifference.X - self:GetPhysicsObject():GetAngleVelocity().Y
	local TurnAmountRoll = (AngDifference.Z - self:GetPhysicsObject():GetAngleVelocity().X + -TurnAmountYaw*0.5)
	-- TurnAmountYaw = TurnAmountYaw + -ForwardVelocity.Y*.05
	-- TurnAmountPitch =  TurnAmountPitch + ForwardVelocity.Z*.05
	local TurnVelocity = (Vector(TurnAmountRoll, TurnAmountPitch, TurnAmountYaw)) * self.TurningFactor
	self:SetPoseParameter("rotate_yaw", TurnAmountYaw*3)
	self:SetPoseParameter("rotate_pitch", TurnAmountPitch*10)
	self:GetPhysicsObject():AddAngleVelocity(TurnVelocity)

	debugoverlay.Line(self:GetPos(), self:GetPos() + (self.CurrentControlRotation:Forward()*1000), 0.03, Color(0, 0, 255))
	debugoverlay.Text(self:GetPos() + self.CurrentControlRotation:Forward()*1000, "CurrentRotation", .03, false)
	debugoverlay.Line(self:GetPos(), self:GetPos() + self.DesiredControlRotation:Forward()*1000, 0.03, Color(0,255,0))
	debugoverlay.Text(self:GetPos() + self.DesiredControlRotation:Forward()*1000, "ControlRotation", .03, false)
end


function ENT:Death()
	if (self.IsDead) then return end
	self.IsDead = true
	self:StartDestruction()
end

function ENT:StartDestruction()
	self.BlowupTime = CurTime() + 1.5
	self:EmitSound("phantom/phantom_windup.ogg", 130)
	self:GetPhysicsObject():EnableGravity(true)
	if (math.random(0,1)==1) then
		self:SetEngineOn(false)
	end
end

function ENT:Blowup()
	self:DropAll()
	self:EmitSound("phantom/phantom_destroyed.ogg", 130)
	util.BlastDamage(self,self,self:GetPos()+ Vector(0,0,self:BoundingRadius()/2 + 10),1000,500) 
	self:SpawnCorpse()
	self:Remove()
end

function ENT:SpawnCorpse()
	local corpse = ents.Create("prop_physics")
	corpse:SetModel(self.Model)
	corpse:PhysicsInit(SOLID_VPHYSICS)
	corpse:SetPos(self:GetPos())
	corpse:SetAngles(self:GetAngles())
	corpse:SetColor(Color(100,100,100))
	corpse:GetPhysicsObject():SetVelocity(self:GetPhysicsObject():GetVelocity())
	corpse:GetPhysicsObject():SetAngleVelocity(self:GetPhysicsObject():GetAngleVelocity())
	corpse:Ignite()
end

function ENT:PhysicsCollide(ColData, Collider)
	local damage = (ColData.OurOldVelocity:Length() - ColData.OurNewVelocity:Length())
	self:TakeDamage(damage, Collider, Collider)
end

function ENT:SpawnUnits()
	self.SpawnedUnitCount = 1
	timer.Create("Spawn"..self:GetCreationID(), 2, #self.TableSpawns, function()
		if (IsValid(self)) then
			local SpawnedUnit = self:SpawnUnit(self.TableSpawns[self.SpawnedUnitCount])
		end
	end)
end

function ENT:SpawnUnit(class)
	local SpawnedUnit = ents.Create(class)
	if (IsValid(SpawnedUnit)) then
		SpawnedUnit:SetPos(self:GetAttachment(self:LookupAttachment("Spawn"))["Pos"] + Vector(0,0,50))
		SpawnedUnit:SetAngles(Angle(0,self:GetAngles().Y,0))
		SpawnedUnit:AddRelationship(self:GetClass().."D_LI 99")
		SpawnedUnit:Spawn()
		nc = constraint.NoCollide(self, SpawnedUnit, 0, 0)

		if (list.Get("NPC")[SpawnedUnit:GetClass()].Weapons != nil) then
			SpawnedUnit:Give(VJ_PICK(list.Get("NPC")[SpawnedUnit:GetClass()].Weapons))
		end

		
	
	end
	
	timer.Simple(1, function()
		if (IsValid(self) and IsValid(SpawnedUnit)) then
			SpawnedUnit:SetVelocity(Vector(math.random(-150, 150),math.random(-150, 150), 0))
			nc:Remove()
		end
	end)	
	
	timer.Simple(2, function() if (IsValid(self) and IsValid(SpawnedUnit)) then SpawnedUnit:VJ_TASK_COVER_FROM_ENEMY()  end end)


	self.SpawnedUnitCount = self.SpawnedUnitCount + 1
	if (self.SpawnedUnitCount==(#self.TableSpawns + 1)) then
		self:TaskComplete()
		self.stickAround = 3
	end

	return ent
end