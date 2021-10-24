$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/misc/Needle.mdl"
$body Needle "Needle.smd"
$cdmaterials "models/hce/spv3/weapon/cov/needler"
$surfaceprop	combine_metal
$sequence idle "Needle.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "Needle.smd" {
	$automass

}
