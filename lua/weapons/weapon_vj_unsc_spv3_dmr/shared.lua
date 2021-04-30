if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/dmr.mdl"
SWEP.Primary.Sound				= {"weapons/dmr/fire/DMR1.ogg", "weapons/dmr/fire/DMR2.ogg", "weapons/dmr/fire/DMR3.ogg", "weapons/dmr/fire/DMR4.ogg"}
SWEP.ReloadSound = {"weapons/dmr/reload/reload_empty_1.ogg", "weapons/dmr/reload/reload_empty_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AR2" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 15
SWEP.Primary.ClipSize			= 15 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 0.85 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 0
SWEP.NPC_CustomSpread 			= 0.75 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.05 -- How much time until the bullet/projectile is fired?
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.PrintName					= "Designated Marksman Rifle"