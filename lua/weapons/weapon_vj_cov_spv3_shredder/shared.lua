SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Shredder"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/shredder.mdl"
SWEP.Primary.Sound				= {"weapons/shredder/fire/Shredder_shot_1.ogg","weapons/shredder/fire/Shredder_shot_2.ogg","weapons/shredder/fire/Shredder_shot_3.ogg"}
SWEP.ReloadSound = {"weapons/shredder/reload/fp_needlerifle_ready01.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 7
SWEP.Primary.ClipSize			= 35 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.65 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 3
SWEP.NPC_CustomSpread 			= 1.35 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.2 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_shredder_shot"
SWEP.Primary.ProjectileSpeed = 3000
SWEP.HoldType 					= "pistol"
SWEP.PrimaryEffects_DynamicLightColor = Color(255, 93, 0, 255)
SWEP.ViewModel 					= "models/weapons/c_smg1.mdl"