AddCSLuaFile("shared.lua")
include('shared.lua')


function ENT:SpawnTurrets()
	local random=math.random(0,1)
	if (random==0) then
		self:SpawnTurret("npc_vj_halo_unsc_spv3_pelican_turret", "Turret_Main")
	end
	random=math.random(0,1)
	if (random==0) then
		self:SpawnTurret("npc_vj_halo_unsc_spv3_pelican_turret", "Turret_Back")
	end
	local random=math.random(0,1)
	if (random==0) then
		self:SpawnTurret("npc_vj_halo_unsc_spv3_rocket_pod", "Rocket_Right")
		self:SpawnTurret("npc_vj_halo_unsc_spv3_rocket_pod", "Rocket_Left")
	elseif (random==1) then
		self:SpawnTurret("npc_vj_halo_unsc_spv3_pelican_turret", "Rocket_Right")
		self:SpawnTurret("npc_vj_halo_unsc_spv3_pelican_turret", "Rocket_Left")
	end
end