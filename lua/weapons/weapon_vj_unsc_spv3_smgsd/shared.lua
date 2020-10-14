if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/smgsd.mdl"
SWEP.Primary.Sound				= {"weapons/smg sd/fire/new_specops_smg_1.wav", "weapons/smg sd/fire/new_specops_smg_2.wav", "weapons/smg sd/fire/new_specops_smg_3.wav", "weapons/smg sd/fire/new_specops_smg_4.wav", "weapons/smg sd/fire/new_specops_smg_5.wav", "weapons/smg sd/fire/new_specops_smg_6.wav"}
SWEP.ReloadSound 				= {"weapons/smg sd/reload/reload_full_1.wav", "weapons/smg sd/reload/reload_full_2.wav"}
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.PrintName					= "SMG SD"