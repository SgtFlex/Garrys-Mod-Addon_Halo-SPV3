if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Base 			= "spv3_map_spawner"
ENT.Type 			= "point"
ENT.PrintName 		= "SPV3 Map Spawner"
ENT.Author 			= "SgtFlex"
ENT.Contact 		= "http://vrejgaming.webs.com/"
ENT.Purpose 		= "To spawn SPV3 units"
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"


ENT.EntitiesToSpawn = {
	{EntityName = "Phantom", SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"dropship_halo_cov_spv3_phantom"}, Weight = GetConVar("vj_spv3_mapCov"):GetFloat()},
	{EntityName = "Pelican", SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"dropship_halo_unsc_spv3_pelican"}, Weight = GetConVar("vj_spv3_mapUNSC"):GetFloat()},
	{EntityName = "Biomass", SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"sent_vj_flood_spv3_biomass"}, Weight = GetConVar("vj_spv3_mapFlood"):GetFloat()},

}
ENT.TimedSpawn_Time = 30 -- How much time until it spawns another SNPC?
ENT.TimedSpawn_OnlyOne = false -- If it's true then it will only have one SNPC spawned at a time
ENT.HasIdleSounds = true -- Does it have idle sounds?
	-- Sounds ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Idle = {}
ENT.IdleSoundChance = 1 -- How much chance to play the sound? 1 = always
ENT.IdleSoundLevel = 80
ENT.IdleSoundPitch1 = 80
ENT.IdleSoundPitch2 = 100
ENT.NextSoundTime_Idle1 = 0.2
ENT.NextSoundTime_Idle2 = 0.5
ENT.SoundTbl_SpawnEntity = {}
ENT.SpawnEntitySoundChance = 1 -- How much chance to play the sound? 1 = always
ENT.SpawnEntitySoundLevel = 80
ENT.SpawnEntitySoundPitch1 = 80
ENT.SpawnEntitySoundPitch2 = 100
	-- Independent Variables ---------------------------------------------------------------------------------------------------------------------------------------------
-- These should be left as they are
ENT.Dead = false
ENT.AlreadyDoneVJBaseSpawnerDisabled = true
ENT.NextIdleSoundT = 0
ENT.NextTimedSpawnT = 0
ENT.TableNavAreas = nil
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnEntitySpawn(EntityName, SpawnPosition, Entities, TheEntity) 
	
