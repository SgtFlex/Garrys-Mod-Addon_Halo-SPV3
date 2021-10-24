// Created by Crowbar 0.68

$modelname "hce\spv3\flood\infector\InfectionForm.mdl"

$bodygroup "mybody"
{
	studio "Main_Body.smd"
}
$lod 25 {
	bonetreecollapse "frame antenna-large-base"
	bonetreecollapse "frame antenna-medium-base"
	bonetreecollapse "frame antenna-small-base"
	bonetreecollapse "frame body-sac"
}
$lod 50 {
	bonetreecollapse "frame antenna-large-base"
	bonetreecollapse "frame antenna-medium-base"
	bonetreecollapse "frame antenna-small-base"
	bonetreecollapse "frame body-sac"
	replacebone "frame antenna-large-base" "frame body-base"
	replacebone "frame antenna-medium-base" "frame body-base"
	replacebone "frame antenna-small-base" "frame body-base"
	replacebone "frame body-sac" "frame body-base"
}
$lod 75 {
	bonetreecollapse "frame body-base"
}
$surfaceprop "alienflesh"

$contents "solid"

$illumposition 0.253 -5.884 14.946

$cdmaterials "models\hce\spv3\flood\infector\"

$cbox 0 0 0 0 0 0

$bbox -12.985 -14.487 -2.149 24.753 14.993 32.042

$definebone "frame body-base" "" 2.875 -0.000001 7.67035 0 0 0 0 0 0 0 0 0
$definebone "frame antenna-large-base" "frame body-base" 3.826636 1.873649 8.69131 0 19.999952 0 0 0 0 0 0 0
$definebone "frame antenna-large-middle" "frame antenna-large-base" 3.702804 0 3.034241 -39.69165 8.45978 -5.426197 0 0 0 0 0 0
$definebone "frame antenna-large-top" "frame antenna-large-middle" 6.084248 -0.191861 1.235435 -4.976945 -5.520793 0.480484 0 0 0 0 0 0
$definebone "frame antenna-medium-base" "frame body-base" 4.44881 -1.295222 7.224702 -8.418297 -27.825407 4.418421 0 0 0 0 0 0
$definebone "frame antenna-medium-top" "frame antenna-medium-base" 4.707413 -0.013198 0.360338 -7.489704 3.025849 -0.394768 0 0 0 0 0 0
$definebone "frame antenna-small-base" "frame body-base" 4.71768 0.638036 6.2396 -13.008148 22.095715 -5.221193 0 0 0 0 0 0
$definebone "frame body-sac" "frame body-base" -0.411423 0 8.228468 -21.00005 0 0 0 0 0 0 0 0
$definebone "frame body-tail" "frame body-sac" -3.083138 0 6.927702 -49.999963 0 0 0 0 0 0 0 0
$definebone "frame body-tail tip" "frame body-tail" -3.206095 0.000001 5.852098 -30.000018 0 0 0 0 0 0 0 0
$definebone "frame tentacles-b" "frame body-base" -6.247409 0.000001 -9.961311 0 0 0 0 0 0 0 0 0
$definebone "frame tentacles-f" "frame body-base" 5.118155 0 -9.961311 0 0 0 0 0 0 0 0 0


$poseparameter "move_yaw" -180 180 loop 0

$animation "rf" "infectionform_anims\rf.smd" {
	fps 30
	loop
	walkframe 26 LX LY
}

$animation "melee1" "infectionform_anims\flying.smd" {
	fps 30
	loop
	walkframe 39 LX LY
	rotate -90
}

$animation "melee2" "infectionform_anims\flying2.smd" {
	fps 30
	loop
	walkframe 39 LX LY
	rotate -90
}

$animation "melee3" "infectionform_anims\flying3.smd" {
	fps 30
	loop
	walkframe 39 LX LY
	rotate -90
}

$sequence "Idle_1" {
	"infectionform_anims\Idle_1.smd"
	{ event 1100 0 "StopMoving" }
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Run" {
	"rf"
	{ event 1100 0 "Moving" }
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}

$sequence "Climb_up" {
	"infectionform_anims\rf.smd"
	{ event 1100 0 "Moving" }
	loop
	walkframe 26 LX LY LZ
	angles -90 0 0
	activity "ACT_CLIMB_UP" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}

$sequence "Climb_down" {
	"infectionform_anims\rf.smd"
	{ event 1100 0 "Moving" }
	loop
	walkframe 26 LX LY LZ
	angles 90 0 180
	activity "ACT_CLIMB_DOWN" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}


$sequence "Melee_1" {
	"melee1"
	{ event 1100 0 "StopMoving" }
	activity "ACT_JUMP" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_2" {
	"melee2"
	{ event 1100 0 "StopMoving" }
	activity "ACT_JUMP" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_3" {
	"melee3"
	{ event 1100 0 "StopMoving" }
	activity "ACT_JUMP" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}

