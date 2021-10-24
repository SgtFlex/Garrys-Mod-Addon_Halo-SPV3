
$scale 1
$modelname	"hce/spv3/unsc/pelican/Pelican.mdl"
$body Pelican "Pelican.smd"
$cdmaterials "models/hce/spv3/unsc/pelican"
$surfaceprop	combine_metal
$sequence "idle" {
	"Pelican_idle.smd"
	activity ACT_IDLE -1
	fadein 0.2
	fadeout 0.2
	loop
	rotate -90
}
$sequence "Spawn_1" {
	"Pelican_Arrive1.SMD"
	fps 15
	{ event 1100 130 "Engine_hovering" }
	rotate -90
}

$sequence "Leave_1" {
	"Pelican_Leave1.SMD"
	fps 10
	{ event 1100 0 "Engine_moving" }
	rotate -90
}
$collisionmodel "Pelican.smd" {
	$automass
}

$attachment "Spawn" "frame hull" -35 0 -50 rotate 0 0 0
$attachment "Turret_Back" "frame hull" 100 0 -8 rotate 0 0 0
$attachment "Turret_Main" "frame hull" 410 0 -120 rotate 0 0 0
$attachment "Rocket_Right" "frame right main engine" -50 -200 45 rotate 0 0 0
$attachment "Rocket_Left" "frame left main engine" -50 200 45 rotate 0 0 0

$attachment "Thruster_L_F_1" "frame left main engine" -10 60 -60 rotate 0 0 0
$attachment "Thruster_R_F_1" "frame right main engine" -10 -60 -60 rotate 0 0 0
$attachment "Thruster_L_F_2" "frame left main engine" -170 60 40 rotate 0 0 0
$attachment "Thruster_R_F_2" "frame right main engine" -170 -60 40 rotate 0 0 0

$attachment "Thruster_L_B_1" "frame left rear engine" -10 50 -50 rotate 0 0 0
$attachment "Thruster_R_B_1" "frame right rear engine" -10 -50 -50 rotate 0 0 0

$attachment "Thruster_L_B_2" "frame left rear engine" -180 35 20 rotate 0 0 0
$attachment "Thruster_R_B_2" "frame right rear engine" -180 -35 20 rotate 0 0 0

$attachment "Window_L" "frame hull" 446 45 -45 rotate 0 0 0
$attachment "Window_R" "frame hull" 446 -45 -45 rotate 0 0 0

$attachment "Engine_L" "frame left main engine" -1 95 -26 rotate 0 0 0
$attachment "Engine_R" "frame right main engine" -1 -95 -26 rotate 0 0 0

$attachment "Tail_L" "frame hull" -442 33 140 rotate 0 0 0
$attachment "Tail_R" "frame hull" -442 -33 140 rotate 0 0 0