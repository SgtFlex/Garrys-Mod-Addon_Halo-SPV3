// Created by Crowbar 0.68

$modelname "hce\spv3\cov\elite\Elite2.mdl"

$bodygroup "mybody"
{
	studio "Main_Body.smd"
}
$bodygroup "Body"
{
	blank
	studio "Assault_Torso.smd"
	studio "Heretic_Torso.smd"
	studio "HonorGuard_Torso.smd"
}
$bodygroup "Arms"
{
	studio "Major_Arms.smd"
	studio "Minor_Arms.smd"
	studio "Ultra_Arms.smd"
}
$bodygroup "Armplates"
{
	studio "Assault_Armplate.smd"
	studio "Heretic_Armplate.smd"
	studio "Minor_Armplate.smd"
	studio "Unarmed_Armplate.smd"
}
$bodygroup "Head"
{
	studio "Assault_Head.smd"
	studio "Heretic_Head.smd"
	studio "Minor_Head.smd"
	studio "Unarmed_Head.smd"
	studio "New_Helm_1.smd"
	studio "New_Helm_2.smd"
	studio "New_Helm_3.smd"
	studio "New_Helm_4.smd"
}
$texturegroup "skinfamilies"
{
	{"elite_main_diff" "elite_extra_diff"}
	{"elite_main_diff_blue" "elite_extra_diff_blue"}
	{"elite_main_diff_red" "elite_extra_diff_red"}
	{"elite_main_diff_gold" "elite_extra_diff_gold"}
}

$weightlist "jaw" {
	"frame mandible lower left" 1
	"frame mandible lower right" 1
	"frame mandible upper left" 1
	"frame mandible upper right" 1
}

$weightlist "upperbody" {
	"bip01 spine1" 1
}

$surfaceprop "flesh"

$contents "solid"

$illumposition -1.788 -5.007 52.072

$cdmaterials "models\hce\spv3\cov\elite\"

$attachment "Cannon" "frame gun" 9.2 0 0 rotate 0 0 0
$attachment "anim_attachment_LH" "bip01 l hand" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -18 -18 -0 18 18 85

