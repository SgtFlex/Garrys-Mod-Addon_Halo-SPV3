if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.PrintName					= "SMG"
SWEP.WorldModel					= "models/hce/spv3/weapons/cov/energysword/energysword.mdl"
SWEP.HoldType = "melee"
SWEP.Primary.Damage = 300 -- Damage
SWEP.IsMeleeWeapon = true -- Should this weapon be a melee weapon?

SWEP.NPC_NextPrimaryFire = 0.5 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire = 0.5 -- How much time until the bullet/projectile is fired?
SWEP.MeleeWeaponDistance = 150 -- If it's this close, it will attack