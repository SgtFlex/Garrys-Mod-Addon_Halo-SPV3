
$scale 1
$modelname	"hce/spv3/unsc/pelican/Pelican.mdl"
$body Pelican "Pelican.smd"
$cdmaterials "models/hce/spv3/unsc/pelican"
$surfaceprop	combine_metal

$poseparameter "rotate_yaw" -90 90 loop 0
$poseparameter "rotate_pitch" -90 90 loop 0


$attachment "Latch" "frame hull" -230.00 0.00 30.00 rotate -0 0 0
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

$weightlist back_door {
	"frame bay door top" 1.0
	"frame bay door low" 1.0
}

$weightlist thrusters {
	"frame right main engine" 1.0
	"frame left main engine" 1.0
	"frame left rear engine" 1.0
	"frame right rear engine" 1.0
}


$sequence "idle" {
	"anims/Pelican_idle.smd"
	activity ACT_IDLE -1
	fadein 0.2
	fadeout 0.2
	loop
	rotate -90
}

$sequence "reference" {
	"Pelican.smd"
	fps 30
	loop
	hidden
}

$animation "rotate_left"  "anims/vehicle steering.smd" {
	fps 30
	frames 2 2
	subtract reference 0
}

$animation "rotate_none" "anims/vehicle steering.smd" {
	fps 30
	frames 3 3
	subtract reference 0

}

$animation "rotate_right"  "anims/vehicle steering.smd" {
	fps 30
	frames 4 4
	subtract reference 0
}

$animation "rotate_down"  "anims/vehicle velocity.smd" {
	fps 30
	frames 4 4
	subtract reference 0
}

$animation "rotate_up"  "anims/vehicle velocity.smd" {
	fps 30
	frames 2 2
	subtract reference 0
}

$animation "back_neutral" "anims/stand opening.smd"{
	fps 30
	frames 0 0
}

$animation "back_open"  "anims/stand opening.smd" {
	fps 30
}

$animation "back_close"  "anims/stand closing.smd" {
	fps 30
}



$sequence "rotate_yaw" {
	"rotate_left"
	"rotate_none"
	"rotate_right"
	autoplay
	blend "rotate_yaw" -90 90
	blendwidth 3
	fadein 0.2
	fadeout 0.2
	delta
	hidden
}

$sequence "rotate_pitch" {
	"rotate_down"
	"rotate_none"
	"rotate_up"
	autoplay
	blend "rotate_pitch" -90 90
	blendwidth 3
	fadein 0.2
	fadeout 0.2
	delta
	hidden
}

$sequence "open_back" {
	"back_open"
	weightlist "back_door"
	
	fadein 0.2
	fadeout 0.2
}

$sequence "close_back" {
	"back_close"
	weightlist "back_door"
	
	fadein 0.2
	fadeout 0.2
}


$collisionmodel "Phys.smd" {
	$mass 50000
	$concave
}
