AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('entities/npc_vj_halo_for_spv3_aggressor/init.lua')
include('shared.lua')

ENT.ItemDropsOnDeath_EntityList = {"weapon_vj_sent_sentinelbeamMajor"}
ENT.defensiveStats = {
	shieldMax = 150,
	shieldCurrent = 150,
	shieldRegen = 3,
	shieldSpeed = .1,
	shieldDelay = 5,
	hullMax = 50,
	hullCurrent = 50,
	hullArmor = 20,
}
ENT.StartHealth = ENT.defensiveStats["hullMax"] + ENT.defensiveStats["shieldMax"]//GetConVarNumber("vj_dum_dummy_h")
ENT.attackStats = {
	damage = 225,
	beamDuration = 1.5,
	beamTickRate = 0.045,
	reload = 2,
}
function ENT:VariantCode()
	self:SetSkin(1)
end