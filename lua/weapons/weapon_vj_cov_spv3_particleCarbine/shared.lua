if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/carbine/carbine.mdl"
SWEP.Primary.Sound				= {"weapons/particle carbine/fire/particle_carbine_1.wav", "weapons/particle carbine/fire/particle_carbine_2.wav", "weapons/particle carbine/fire/particle_carbine_3.wav"}
SWEP.ReloadSound = {}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 10
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 2
SWEP.NPC_CustomSpread 			= 0.75 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.NPC_HasReload = false
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.PrintName					= "Particle Carbine"