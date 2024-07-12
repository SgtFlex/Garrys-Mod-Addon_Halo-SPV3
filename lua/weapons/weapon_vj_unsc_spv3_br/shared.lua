SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Battle Rifle"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/battlerifle.mdl"
SWEP.Primary.Sound				= {"weapons/battle rifle/fire/BR1.ogg", "weapons/battle rifle/fire/BR2.ogg", "weapons/battle rifle/fire/BR3.ogg"}
SWEP.ReloadSound = {"weapons/battle rifle/reload/reload_empty_1.ogg", "weapons/battle rifle/reload/reload_empty_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AR2Tracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 5
SWEP.Primary.ClipSize			= 36 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 2
SWEP.NPC_CustomSpread 			= 1.15 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.05 -- How much time until the bullet/projectile is fired?
SWEP.Primary.Burst				= true -- Is it a burst weapon?