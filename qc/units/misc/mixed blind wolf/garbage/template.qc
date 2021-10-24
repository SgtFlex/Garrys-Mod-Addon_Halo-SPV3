
$scale 1
$modelname	"hce/spv3/flood/wolf/FloodWolf_weapon.mdl"
$body FloodWolf_weapon "FloodWolf_weapon.smd"
$cdmaterials "models/hce/spv3/flood/wolf"
$cdmaterials "models/hce/spv3/flood/biomass"
$surfaceprop	zombieflesh
$sequence idle "FloodWolf_weapon.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "FloodWolf_weapon.smd" {
	$automass

}
