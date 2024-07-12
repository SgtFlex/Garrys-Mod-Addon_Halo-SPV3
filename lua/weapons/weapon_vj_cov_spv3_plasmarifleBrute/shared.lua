SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Brute Plasma Rifle"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/plasma_rifle/plasmarifle.mdl"
SWEP.Primary.Sound				= {"weapons/plasmarifle/fire/plasmarifle1.ogg", "weapons/plasmarifle/fire/plasmarifle2.ogg", "weapons/plasmarifle/fire/plasmarifle3.ogg", "weapons/plasmarifle/fire/plasmarifle4.ogg", "weapons/plasmarifle/fire/plasmarifle5.ogg"}
SWEP.ReloadSound = {"weapons/brute shot/reload/reload_full_1.ogg", "weapons/brute shot/reload/reload_full_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 6.5
SWEP.Primary.ClipSize			= 6000 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 2 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 3
SWEP.NPC_CustomSpread 			= 1 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.15 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_pr_shot"
SWEP.Primary.ProjectileSpeed = 4000
SWEP.PrimaryEffects_MuzzleParticles = {"hcea_hunter_plasma_rifle_fire"}
SWEP.PrimaryEffects_SpawnShells = false
SWEP.Color = Color(255, 30, 30, 0)
SWEP.HoldType 					= "pistol"
SWEP.PrimaryEffects_DynamicLightColor = Color(255, 0, 0, 255)
SWEP.ViewModel 					= "models/weapons/c_smg1.mdl"