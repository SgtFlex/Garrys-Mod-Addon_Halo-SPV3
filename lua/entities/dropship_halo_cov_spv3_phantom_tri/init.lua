AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SpawnTurrets()
	self:SpawnTurret("npc_vj_halo_cov_spv3_phantom_turret", "Cannon1")
    self:SpawnTurret("npc_vj_halo_cov_spv3_phantom_turret", "Cannon2")
    self:SpawnTurret("npc_vj_halo_cov_spv3_phantom_turret", "Cannon3")
end