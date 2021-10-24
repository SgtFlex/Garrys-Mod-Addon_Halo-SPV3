
$scale 1
$modelname	"hce/spv3/weapons/cov/PlasmaGrenade.mdl"
$body PlasmaGrenade "PlasmaGrenade_Base.smd"
$cdmaterials "models/hce/spv3/weapon/cov/plasma_grenade"
$surfaceprop	weapon
$sequence idle "PlasmaGrenade_Base.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "PlasmaGrenade_Phys.smd" {
	$automass

}
