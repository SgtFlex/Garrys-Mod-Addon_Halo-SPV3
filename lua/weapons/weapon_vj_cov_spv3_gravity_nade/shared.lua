SWEP.Base = "weapon_vj_spv3_grenade_base"
SWEP.PrintName					= "[SPV3] Gravity Grenade"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Halo CE SPV3"
SWEP.Spawnable = true

	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
SWEP.Slot = 4 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
end

SWEP.EntToThrow = "obj_vj_cov_spv3_gravity_nade"
SWEP.WorldModel					= "models/hce/spv3/weapons/cov/gravitygrenade.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.Primary.Ammo				= "gravity_grenade" -- Ammo type
