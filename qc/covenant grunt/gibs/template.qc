$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/cov/grunt/garbage/major_mask.mdl"
$body major_mask "major_mask.smd"
$cdmaterials "models/hce/spv3/cov/grunt"
$surfaceprop	combine_metal
$sequence idle "major_mask.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "major_mask.smd" {
	$automass
}