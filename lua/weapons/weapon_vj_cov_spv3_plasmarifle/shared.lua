SWEP.Base = "weapon_vj_spv3_base"
SWEP.PrintName					= "SPV3 Plasma Rifle"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Halo CE SPV3"
SWEP.Spawnable = true

	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
SWEP.Slot = 2 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
end

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/plasma_rifle/plasmarifle.mdl"
SWEP.Primary.Sound				= {"weapons/plasmarifle/fire/plasmarifle1.ogg", "weapons/plasmarifle/fire/plasmarifle2.ogg", "weapons/plasmarifle/fire/plasmarifle3.ogg", "weapons/plasmarifle/fire/plasmarifle4.ogg", "weapons/plasmarifle/fire/plasmarifle5.ogg"}
SWEP.ReloadSound = {}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Delay				= 0.1-- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Damage				= 5
SWEP.Primary.ClipSize			= 6000 -- Max amount of bullets per clip
SWEP.Primary.Cone 				= 10

SWEP.NPC_NextPrimaryFire 		= 2 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 3
SWEP.NPC_CustomSpread 			= 1 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.12 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_pr_shot"
SWEP.Primary.ProjectileSpeed = 4000
SWEP.PrimaryEffects_MuzzleParticles = {"hcea_hunter_plasma_rifle_fire"}
SWEP.PrimaryEffects_SpawnShells = false
SWEP.HoldType 					= "pistol"
SWEP.PrimaryEffects_DynamicLightColor = Color(220, 0, 255, 255)
SWEP.ViewModel 					= "models/weapons/c_smg1.mdl"