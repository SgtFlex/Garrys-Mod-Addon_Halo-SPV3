if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.PrintName					= "SMG"
SWEP.Primary.Damage				= 5  -- Damage
SWEP.Primary.TracerType 		= "AR2Tracer" -- Tracer type (Examples: AR2)