AddCSLuaFile("shared.lua")
include("shared.lua")

	-- ====Variant Variables==== --
ENT.Model = "models/hce/spv3/cov/phantom/phantom.mdl" -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.EngineIdleSFX = "phantom/engine_hover.wav"
ENT.EngineMoveSFX = "phantom/engine_moving.wav"
ENT.StartHealth = 5000 * GetConVarNumber("vj_spv3_HealthModifier")
-----------------Movement----------------
ENT.AccelerationSpeed = 2
ENT.DecelerateSpeed = 3.5
ENT.MaxSpeed = 1500
ENT.MaxTurnRate = 0.01
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
ENT.EntClassToCarry = nil
----AirNode generation----
ENT.AirNodeDirections = 8 --Determines how many directions we generate air nodes. Default is 4
ENT.LengthBetweenNodes = 5000 --Determines how far between nodes we generate. Shorter number is going to mean sharper turns. Default is 5000
ENT.MaxDepth = 30 --How many nodes we're allowed to generate in each direction
---------------------------



-------------Internal, Do not modify--------
ENT.DesiredControlRotation = nil
ENT.CurrentControlRotation = nil
ENT.MoveLocation = Vector(0,0,0)
ENT.DesiredSpeed = 1500
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
------------------------------------------------


function ENT:TaskStart_FlyToPos(data)
	self.MoveLocation = data.pos
end

function ENT:Task_FlyToPos(data)
	debugoverlay.Cross(self.MoveLocation, data.AcceptanceRadius, 0.25, Color(255, 0, 0))
	local rot = (self.MoveLocation - self:GetPos()):GetNormalized():Angle()
	if (data.Stop) then
		self.DesiredSpeed = Lerp(math.min(self:GetPos():Distance(self.MoveLocation)/5000, self.MaxSpeed), 0, self.MaxSpeed)
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
	if (self.EntClassToCarry) then
		local ent = ents.Create(self.EntClassToCarry)
		if (IsValid(ent)) then
			ent:Spawn()
			self:PickupEntity(ent)
		end
	end
	
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
		SpeedFactor = math.abs((self:GetPhysicsObject():GetVelocity()):GetNormalized():Dot((data.Path[self.CurAirNodeI+1] - self:GetPos()):GetNormalized()))
	else
		SpeedFactor = (math.abs((self:GetPhysicsObject():GetVelocity()):GetNormalized():Dot((data.Path[self.CurAirNodeI] - self:GetPos()):GetNormalized())))
	end
	SpeedFactor = math.max(.3, SpeedFactor)
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

	self:DropCarriedEntity()
	self:TaskComplete()
end

function ENT:Task_DropEntity(data)

end

function ENT:TaskStart_Despawn()
	self:Remove()
end

function ENT:Task_Despawn()

end

function ENT:SelectSchedule()
	self:StartSchedule(self.FlySchedule)
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
		self.FlySchedule:AddTask("Despawn", 0)
	else
		self.FlySchedule:AddTask("FlyToPos", {pos = self.Nodes[1], AcceptanceRadius = 100, Stop = true})
		self.FlySchedule:AddTask("SpawnVehicle", 0)
		self.FlySchedule:AddTask("SetSolid", SOLID_VPHYSICS)
		self.FlySchedule:AddTask("Touchdown", 0)
		self.FlySchedule:AddTask("DropEntity", 0)
		self.FlySchedule:AddTask("SpawnUnits", 0)
		--Leaving
		self.FlySchedule:AddTask("SetSolid", SOLID_NONE)
		self.FlySchedule:AddTask("FlyToPos", {pos = self.SpawnPos, AcceptanceRadius = 1500, Stop = false})
		self.FlySchedule:AddTask("Despawn", 0)
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

