SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Magnum"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/magnum.mdl"
SWEP.Primary.Sound				= {"weapons/magnum/fire/handgun2.ogg"}
SWEP.ReloadSound 				= {"weapons/magnum/reload/reload_full_1.ogg", "weapons/magnum/reload/reload_full_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AR2Tracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Delay				= 0.4-- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Damage				= 15
SWEP.Primary.ClipSize			= 8 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 2
SWEP.NPC_CustomSpread 			= 0.75 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.HoldType 					= "pistol"
SWEP.ViewModel 					= "models/weapons/c_pistol.mdl"