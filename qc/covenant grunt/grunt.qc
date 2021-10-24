// Created by Crowbar 0.68

$modelname "hce\spv3\cov\grunt\Grunt.mdl"

$bodygroup "mybody"
{
	studio "Main_Body.smd"
}
$bodygroup "Body"
{
	blank
	studio "Minor_Back.smd"
	studio "Major_Back.smd"
}
$bodygroup "Head"
{
	blank
	studio "Minor_Mask.smd"
	studio "Major_Mask.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -5.729 -2.732 32.119

$cdmaterials "models\hce\spv3\cov\grunt\"

$attachment "Cannon" "frame gun" 9.2 0 0 rotate 0 0 0
$attachment "anim_attachment_LH" "bip01 l forearm" 23.00 -4.00 -5.00 rotate -0 -0 0
$attachment "Backpack" "bip01 spine1" 10.00 -5.00 0.00 rotate -0 0 -0
$cbox 0 0 0 0 0 0

$bbox -43.18 -44.074 -6.289 48.644 32.616 70.528

$definebone "bip01 pelvis" "" 0.33532 -0.000001 19.046644 -89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "bip01 l thigh" "bip01 pelvis" -0.000004 0.000003 2.855944 -54.579997 151.227778 142.487008 0 0 0 0 0 0
$definebone "bip01 l calf" "bip01 l thigh" 10.817978 0.000002 -0.000001 0 -66.97676 -0.000055 0 0 0 0 0 0
$definebone "bip01 l foot" "bip01 l calf" 9.745928 0.000001 0 -15.872878 8.857293 61.448862 0 0 0 0 0 0
$definebone "bip01 r thigh" "bip01 pelvis" 0.000004 -0.000003 -2.855944 54.580103 151.227888 -142.486789 0 0 0 0 0 0
$definebone "bip01 r calf" "bip01 r thigh" 10.817982 0.000002 0 -0.000002 -66.97676 0.000002 0 0 0 0 0 0
$definebone "bip01 r foot" "bip01 r calf" 9.74593 0.000002 0 15.872878 8.8573 -61.448801 0 0 0 0 0 0
$definebone "bip01 spine" "bip01 pelvis" 2.035389 -1.93415 0.000008 -0.000057 -32.454392 -0.000229 0 0 0 0 0 0
$definebone "bip01 spine1" "bip01 spine" 11.227922 -0.006733 0 -0.000229 66.500006 -0.000115 0 0 0 0 0 0
$definebone "bip01 l clavicle" "bip01 spine1" 21.194386 -0.000008 3.270569 -49.295511 169.950051 13.099536 0 0 0 0 0 0
$definebone "bip01 l upperarm" "bip01 l clavicle" 13.273071 -0.000002 0.000004 -12.048271 -35.063186 0.693278 0 0 0 0 0 0
$definebone "bip01 l forearm" "bip01 l upperarm" 9.442615 0 0.000004 0.000001 2.540777 -0.000002 0 0 0 0 0 0
$definebone "bip01 neck" "bip01 spine1" 21.193577 -0.000994 0.000003 0.000115 -39.999961 -0.000057 0 0 0 0 0 0
$definebone "bip01 head" "bip01 neck" 1.622688 0.000001 0.000001 -0.000115 35.954304 -0.000057 0 0 0 0 0 0
$definebone "bip01 r clavicle" "bip01 spine1" 21.194386 0.000013 -3.270561 49.295459 169.949709 -13.099933 0 0 0 0 0 0
$definebone "bip01 r upperarm" "bip01 r clavicle" 13.273066 0.000004 0.000004 12.048272 -35.063186 -0.693275 0 0 0 0 0 0
$definebone "bip01 r forearm" "bip01 r upperarm" 9.442612 -0.000006 -0.000004 0.000003 2.540775 0.000005 0 0 0 0 0 0
$definebone "frame gun" "bip01 r forearm" 28.094044 -7.350288 1.151501 -2.563419 11.03316 122.953309 -2 0 -5 0 0 0


$sectionframes 30 159

$poseparameter "aim_pitch" -90 90 loop 0
$poseparameter "aim_yaw" -90 90 loop 0
$poseparameter "move_yaw" -180 180 loop 0

$ikchain l_foot "bip01 l foot" Z 0 height 36
$ikchain r_foot "bip01 r foot" Z 0 height 36

$cmdlist lockfeet {
    ikrule l_foot footstep
    ikrule r_foot footstep
}


$animation "aimup_body_corrective_animation" "grunt_anims\aimup_body_corrective_animation.smd" {
}

$animation "aimcenter_corrective_animation" "grunt_anims\aimcenter_corrective_animation.smd" {
}

$animation "aimdown_body_corrective_animation" "grunt_anims\aimdown_body_corrective_animation.smd" {
}

$animation "aimright_body_corrective_animation" "grunt_anims\aimright_body_corrective_animation.smd" {
}

$animation "aimleft_body_corrective_animation" "grunt_anims\aimleft_body_corrective_animation.smd" {
}

$animation "aimleft_body" "grunt_anims\aimleft_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimleft_body_corrective_animation" 0
}

