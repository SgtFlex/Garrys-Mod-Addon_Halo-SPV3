AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Model = "models/hce/spv3/cov/phantom/phantom.mdl" -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.EngineIdleSFX = "phantom/engine_hover.wav"
ENT.EngineMoveSFX = "phantom/engine_moving.wav"

ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.EntClassToCarry = nil


ENT.UnitCost = {
	{Name = "npc_vj_halo_cov_spv3_grunt_min", Cost = 1},
	{Name = "npc_vj_halo_cov_spv3_grunt_maj", Cost = 2},
	{Name = "npc_vj_halo_cov_spv3_grunt_spc", Cost = 3},
	{Name = "npc_vj_halo_cov_spv3_grunt_ult", Cost = 4},
	{Name = "npc_vj_halo_cov_spv3_elite_min", Cost = 7},
	{Name = "npc_vj_halo_cov_spv3_elite_maj", Cost = 8},
	{Name = "npc_vj_halo_cov_spv3_elite_spc", Cost = 9},
	{Name = "npc_vj_halo_cov_spv3_elite_ult", Cost = 10},
	{Name = "npc_vj_halo_cov_spv3_elite_zel", Cost = 11},
	{Name = "npc_vj_halo_cov_spv3_elite_hg_min", Cost = 12},
	{Name = "npc_vj_halo_cov_spv3_elite_hg_maj", Cost = 13},
	{Name = "npc_vj_halo_cov_spv3_elite_hg_ult", Cost = 14},
	{Name = "npc_vj_halo_cov_spv3_elite_hg_zel", Cost = 15},
	{Name = "npc_vj_halo_cov_spv3_brute_min", Cost = 7},
	{Name = "npc_vj_halo_cov_spv3_brute_maj", Cost = 8},
	{Name = "npc_vj_halo_cov_spv3_brute_ult", Cost = 9},
	{Name = "npc_vj_halo_cov_spv3_brute_chf", Cost = 10},
	{Name = "npc_vj_halo_cov_spv3_brute_wchf", Cost = 11},
	{Name = "npc_vj_halo_cov_spv3_hunter_min", Cost = 9},
	{Name = "npc_vj_halo_cov_spv3_hunter_maj", Cost = 10},
	{Name = "npc_vj_halo_cov_spv3_hunter_spc", Cost = 11},
	{Name = "npc_vj_halo_cov_spv3_jackal_min", Cost = 3},
	{Name = "npc_vj_halo_cov_spv3_jackal_maj", Cost = 4},
	{Name = "npc_vj_halo_cov_spv3_jackal_spc", Cost = 5},
	{Name = "npc_vj_halo_cov_spv3_jackal_mkm_min", Cost = 4},
	{Name = "npc_vj_halo_cov_spv3_jackal_mkm_maj", Cost = 5},
	{Name = "npc_vj_halo_cov_spv3_jackal_mkm_ult", Cost = 6},
}

ENT.GibModels = {
	"models/hce/spv3/cov/phantom/garbage/back.mdl",
	"models/hce/spv3/cov/phantom/garbage/front.mdl",
	"models/hce/spv3/cov/phantom/garbage/left.mdl",
	"models/hce/spv3/cov/phantom/garbage/right.mdl",
}

ENT.ChildUnitModels = {
	"models/hce/spv3/cov/elite/Elite_Cov.mdl",
	"models/hce/spv3/cov/grunt/grunt.mdl",
	"models/hce/spv3/cov/hunter/hunter.mdl",
	"models/hce/spv3/cov/jackal/jackal.mdl",
	"models/hce/spv3/cov/brute/Brute.mdl"
}




function ENT:SpawnCorpse()
	local function SpawnPhantomGib(self, model, pos)
		local gib = ents.Create("prop_physics")
		gib:SetModel(model)
		gib:SetPos(pos)
		gib:SetAngles(self:GetAngles())
		gib:Spawn()
		gib:GetPhysicsObject():SetVelocity(self:GetForward() * math.random(100, 200))
		gib:GetPhysicsObject():AddVelocity(self:GetVelocity())
		gib:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(-50, 50)))
	end
	SpawnPhantomGib(self, "models/hce/spv3/cov/phantom/garbage/front.mdl", self:GetPos() + self:GetForward() * 250)
	SpawnPhantomGib(self, "models/hce/spv3/cov/phantom/garbage/left.mdl", self:GetPos() + self:GetRight() * -240)
	SpawnPhantomGib(self, "models/hce/spv3/cov/phantom/garbage/right.mdl", self:GetPos() + self:GetRight() * 240)
	SpawnPhantomGib(self, "models/hce/spv3/cov/phantom/garbage/back.mdl", self:GetPos() + self:GetRight() * -250)
end

function ENT:SpawnTurrets() end