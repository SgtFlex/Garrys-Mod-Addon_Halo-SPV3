
$scale 1
$modelname	"hce/spv3/weapons/cov/GravityGrenade.mdl"
$body GravityGrenade "GravityGrenade_Base.smd"
$cdmaterials "models/hce/spv3/weapon/cov/gravity_grenade"
$surfaceprop	weapon
$sequence idle "GravityGrenade_Base.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "GravityGrenade_Phys.smd" {
	$automass
}
