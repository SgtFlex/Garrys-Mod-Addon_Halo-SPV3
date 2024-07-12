SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Particle Carbine"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/carbine/carbine.mdl"
SWEP.Primary.Sound				= {"weapons/particle carbine/fire/particle_carbine_1.ogg", "weapons/particle carbine/fire/particle_carbine_2.ogg", "weapons/particle carbine/fire/particle_carbine_3.ogg"}
SWEP.ReloadSound = {}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 10
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 2
SWEP.NPC_CustomSpread 			= 0.75 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.NPC_HasReload              = false
SWEP.Primary.Delay				= 0.2-- Time until it can shoot again
SWEP.Primary.Burst						= false -- Is it a burst weapon?
SWEP.Primary.Automatic					= false -- Is it automatic?
SWEP.PrimaryEffects_DynamicLightColor = Color(220, 0, 191, 255)
