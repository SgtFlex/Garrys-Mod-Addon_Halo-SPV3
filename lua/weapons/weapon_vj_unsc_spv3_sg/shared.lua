SWEP.Base = "weapon_vj_spv3_base"
SWEP.PrintName					= "SPV3 Shotgun"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Halo CE SPV3"
SWEP.Spawnable = true

	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
SWEP.Slot = 3 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
end

SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/shotgun.mdl"
SWEP.Primary.Sound				= {"weapons/shotgun/fire/shotgun6050_1.ogg","weapons/shotgun/fire/shotgun6050_2.ogg", "weapons/shotgun/fire/shotgun6050_3.ogg", "weapons/shotgun/fire/shotgun6050_4.ogg", "weapons/shotgun/fire/shotgun6050_5.ogg", }
SWEP.HasReloadSound 					= true
SWEP.ReloadSound = {"weapons/shotgun/reload/sg_reload_exit1.ogg", "weapons/shotgun/reload/sg_reload_exit2.ogg", "weapons/shotgun/reload/sg_reload_exit3.ogg"}
SWEP.NPC_ReloadSound 			= SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.Tracer = 0 -- Show tracer for every x bullets
SWEP.Primary.Delay				= 1 -- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Cone 				= 15

SWEP.Primary.Damage				= 10
SWEP.Primary.NumberOfShots		= 10	 -- How many shots per attack?
SWEP.Primary.ClipSize			= 10 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.3 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 0
SWEP.NPC_CustomSpread 			= 3 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.3 -- How much time until the bullet/projectile is fired?
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.ViewModel 					= "models/weapons/c_shotgun.mdl"