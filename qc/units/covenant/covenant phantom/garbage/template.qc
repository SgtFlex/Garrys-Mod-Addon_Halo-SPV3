$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/cov/Phantom/garbage/back.mdl"
$body back "back.smd"
$cdmaterials "models/hce/spv3/cov/Phantom"
$surfaceprop	combine_metal
$sequence idle "back.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "back.smd" {
	$automass
}