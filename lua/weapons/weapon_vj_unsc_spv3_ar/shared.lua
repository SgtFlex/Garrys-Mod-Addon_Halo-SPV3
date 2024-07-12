SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Assault Rifle"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/assault_rifle/assaultrifle.mdl"
SWEP.Primary.Sound				= {"weapons/assault rifle/fire/fire (1).ogg", "weapons/assault rifle/fire/fire (2).ogg"}
SWEP.ReloadSound 				= {"weapons/assault rifle/ar_reload/reload.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AR2Tracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Delay				= 0.1-- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Damage				= 6
SWEP.Primary.ClipSize			= 32 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 9
SWEP.NPC_CustomSpread 			= 1 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.125 -- How much time until the bullet/projectile is fired?
