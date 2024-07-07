include('shared.lua')
AddCSLuaFile()

if CLIENT then
    function ENT:Initialize()
        print("initializing2222.....")
        hook.Add("PostDrawSkyBox",self,function(self)
            self:Draw()
        end)
    end
end