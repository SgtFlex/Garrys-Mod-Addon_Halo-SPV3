SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Brute Plasma Pistol"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/plasma_pistol/plasmapistol.mdl"
SWEP.Primary.Sound				= {"weapons/plasma pistol/fire/plasmapistol1.ogg", "weapons/plasma pistol/fire/plasmapistol2.ogg", "weapons/plasma pistol/fire/plasmapistol3.ogg", "weapons/plasma pistol/fire/plasmapistol4.ogg", "weapons/plasma pistol/fire/plasmapistol5.ogg"}
SWEP.ReloadSound = {"weapons/brute shot/reload/reload_full_1.ogg", "weapons/brute shot/reload/reload_full_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.Delay				= 0.2-- Time until it can shoot again
SWEP.Primary.Burst						= false -- Is it a burst weapon?
SWEP.Primary.Automatic					= false -- Is it automatic?
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 5
SWEP.Primary.NumberOfShots 		= 3 -- How many shots per attack?
SWEP.Primary.ClipSize			= 6000 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 2
SWEP.NPC_CustomSpread 			= 1.65 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_bpp_shot"
SWEP.Primary.ProjectileSpeed = 4000
SWEP.Color = Color(255, 30, 30, 0)
SWEP.HoldType 					= "pistol"
SWEP.NPC_HasSecondaryFire = true -- Can the weapon have a secondary fire?
SWEP.NPC_SecondaryFireEnt = "obj_vj_spv3_bpp_charged" -- The entity to fire, this only applies if self:NPC_SecondaryFire() has NOT been overridden!
SWEP.NPC_SecondaryFireChance = 3 -- Chance that the secondary fire is used | 1 = always
SWEP.NPC_SecondaryFireNext = VJ_Set(12, 15) -- How much time until the secondary fire can be used again?
SWEP.NPC_SecondaryFireDistance = 2500 -- How close does the owner's enemy have to be for it to fire?
SWEP.NPC_HasSecondaryFireSound = true -- Can the secondary fire sound be played?
SWEP.NPC_SecondaryFireSound = {"weapons/plasma pistol/charged fire/charged fire.ogg"} -- The sound it plays when the secondary fire is used
SWEP.NPC_SecondaryFireSoundLevel = 90 -- The sound level to use for the secondary firing sound
SWEP.PrimaryEffects_DynamicLightColor = Color(255, 0, 0, 255)
SWEP.ViewModel 					= "models/weapons/c_pistol.mdl"