end
ENT.CanFunction = true
function ENT:CustomOnInitialize_BeforeNPCSpawn() 
	util.PrecacheModel("models/hce/spv3/cov/phantom/phantom.mdl")
	util.PrecacheModel("models/hce/spv3/cov/phantom/phantomturret.mdl")
	util.PrecacheModel("models/hce/spv3/unsc/pelican/pelican.mdl")
	util.PrecacheModel("models/hce/spv3/unsc/pelican/pelican_rocket_pod.mdl")
	util.PrecacheModel("models/hce/spv3/unsc/pelican/pelicanturret.mdl")
	util.PrecacheModel("models/hce/spv3/flood/biomass1/biomass1.mdl")

	self.TableNavAreas = navmesh.GetAllNavAreas()
	if (self.TableNavAreas[1] == nil) then
		PrintMessage(3, "Map spawner requires Navmesh to function. Map has no navmesh!")
		self.CanFunction = false
		self:Remove()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize_AfterNPCSpawn() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_BeforeAliveChecks() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AfterAliveChecks() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnAnEntity(keys, values, initspawn)
	if (self.CanFunction == false) then return end
	self.LastSpawnTime = CurTime()
	self.TimedSpawn_Time = math.random(20, 80)
	local k = keys
	local v = values
	initspawn = initspawn or false
	local overridedisable = false
	local hasweps = false
	local wepslist = {}
	if initspawn == true && self.OverrideDisableOnSpawn then overridedisable = true end
	if self.VJBaseSpawnerDisabled == true && overridedisable == false then return end
	
	local getthename = v.EntityName
	local spawnpos = v.SpawnPosition
	local totalWeight = 0
	local spawnIndex = 0
	for k, v in pairs(self.EntitiesToSpawn) do
		totalWeight = totalWeight + v["Weight"]
	end
	randomSelection = math.random(0, totalWeight)
	for k, v in pairs(self.EntitiesToSpawn) do
			randomSelection = randomSelection - v["Weight"]
			spawnIndex = spawnIndex + 1
			if (randomSelection <= 0 && v["Weight"]>0) then break end
	end
	k = keys
	v = self.EntitiesToSpawn[spawnIndex]
	getthename = ents.Create(VJ_PICK(v.Entities))

	if (v.EntityName == "Phantom") then
		local navArea = nil
		local pos = nil
		local trace = nil
		repeat
			navArea = self.TableNavAreas[math.random(1, #self.TableNavAreas)]
			pos = navArea:GetRandomPoint()
			local trace = util.TraceLine({
				start = pos + Vector(0, 0, 5),
				endpos = pos + Vector(0, 0, 1000),
				filter = self,
			})
		until (!navArea:IsUnderwater() and navArea:GetSizeX()>= 250 and navArea:GetSizeY()>= 250 and !trace.Hit)
		getthename:SetPos(pos)
	elseif (v.EntityName == "Pelican") then
		local navArea = nil
		local pos = nil
		repeat
			navArea = self.TableNavAreas[math.random(1, #self.TableNavAreas)]
			pos = navArea:GetRandomPoint()
			local trace = util.TraceLine({
					start = pos + Vector(0, 0, 5),
					endpos = pos + Vector(0, 0, 1000),
					filter = self,
				})
		until (!navArea:IsUnderwater() and navArea:GetSizeX()>= 250 and navArea:GetSizeY()>= 250 and !trace.Hit)
		getthename:SetPos(pos)
		
	elseif (v.EntityName == "Biomass") then
		local navArea = nil
		local pos = nil
		local viablePos = true
		repeat
			navArea = self.TableNavAreas[math.random(1, #self.TableNavAreas)]
			pos = navArea:GetRandomPoint()
		until (!navArea:IsUnderwater() and !navArea:HasAttributes(NAV_MESH_DONT_HIDE) and !navArea:HasAttributes(NAV_MESH_AVOID) and !navArea:HasAttributes(NAV_MESH_JUMP) and !navArea:HasAttributes(NAV_MESH_CROUCH) and #navArea:GetHidingSpots(1) >= 1 and navArea:GetSizeX()>= 150 and navArea:GetSizeY()>= 150) 
		getthename:SetPos(pos)
	end

	//getthename:SetPos(self:GetPos() +self:GetForward()*spawnpos.vForward +self:GetRight()*spawnpos.vRight +self:GetUp()*spawnpos.vUp)
	getthename:SetAngles(self:GetAngles())
	getthename:Spawn()
	getthename:Activate()
	if v.WeaponsList != nil && VJ_PICK(v.WeaponsList) != false && VJ_PICK(v.WeaponsList) != NULL && VJ_PICK(v.WeaponsList) != "None" && VJ_PICK(v.WeaponsList) != "none" then hasweps = true wepslist = v.WeaponsList end
	if hasweps == true then
		local randwep = VJ_PICK(v.WeaponsList) -- Kharen zenkme zad e
		if randwep == "default" then
			getthename:Give(VJ_PICK(list.Get("NPC")[getthename:GetClass()].Weapons))
		else
			getthename:Give(randwep)
		end
	end
	if initspawn == false then table.remove(self.CurrentEntities,k) end
	table.insert(self.CurrentEntities,k,{EntityName=v.EntityName,SpawnPosition=v.SpawnPosition,Entities=v.Entities,TheEntity=getthename,WeaponsList=wepslist,Dead=false/*NextTimedSpawnT=CurTime()+self.TimedSpawn_Time*/})
	self:SpawnEntitySoundCode()
	if self.VJBaseSpawnerDisabled == true && overridedisable == true then getthename:Remove() return end
	self:CustomOnEntitySpawn(v.EntityName,v.SpawnPosition,v.Entities,TheEntity)
	timer.Simple(0.1,function() if IsValid(self) && self.SingleSpawner == true then self:DoSingleSpawnerRemove() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.nav = nil
ENT.spv3Npcs = {}
ENT.spv3NpcCount = 0
function ENT:Initialize()
	self.EntitiesToSpawn = {
	{EntityName = "Phantom", SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"dropship_halo_cov_spv3_phantom"}, Weight = GetConVar("vj_spv3_mapCov"):GetFloat()},
	{EntityName = "Pelican", SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"dropship_halo_unsc_spv3_pelican"}, Weight = GetConVar("vj_spv3_mapUNSC"):GetFloat()},
	{EntityName = "Biomass", SpawnPosition = {vForward=0, vRight=0, vUp=0}, Entities = {"sent_vj_flood_spv3_biomass"}, Weight = GetConVar("vj_spv3_mapFlood"):GetFloat()},
	}
	self:SetPos(Vector(0,0,0))
	self.nav = navmesh.Find(self:GetPos(), 50, 10, 10)[1]
	if self:GetModel() == "models/error.mdl" then
	self:SetModel(VJ_PICK(self.Model)) end
	self:DrawShadow(false)
	self:SetNoDraw(true)
	self:SetNotSolid(true)
	self.CurrentEntities = {}
	self:CustomOnInitialize_BeforeNPCSpawn()
	self.NumberOfEntitiesToSpawn =  table.Count(self.EntitiesToSpawn)
	local k = 1
	local v = self.EntitiesToSpawn[math.random(1, #self.EntitiesToSpawn)]
	self:SpawnAnEntity(k, v, true)
	self:CustomOnInitialize_AfterNPCSpawn()
end
// lua_run for k,v in ipairs(ents.GetAll()) do if v.IsVJBaseSpawner == true then v.VJBaseSpawnerDisabled = false end end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.LastSpawnTime = 0
//Currently hardcoded cap of 80 total NPCS spawned, but infection forms count as 1/3 of an NPC.
function ENT:Think()
	if self.Dead == true then VJ_STOPSOUND(self.CurrentIdleSound) return end
	if self.VJBaseSpawnerDisabled == true then self.AlreadyDoneVJBaseSpawnerDisabled = false end
	//PrintTable(self.CurrentEntities)
	//print("-----------------------------------------------------------")
	self:CustomOnThink_BeforeAliveChecks()
	self:IdleSoundCode()
	
	/*if self.VJBaseSpawnerDisabled == false && self.AlreadyDoneVJBaseSpawnerDisabled == false && table.Count(self.CurrentEntities) < self.NumberOfEntitiesToSpawn then
		self.AlreadyDoneVJBaseSpawnerDisabled = true
		local k = 1
		local v = self.EntitiesToSpawn[math.random(1, #self.EntitiesToSpawn)]
		self:SpawnAnEntity(k, v, true)
	end*/
	if (CurTime() >= self.LastSpawnTime + self.TimedSpawn_Time) then
		local k = 1
		local v = self.EntitiesToSpawn[math.random(1, #self.EntitiesToSpawn)]
		
		local ents = ents.GetAll()
		self.spv3Npcs = {}
		self.spv3NpcCount = 0
		for i=1, #ents do
			if (string.find(tostring(ents[i]), "npc") and string.find(tostring(ents[i]), "spv3")) then
				if (string.find(tostring(ents[i]), "infection")) then
					self.spv3NpcCount = self.spv3NpcCount + 0.33
				else
					self.spv3NpcCount = self.spv3NpcCount + 1
				end
			end
		end
		if (self.spv3NpcCount < GetConVar("vj_spv3_mapLimit"):GetInt()) then
			self:SpawnAnEntity(k, v, true)
		end
		print(self.spv3NpcCount)
	end
	self:CustomOnThink_AfterAliveChecks()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:IdleSoundCode()
	if self.HasIdleSounds == false then return end
	if CurTime() > self.NextIdleSoundT then
		local randomidlesound = math.random(1,self.IdleSoundChance)
		if randomidlesound == 1 /*&& self:VJ_IsPlayingSoundFromTable(self.SoundTbl_Idle) == false*/ then
			self.CurrentIdleSound = VJ_CreateSound(self,self.SoundTbl_Idle,self.IdleSoundLevel,math.random(self.IdleSoundPitch1,self.IdleSoundPitch2))
		end
		self.NextIdleSoundT = CurTime() + math.Rand(self.NextSoundTime_Idle1,self.NextSoundTime_Idle2)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnEntitySoundCode()
	if self.HasIdleSounds == false then return end
	local randomidlesound = math.random(1,self.SpawnEntitySoundChance)
	if randomidlesound == 1 /*&& self:VJ_IsPlayingSoundFromTable(self.SoundTbl_Idle) == false*/ then
		self.CurrentSpawnEntitySound = VJ_CreateSound(self,self.SoundTbl_SpawnEntity,self.SpawnEntitySoundLevel,math.random(self.SpawnEntitySoundPitch1,self.SpawnEntitySoundPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoSingleSpawnerRemove()
	for _, v in ipairs(self.CurrentEntities) do
		if IsValid(v.TheEntity) && self:GetCreator() != nil then
			//cleanup.ReplaceEntity(self,v.TheEntity)
			//undo.ReplaceEntity(self,v.TheEntity)
			undo.Create(v.TheEntity:GetName())
			undo.AddEntity(v.TheEntity)
			undo.SetPlayer(self:GetCreator())
			undo.Finish()
		end
	end
	self.Dead = true
	VJ_STOPSOUND(self.CurrentIdleSound)
	self:Remove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
	self:CustomOnRemove()
	self.Dead = true
	VJ_STOPSOUND(self.CurrentIdleSound)
	if self.SingleSpawner == false && self.CurrentEntities != nil then
		for _, v in ipairs(self.CurrentEntities) do
			if IsValid(v.TheEntity) && v.TheEntity then v.TheEntity:Remove() end
		end
	end
end
/*--------------------------------------------------
	=============== Spawner Base ===============
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to make spawners.
--------------------------------------------------*/