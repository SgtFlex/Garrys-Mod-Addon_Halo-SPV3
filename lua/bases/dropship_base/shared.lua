ENT.Base 			= "base_ai"
ENT.Type 			= "ai"
ENT.PrintName 		= "Dropship Base"
ENT.Author 			= "SgtFlex"
ENT.Purpose 		= "Let it eat you."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

-- if (CLIENT) then
-- local Name = "Elite Minor"
-- local LangName = "npc_vj_halo_cov_spv3_elite_min"
-- language.Add(LangName, Name)
-- killicon.Add(LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
-- language.Add("#"..LangName, Name)
-- killicon.Add("#"..LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
-- end

ENT.AutomaticFrameAdvance = false



function ENT:SetAutomaticFrameAdvance(bUsingAnim)
    self.AutomaticFrameAdvance = bUsingAnim
end