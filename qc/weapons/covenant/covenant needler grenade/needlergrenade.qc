
$scale 1
$modelname	"hce/spv3/weapons/cov/NeedlerGrenade.mdl"
$body NeedlerGrenade "NeedlerGrenade_Base.smd"
$cdmaterials "models\hce\spv3\weapon\cov\needler"
$surfaceprop	weapon
$sequence idle "NeedlerGrenade_Base.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "NeedlerGrenade_Phys.smd" {
	$automass
}
