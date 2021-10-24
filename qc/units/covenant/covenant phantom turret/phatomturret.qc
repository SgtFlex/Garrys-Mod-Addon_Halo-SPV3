$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/cov/Phantom/PhantomTurret.mdl"
$body PhantomTurret "Turret.smd"
$cdmaterials "models/hce/spv3/cov/Phantom"
$surfaceprop	combine_metal
$sequence idle "Turret.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "Turret.smd" {
	$automass

}

$poseparameter "aim_pitch" -90 90 loop 0

$sequence "aim_pitch_body" {
	"turret_aim_center.smd"
	"turret_aim_center.smd"
	"turret_aim_down.smd"
	autoplay
	blend "aim_pitch" -90 90
}

$attachment "muzzle" "frame gun" 60 0 0 rotate 0 0 0