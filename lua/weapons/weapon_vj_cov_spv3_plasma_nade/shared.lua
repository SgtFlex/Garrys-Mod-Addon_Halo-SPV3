include('weapons/weapon_vj_spv3_gbase/shared.lua')

SWEP.PrintName					= "[SPV3] Plasma Grenade"
SWEP.EntToThrow = "obj_vj_cov_spv3_plasma_nade"
SWEP.WorldModel					= "models/hce/spv3/weapons/cov/plasmagrenade.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.Spawnable					= true
SWEP.Primary.Ammo				= "plasma_grenade" -- Ammo type
SWEP.Primary.Sound				= {"grenades/plasma nade/throw/throw_plasma.ogg"} -- npc/roller/mine/rmine_explode_shock1.ogg
SWEP.PickupSound = {"grenades/plasma nade/pickup/pickup (1).ogg","grenades/plasma nade/pickup/pickup (2).ogg","grenades/plasma nade/pickup/pickup (3).ogg",}
SWEP.DeploySound = SWEP.PickupSound