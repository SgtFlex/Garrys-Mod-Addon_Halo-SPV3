ENT.Base 			= "npc_vj_creature_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Elite Minor"
ENT.Author 			= "Mayhem"
ENT.Contact 		= "http://vrejgaming.webs.com/"
ENT.Purpose 		= "Let it eat you."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if (CLIENT) then

    function ENT:Initialize()
        hook.Add("PostDrawSkyBox",self,function(self)
            self:Draw()
        end)
    end
    
end