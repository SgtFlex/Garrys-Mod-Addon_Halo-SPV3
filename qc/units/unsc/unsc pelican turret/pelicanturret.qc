$origin 0 0 10 -90
$scale 1
$modelname	"hce/spv3/unsc/Pelican/PelicanTurret.mdl"
$body PelicanTurret "Pelican_Turret.smd"
$cdmaterials "models/hce/spv3/unsc/warthog"
$surfaceprop	combine_metal
$sequence idle "Pelican_Turret.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "Pelican_Turret.smd" {
	$automass

}
$bbox 30 30 15 -30 -30 -50
$poseparameter "aim_pitch" -90 90 loop 0

$sequence "aim_pitch_body" {
	"Pelican_turret_aim_Up.smd"
	"Pelican_turret_aim_center.smd"
	"Pelican_turret_aim_down.smd"
	autoplay
	blend "aim_pitch" -90 90
}

$attachment "muzzle" "frame barrels" 42 0 0 rotate 0 0 0
$attachment "light" "frame gun" 6 5 10 rotate 0 0 0