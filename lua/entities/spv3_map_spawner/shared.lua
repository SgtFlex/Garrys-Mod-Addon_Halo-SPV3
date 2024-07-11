ENT.Type = "point" -- Sets the entity type to 'anim', indicating it's an animated entity.
ENT.Base = "base_ai" -- Specifies that this entity is based on the 'base_gmodentity', inheriting its functionality.
ENT.PrintName = "SPV3 Map Spawner" -- The name that will appear in the spawn menu.
ENT.Author = "SgtFlex" -- The author's name for this entity.
ENT.Category = "New Category" -- The category for this entity in the spawn menu.
ENT.Contact = "SgtFlex" -- The contact details for the author of this entity.
ENT.Purpose = "To test the creation of entities." -- The purpose of this entity.
ENT.Spawnable = true -- Specifies whether this entity can be spawned by players in the spawn menu.

if (SERVER) then


ENT.SpawnCD = 30
---------INTERNAL------
ENT.nav = nil
ENT.spv3Npcs = {}
ENT.spv3NpcCount = 0
ENT.LastSpawnTime = 0
ENT.SpawnedEntities = {}
-----------------------

ENT.Factions = {
	{Name = "UNSC", Spawners = {"dropship_halo_unsc_spv3_pelican", "dropship_halo_unsc_spv3_pelican_armed"}, Power = 0, SpawnerPosition = function(NavAreas)
		local pos = nil
		for i = 1, 50 do
			local navArea = table.Random(NavAreas)
			navArea:Draw()
			pos = navArea:GetCenter()
			local trace = util.TraceLine({
				start = pos + Vector(0, 0, 5),
				endpos = pos + Vector(0, 0, 100000),
			})
			if (!navArea:IsUnderwater() and navArea:GetSizeX()>= 500 and navArea:GetSizeY()>= 500 and trace.HitSky) then
				break
			end
		end
		return pos
	end},
	{Name = "COV", Spawners = {"dropship_halo_cov_spv3_phantom", "dropship_halo_cov_spv3_phantom_tri"}, Power = 0, SpawnerPosition = function(NavAreas)
		local pos = nil
		for i = 1, 50 do
			local navArea = table.Random(NavAreas)
			navArea:Draw()
			pos = navArea:GetCenter()
			local trace = util.TraceLine({
				start = pos + Vector(0, 0, 5),
				endpos = pos + Vector(0, 0, 100000),
			})
			if (!navArea:IsUnderwater() and navArea:GetSizeX()>= 500 and navArea:GetSizeY()>= 500 and trace.HitSky) then
				break
			end
		end
		return pos
	end},
	{Name = "FLOOD", Spawners = {"sent_vj_flood_spv3_biomass"}, Power = 0, SpawnerPosition = function(NavAreas)
		local pos = nil
		for i = 1, 50 do
			navArea = table.Random(NavAreas)
			pos = navArea:GetRandomPoint()
			if (!navArea:IsUnderwater() and !navArea:HasAttributes(NAV_MESH_DONT_HIDE) and !navArea:HasAttributes(NAV_MESH_AVOID) and !navArea:HasAttributes(NAV_MESH_JUMP) and !navArea:HasAttributes(NAV_MESH_CROUCH) and #navArea:GetHidingSpots(1) >= 1 and navArea:GetSizeX()>= 150 and navArea:GetSizeY()>= 150) then
				break
			end
		end
		return pos
	end},
}

local NavAreas = nil
function ENT:Initialize() 
	util.PrecacheModel("models/hce/spv3/cov/phantom/phantom.mdl")
	util.PrecacheModel("models/hce/spv3/cov/phantom/phantomturret.mdl")
	util.PrecacheModel("models/hce/spv3/unsc/pelican/pelican.mdl")
	util.PrecacheModel("models/hce/spv3/unsc/pelican/pelican_rocket_pod.mdl")
	util.PrecacheModel("models/hce/spv3/unsc/pelican/pelicanturret.mdl")
	util.PrecacheModel("models/hce/spv3/flood/biomass1/biomass1.mdl")

	NavAreas = navmesh.GetAllNavAreas()
	if (table.IsEmpty(NavAreas)) then
		PrintMessage(3, "Map spawner requires Navmesh to function. Map has no navmesh!")
		self:Remove()
	end
end


function ENT:TriggerSpawn()
	self.LastSpawnTime = CurTime()
	local faction = table.Random(self.Factions)
	local SpawnPos = faction.SpawnerPosition(NavAreas)
	if (SpawnPos) then
		local Spawner = ents.Create(table.Random(faction["Spawners"]))
		Spawner:SetPos(SpawnPos)
		Spawner:Spawn()
		print("Spawned entity")
		table.insert(self.SpawnedEntities, Spawner)
	end
end

function ENT:Think()
	if (CurTime() >= self.LastSpawnTime + self.SpawnCD) then
		self:TriggerSpawn()
	end
end

function ENT:OnRemove()
	for k, v in pairs(self.SpawnedEntities) do
		if (IsValid(v)) then
			v:Remove()
		end
	end
end

end