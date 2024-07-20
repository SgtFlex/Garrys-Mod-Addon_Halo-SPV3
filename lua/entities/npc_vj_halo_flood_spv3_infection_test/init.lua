AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include('shared.lua')

ENT.Model = "models/hce/spv3/flood/infector/infectionform.mdl"

local mySCH = ai_schedule.New("MySched")
mySCH:EngTask( "TASK_GET_PATH_TO_RANDOM_NODE",  600 )
mySCH:EngTask( "TASK_FACE_PATH", 		   0   )
mySCH:AddTask("MoveTo", Vector(0,0,0))
mySCH:EngTask( "TASK_WAIT_FOR_MOVEMENT", 	   0   )

ENT.NextMoveTime = 0
ENT.MoveLocation = Vector(0,0,0)

ENT.IsAirborne = false

function ENT:TaskStart_MoveTo(data)
end

function ENT:Task_MoveTo(data)
	local table = ents.FindByClass("Player")
	self.MoveLocation = table[1]:GetPos()
	local velocity = (self.MoveLocation - self:GetPos()):GetNormalized() * 5
	velocity.Z = 0	
		--self:SetVelocity(self:GetAngles():Forward()*5)
	self:SetVelocity(velocity)
	
end

function ENT:SelectSchedule()
	self:StartSchedule(mySCH)
end


local function DrawAxes(pos, forwardAngle)

end

function ENT:Initialize()

	self.corpse = ents.Create("prop_ragdoll")
	local corpse = self.corpse
	corpse:SetModel("models/Kleiner.mdl")
	corpse:SetPos(self:GetPos())
	corpse:Spawn()
	
	
	self:SetModel(self.Model)
	self:SetHullType(HULL_TINY)
	self:SetSolid(SOLID_BBOX)
	self:DropToFloor()
	self:SetHealth(1)
	self:CapabilitiesAdd(CAP_MOVE_GROUND)
	self:SetMoveType(MOVETYPE_FLY)
end

function ENT:OnTakeDamage(dmginfo)
	local attacker = dmginfo:GetAttacker()
	local damage = dmginfo:GetDamage()

	self:SetHealth(self:Health() - dmginfo:GetDamage())
	if (self:Health() <= 0) then
		SafeRemoveEntity(self)
	end

	return false
end

function ENT:TraceForCollisions()
	local TraceVel = {
		start = self:GetPos(),
		endpos = self:GetPos() + (self:GetForward()*30),
		filter = self,
	}
	local TraceGround = {
		start = self:GetPos(),
		endpos = self:GetPos() + (self:GetUp()*-30),
		filter = self,
	}
	local tr = util.TraceLine(TraceVel)
	local tr2 = util.TraceLine(TraceGround)
	debugoverlay.Line(TraceVel.start, TraceVel.endpos, .25)
	debugoverlay.Line(TraceGround.start, TraceGround.endpos, .25)
	if (tr.Hit) then
		self:SetLocalAngles(self:GetAngles() + Angle(-90,0,0))
	elseif (!tr2.Hit) then
		self:SetAngles(Angle(0,0,0))
		self:SetVelocity((TraceVel.endpos + TraceGround.endpos):GetNormalized()*500)
		self:Airborne()
	else
		self.IsAirborne = false
	end
	--self:SetAngles(LerpAngle(0.5, tr.HitNormal:Angle(), tr2.HitNormal:Angle()))
end

function ENT:Airborne()
	if (self.IsAirborne == false) then
		self:OnBeginAirborne()
		self.IsAirborne = true
	end
	self:SetVelocity(Vector(0,0,-40))
end

function ENT:OnBeginAirborne()
	self:SetVelocity(Vector(5000,0,5000))
end

function ENT:Think()
	local corpse = self.corpse

	--Representation of GetAngles() on a corpse
	debugoverlay.Line(corpse:GetPos(), corpse:GetPos() + corpse:GetAngles():Forward() * 500, 1, Color(255, 0, 0))
	local pos, ang = corpse:GetBonePosition(0) --Pelvis bone
	--Representation of Using Angles returned by GetBonePosition
	debugoverlay.Line(pos, pos + ang:Up() * 500, 1, Color(0, 255, 0))


	self:TraceForCollisions()
	local ang = self:GetAngles()
	ang.Y = (self.MoveLocation - self:GetPos()):Angle().Y
	self:SetLocalAngles(ang)
	--self:SetAngles(self:GetVelocity():Angle())
	-- self:SetMoveVelocity(Vector(100000,0,0))
	-- self:SetMoveInterval(0.1)
	-- if (CurTime() > self.NextMoveTime) then
	-- 	self.NextMoveTime = CurTime() + 5
	-- 	self:StartSchedule(mySCH)
	-- end
	self:CalcActivity()
	-- local TrFor = util.TraceLine({
	-- 	start = self:GetPos() + self:OBBCenter(),
	-- 	endpos = self:GetPos() + self:OBBCenter() + self:GetForward()*25,
	-- 	ignoreworld = false,
	-- 	filter = self,
	-- })
	-- local TrDown = util.TraceLine({
	-- 	start = self:GetPos(),
	-- 	endpos = self:GetPos() + self:GetUp()*-20,
	-- 	ignoreworld = false,
	-- 	filter = self,
	-- })
	-- if (TrDown.Hit==false) then
	-- 	print("Going down")
	-- 	self.Speed = 400
	-- 	self:SetVelocity(Vector(0,0,0))
	-- 	self:SetAngles(self:GetAngles() + Angle(90,0,0))
	-- elseif (TrFor.Hit==true) then
	-- 	print("Going On Wall")
	-- 	self.Speed = 75
	-- 	self:SetAngles(self:GetAngles() + Angle(-90,0,0))
	-- end
	-- self:MoveTo(Vector(0,0,0))
end



function ENT:PhysicsCollide(colData, collider)
	print("collided")
end

function ENT:CalcActivity()
	if (self.IsAirborne) then
		self:SetIdealActivity(ACT_JUMP)
		return
	end
	if (self:GetVelocity():Length() > 0) then
		self:SetIdealActivity(ACT_RUN)
	else
		self:SetIdealActivity(ACT_IDLE)
	end
end

function ENT:GetRelationship(entity)
	return D_HT
end