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
    local front = ents.Create("prop_physics")
	front:SetModel("models/hce/spv3/cov/phantom/garbage/front.mdl")
	front:SetPos(self:GetPos() + self:GetForward() * 250)
	front:SetAngles(self:GetAngles())
	front:Spawn()
	front:GetPhysicsObject():SetVelocity(self:GetForward() * math.random(100, 200))
	front:GetPhysicsObject():AddVelocity(self:GetVelocity())
	front:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(-50, 50)))
	timer.Create("FireFallFXSmall".."front"..self:GetCreationID(), 0.2, 300, function() 
		if (IsValid(front)) then 
			local effect = EffectData()
			effect:SetOrigin(front:GetPos())
			util.Effect("PhantomFXDead", effect)
			end 
		end)
	local left = ents.Create("prop_physics")
	left:SetModel("models/hce/spv3/cov/phantom/garbage/left.mdl")
	left:SetPos(self:GetPos() + self:GetRight() * -240)
	left:SetAngles(self:GetAngles())
	left:Spawn()
	left:GetPhysicsObject():SetVelocity(self:GetRight() * math.random(-100, -200))
	left:GetPhysicsObject():AddVelocity(self:GetVelocity())
	left:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(-50, 50)))
	timer.Create("FireFallFXSmall".."left"..self:GetCreationID(), 0.2, 300, function() 
		if (IsValid(left)) then 
			local effect = EffectData()
			effect:SetOrigin(left:GetPos())
			util.Effect("PhantomFXDead", effect)
			end 
		end)
	local right = ents.Create("prop_physics")
	right:SetModel("models/hce/spv3/cov/phantom/garbage/right.mdl")
	right:SetPos(self:GetPos() + self:GetRight() * 240)
	right:SetAngles(self:GetAngles())
	right:Spawn()
	right:GetPhysicsObject():SetVelocity(self:GetRight() * math.random(100, 200))
	right:GetPhysicsObject():AddVelocity(self:GetVelocity())
	right:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(-50, 50)))
	timer.Create("FireFallFXSmall".."right"..self:GetCreationID(), 0.2, 300, function() 
		if (IsValid(right)) then 
			local effect = EffectData()
			effect:SetOrigin(right:GetPos())
			util.Effect("PhantomFXDead", effect)
			end 
		end)
	local back = ents.Create("prop_physics")
	back:SetModel("models/hce/spv3/cov/phantom/garbage/back.mdl")
	back:SetPos(self:GetPos() + self:GetForward() * -250)
	back:SetAngles(self:GetAngles())
	back:Spawn()
	back:GetPhysicsObject():SetVelocity(self:GetForward() * math.random(-100, -200))
	back:GetPhysicsObject():AddVelocity(self:GetVelocity())
	back:GetPhysicsObject():AddAngleVelocity(Vector(math.random(-100, 100),math.random(-100, 100), math.random(-50, 50)))
	timer.Create("FireFallFXSmall".."back"..self:GetCreationID(), 0.2, 300, function() 
		if (IsValid(back)) then 
			local effect = EffectData()
			effect:SetOrigin(back:GetPos())
			util.Effect("PhantomFXDead", effect)
			end 
		end)
end

function ENT:SpawnTurrets() end