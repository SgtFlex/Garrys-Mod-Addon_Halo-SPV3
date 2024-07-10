ENT.Base 			= "base_ai"
ENT.Type 			= "ai"
ENT.PrintName 		= "Dropship Base"
ENT.Author 			= "SgtFlex"
ENT.Purpose 		= "To spawn units."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if CLIENT then
    function ENT:Initialize()
        hook.Add("PostDrawSkyBox",self,function(self)
            self:Draw()
        end)
    end
end