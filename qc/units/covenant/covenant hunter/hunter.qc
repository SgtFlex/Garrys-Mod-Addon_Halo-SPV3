// Created by Crowbar 0.68

$modelname "hce\spv3\cov\Hunter\Hunter.mdl"

$bodygroup "mybody"
{
	studio "Main_Body.smd"
}
$bodygroup "Back"
{
	studio "Main_Back.smd"
}
$bodygroup "Arm"
{
	studio "Arm_Major.smd"
	studio "Arm_Minor.smd"
}
$bodygroup "Cannons"
{
	studio "Cannon_1.smd"
	studio "Cannon_2.smd"
	studio "Cannon_3.smd"
}


$surfaceprop "metalpanel"

$jointsurfaceprop "frame bip01 spine" "flesh"
$jointsurfaceprop "frame bip01 spine1" "flesh"
$jointsurfaceprop "frame bip01 l clavicle" "metalpanel"
$jointsurfaceprop "frame bip01 l upperarm" "metalpanel"
$jointsurfaceprop "frame bip01 l forearm" "metalpanel"
$jointsurfaceprop "frame head" "flesh"
$jointsurfaceprop "frame spike top left" "metalpanel"
$jointsurfaceprop "frame spike top right" "metalpanel"
$jointsurfaceprop "frame spike bottom left" "metalpanel"
$jointsurfaceprop "frame spike bottom right" "metalpanel"
$jointsurfaceprop "frame spike middle left" "metalpanel"
$jointsurfaceprop "frame spike middle right" "metalpanel"
$jointsurfaceprop "frame bip01 r clavicle" "metalpanel"
$jointsurfaceprop "frame bip01 r upperarm" "metalpanel"
$jointsurfaceprop "frame bip01 r forearm" "metalpanel"
$jointsurfaceprop "frame gun" "metalpanel"
$jointsurfaceprop "frame ammo barrel" "metalpanel"
$jointsurfaceprop "frame barrel" "metalpanel"
$jointsurfaceprop "frame frg chargeprong00" "metalpanel"
$jointsurfaceprop "frame frg chargeprong01" "metalpanel"
$jointsurfaceprop "frame frg chargeprong02" "metalpanel"
$jointsurfaceprop "frame ammo rods" "metalpanel"

$contents "solid"

$illumposition 2.137 3.676 73.023

$cdmaterials "models\hce\spv3\cov\hunter\"
$cdmaterials "models\hce\spv3\weapon\cov\hunter_cannons\"
$cdmaterials "models\hce\spv3\weapon\cov\hunter_cannons\green\"

$texturegroup "skinfamilies"
{
	{ "hunter_base_diff"       "hunter_lights_bitmap_1"      "hunter_gel_noise"        }
	{ "hunter_base_diff_black" "hunter_lights_bitmap_2"      "hunter_gel_noise_purple" }
	{ "hunter_base_diff_blue"  "hunter_lights_bitmap_orange" "hunter_gel_noise_orange" }
}

$attachment "Cannon_1" "frame barrel" 4 0 0 rotate 0 0 0
$attachment "Light1" "frame gun" -5 -11 -7 rotate 0 0 0
$attachment "Light2" "frame gun" -5 -11 7 rotate 0 0 0
$attachment "Light3" "frame gun" 7 -15 0 rotate 0 0 0
$attachment "Light4" "frame gun" 17 -11 -11 rotate 0 0 0
$attachment "Light5" "frame gun" 17 -11 10 rotate 0 0 0
$attachment "Head_Light1" "frame head" 8.5 1.5 -4 rotate 0 0 0
$attachment "Head_Light2" "frame head" 7 3.5 -3 rotate 0 0 0
$attachment "Head_Light3" "frame head" 8.5 -2.5 -4 rotate 0 0 0
$attachment "Head_Light4" "frame head" 7 -4.5 -3 rotate 0 0 0
$attachment "Arm_Light1" "frame bip01 l forearm" 11 -1 17 rotate 0 0 0
$attachment "Arm_Light2" "frame bip01 l forearm" 17.5 -1 17 rotate 0 0 0
$attachment "Arm_Light3" "frame bip01 l forearm" 24 -1 17 rotate 0 0 0
$attachment "Arm_Light4" "frame bip01 l forearm" 30.5 -1 17 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -32.564 -57.334 -0.048 25.213 61.608 146.095

