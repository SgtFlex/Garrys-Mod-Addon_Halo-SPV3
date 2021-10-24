$scale 1
$origin 0 0 0 -90
$modelname	"hce/spv3/flood/human/floodSkin_xl.mdl"
$body floodSkin_xl "floodSkin_xl.smd"
$cdmaterials "models/hce/spv3/flood/human"
$surfaceprop	zombieflesh
$sequence idle "floodSkin_xl.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "floodSkin_xl.smd" {
	$automass
}