$animation "aimcenter" "grunt_anims\aimcenter.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimcenter_corrective_animation" 0
}

$animation "aimright_body" "grunt_anims\aimright_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimright_body_corrective_animation" 0
}

$animation "aimup_body" "grunt_anims\aimup_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimup_body_corrective_animation" 0
}

$animation "aimdown_body" "grunt_anims\aimdown_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimdown_body_corrective_animation" 0
}

$animation "death1" "grunt_anims\death1.smd" {
	fps 30
	walkframe 39 LX LY
}

$animation "death2" "grunt_anims\death2.smd" {
	fps 30
	walkframe 39 LX LY
}

$animation "death3" "grunt_anims\death3.smd" {
	fps 30
	walkframe 40 LX LY
}

$animation "wF" "grunt_anims\wF.smd" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	walkframe 15 LX LY
}

$animation "wL" "grunt_anims\wL.smd" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	walkframe 19 LX LY
}

$animation "wR" "grunt_anims\wR.smd" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	walkframe 19 LX LY
}

$animation "wB" "grunt_anims\wB.smd" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	walkframe 19 LX LY
}

$animation "rif_wF" "grunt_anims/rifle_rF" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	rotate -90
	walkframe 15 LX LY
}

$animation "rif_wL" "grunt_anims/rifle_rL" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "rif_wR" "grunt_anims/rifle_rR" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "rif_wB" "grunt_anims/rifle_rB" {
	fps 30
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "rF" "grunt_anims\rF.smd" {
	fps 30
	ikrule l_foot footstep range .. 2 27 ..
	ikrule r_foot footstep range .. 27 7 ..
	loop
	walkframe 46 LX LY
}

$animation "EvadeL" "grunt_anims\EvadeL.smd" {
	fps 30
	walkframe 28 LX LY
}

$animation "EvadeR" "grunt_anims\EvadeR.smd" {
	fps 30
	walkframe 25 LX LY
}

$animation "death_airborne" "grunt_anims\death_airborne.smd" {
	fps 30
	loop
	rotate -90
}

$sequence "Die_Airborne" {
	"death_Airborne"
	fadein 0.2
	fadeout 0.2
}

$sequence "Crouch_pistol1" {
	"grunt_anims\pistol_crouch.smd"
	cmdlist lockfeet
	activity "ACT_RANGE_ATTACK1_LOW" 1
	rotate -90
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Crouch_pistol2" {
	"grunt_anims\pistol_crouch.smd"
	cmdlist lockfeet
	activity "ACT_COVER_LOW" 1
	rotate -90
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "centeraim" {
	"grunt_anims\centeraim.smd"
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

$sequence "Idle_1" {
	"grunt_anims\Idle_1.smd"
	cmdlist lockfeet
	activity "ACT_IDLE_AGITATED" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_Rifle" {
	"grunt_anims\rifle_idle.smd"
	cmdlist lockfeet
	activity "ACT_IDLE_RIFLE" 1
	rotate -90
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_2" {
	"grunt_anims\Idle_2.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_3" {
	"grunt_anims\Idle_3.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_4" {
	"grunt_anims\Idle_4.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_5" {
	"grunt_anims\Idle_5.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_6" {
	"grunt_anims\Idle_6.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Die_1" {
	"grunt_anims/death5"
	rotate -90
	{ event 1100 0 "Death_Front" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_2" {
	"death2"
	{ event 1100 0 "Death_Back" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_3" {
	"death3"
	{ event 1100 0 "Death_Right" }
	fadein 0.2
	fadeout 0.2
}
$sequence "Die_4" {
	"grunt_anims/death4"
	walkframe 60 LX LY
	rotate -90
}

$sequence "Die_5" {
	"death1"
	walkframe 60 LX LY
}

$sequence "Run_rifle" {
	"rif_wB"
	"rif_wR"
	"rif_wF"
	"rif_wL"
	"rif_wB"
	activity "ACT_RUN_RIFLE" 1
	
	walkframe 60 LX LY
	loop
	blend "move_yaw" -180 180
	blendwidth 5
	{ event 1100 9 "Step" }
	{ event 1100 15 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run" {
	"wB"
	"wR"
	"wF"
	"wL"
	"wB"
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	blendwidth 5
	{ event 1100 9 "Step" }
	{ event 1100 15 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Walk" {
	"rF"
	activity "ACT_WALK" 1
	blend "move_yaw" -180 180
	{ event 1100 2 "Step" }
	{ event 1100 25 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "EvadeLeft" {
	"EvadeL"
	activity "ACT_SIGNAL1" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "EvadeL" }
	fadein 0.2
	fadeout 0.2
}

$sequence "EvadeRight" {
	"EvadeR"
	activity "ACT_SIGNAL2" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "EvadeR" }
	fadein 0.2
	fadeout 0.2
}

$sequence "ragdoll" {
	"grunt_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionjoints "grunt_physics.smd"
{
	$mass 90
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01 pelvis"


	$jointconstrain "bip01 l thigh" x limit -30 30 0
	$jointconstrain "bip01 l thigh" y limit -50 50 0
	$jointconstrain "bip01 l thigh" z limit -50 50 0

	$jointconstrain "bip01 r thigh" x limit -30 30 0
	$jointconstrain "bip01 r thigh" y limit -50 50 0
	$jointconstrain "bip01 r thigh" z limit -50 50 0

	$jointconstrain "bip01 r calf" x limit 0 30 0
	$jointconstrain "bip01 r calf" y limit 0 0 0
	$jointconstrain "bip01 r calf" z limit -35 35 0

	$jointconstrain "bip01 spine1" x limit -40 40 0
	$jointconstrain "bip01 spine1" y limit -30 30 0
	$jointconstrain "bip01 spine1" z limit -30 30 0

	$jointconstrain "bip01 l upperarm" x limit -20 20 0
	$jointconstrain "bip01 l upperarm" y limit -40 40 0
	$jointconstrain "bip01 l upperarm" z limit -60 60 0

	$jointconstrain "bip01 l forearm" x limit 0 0 0
	$jointconstrain "bip01 l forearm" y limit 0 0 0
	$jointconstrain "bip01 l forearm" z limit -70 30 0

	$jointconstrain "bip01 r upperarm" x limit -20 20 0
	$jointconstrain "bip01 r upperarm" y limit -40 40 0
	$jointconstrain "bip01 r upperarm" z limit -60 60 0

	$jointconstrain "bip01 r forearm" x limit 0 0 0
	$jointconstrain "bip01 r forearm" y limit 0 0 0
	$jointconstrain "bip01 r forearm" z limit -70 30 0

	$jointconstrain "bip01 head" x limit -40 40 0
	$jointconstrain "bip01 head" y limit -20 20 0
	$jointconstrain "bip01 head" z limit -25 25 0

	$jointconstrain "bip01 l calf" x limit -30 0 0
	$jointconstrain "bip01 l calf" y limit 0 0 0
	$jointconstrain "bip01 l calf" z limit -35 35 0
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



//new

$animation grunt_T "grunt_anims/Grunt_Stuck.SMD" {
	fps 30
	walkframe 120 LX LY
	rotateto 90
}
$sequence "Transform" {
	"grunt_T"
	activity "ACT_COVER_PISTOL_LOW" 1
	fadein 0.2
	fadeout 0.2
}

$animation grunt_rs "grunt_anims/Grunt_Flee_Forward.SMD" {
	fps 30
	walkframe 120 LX LY
	rotateto 0
}
$sequence "run_scared" {
	"grunt_rs"
	ikrule l_foot footstep range .. 15 4 ..
	ikrule r_foot footstep range .. 7 12 ..
	activity "ACT_RUN_SCARED" 1
	fadein 0.2
	fadeout 0.2
	loop
}

$animation "EvadeF" "grunt_anims/Grunt_Evade_Front.SMD" {
	fps 30
	walkframe 28 LX LY
	rotateto 0
}
$sequence "EvadeForward" {
	"EvadeF"
	activity "ACT_SIGNAL3" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "EvadeF" }
	fadein 0.2
	fadeout 0.2
}

$animation "pis_throw" "grunt_anims/Grunt_Throw.SMD" {
	fps 30
	rotateto 0
}

$sequence "Throw" "pis_throw" fps 30 walkframe 60 LX LY

$animation "pis_warn" "grunt_anims/Grunt_Warn.SMD" {
	fps 30
	rotateto -90
}
$sequence "Warn" {
	"pis_warn" 
	fps 30 
	cmdlist lockfeet
	walkframe 60 LX LY 
	activity "ACT_SIGNAL_FORWARD" 1
}

$animation "h_head" "grunt_anims/Grunt_Hurt_Head.SMD" {
	fps 30
	rotateto 0
}

$animation "pis_reload" "grunt_anims/Grunt_Reload.SMD" {
	fps 30
	walkframe 60 LX LY 
	rotate -90 //Won't rotate?
}

$sequence "Reload" {
	"pis_reload"
	cmdlist lockfeet
	fadein 0.2
	fadeout 0.2	
	activity "ACT_RELOAD" 1
}
$sequence "Hit_head" {
	"grunt_anims/h_f_head"
	walkframe 60 LX LY
	rotate -90
	fadein 0.2
	fadeout 0.2	
	{ event 1100 0 "Pain" }
}

$sequence "h_f_gut" {
	"grunt_anims/h_f_gut"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "h_b_gut" {
	"grunt_anims/h_b_gut"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "h_f_l_arm" {
	"grunt_anims/h_f_l_arm"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "h_f_r_arm" {
	"grunt_anims/h_f_r_arm"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "h_f_l_hand" {
	"grunt_anims/h_f_l_hand"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "h_f_r_hand" {
	"grunt_anims/h_f_r_hand"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}
$sequence "h_f_l_foot" {
	"grunt_anims/h_f_l_foot"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}
$sequence "h_f_r_foot" {
	"grunt_anims/h_f_r_foot"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}


// .qc block generated by HLMV begins.

$surfaceprop "flesh"


$hboxset "default"

$hbox 500 "bip01 pelvis"	    -0.61   -2.85   -6.73     2.89    4.58    6.85
$hbox 501 "bip01 l thigh"	    -2.38   -6.45   -6.41    12.17    3.55    5.18
$hbox 501 "bip01 l foot"	    -3.71  -10.17   -6.47     5.39    6.24    6.47
$hbox 502 "bip01 r thigh"	    -0.71   -5.74   -4.41    12.07    3.50    6.36
$hbox 502 "bip01 r foot"	    -3.71  -10.17   -6.59     5.39    6.24    6.34
$hbox 500 "bip01 spine"	    -6.59   -6.14   -7.45    11.41    8.86    7.55
$hbox 500 "bip01 spine1"	    -4.50   -7.00   -9.94    20.50   13.00   10.06
$hbox 503 "bip01 l upperarm"	    -2.00   -5.43   -5.18    18.00    3.68    3.42
$hbox 504 "bip01 l forearm"	     7.00   -6.61   -8.42    27.00    4.64    2.77
$hbox 505 "bip01 neck"	    -4.18   -3.34   -3.76     1.84    3.40    3.88
$hbox 505 "bip01 head"	    -1.96   -7.88   -6.79    10.39   12.72    6.86
$hbox 506 "bip01 r upperarm"	    -2.00   -5.50   -3.36    18.00    3.61    5.24
$hbox 507 "bip01 r forearm"	     7.00   -7.35   -2.71    27.00    4.57    8.48
$hbox 508 "bip01 spine1"	    -4.50  -25.00  -10.00    20.50   -5.00   10.00

// .qc block generated by HLMV ends.

