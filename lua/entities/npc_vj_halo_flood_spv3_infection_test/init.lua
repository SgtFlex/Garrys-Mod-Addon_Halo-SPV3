AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include('shared.lua')

ENT.Model = "models/hce/spv3/flood/infector/infectionform.mdl"

local mySCH = ai_schedule.New("MySched")
mySCH:EngTask( "TASK_GET_PATH_TO_RANDOM_NODE",  600 )
mySCH:EngTask( "TASK_RUN_PATH", 		   0   )
mySCH:EngTask( "TASK_WAIT_FOR_MOVEMENT", 	   0   )


function ENT:SelectSchedule()
	--self:StartSchedule(mySCH)
end

function ENT:Initialize()
	self.nick = "Poppy the popcorn"
	self:SetModel(self.Model)
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetSolid(SOLID_BBOX)
	self:DropToFloor()
	self:SetHealth(25)
	self:CapabilitiesAdd(CAP_MOVE_GROUND)
	self:SetMoveType(MOVETYPE_STEP)
end

function ENT:OnTakeDamage(dmginfo)
	local attacker = dmginfo:GetAttacker()
	local damage = dmginfo:GetDamage()

	self:SetHealth(self:Health() - dmginfo:GetDamage())
	if (self:Health() <= 0) then
		SafeRemoveEntity(self)
		print(attacker:Nick() .. " killed " .. self.nick .. "!")
	end

	return false
end

ENT.Speed = 200
function ENT:MoveTo(pos)
	local vec1 = Vector(pos.x, pos.y, 0)
	local vec2 = Vector(self:GetPos().x, self:GetPos().y, 0)
	local moveVec = (vec1 - vec2):GetNormalized()
	self:SetVelocity(moveVec*self.Speed)
	self:SetAngles(moveVec:Angle())
end


function ENT:Think()
	self:CalcActivity()
	local TrFor = util.TraceLine({
		start = self:GetPos() + self:OBBCenter(),
		endpos = self:GetPos() + self:OBBCenter() + self:GetForward()*25,
		ignoreworld = false,
		filter = self,
	})
	local TrDown = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetUp()*-20,
		ignoreworld = false,
		filter = self,
	})
	if (TrDown.Hit==false) then
		print("Going down")
		self.Speed = 400
		self:SetVelocity(Vector(0,0,0))
		self:SetAngles(self:GetAngles() + Angle(90,0,0))
	elseif (TrFor.Hit==true) then
		print("Going On Wall")
		self.Speed = 75
		self:SetAngles(self:GetAngles() + Angle(-90,0,0))
	end
	self:MoveTo(Vector(0,0,0))
end

function ENT:CalcActivity()
	if (self:GetVelocity():Length() > 0) then
		self:SelectWeightedSequence(ACT_RUN)
	end
end

function ENT:GetRelationship(entity)
	return D_HT
end