$definebone "bip01 pelvis" "" 1.680644 0.000003 50.602871 -89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "bip01 l thigh" "bip01 pelvis" -0.000004 0.000006 4.582232 -4.499819 147.836043 -179.999937 0 0 0 0 0 0
$definebone "bip01 l calf" "bip01 l thigh" 22.691002 0 0.000001 0 -87.646729 0 0 0 0 0 0 0
$definebone "bip01 l horselink" "bip01 l calf" 9.769848 0 -0.000002 0 40.941838 0 0 0 0 0 0 0
$definebone "bip01 l foot" "bip01 l horselink" 13.116437 0.000003 0.000003 -3.808279 14.461167 2.399032 0 0 0 0 0 0
$definebone "bip01 r thigh" "bip01 pelvis" 0.000004 -0.000006 -4.582244 4.500051 147.836043 179.999937 0 0 0 0 0 0
$definebone "bip01 r calf" "bip01 r thigh" 22.690994 -0.000004 0 0 -87.646784 0 0 0 0 0 0 0
$definebone "bip01 r horselink" "bip01 r calf" 9.769846 -0.000006 0 0 40.941844 0.000001 0 0 0 0 0 0
$definebone "bip01 r foot" "bip01 r horselink" 13.116445 0.000003 0.000002 3.808278 14.461223 -2.399088 0 0 0 0 0 0
$definebone "bip01 spine" "bip01 pelvis" 4.375942 1.140536 0.000001 -0.000115 5.045581 -0.000229 0 0 0 0 0 0
$definebone "bip01 spine1" "bip01 spine" 5.308685 -0.011847 0 0 0 0 0 0 0 0 0 0
$definebone "bip01 l clavicle" "bip01 spine1" 13.5439 0.117731 2.943413 -63.106085 -170.112377 -11.109362 0 0 0 0 0 0
$definebone "bip01 l upperarm" "bip01 l clavicle" 11.678596 0 -0.000023 50.757304 13.433109 8.062837 0 0 0 0 0 0
$definebone "bip01 l forearm" "bip01 l upperarm" 14.947926 0 0.000002 -0.000004 -20.526329 0.000001 0 0 0 0 0 0
$definebone "bip01 neck" "bip01 spine1" 14.880653 -0.003672 0 -0.000115 41.718894 0 0 0 0 0 0 0
$definebone "bip01 neck1" "bip01 neck" 6.179462 -0.003208 -0.000001 -0.000115 46.718863 0 0 0 0 0 0 0
$definebone "bip01 head" "bip01 neck1" 5.852535 -0.000008 -0.000001 0.000057 -38.483403 0 0 0 0 0 0 0
$definebone "frame mandible lower left" "bip01 head" -0.332817 5.927551 2.394671 1.561539 69.206639 85.849993 0 0 0 0 0 0
$definebone "frame mandible lower right" "bip01 head" -0.331375 5.930229 -2.447462 -1.561597 69.206543 94.150258 0 0 0 0 0 0
$definebone "frame mandible upper left" "bip01 head" 0.394344 7.177811 2.507764 -1.828938 62.677292 81.236139 0 0 0 0 0 0
$definebone "frame mandible upper right" "bip01 head" 0.392963 7.175316 -2.559426 1.828824 62.67734 98.764057 0 0 0 0 0 0
$definebone "bip01 r clavicle" "bip01 spine1" 13.543892 0.117748 -2.943414 63.106146 -170.11306 11.108737 0 0 0 0 0 0
$definebone "bip01 r upperarm" "bip01 r clavicle" 11.678598 0 0 -50.757359 13.432996 -8.062776 0 0 0 0 0 0
$definebone "bip01 r forearm" "bip01 r upperarm" 14.947937 -0.000005 0.000004 -0.000062 -20.526387 0.000003 0 0 0 0 0 0
$definebone "bip01 l hand" "bip01 l forearm" 16.39991 0.000001 0 12.761601 7.305841 -83.923935 0 0 0 0 0 0
$definebone "bip01 r hand" "bip01 r forearm" 16.399918 -0.00001 0.000006 -12.761606 7.305842 83.923818 0 0 0 0 0 0
$definebone "frame gun" "bip01 r hand" 8.311674 1.411407 -0.554154 0.172439 0.209858 -0.211957 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "frame gun" 0 0 0 0 0 0 0 0 0 0 0 0

$ikchain l_foot "bip01 l foot" Z 0 height 36
$ikchain r_foot "bip01 r foot" Z 0 height 36

$cmdlist lockfeet {
    ikrule l_foot footstep
    ikrule r_foot footstep
}
$cmdlist rif_f_ik {
	ikrule l_foot footstep range .. 10 16 ..
	ikrule r_foot footstep range .. 20 3 ..
}
$cmdlist rif_b_ik {
	ikrule l_foot footstep range .. 24 9 ..
	ikrule r_foot footstep range .. 13 1 ..
}
$cmdlist rif_l_ik {
	ikrule l_foot footstep range .. 8 18 ..
	ikrule r_foot footstep range .. 23 6 ..
}
$cmdlist rif_r_ik {
	ikrule l_foot footstep range .. 8 16 ..
	ikrule r_foot footstep range .. 20 5 ..
}
$cmdlist wF_ik {
	ikrule l_foot footstep range .. 13 20 ..
	ikrule r_foot footstep range .. 1 7 ..
}
$cmdlist wB_ik {
	ikrule l_foot footstep range .. 1 9 ..
	ikrule r_foot footstep range .. 13 20 ..
}
$cmdlist wL_ik {
	ikrule l_foot footstep range .. 10 20 ..
	ikrule r_foot footstep range .. 22 5 ..
}
$cmdlist wR_ik {
	ikrule l_foot footstep range .. 8 15 ..
	ikrule r_foot footstep range .. 20 4 ..
}

$poseparameter "aim_pitch" -90 90 loop 0
$poseparameter "aim_yaw" -90 90 loop 0
$poseparameter "move_yaw" -180 180 loop 0
$poseparameter "move_mouth" 0 100 loop 0