$hboxset "default"
$hbox 11 "frame bip01 pelvis" -10.69 -12.37 -10.87 3.21 17.360001 11.21
$hbox 11 "frame bip01 l thigh" -7.1 -8.73 -8.43 28.57 10.01 7.08
$hbox 11 "frame bip01 l calf" -7.97 -11.76 -7.27 20.92 9.48 6.19
$hbox 11 "frame bip01 l foot" -7.31 -13.41 -7.26 13.33 10.3 6.18
$hbox 11 "frame bip01 l toe0" -4.39 0 -7.53 12.79 19.040001 6.46
$hbox 11 "frame bip01 r thigh" -7.1 -8.73 -7.08 28.57 10.01 8.43
$hbox 11 "frame bip01 r calf" -7.97 -11.76 -6.19 20.92 9.48 7.27
$hbox 11 "frame bip01 r foot" -7.31 -13.41 -6.18 13.33 10.3 7.26
$hbox 11 "frame bip01 r toe0" -4.39 0 -6.46 12.79 19.040001 7.53
$hbox 12 "frame bip01 spine" -5.78 -11.79 -11.59 16.719999 6.26 10.91
$hbox 11 "frame bip01 spine1" -14.38 -17.82 -10.93 25.879999 -12.07 10.93
$hbox 11 "frame bip01 l upperarm" -14.76 -15.09 -5.98 30.75 14.55 12.04
$hbox 11 "frame bip01 l forearm" -22.43 -18.139999 -11.49 49.990002 16.360001 17.360001
$hbox 12 "frame head" -11.41 -7.06 -14.73 9.66 6.49 6.57
$hbox 11 "frame spike top left" -25.5 -3.17 -3.1 4.51 7.68 7.17
$hbox 11 "frame spike top right" -25.5 -7.68 -3.1 4.51 3.17 7.17
$hbox 11 "frame spike bottom left" -8.77 -3.48 -53.16 4.14 6.05 4.23
$hbox 11 "frame spike bottom right" -8.77 -6.05 -53.16 4.14 3.48 4.23
$hbox 11 "frame spike middle left" -17.360001 -6.85 -40.630001 9.01 7.04 3.94
$hbox 11 "frame spike middle right" -17.360001 -7.04 -40.630001 9.01 6.89 3.94
$hbox 11 "frame bip01 r upperarm" -14.57 -15.28 -11.73 24.549999 14.31 6.46
$hbox 11 "frame bip01 r forearm" 0 -6 -6.81 25.48 5.3 5.98
$hbox 11 "frame gun" -3.99 -12.99 -12.63 34.740002 14.08 12.62
$hbox 11 "frame ammo barrel" -20.93 -8.25 -5.9 1.25 8.02 5.91
$hbox 11 "frame barrel" -0.85 -2.28 -2.39 3.13 2.29 2.18
$hbox 11 "frame frg chargeprong00" -0.89 -1.92 -5.41 9.96 1.92 1.42
$hbox 11 "frame frg chargeprong01" -4.89 -1.92 -5.41 9.96 4.4 1.42
$hbox 11 "frame frg chargeprong02" -4.89 -3.6 -5.41 9.96 1.92 1.42
$hbox 11 "frame ammo rods" 0 -3.48 0 8.48 3.49 4.02
$skipboneinbbox

