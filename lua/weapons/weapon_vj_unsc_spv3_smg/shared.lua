SWEP.Base = "weapon_vj_spv3_base"
SWEP.PrintName					= "SPV3 SMG"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Halo CE SPV3"
SWEP.Spawnable = true

	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
SWEP.Slot = 2 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
end

SWEP.Primary.Delay				= 0.06 -- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Damage				= 5  -- Damage
SWEP.Primary.Cone 				= 10
SWEP.Primary.Tracer 					= 1 -- Show tracer for every x bullets
SWEP.Primary.TracerType 				= "Tracer" -- Tracer type (Examples: AR2)SWEP.ViewModel 					= "models/weapons/c_smg1.mdl"
SWEP.Primary.Sound				= {"weapons/smg/fire/fire1.ogg", "weapons/smg/fire/fire2.ogg", "weapons/smg/fire/fire3.ogg"}
SWEP.HasReloadSound 					= true
SWEP.ReloadSound 				= {"weapons/smg sd/reload/reload_full_1.ogg", "weapons/smg sd/reload/reload_full_2.ogg"}
SWEP.ViewModel 					= "models/weapons/c_smg1.mdl"