$animation "aimup_body_corrective_animation" "elite_anims\aimup_body_corrective_animation.smd" {
}

$animation "aimcenter_corrective_animation" "elite_anims\aimcenter_corrective_animation.smd" {
}

$animation "aimdown_body_corrective_animation" "elite_anims\aimdown_body_corrective_animation.smd" {
}

$animation "aimright_body_corrective_animation" "elite_anims\aimright_body_corrective_animation.smd" {
}

$animation "aimleft_body_corrective_animation" "elite_anims\aimleft_body_corrective_animation.smd" {
}

$animation "aimleft_body" "elite_anims\aimleft_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimleft_body_corrective_animation" 0
}

$animation "aimcenter" "elite_anims\aimcenter.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimcenter_corrective_animation" 0
}

$animation "aimright_body" "elite_anims\aimright_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimright_body_corrective_animation" 0
}

$animation "aimup_body" "elite_anims\aimup_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimup_body_corrective_animation" 0
}

$animation "aimdown_body" "elite_anims\aimdown_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimdown_body_corrective_animation" 0
}

$animation "death1" "elite_anims\death1.smd" {
	fps 30
	walkframe 65 LX LY
}

$animation "death2" "elite_anims\death2.smd" {
	fps 30
	walkframe 36 LX LY
}

$animation "death3" "elite_anims\death3.smd" {
	fps 30
	walkframe 41 LX LY
}

$animation "wF" "elite_anims\wF.smd" {
	fps 30
	cmdlist wF_ik
	loop
	walkframe 25 LX LY
}

$animation "wL" "elite_anims\wL.smd" {
	fps 30
	cmdlist wL_ik
	loop
	walkframe 25 LX LY
}

$animation "wR" "elite_anims\wR.smd" {
	cmdlist wR_ik
	loop
	fps 30
	walkframe 25 LX LY
}

$animation "wB" "elite_anims\wB.smd" {
	cmdlist wB_ik
	loop
	fps 30
	loop
	walkframe 25 LX LY
}

$animation "rF" "elite_anims\rF.smd" {
	fps 30
	loop
	walkframe 34 LX LY
}

$animation "melee1" "elite_anims\melee1.smd" {
	fps 30
	walkframe 40 LX LY
}

$animation "sword_melee1" "elite_anims\sword_melee1.smd" {
	fps 30
	walkframe 40 LX LY
	rotate -90
}

$animation "sword_melee2" "elite_anims\sword_melee2.smd" {
	fps 30
	walkframe 40 LX LY
	rotate -90
}

$animation "reld" "elite_anims\reld.smd" {
	fps 30
	walkframe 49 LX LY
}

$animation "EvadeL" "elite_anims\EvadeL.smd" {
	fps 30
	walkframe 30 LX LY
}

$animation "EvadeR" "elite_anims\EvadeR.smd" {
	fps 30
	walkframe 30 LX LY
}

$animation "death_airborne" "elite_anims/Die_Airborne.SMD" {
	fps 30
	loop
	rotate -90
}

$animation "pis_air" "elite_anims/p_jump.SMD" {
	fps 30
	loop
	walkframe 60 LX LY
	rotate -90
}

$sequence "Talk" {
	"elite_anims/mouth_closed.smd"
	"elite_anims/mouth_open.smd"
	blend "move_mouth" 0 100
	autoplay
	fadein 0.2
	fadeout 0.2
	loop
	weightlist "jaw"
	hidden
}

$sequence "pistol_Airborne" {
	"pis_air"
	activity "ACT_JUMP" 1
	blend "move_yaw" -180 180
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_Airborne" {
	"death_Airborne"
	fadein 0.2
	fadeout 0.2
}