$definebone "frame bip01 pelvis" "" -0.015847 0 71.569099 -89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "frame bip01 l thigh" "frame bip01 pelvis" -0.000008 0.000015 10.965055 0.000091 -178.729563 -179.999827 0 0 0 0 0 0
$definebone "frame bip01 l calf" "frame bip01 l thigh" 32.584324 -0.000002 -0.00001 0 -8.459147 0 0 0 0 0 0 0
$definebone "frame bip01 l foot" "frame bip01 l calf" 24.059958 0 -0.000004 0.000057 9.729569 0 0 0 0 0 0 0
$definebone "frame bip01 l toe0" "frame bip01 l foot" 15.326859 10.93734 -0.000002 0 89.999982 0 0 0 0 0 0 0
$definebone "frame bip01 r thigh" "frame bip01 pelvis" 0.000015 -0.000015 -10.965065 0.000091 -178.729563 -179.999827 0 0 0 0 0 0
$definebone "frame bip01 r calf" "frame bip01 r thigh" 32.584332 -0.000002 -0.000007 0 -8.459147 0 0 0 0 0 0 0
$definebone "frame bip01 r foot" "frame bip01 r calf" 24.059963 0 -0.000001 0 9.729569 0 0 0 0 0 0 0
$definebone "frame bip01 r toe0" "frame bip01 r foot" 15.326852 10.937336 0.000009 0 89.999982 0 0 0 0 0 0 0
$definebone "frame bip01 spine" "frame bip01 pelvis" 5.815254 0.944278 0 0 -16.454317 -0.000172 0 0 0 0 0 0
$definebone "frame bip01 spine1" "frame bip01 spine" 11.148079 -0.022141 0.000009 0.000057 18.500063 -0.000344 0 0 0 0 0 0
$definebone "frame bip01 l clavicle" "frame bip01 spine1" 25.807495 0.125762 6.425947 -78.540823 179.955404 -0.000974 0 0 0 0 0 0
$definebone "frame bip01 l upperarm" "frame bip01 l clavicle" 13.602082 0.000003 0.000008 61.313529 2.270403 1.399563 0 0 0 0 0 0
$definebone "frame bip01 l forearm" "frame bip01 l upperarm" 35.358482 0.000001 0 0 -2.959041 0 0 0 0 0 0 0
$definebone "frame head" "frame bip01 spine1" 50.958221 12.775123 0.314198 -0.000057 87.954347 90.000098 0 0 0 0 0 0
$definebone "frame spike top left" "frame bip01 spine1" 25.773468 -0.806255 11.209799 -0.000057 87.954347 90.000098 0 0 0 0 0 0
$definebone "frame spike top right" "frame bip01 spine1" 25.773453 -0.806241 -11.209311 -0.000057 87.954347 90.000098 0 0 0 0 0 0
$definebone "frame spike bottom left" "frame bip01 spine1" 11.653671 -15.730043 4.711354 0 87.954409 89.999873 0 0 0 0 0 0
$definebone "frame spike bottom right" "frame bip01 spine1" 11.653656 -15.730045 -4.711699 0 87.95447 89.999982 0 0 0 0 0 0
$definebone "frame spike middle left" "frame bip01 spine1" 21.443604 -11.118971 11.211151 -0.000057 87.954347 90.000098 0 0 0 0 0 0
$definebone "frame spike middle right" "frame bip01 spine1" 21.443604 -11.118942 -11.211514 -0.000057 87.954347 90.000098 0 0 0 0 0 0
$definebone "frame bip01 r clavicle" "frame bip01 spine1" 25.80751 0.125799 -6.425958 78.540823 179.954366 0 0 0 0 0 0 0
$definebone "frame bip01 r upperarm" "frame bip01 r clavicle" 13.602082 -0.000004 0.000015 -58.256855 4.990231 -3.554744 0 0 0 0 0 0
$definebone "frame bip01 r forearm" "frame bip01 r upperarm" 23.755112 0.000009 0.000019 0.000003 -8.459206 -0.000001 0 0 0 0 0 0
$definebone "frame gun" "frame bip01 r forearm" 10.724743 -0.294635 -1.359772 -0.228436 -1.041236 90.019919 0 0 0 0 0 0
$definebone "frame ammo barrel" "frame gun" 14.738991 -10.654125 -0.061818 0 9.999941 89.999982 0 0 0 0 0 0
$definebone "frame barrel" "frame gun" 30.521935 -0.000004 -0.000001 0 -0.000005 0 0 0 0 0 0 0
$definebone "frame frg chargeprong00" "frame gun" 20.152847 -10.269825 -0.191768 0 -0.000005 89.999982 0 0 0 0 0 0
$definebone "frame frg chargeprong01" "frame gun" 20.152851 4.58559 9.272185 0 -0.000005 -24.999923 0 0 0 0 0 0
$definebone "frame frg chargeprong02" "frame gun" 20.152847 5.393635 -9.235076 0 -0.000005 -150.000011 0 0 0 0 0 0
$definebone "frame ammo rods" "frame ammo barrel" -12.163551 0.000001 -0.000004 -0.000005 -0.000001 0 0 0 0 0 0 0

