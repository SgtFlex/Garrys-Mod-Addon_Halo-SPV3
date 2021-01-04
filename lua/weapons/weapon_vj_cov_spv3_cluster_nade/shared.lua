include('weapons/weapon_vj_spv3_gbase/shared.lua')

SWEP.PrintName					= "[SPV3] Cluster Grenade"
SWEP.EntToThrow = "obj_vj_cov_spv3_cluster_nade"
SWEP.WorldModel					= "models/hce/spv3/weapons/cov/clustergrenade.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.Spawnable					= true
SWEP.Primary.Ammo				= "cluster_grenade" -- Ammo type
SWEP.Primary.Sound				= {"grenades/cluster nade/throw/throw.ogg"} -- npc/roller/mine/rmine_explode_shock1.ogg
SWEP.PickupSound = "grenades/cluster nade/pickup/pickup.ogg"
SWEP.DeploySound =  "grenades/cluster nade/pickup/pickup.ogg" -- Sound played when the weapon is deployed