function ENT:Initialize()
	self:GeneratePathFromPos(self:GetPos())
	self.SpawnPos = self.Nodes[#self.Nodes] + (self.HitSkyPos - self.Nodes[1]):GetNormalized()*(17000 - self.Nodes[#self.Nodes]:Length()) --18K is the max map limit for physics-simulated entities. Spawn within those bounds
	self:SetPos(self.SpawnPos)
	self:SetAngles((self.Nodes[#self.Nodes] - self:GetPos()):Angle())
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
	self:SetupSpawnTable()
	self:PrecacheGibModels()
	self:PrecacheChildUnitModels()
	self:GetPhysicsObject():SetVelocity((self.Nodes[#self.Nodes] - self:GetPos()):GetNormalized() * self.DesiredSpeed)
	self:ConstructFlySchedule()
	self:SetSolid(SOLID_NONE)
	self:AddEFlags(EFL_IN_SKYBOX)
end

function ENT:UpdateTransmitState()	
	return TRANSMIT_ALWAYS 
end

function ENT:PickupEntity(ent)
	if (self.CarriedEntity) then self:DropCarriedEntity() end
	self.CarriedEntity = ent	
	self.CarriedEntity:GetPhysicsObject():Wake()
	self.CarriedEntity:GetPhysicsObject():SetVelocity(self:GetPhysicsObject():GetVelocity())
	for k, v in pairs(ent:GetChildren()) do
		constraint.NoCollide(self, v, 0, 0)
		ent:GetPhysicsObject():Wake()
	end
	-- self.CarriedEntity:GetPhysicsObject():EnableGravity(false)
	-- self.CarriedEntity:GetPhysicsObject():SetMass(0)
	self.CarriedEntity:SetPos(self:GetAttachment(self:LookupAttachment("Latch"))["Pos"] + -(self:GetUp() * (ent:OBBMaxs().Z)))
	self.CarriedEntity:SetAngles(self:GetAttachment(self:LookupAttachment("Latch"))["Ang"])
	--self.LatchConstraint = constraint.Weld(ent, self, 0, 0, 0, true)
	--self.LatchConstraint = constraint.Ballsocket(self, ent, 0, 0, Vector(0, 0, 0), 0, 0, 1)
	self.LatchConstraint = constraint.AdvBallsocket(ent, self, 0, 0, Vector(0, 0, ent:OBBMaxs().Z), nil, -100, -100, -100, 100, 100, 100, 0, 0, 0, 0, 0, 0, 1)
	self:DeleteOnRemove(self.CarriedEntity)
	
end

function ENT:DropCarriedEntity()
	if (!self.CarriedEntity) then return end
	self:DontDeleteOnRemove(self.CarriedEntity)
	self.LatchConstraint:Remove()
	self.CarriedEntity = nil
end



function ENT:PrecacheGibModels()
	PrintTable(self.GibModels)
	for k, v in pairs(self.GibModels) do
		print(v)
		util.PrecacheModel(v)
	end
end

function ENT:PrecacheChildUnitModels()
	PrintTable(self.ChildUnitModels)
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
				self.TableSpawns[k] = unit
				k = k + 1
			end
		end
	end
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
	constraint.NoCollide(self, turret, 0, 0)
	table.insert(self.Turrets, turret)
	return turret
end

function ENT:InitializePhysics()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:GetPhysicsObject():EnableGravity(false)
	self:GetPhysicsObject():SetDragCoefficient(0)
end

function ENT:OnRemove()
	if (self.EngineSound) then self.EngineSound:Stop() end
	if (self.EngineIdleSound) then self.EngineIdleSound:Stop() end
end

function ENT:PhysicsCollide(colData, collider)
	self.CurSpeed = 0
end

function ENT:Think()
	if (self.IsDead) then return end
	self.CurrentControlRotation = self:GetPhysicsObject():GetAngles()
	self:Drive()
	self:TurnToControlRotation()
	self.EngineSound:Play()
	self.EngineSound:ChangePitch(math.Clamp(80 + (30 * (self:GetSpeed()/self.MaxSpeed)), 80, 100))
	self.EngineIdleSound:Play()
	
	
	
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
	if (self:GetSpeed() > 5) then
		self:GetPhysicsObject():AddVelocity(-self:GetVelocity():GetNormalized() * self.DecelerateSpeed)
	else
		self:GetPhysicsObject():SetVelocity(Vector(0,0,0))
	end
end

function ENT:TurnToControlRotation()
	if (!self.DesiredControlRotation) then return end
	--self.DesiredControlRotation = ((self.MoveLocation - self:GetPos()):GetNormalized()):Angle()
	local AngDifference = self.DesiredControlRotation - self.CurrentControlRotation
	AngDifference:Normalize()
	
	local ForwardVelocity = self:GetPhysicsObject():WorldToLocalVector(self:GetPhysicsObject():GetVelocity())
	local TurnAmountYaw = AngDifference.Y - self:GetPhysicsObject():GetAngleVelocity().Z + -ForwardVelocity.Y*.05
	local TurnAmountPitch =  AngDifference.X - self:GetPhysicsObject():GetAngleVelocity().Y + ForwardVelocity.Z*.05
	local TurnVelocity = (Vector((AngDifference.Z - self:GetPhysicsObject():GetAngleVelocity().X + -TurnAmountYaw*0.5), TurnAmountPitch, TurnAmountYaw)) * self.MaxTurnRate
	self:SetPoseParameter("rotate_yaw", TurnAmountYaw*3)
	self:SetPoseParameter("rotate_pitch", TurnAmountPitch*3)
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
	self:EmitSound("phantom/phantom_windup.ogg", 130)
	self:GetPhysicsObject():EnableGravity(true)
	local effect = EffectData()
	effect:SetEntity(self)
	effect:SetOrigin(self:GetPos() + (self:GetForward()*math.random(-350, 350)) + (self:GetRight()*math.random(-200, 200)) + Vector(0,0,math.random(250, 300)))
	util.Effect("phantomFXBurst", effect) 

	timer.Create("miniexplosions"..self:GetCreationID(), 0.25, 2, function()
		if (IsValid(self)) then
			local effect = EffectData()
			local explosionLoc = self:GetPos() + (self:GetForward()*math.random(-350, 350)) + (self:GetRight()*math.random(-200, 200)) + Vector(0,0,math.random(250, 300))
			effect:SetEntity(self)
			effect:SetOrigin(explosionLoc)
			util.Effect("phantomFXBurst", effect) 
			for k=1, 5 do
				local ent = {}
				ent[k] = ents.Create("prop_physics")
				ent[k]:SetModel(self.gibTable[k])
				ent[k]:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
				ent[k]:PhysicsInit(SOLID_VPHYSICS)
				
				ent[k]:SetPos(explosionLoc)
				ent[k]:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
				ent[k]:GetPhysicsObject():AddVelocity(Vector(math.random(-1000, 1000),math.random(-1000, 1000), math.random(-100, 300)))
				local effect=EffectData()
				if (GetConVarNumber("vj_sent_useParticles")==1) then timer.Create("FireFallFXSmall"..self:GetCreationID()..math.random(0,100)..k, 0.03, math.random(75, 150), function() 
					if (IsValid(ent[k])) then 
						effect:SetOrigin(ent[k]:GetPos()) 
						util.Effect("fireFallFXSmall", effect)
						end 
					end) 
				end
			end
		end
	end)
	if (math.random(0,1)==1) then
		--self:PhysicsInit(SOLID_VPHYSICS)

		self:GetPhysicsObject():Wake()
	end
	timer.Create("Blowup"..self:GetCreationID(), 3, 0, function() self:Blowup() end)
end

function ENT:Blowup()
	self:DropCarriedEntity()
	self:EmitSound("phantom/phantom_destroyed.ogg", 130)
	
	util.BlastDamage(self,self,self:GetPos()+ Vector(0,0,self:BoundingRadius()/2 + 10),1000,500) 
	ParticleEffect("", self:LocalToWorld(Vector(0,0,20)), self:GetAngles(), nil)
	for i=1, 10 do
		local effect = EffectData()
		local explosion = self:GetPos() + (self:GetForward()*math.random(-550, 550)) + (self:GetRight()*math.random(-300, 300)) + Vector(0,0,math.random(50, 300))
		effect:SetOrigin(explosion)
		util.Effect("phantomFX", effect) 
	end
	
	local ent = {}
	for k,v in pairs(self.gibTable) do
		ent[k] = ents.Create("prop_physics")
		ent[k]:SetModel(self.gibTable[k])
		ent[k]:PhysicsInit(SOLID_VPHYSICS)
		ent[k]:SetPos(self:GetPos() + (self:GetForward()*math.random(-350, 350)) + (self:GetRight()*math.random(-200, 200)) + Vector(0,0,math.random(-150, 250)))
		ent[k]:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(75, 250)))
		ent[k]:GetPhysicsObject():AddVelocity(Vector(math.random(-1000, 1000),math.random(-1000, 1000), math.random(1000, -400)))
		local effect=EffectData()
		if (GetConVarNumber("vj_sent_useParticles")==1) then timer.Create("FireFallFXSmall"..self:GetCreationID()..k, 0.03, math.random(75, 150), function() 
			if (IsValid(ent[k])) then 
				effect:SetOrigin(ent[k]:GetPos()) 
				util.Effect("fireFallFXSmall", effect)
				end 
			end) 
		end
	end
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
	local nc = nil
	timer.Create("Spawn"..self:GetCreationID(), 2, #self.TableSpawns, function()
		if (IsValid(self)) then
			local SpawnedUnit = ents.Create(self.TableSpawns[self.SpawnedUnitCount]["Name"])
			SpawnedUnit:SetPos(self:GetAttachment(self:LookupAttachment("Spawn"))["Pos"] + Vector(0,0,50))
			SpawnedUnit:SetAngles(Angle(0,self:GetAngles().Y,0))
			SpawnedUnit:Spawn()
			nc = constraint.NoCollide(self, SpawnedUnit, 0, 0)
			timer.Simple(1, function()
				if (IsValid(self) and IsValid(SpawnedUnit)) then
					SpawnedUnit:SetVelocity(Vector(math.random(-150, 150),math.random(-150, 150), 0))
					nc:Remove()
				end
			end)	
			
			timer.Simple(2, function() if (IsValid(self) and IsValid(SpawnedUnit)) then SpawnedUnit:VJ_TASK_COVER_FROM_ENEMY()  end end)
			
			if (list.Get("NPC")[SpawnedUnit:GetClass()].Weapons != nil) then
				SpawnedUnit:Give(VJ_PICK(list.Get("NPC")[SpawnedUnit:GetClass()].Weapons))
			end
			self.SpawnedUnitCount = self.SpawnedUnitCount + 1
			if (self.SpawnedUnitCount==(#self.TableSpawns + 1)) then
				self:TaskComplete()
				self.stickAround = 3
			end
		end
	end)
end