$ikchain l_foot "frame bip01 l foot" Z 0 height 36
$ikchain r_foot "frame bip01 r foot" Z 0 height 36


$cmdlist lockfeet {
    ikrule l_foot footstep
    ikrule r_foot footstep
}


$sectionframes 30 119

$poseparameter "aim_pitch" -90 90 loop 0
$poseparameter "aim_yaw" -90 90 loop 0
$poseparameter "move_yaw" -180 180 loop 0





$animation "aimup_body_corrective_animation" "hunter_anims\aimup_body_corrective_animation.smd" {
	fps 30
}

$animation "aimcenter_corrective_animation" "hunter_anims\aimcenter_corrective_animation.smd" {
	fps 30
}

$animation "aimdown_body_corrective_animation" "hunter_anims\aimdown_body_corrective_animation.smd" {
	fps 30
}

$animation "aimright_body_corrective_animation" "hunter_anims\aimright_body_corrective_animation.smd" {
	fps 30
}

$animation "aimleft_body_corrective_animation" "hunter_anims\aimleft_body_corrective_animation.smd" {
	fps 30
}

$animation "aimleft_body" "hunter_anims\aimleft_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimleft_body_corrective_animation" 0
}

$animation "aimcenter" "hunter_anims\aimcenter.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimcenter_corrective_animation" 0
}

$animation "aimright_body" "hunter_anims\aimright_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimright_body_corrective_animation" 0
}

$animation "aimup_body" "hunter_anims\aimup_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimup_body_corrective_animation" 0
}

$animation "aimdown_body" "hunter_anims\aimdown_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimdown_body_corrective_animation" 0
}

$animation "cwB" "hunter_anims\cwB.smd" {
	fps 30
	loop
	walkframe 21 LX LY
	ikrule l_foot footstep range .. 21 15 ..
	ikrule r_foot footstep range .. 14 2 ..
}

$animation "cwL" "hunter_anims\cwL.smd" {
	fps 30
	loop
	walkframe 22 LX LY
	ikrule l_foot footstep range .. 11 1 ..
	ikrule r_foot footstep range .. 21 10 ..
}

$animation "cwF" "hunter_anims\cwF.smd" {
	fps 30
	loop
	walkframe 21 LX LY
	ikrule l_foot footstep range .. 11 1 ..
	ikrule r_foot footstep range .. 21 10 ..
}

$animation "cwR" "hunter_anims\cwR.smd" {
	fps 30
	loop
	walkframe 22 LX LY
	ikrule l_foot footstep range .. 21 10 ..
	ikrule r_foot footstep range .. 11 1 ..
}

$animation "rf" "hunter_anims\rf.smd" {
	fps 30
	loop
	walkframe 27 LX LY
	ikrule l_foot footstep range .. 11 17 ..
	ikrule r_foot footstep range .. 26 2 ..
}

$animation "melee1" "hunter_anims\melee1.smd" {
	fps 30
	walkframe 59 LX LY
}

