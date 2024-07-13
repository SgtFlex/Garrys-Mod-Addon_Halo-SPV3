SWEP.Base = "weapon_vj_spv3_base"
SWEP.PrintName					= "SPV3 Rocket Launcher"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Halo CE SPV3"
SWEP.Spawnable = true

	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
SWEP.Slot = 4 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
end

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/rocketlauncher.mdl"
SWEP.Primary.Sound				= {"weapons/rocket launcher/fire/fire_1.ogg","weapons/rocket launcher/fire/fire_2.ogg","weapons/rocket launcher/fire/fire_3.ogg"}
SWEP.HasReloadSound 					= true
SWEP.ReloadSound 				= {"weapons/rocket launcher/reload/rocket_reload.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AR2Tracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Delay				= 1-- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= false -- Is it automatic?
SWEP.Primary.Damage				= 350
SWEP.Primary.ClipSize			= 2 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 4 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 0
SWEP.NPC_CustomSpread 			= 1 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_rl_shot"
SWEP.Primary.ProjectileSpeed = 2500
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.ViewModel 					= "models/weapons/c_rpg.mdl"