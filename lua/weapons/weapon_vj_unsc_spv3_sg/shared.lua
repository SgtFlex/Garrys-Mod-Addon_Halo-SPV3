SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Shotgun"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/shotgun.mdl"
SWEP.Primary.Sound				= {"weapons/shotgun/fire/shotgun6050_1.ogg","weapons/shotgun/fire/shotgun6050_2.ogg", "weapons/shotgun/fire/shotgun6050_3.ogg", "weapons/shotgun/fire/shotgun6050_4.ogg", "weapons/shotgun/fire/shotgun6050_5.ogg", }
SWEP.ReloadSound = {"weapons/shotgun/reload/sg_reload_exit1.ogg", "weapons/shotgun/reload/sg_reload_exit2.ogg", "weapons/shotgun/reload/sg_reload_exit3.ogg"}
SWEP.NPC_ReloadSound 			= SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AR2Tracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 1.5
SWEP.Primary.NumberOfShots		= 30	 -- How many shots per attack?
SWEP.Primary.ClipSize			= 10 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.3 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 0
SWEP.NPC_CustomSpread 			= 3 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.ViewModel 					= "models/weapons/c_shotgun.mdl"