$sequence "centeraim" {
	"hunter_anims\centeraim.smd"
	activity "ACT_AIM_CENTER" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "aim_pitch_body" {
	"aimup_body"
	"aimcenter"
	"aimdown_body"
	autoplay
	blend "aim_pitch" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "aim_yaw_body" {
	"aimright_body"
	"aimcenter"
	"aimleft_body"
	autoplay
	blend "aim_yaw" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "CIdle" {
	"hunter_anims\CIdle.smd"
	cmdlist lockfeet
	activity "ACT_IDLE_ANGRY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_1" {
	"hunter_anims\Idle_1.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_2" {
	"hunter_anims\Idle_2.smd"
	cmdlist lockfeet
	activity "ACT_IDLE_AGITATED" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_3" {
	"hunter_anims\Idle_3.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_4" {
	"hunter_anims\Idle_4.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_5" {
	"hunter_anims\Idle_5.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_6" {
	"hunter_anims\Idle_6.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "EvadeForward" {
	"hunter_anims\EvadeForward.smd"
	activity "ACT_SIGNAL1" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 45 LX LY
}

$sequence "CWalk" {
	"cwB"
	"cwL"
	"cwF"
	"cwR"
	"cwB"
	activity "ACT_WALK_CROUCH" 1
	blend "move_yaw" -180 180
	blendwidth 5
	{ event 1100 14 "Step" }
	{ event 1100 21 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run" {
	"rf"
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	{ event 1100 11 "Step" }
	{ event 1100 11 "Armor" }
	{ event 1100 25 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_1" {
	"melee1"
	activity "ACT_MELEE1" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee1" }
	{ event 1100 21 "Step" }
	{ event 1100 21 "Armor" }
	{ event 1100 24 "Hit" }
	{ event 1100 27 "Step" }
	{ event 1100 29 "Step" }
	{ event 1100 29 "Armor" }
	{ event 1100 39 "Step" }
	{ event 1100 46 "Hit" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_2" {
	"hunter_anims\Melee_2.smd"
	activity "ACT_MELEE1" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee1" }
	{ event 1100 21 "Step" }
	{ event 1100 21 "Armor" }
	{ event 1100 24 "Hit" }
	{ event 1100 27 "Step" }
	{ event 1100 29 "Step" }
	{ event 1100 29 "Armor" }
	{ event 1100 39 "Step" }
	{ event 1100 46 "Hit" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 69 LX LY
}

$sequence "Berserk" {
	"hunter_anims\Berserk.smd"
	cmdlist lockfeet
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 49 LX LY
}

$sequence "Brace" {
	"hunter_anims\Brace.smd"
	cmdlist lockfeet
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 44 LX LY
}

$sequence "Die_1" {
	"hunter_anims\Die_1.smd"
	activity "ACT_DIE_SIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Die_2" {
	"hunter_anims\Die_2.smd"
	activity "ACT_DIE_SIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Die_3" {
	"hunter_anims\Die_3.smd"
	activity "ACT_DIE_SIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Die_4" {
	"hunter_anims\Die_4.smd"
	activity "ACT_DIE_SIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Die_5" {
	"hunter_anims\Die_5.smd"
	activity "ACT_DIE_SIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Die_6" {
	"hunter_anims\Die_6.smd"
	activity "ACT_DIE_SIMPLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "Die_Airborne" {
	"hunter_anims\Die_Airborne.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "ragdoll" {
	"hunter_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionjoints "hunter_physics.smd"
{
	$mass 90
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01 pelvis"


	$jointconstrain "frame bip01 spine1" x limit -40 40 0
	$jointconstrain "frame bip01 spine1" y limit -20 20 0
	$jointconstrain "frame bip01 spine1" z limit -50 50 0

	$jointconstrain "frame bip01 r upperarm" x limit -30 30 0
	$jointconstrain "frame bip01 r upperarm" y limit -10 50 0
	$jointconstrain "frame bip01 r upperarm" z limit -80 80 0

	$jointconstrain "frame spike middle left" x limit -30 30 0
	$jointconstrain "frame spike middle left" y limit 0 60 0
	$jointconstrain "frame spike middle left" z limit -30 30 0

	$jointconstrain "frame spike bottom right" x limit -30 30 0
	$jointconstrain "frame spike bottom right" y limit 0 60 0
	$jointconstrain "frame spike bottom right" z limit -30 30 0

	$jointconstrain "frame spike bottom left" x limit -30 30 0
	$jointconstrain "frame spike bottom left" y limit 0 60 0
	$jointconstrain "frame spike bottom left" z limit -30 30 0

	$jointconstrain "frame spike top right" x limit -30 30 0
	$jointconstrain "frame spike top right" y limit 0 60 0
	$jointconstrain "frame spike top right" z limit -30 30 0

	$jointconstrain "frame spike top left" x limit -30 30 0
	$jointconstrain "frame spike top left" y limit 0 60 0
	$jointconstrain "frame spike top left" z limit -30 30 0

	$jointconstrain "frame head" x limit -30 30 0
	$jointconstrain "frame head" y limit -30 30 0
	$jointconstrain "frame head" z limit -30 30 0

	$jointconstrain "frame bip01 l upperarm" x limit -30 30 0
	$jointconstrain "frame bip01 l upperarm" y limit -50 10 0
	$jointconstrain "frame bip01 l upperarm" z limit -80 80 0

	$jointconstrain "frame bip01 l forearm" x limit 0 0 0
	$jointconstrain "frame bip01 l forearm" y limit 0 0 0
	$jointconstrain "frame bip01 l forearm" z limit -90 0 0

	$jointconstrain "frame spike middle right" x limit -30 30 0
	$jointconstrain "frame spike middle right" y limit 0 60 0
	$jointconstrain "frame spike middle right" z limit -30 30 0

	$jointconstrain "frame bip01 r thigh" x limit -30 30 0
	$jointconstrain "frame bip01 r thigh" y limit -40 10 0
	$jointconstrain "frame bip01 r thigh" z limit -70 70 0

	$jointconstrain "frame bip01 r calf" x limit 0 0 0
	$jointconstrain "frame bip01 r calf" y limit 0 0 0
	$jointconstrain "frame bip01 r calf" z limit -90 0 0

	$jointconstrain "frame bip01 r forearm" x limit 0 0 0
	$jointconstrain "frame bip01 r forearm" y limit 0 0 0
	$jointconstrain "frame bip01 r forearm" z limit -90 0 0

	$jointconstrain "frame bip01 l thigh" x limit -30 30 0
	$jointconstrain "frame bip01 l thigh" y limit -10 40 0
	$jointconstrain "frame bip01 l thigh" z limit -70 70 0

	$jointconstrain "frame bip01 l calf" x limit 0 0 0
	$jointconstrain "frame bip01 l calf" y limit 0 0 0
	$jointconstrain "frame bip01 l calf" z limit -90 0 0

	$jointconstrain "frame bip01 l foot" x limit -15 15 0
	$jointconstrain "frame bip01 l foot" y limit -15 15 0
	$jointconstrain "frame bip01 l foot" z limit -15 15 0

	$jointconstrain "frame bip01 r foot" x limit -15 15 0
	$jointconstrain "frame bip01 r foot" y limit -15 15 0
	$jointconstrain "frame bip01 r foot" z limit -15 15 0
}

$collisiontext
{
	animatedfriction 
	{
		"animfrictionmin"		"1.000000"
		"animfrictionmax"		"400.000000"
		"animfrictiontimein"		"0.500000"
		"animfrictiontimeout"		"0.300000"
		"animfrictiontimehold"		"0.000000"
	}
	editparams 
	{
		"rootname"		"bip01 pelvis"
		"totalmass"		"90.000000"
	}
}
