
$scale 1
$modelname	"hce/spv3/weapons/cov/ClusterGrenade.mdl"
$body ClusterGrenade "ClusterGrenade_Base.smd"
$cdmaterials "models/hce/spv3/weapon/cov/cluster_grenade"
$surfaceprop	weapon
$sequence idle "ClusterGrenade_Base.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "ClusterGrenade_Phys.smd" {
	$automass

}
