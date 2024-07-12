ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "(WIP) Infection Form"
ENT.Category = "VJ Base"
ENT.Author = "Sgt Flexxx"
ENT.Contact = "https://steamcommunity.com/id/sgtflexxx/"
ENT.Purpose = "To test code."
ENT.Instructions = "Spawn me"
ENT.Spawnable = true

ENT.AutomaticFrameAdvance = false

function ENT:PhysicsCollide(data, physObj)
end

function ENT:PhysicsUpdate(physObj)
end

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
    self.AutomaticFrameAdvance = bUsingAnim
end