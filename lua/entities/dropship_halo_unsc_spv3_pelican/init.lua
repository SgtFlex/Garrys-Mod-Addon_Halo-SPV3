AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = "models/hce/spv3/unsc/pelican/pelican.mdl"
ENT.EngineIdleSFX = "pelican/wind_loop.wav"
ENT.EngineMoveSFX = "pelican/engine_loop.wav"
ENT.UnitCost = {
	{Name = "npc_vj_halo_unsc_spv3_marine", Cost = 1},
	{Name = "npc_vj_halo_unsc_spv3_odst", Cost = 5},
	{Name = "npc_vj_halo_unsc_spv3_stacker", Cost = 12},
	{Name = "npc_vj_halo_unsc_spv3_johnson", Cost = 12},
	{Name = "npc_vj_halo_unsc_spv3_chief", Cost = 15},
}
ENT.VJ_NPC_Class = {"CLASS_UNSC"} -- NPCs with the same class with be allied to each other
ENT.EntClassToCarry = nil
ENT.GibModels = {}

ENT.ChildUnitModels = {
	"models/hce/spv3/unsc/chief/chief.mdl",
	"models/hce/spv3/unsc/marine/Marine.mdl",
}

ENT.DropHeight = 300

function ENT:StartDestruction()
	self.BlowupTime = CurTime() + 1.5
	self:GetPhysicsObject():EnableGravity(true)
	local effect = EffectData()
	effect:SetEntity(self)
	effect:SetOrigin(self:GetPos())
	util.Effect("burning_engine_01", effect)
	self:EmitSound("phx/explode00.wav", 90)
	ParticleEffectAttach("burning_engine_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end