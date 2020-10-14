AddCSLuaFile("shared.lua")
include('shared.lua')

function SWEP:CustomOnRemove() 
	if (IsValid(self) and self.firingSound) then
		self.firingSound:Stop()
	end
end