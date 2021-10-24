$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/unsc/Pelican/Pelican_Rocket_Pod.mdl"
$body Pelican_Rocket_Pod "Pelican_Rocket_Pod.smd"
$cdmaterials "models/hce/spv3/unsc/warthog"
$surfaceprop	combine_metal
$sequence idle "Pelican_Rocket_Pod.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "Pelican_Rocket_Pod.smd" {
	$automass

}

$attachment "muzzle" "frame rrl02" 35 0 -20 rotate 0 0 0
$attachment "light" "frame rrl02" 35 -15 -15 rotate 0 0 0