//agitated
$sequence "Idle_1" {
	"elite_anims\Idle_1.smd"
	cmdlist lockfeet
	activity "ACT_IDLE_AGITATED" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
//relaxed
$sequence "Idle_2" {
	"elite_anims\Idle_2.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "centeraim" {
	"elite_anims\centeraim.smd"
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

$sequence "ragdoll" {
	"elite_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Die_1" {
	"death1"
	cmdlist lockfeet
	{ event 1100 0 "Death_Front" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_2" {
	"death2"
	cmdlist lockfeet
	{ event 1100 0 "Death_Back" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_3" {
	"death3"
	cmdlist lockfeet
	{ event 1100 0 "Death_Right" }
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
	{ event 1100 22 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Walk" {
	"rF"
	activity "ACT_WALK" 1
	blend "move_yaw" -180 180
	{ event 1100 6 "Step" }
	{ event 1100 22 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_1" {
	"melee1"
	activity "ACT_MELEE_ATTACK1" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee1" }
	{ event 1100 19 "Hit" }
	{ event 1100 25 "Step" }
	{ event 1100 31 "Step" }
	{ event 1100 40 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Sword_melee01" {
	"sword_melee1"
	activity "ACT_MELEE_ATTACK2" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee1" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Sword_melee02" {
	"sword_melee2"
	activity "ACT_MELEE_ATTACK2" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee1" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Reload" {
	"reld"
	cmdlist lockfeet
	activity "ACT_ARM" 1
	blend "move_yaw" -180 180
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

$collisionjoints "elite_physics.smd"
{
	$mass 90
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01 pelvis"


	$jointconstrain "bip01 l thigh" x limit -30 30 0
	$jointconstrain "bip01 l thigh" y limit -20 60 0
	$jointconstrain "bip01 l thigh" z limit -60 60 0

	$jointconstrain "bip01 l calf" x limit 0 0 0
	$jointconstrain "bip01 l calf" y limit 0 0 0
	$jointconstrain "bip01 l calf" z limit -30 30 0

	$jointconstrain "bip01 l horselink" x limit 0 0 0
	$jointconstrain "bip01 l horselink" y limit 0 0 0
	$jointconstrain "bip01 l horselink" z limit -30 60 0

	$jointconstrain "bip01 r thigh" x limit -30 30 0
	$jointconstrain "bip01 r thigh" y limit -60 20 0
	$jointconstrain "bip01 r thigh" z limit -60 60 0

	$jointconstrain "bip01 r calf" x limit 0 0 0
	$jointconstrain "bip01 r calf" y limit 0 0 0
	$jointconstrain "bip01 r calf" z limit -30 30 0

	$jointconstrain "bip01 r horselink" x limit 0 0 0
	$jointconstrain "bip01 r horselink" y limit 0 0 0
	$jointconstrain "bip01 r horselink" z limit -30 60 0

	$jointconstrain "bip01 r foot" x limit -30 30 0
	$jointconstrain "bip01 r foot" y limit -30 30 0
	$jointconstrain "bip01 r foot" z limit -30 30 0

	$jointconstrain "bip01 spine1" x limit -30 30 0
	$jointconstrain "bip01 spine1" y limit -30 30 0
	$jointconstrain "bip01 spine1" z limit -40 40 0

	$jointconstrain "bip01 l upperarm" x limit -30 30 0
	$jointconstrain "bip01 l upperarm" y limit -60 10 0
	$jointconstrain "bip01 l upperarm" z limit -70 70 0

	$jointconstrain "bip01 l forearm" x limit 0 0 0
	$jointconstrain "bip01 l forearm" y limit 0 0 0
	$jointconstrain "bip01 l forearm" z limit -90 0 0

	$jointconstrain "bip01 neck1" x limit -30 30 0
	$jointconstrain "bip01 neck1" y limit -30 30 0
	$jointconstrain "bip01 neck1" z limit -30 30 0

	$jointconstrain "bip01 r upperarm" x limit -30 30 0
	$jointconstrain "bip01 r upperarm" y limit -10 60 0
	$jointconstrain "bip01 r upperarm" z limit -70 70 0

	$jointconstrain "bip01 r forearm" x limit 0 0 0
	$jointconstrain "bip01 r forearm" y limit 0 0 0
	$jointconstrain "bip01 r forearm" z limit -90 0 0

	$jointconstrain "bip01 r hand" x limit -30 30 0
	$jointconstrain "bip01 r hand" y limit -30 30 0
	$jointconstrain "bip01 r hand" z limit -30 30 0

	$jointconstrain "bip01 l hand" x limit -30 30 0
	$jointconstrain "bip01 l hand" y limit -30 30 0
	$jointconstrain "bip01 l hand" z limit -30 30 0

	$jointconstrain "bip01 l foot" x limit -30 30 0
	$jointconstrain "bip01 l foot" y limit -30 30 0
	$jointconstrain "bip01 l foot" z limit -30 30 0
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

$animation elite_T "elite_anims/Stuck.SMD" {
	fps 30
	walkframe 120 LX LY
	rotate -90
	loop
}
$sequence "Transform" {
	"elite_T"
	activity "ACT_COVER_PISTOL_LOW" 1
	fadein 0.2
	fadeout 0.2
}

$animation "EvadeF" "elite_anims/EvadeF.SMD" {
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

$animation "pis_throw" "elite_anims/Throw.SMD" {
	fps 30
	rotateto 0
}

$sequence "Throw" "pis_throw" fps 30 walkframe 60 LX LY

$animation "pis_warn" "elite_anims/Warn.SMD" {
	fps 30
	rotate -90
}
$sequence "Warn" {
	"pis_warn" 
	cmdlist lockfeet
	fps 30 
	walkframe 60 LX LY 
	activity "ACT_SIGNAL_FORWARD" 1
}

$animation "pis_berserk" "elite_anims/Berserk.SMD" {
	fps 30
	walkframe 60 LX LY
	rotateto 0
}

$sequence "Berserk" "pis_berserk" cmdlist lockfeet fps 30 walkframe 30 LX LY


$animation "rif_f" "elite_anims/rif_f" {
	fps 30
	cmdlist rif_f_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "rif_b" "elite_anims/rif_b" {
	fps 30
	cmdlist rif_b_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "rif_l" "elite_anims/rif_l" {
	fps 30
	cmdlist rif_l_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "rif_r" "elite_anims/rif_r" {
	fps 30
	cmdlist rif_r_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "r_idle" "elite_anims/Idle_Rifle.SMD" {
	cmdlist lockfeet
	fps 30
	loop
	rotate -90
}
$sequence "Rifle_idle" {
	"r_idle"
	fadein 0.2
	fadeout 0.2
	activity "ACT_IDLE_RIFLE" 1
}

$sequence "Rifle_run" {
	"rif_b"
	"rif_r"
	"rif_f"
	"rif_l"
	"rif_b"
	{ event 1100 9 "Step" }
	{ event 1100 23 "Step" }
	blend "move_yaw" -180 180
	blendwidth 5
	activity "ACT_RUN_RIFLE" 1
	fadein 0.2
	fadeout 0.2

}
$animation "s_idle" "elite_anims/sword_idle.SMD" {
	cmdlist lockfeet
	fps 30
	loop
	rotate -90
}
$sequence "Sword_idle" {
	"s_idle"
	fadein 0.2
	fadeout 0.2
	activity "ACT_IDLE_MELEE" 1
}

$animation "sword_f" "elite_anims/sword_f" {
	fps 30
	cmdlist rif_f_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "sword_b" "elite_anims/sword_b" {
	fps 30
	cmdlist rif_b_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "sword_r" "elite_anims/sword_l" {
	fps 30
	cmdlist rif_r_ik
	loop
	walkframe 60 LX LY
	rotate -90
}
$animation "sword_l" "elite_anims/sword_r" {
	fps 30
	cmdlist rif_l_ik
	loop
	walkframe 60 LX LY
	rotate -90
}

$sequence "Crouch_rifle_idle" {
	"elite_anims\crouch_rifle_idle.smd"
	cmdlist lockfeet
	activity "ACT_COVER_MED" 1
	rotate -90
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}


$sequence "Crouch_pistol_idle1" {
	"elite_anims\crouch_pistol_idle.smd"
	cmdlist lockfeet
	activity "ACT_RANGE_ATTACK1_LOW" 1
	rotate -90
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Crouch_pistol_idle2" {
	"elite_anims\crouch_rifle_idle.smd"
	cmdlist lockfeet
	rotate -90
	activity "ACT_COVER_LOW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}


$sequence "Sword_run" {
	"sword_b"
	"sword_r"
	"sword_f"
	"sword_l"
	"sword_b"
	{ event 1100 9 "Step" }
	{ event 1100 23 "Step" }
	activity "ACT_MP_RUN_MELEE" 1
	blend "move_yaw" -180 180
	blendwidth 5
	fadein 0.2
	fadeout 0.2

}

$sequence "Hit_f_chest" {
	"elite_anims/hit_f_chest"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 7 "Step" }
	{ event 1100 13 "Step" }
}

$sequence "Hit_f_gut" {
	"elite_anims/hit_f_gut"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 5 "Step" }
	{ event 1100 14 "Step" }
}

$sequence "Hit_f_left_arm" {
	"elite_anims/hit_f_left_arm"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 7 "Step" }
	{ event 1100 36 "Step" }
}

$sequence "Hit_f_right_arm" {
	"elite_anims/hit_f_right_arm"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "Hit_f_left_hand" {
	"elite_anims/hit_f_left_hand"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "Hit_f_right_hand" {
	"elite_anims/hit_f_right_hand"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "Hit_f_left_thigh" {
	"elite_anims/hit_f_left_thigh"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 7 "Step" }
	{ event 1100 36 "Step" }

}
$sequence "Hit_f_right_thigh" {
	"elite_anims/hit_f_right_thigh"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
}

$sequence "Hit_f_left_foot" {
	"elite_anims/hit_f_left_foot"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 10 "Step" }
	{ event 1100 31 "Step" }
}
$sequence "Hit_f_right_foot" {
	"elite_anims/hit_f_right_foot"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 9 "Step" }
	{ event 1100 54 "Step" }
}

$sequence "kill_f_gut" {
	"elite_anims/kill_f_gut"
	cmdlist lockfeet
	walkframe 60 LX LY
	rotate -90
}

// .qc block generated by HLMV begins.

$surfaceprop "flesh"


$hboxset "default"

$hbox 500 "bip01 pelvis"	    -7.94   -7.75   -9.23     7.62    6.87    9.23
$hbox 501 "bip01 l thigh"	     2.00   -7.50   -6.00    24.00    7.50    4.00
$hbox 502 "bip01 l horselink"	    -4.48   -7.46   -6.08    15.40    4.84    5.52
$hbox 502 "bip01 l foot"	    -3.44   -9.45   -7.62    13.27   11.43    5.92
$hbox 503 "bip01 r thigh"	     2.00   -7.50   -4.00    24.00    7.50    6.00
$hbox 504 "bip01 r horselink"	    -4.48   -7.46   -5.52    15.40    4.84    6.08
$hbox 504 "bip01 r foot"	    -3.44   -9.45   -5.92    13.27   11.43    7.62
$hbox 500 "bip01 spine"	    -7.69  -11.05   -8.63     6.97    6.15    8.63
$hbox 500 "bip01 spine1"	   -17.50  -10.00  -12.50    17.50   10.00   12.50
$hbox 505 "bip01 l upperarm"	    -7.50   -5.00   -5.00    17.50    5.00    5.00
$hbox 506 "bip01 l forearm"	    -4.19   -4.07   -3.54    19.09    5.26    8.36
$hbox 507 "bip01 head"	    -1.00    1.00   -5.00     9.00   11.00    5.00
$hbox 508 "bip01 r upperarm"	    -7.50   -5.00   -5.00    17.50    5.00    5.00
$hbox 509 "bip01 r forearm"	    -4.19   -4.07   -8.36    19.09    5.26    3.54
$hbox 506 "bip01 l hand"	    -5.33   -4.29   -3.99    14.07    5.90    5.31
$hbox 509 "bip01 r hand"	    -5.33   -4.29   -5.31    11.64    4.38    3.99
$hbox 507 "bip01 neck1"	    -5.00   -5.00   -5.00     5.00    5.00    5.00

// .qc block generated by HLMV ends.



