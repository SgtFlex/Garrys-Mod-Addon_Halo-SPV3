if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/shotgun.mdl"
SWEP.Primary.Sound				= {"weapons/shotgun/fire/shotgun6050_1.ogg","weapons/shotgun/fire/shotgun6050_2.ogg", "weapons/shotgun/fire/shotgun6050_3.ogg", "weapons/shotgun/fire/shotgun6050_4.ogg", "weapons/shotgun/fire/shotgun6050_5.ogg", }
SWEP.ReloadSound = {"weapons/shotgun/reload/sg_reload_exit1.ogg", "weapons/shotgun/reload/sg_reload_exit2.ogg", "weapons/shotgun/reload/sg_reload_exit3.ogg"}
SWEP.NPC_ReloadSound 			= SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 2.5
SWEP.Primary.NumberOfShots		= 30	 -- How many shots per attack?
SWEP.Primary.ClipSize			= 10 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.3 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 0
SWEP.NPC_CustomSpread 			= 3 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.PrintName					= "Shotgun"