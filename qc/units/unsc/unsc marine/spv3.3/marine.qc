// Created by Crowbar 0.68

$modelname "hce\spv3\unsc\marine\Marine.mdl"




$surfaceprop "flesh"

$contents "solid"

$illumposition -1.279 -2.142 36.265

$cdmaterials "models\hce\spv3\unsc\armored\"
$cdmaterials "models\hce\spv3\unsc\marine\"
$cdmaterials "models\hce\spv3\unsc\odst\"
$cdmaterials "models\hce\spv3\unsc\chief\"
$cdmaterials "models\hce\spv3\weapon\unsc\assault_rifle\"
$bodygroup "empty"
{
	blank
}
$bodygroup "Head"
{
	studio "Head_bisenti.smd"
	studio "Head_charles.smd"
	studio "Head_charles_boonie.smd"
	studio "Head_charles_pilot.smd"
	studio "Head_chris_bandana.smd"
	studio "Head_chris_helmet.smd"
	studio "Head_dubbo_helmet.smd"
	studio "Head_fred_helmet.smd"
	studio "Head_jenkins_helmet.smd"
	studio "Head_johnson_cap.smd"
	studio "Head_marcus_cap.smd"
	studio "Head_marcus_helmet.smd"
	studio "Head_matt.smd"
	studio "Head_matt_helmet.smd"
	studio "Head_matt_operator.smd"
	studio "Head_mendoza_boonie.smd"
	studio "Head_mobuto_helmet.smd"
	studio "Head_paul.smd"
	studio "Head_paul_pilot.smd"
	studio "Head_rob_helmet.smd"
	studio "Head_rob_operator.smd"
	studio "Head_shiek_helmet.smd"
	studio "Head_steve_bandana.smd"
	studio "Head_steve_operator.smd"
	studio "Head_keyes.smd"
	studio "Head_ODST.smd"
}
$bodygroup "Torso"
{
	studio "Torso_bdu.smd"
	studio "Torso_armor.smd"
	studio "Torso_armorKitted.smd"
	studio "Torso_crewman.smd"
	studio "Torso_keyes.smd"
	studio "Torso_ODST.smd"
}
$bodygroup "Arms"
{
	studio "Arms_bdu.smd"
	studio "Arms_bdu_gloves.smd"
	studio "Arms_bdu_short.smd"
	studio "Arms_bdu_short_armored_gloves.smd"
	studio "Arms_armor.smd"
	studio "Arms_armor_gloves.smd"
	studio "Arms_armor_short.smd"
	studio "Arms_crewman.smd"
	studio "Arms_keyes.smd"
	studio "Arms_ODST.smd"
}
$bodygroup "Legs"
{
	studio "Legs_bdu.smd"
	studio "Legs_armor.smd"
	studio "Legs_crewman.smd"
	studio "Legs_keyes.smd"
	studio "Legs_ODST.smd"
}
$texturegroup "skinfamilies"
{
	{ "marine_face-charles_diff" }
	{ "marine_face-chris_diff"   }
	{ "marine_face-fred_diff"    }
	{ "marine_face-marcus_diff"  }
	{ "marine_face-matt_diff"    }
	{ "marine_face-paul_diff"    }
	{ "marine_face-rob_diff"     }
	{ "marine_face-shiek_diff"   }
	{ "marine_face-johnson_diff"   }
	{ "captain_head_diff"   }
}

$cbox 0 0 0 0 0 0

$bbox -19.557 -20.039 -0.079 23.84 17.48 72.608

$definebone "bip01 pelvis" "" -0.94362 0 41.900246 -89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "bip01 l thigh" "bip01 pelvis" -0.000004 0.000006 4.145658 0.000091 177.770344 -179.999896 0 0 0 0 0 0
$definebone "bip01 l calf" "bip01 l thigh" 18.255096 0 0.000001 0 -10.959193 0 0 0 0 0 0 0
$definebone "bip01 l foot" "bip01 l calf" 17.941727 -0.000001 -0.000001 0 8.729413 0 0 0 0 0 0 0
$definebone "bip01 r thigh" "bip01 pelvis" 0.000004 -0.000006 -4.145669 0.000091 177.770344 -179.999896 0 0 0 0 0 0
$definebone "bip01 r calf" "bip01 r thigh" 18.255098 0 0.000001 0 -10.959193 0 0 0 0 0 0 0
$definebone "bip01 r foot" "bip01 r calf" 17.941729 -0.000001 -0.000001 0.000057 8.729413 0 0 0 0 0 0 0
$definebone "bip01 spine" "bip01 pelvis" 3.966858 -0.004378 0.000003 -0.000057 -1.954416 -0.000229 0 0 0 0 0 0
$definebone "bip01 spine1" "bip01 spine" 5.500431 -0.00853 0 0 -3.000007 0 0 0 0 0 0 0
$definebone "bip01 l clavicle" "bip01 spine1" 10.399792 -0.262663 1.766676 -69.517549 177.276412 2.858372 0 0 0 0 0 0
$definebone "bip01 l upperarm" "bip01 l clavicle" 6.395039 0 0.000004 -19.756216 0.329107 6.121137 0 0 0 0 0 0
$definebone "bip01 l forearm" "bip01 l upperarm" 12.31259 -0.000001 0.000015 0 -3.959482 -0.000001 0 0 0 0 0 0
$definebone "bip01 l hand" "bip01 l forearm" 11.162745 0 -0.000004 -4.221724 2.19271 -93.824362 0 0 0 0 0 0
$definebone "bip01 neck" "bip01 spine1" 10.727253 -0.001361 0 0 9.718796 0 0 0 0 0 0 0
$definebone "bip01 head" "bip01 neck" 1.735985 0 0 -0.000057 3.735398 0 0 0 0 0 0 0
$definebone "bip01 ponytail1" "bip01 head" 1.21006 0.740754 -0.000002 -0.000115 97.480576 -0.000229 0 0 0 0 0 0
$definebone "bip01 r clavicle" "bip01 spine1" 10.398945 -0.262709 -1.890186 69.517495 177.275784 -2.859174 0 0 0 0 0 0
$definebone "bip01 r upperarm" "bip01 r clavicle" 6.395037 0 -0.000004 19.756443 0.329394 -6.120908 0 0 0 0 0 0
$definebone "bip01 r forearm" "bip01 r upperarm" 12.312592 0.000004 0 0.000002 -3.959482 0.000115 0 0 0 0 0 0
$definebone "bip01 r hand" "bip01 r forearm" 11.16276 0.000001 -0.000011 4.221728 2.192709 93.824471 0 0 0 0 0 0
$definebone "frame gun" "bip01 r hand" 2 2.5 0 10 -15 0 0 0 0 0 0 0

$bonemerge	"bip01 r hand"
$bonemerge	"frame gun"
$hierarchy "frame gun" "bip01 r hand"
$attachment "Cannon" "frame gun" 0 0 0 rotate 0 0 0
$attachment "anim_attachment_LH" "bip01 l hand" 0 0 0 rotate 0 0 0

$ikchain l_foot "bip01 l foot" Z 0 height 36
$ikchain r_foot "bip01 r foot" Z 0 height 36

$cmdlist lockfeet {
    ikrule l_foot footstep
    ikrule r_foot footstep
}
$cmdlist wF_ik {
	ikrule l_foot footstep range .. 0 5 ..
	ikrule r_foot footstep range .. 8 14 ..
}
$cmdlist wB_ik {
	ikrule l_foot footstep range .. 10 15 ..
	ikrule r_foot footstep range .. 0 4 ..
}
$cmdlist wL_ik {
	ikrule l_foot footstep range .. 16 1 ..
	ikrule r_foot footstep range .. 7 12 ..
}
$cmdlist wR_ik {
	ikrule l_foot footstep range .. 0 5 ..
	ikrule r_foot footstep range .. 9 14 ..
}

$poseparameter "aim_pitch" -90 90 loop 0
$poseparameter "aim_yaw" -90 90 loop 0
$poseparameter "move_yaw" -180 180 loop 0
$poseparameter "move_mouth" 0 100 loop 0


$weightlist "jaw" {
	"bip01 ponytail1" 1
}

$animation "aimup_body_corrective_animation" "marine_anims\aimup_body_corrective_animation.smd" {
}

$animation "aimcenter_corrective_animation" "marine_anims\aimcenter_corrective_animation.smd" {
}

$animation "aimdown_body_corrective_animation" "marine_anims\aimdown_body_corrective_animation.smd" {
}

$animation "aimright_body_corrective_animation" "marine_anims\aimright_body_corrective_animation.smd" {
}

$animation "aimleft_body_corrective_animation" "marine_anims\aimleft_body_corrective_animation.smd" {
}

$animation "aimleft_body" "marine_anims\aimleft_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimleft_body_corrective_animation" 0
}

$animation "aimcenter" "marine_anims\aimcenter.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimcenter_corrective_animation" 0
}

$animation "aimright_body" "marine_anims\aimright_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimright_body_corrective_animation" 0
}

$animation "aimup_body" "marine_anims\aimup_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimup_body_corrective_animation" 0
}

$animation "aimdown_body" "marine_anims\aimdown_body.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimdown_body_corrective_animation" 0
}

$animation "wF" "marine_anims\wF.smd" {
	fps 30
	loop
	cmdlist wF_ik
	walkframe 19 LX LY
}

$animation "wL" "marine_anims\wL.smd" {
	fps 30
	loop
	cmdlist wL_ik
	walkframe 19 LX LY
}

$animation "wR" "marine_anims\wR.smd" {
	fps 30
	loop
	cmdlist wR_ik
	walkframe 19 LX LY
}

$animation "wB" "marine_anims\wB.smd" {
	fps 30
	loop
	cmdlist wB_ik
	walkframe 19 LX LY
}

$animation "pis_F" "marine_anims/Pistol_m_f.SMD" {
	fps 30
	cmdlist wF_ik
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "pis_L" "marine_anims/Pistol_m_l.SMD" {
	fps 30
	cmdlist wL_ik
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "pis_R" "marine_anims/Pistol_m_r.SMD" {
	fps 30
	cmdlist wR_ik
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "pis_B" "marine_anims/Pistol_m_b.SMD" {
	fps 30
	cmdlist wB_ik
	loop
	rotate -90
	walkframe 19 LX LY
}

$animation "rF" "marine_anims\rF.smd" {
	fps 30
	ikrule l_foot footstep range .. 10 1 ..
	ikrule r_foot footstep range .. 28 12 ..
	loop
	walkframe 29 LX LY
}

$animation "reld" "marine_anims\reld.smd" {
	fps 30
	walkframe 59 LX LY
}

$animation "EvadeL" "marine_anims\EvadeL.smd" {
	fps 30
	walkframe 38 LX LY
}

$animation "EvadeR" "marine_anims\EvadeR.smd" {
	fps 30
	walkframe 38 LX LY
}

$sequence "Talk" {
	"marine_anims/mouth_closed.smd"
	"marine_anims/mouth_open.smd"
	blend "move_mouth" 0 100
	autoplay
	fadein 0.2
	fadeout 0.2
	loop
	weightlist "jaw"
	hidden
}


$sequence "Idle_1" {
	"marine_anims\Idle_1.smd"
	cmdlist lockfeet
	activity "ACT_IDLE_AGITATED" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_2" {
	"marine_anims\Idle_2.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Crouch_idle" {
	"marine_anims\crouch_rifle_idle.smd"
	cmdlist lockfeet
	rotate -90
	activity "ACT_RANGE_ATTACK1_LOW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Crouch_idle1" {
	"marine_anims\crouch_rifle_idle.smd"
	cmdlist lockfeet
	rotate -90
	activity "ACT_COVER_LOW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "centeraim" {
	"marine_anims\centeraim.smd"
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
	"marine_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
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
	{ event 1100 10 "Step" }
	{ event 1100 19 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Walk" {
	"rF"
	activity "ACT_WALK" 1
	blend "move_yaw" -180 180
	{ event 1100 12 "Step" }
	{ event 1100 27 "Step" }
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
	rotate -90
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

$collisionjoints "marine_physics.smd"
{
	$mass 90
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01 pelvis"


	$jointconstrain "bip01 l thigh" x limit -15 15 0
	$jointconstrain "bip01 l thigh" y limit -10 70 0
	$jointconstrain "bip01 l thigh" z limit -80 80 0

	$jointconstrain "bip01 l calf" x limit 0 0 0
	$jointconstrain "bip01 l calf" y limit 0 0 0
	$jointconstrain "bip01 l calf" z limit -90 0 0

	$jointconstrain "bip01 r thigh" x limit -15 15 0
	$jointconstrain "bip01 r thigh" y limit -70 10 0
	$jointconstrain "bip01 r thigh" z limit -80 80 0

	$jointconstrain "bip01 r calf" x limit 0 0 0
	$jointconstrain "bip01 r calf" y limit 0 0 0
	$jointconstrain "bip01 r calf" z limit -90 0 0

	$jointconstrain "bip01 r foot" x limit -15 15 0
	$jointconstrain "bip01 r foot" y limit -15 15 0
	$jointconstrain "bip01 r foot" z limit -40 40 0

	$jointconstrain "bip01 spine1" x limit -40 40 0
	$jointconstrain "bip01 spine1" y limit -20 20 0
	$jointconstrain "bip01 spine1" z limit -40 40 0

	$jointconstrain "bip01 l upperarm" x limit -30 30 0
	$jointconstrain "bip01 l upperarm" y limit -80 80 0
	$jointconstrain "bip01 l upperarm" z limit -70 70 0

	$jointconstrain "bip01 l forearm" x limit 0 0 0
	$jointconstrain "bip01 l forearm" y limit 0 0 0
	$jointconstrain "bip01 l forearm" z limit -100 10 0

	$jointconstrain "bip01 head" x limit -30 30 0
	$jointconstrain "bip01 head" y limit -30 30 0
	$jointconstrain "bip01 head" z limit -30 30 0

	$jointconstrain "bip01 r upperarm" x limit -30 30 0
	$jointconstrain "bip01 r upperarm" y limit -80 80 0
	$jointconstrain "bip01 r upperarm" z limit -70 70 0

	$jointconstrain "bip01 r forearm" x limit 0 0 0
	$jointconstrain "bip01 r forearm" y limit 0 0 0
	$jointconstrain "bip01 r forearm" z limit -100 10 0

	$jointconstrain "bip01 r hand" x limit -40 40 0
	$jointconstrain "bip01 r hand" y limit -20 20 0
	$jointconstrain "bip01 r hand" z limit -70 70 0

	$jointconstrain "bip01 l hand" x limit -40 40 0
	$jointconstrain "bip01 l hand" y limit -20 20 0
	$jointconstrain "bip01 l hand" z limit -70 70 0

	$jointconstrain "bip01 l foot" x limit -15 15 0
	$jointconstrain "bip01 l foot" y limit -15 15 0
	$jointconstrain "bip01 l foot" z limit -40 40 0
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

$animation marine_T "marine_anims/Stuck.SMD" {
	fps 30
	walkframe 120 LX LY
	rotateto -180
	loop

}
$sequence "Transform" {
	"marine_T"
	activity "ACT_COVER_PISTOL_LOW" 1
	fadein 0.2
	fadeout 0.2
	
}
$animation "EvadeF" "marine_anims/EvadeF.SMD" {
	fps 30
	walkframe 120 LX LY
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

$animation "rif_throw" "marine_anims/Throw.SMD" {
	fps 30
	rotateto 0
}

$sequence "Throw" "rif_throw" fps 30 walkframe 60 LX LY

$animation "rif_warn" "marine_anims/Warn.SMD" {
	fps 30
	rotateto 45
}
$sequence "Warn" {
	"rif_warn" 
	cmdlist lockfeet
	fps 30 
	walkframe 60 LX LY 
	activity "ACT_SIGNAL_FORWARD" 1
}

$animation "death1" "marine_anims\Die_1.smd" {
	fps 30
	walkframe 39 LX LY
}

$animation "death2" "marine_anims\Die_2.smd" {
	fps 30
	walkframe 39 LX LY
}

$animation "death3" "marine_anims\Die_3.smd" {
	fps 30
	walkframe 40 LX LY
}
$sequence "Die_1" {
	"marine_anims/Die_5"
	{ event 1100 0 "Death_Front" }
	fadein 0.2
	fadeout 0.2
	rotate -90
}

$sequence "Die_2" {
	"death2"
	{ event 1100 0 "Death_Back" }
	fadein 0.2
	fadeout 0.2
	rotate -90
}

$sequence "Die_3" {
	"death3"
	{ event 1100 0 "Death_Right" }
	fadein 0.2
	fadeout 0.2
	rotate -90
}


$animation "death_airborne" "marine_anims\Die_airborne.smd" {
	fps 30
	walkframe 40 LX LY
	loop
	rotate -90
}
$sequence "Die_Airborne" {
	"death_Airborne"
	{ event 1100 0 "Death_Right" }
	fadein 0.2
	fadeout 0.2
}

$sequence "h_f_chest" {
	"marine_anims/h_f_chest"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 13 "Step" }
}

$sequence "h_f_gut" {
	"marine_anims/h_f_gut"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 11 "Step" }
}

$sequence "h_f_l_arm" {
	"marine_anims/h_f_l_arm"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 11 "Step" }
	{ event 1100 21 "Step" }
	{ event 1100 28 "Step" }
}

$sequence "h_f_r_arm" {
	"marine_anims/h_f_r_arm"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 13 "Step" }
	{ event 1100 19 "Step" }
}
$sequence "h_f_l_leg" {
	"marine_anims/h_f_l_leg"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 15 "Step" }
	{ event 1100 49 "Step" }
}
$sequence "h_f_r_leg" {
	"marine_anims/h_f_r_leg"
	walkframe 60 LX LY
	rotate -90
	{ event 1100 0 "Pain" }
	{ event 1100 9 "Step" }
}
$sequence "Die_4" {
	"marine_anims/Die_4"
	walkframe 60 LX LY
	rotate -90
}
$sequence "Die_5" {
	"death1"
	walkframe 60 LX LY
	rotate -90
}

// .qc block generated by HLMV begins.

$surfaceprop "flesh"


$hboxset "default"

$hbox 500 "bip01 pelvis"	   -12.11   -6.64   -7.50     4.89    5.36    7.50
$hbox 501 "bip01 l thigh"	     2.00   -5.00   -4.00    22.00    5.00    4.00
$hbox 501 "bip01 l calf"	     0.00   -5.00   -4.00    20.00    5.00    4.00
$hbox 501 "bip01 l foot"	    -2.71   -4.79   -4.00     6.34   11.55    3.17
$hbox 502 "bip01 r thigh"	     2.00   -6.00   -4.00    22.00    6.00    4.00
$hbox 502 "bip01 r calf"	     0.00   -5.00   -4.00    20.00    5.00    4.00
$hbox 502 "bip01 r foot"	    -2.71   -4.79   -3.26     6.34   11.55    3.63
$hbox 500 "bip01 spine"	    -5.50   -4.00   -7.50     5.50    6.00    7.50
$hbox 500 "bip01 spine1"	   -10.00   -6.00   -8.50    10.00    6.00    8.50
$hbox 503 "bip01 l upperarm"	    -1.50   -4.00   -4.00    13.50    4.00    4.00
$hbox 503 "bip01 l forearm"	    -3.02   -3.14   -4.17    12.36    4.28    3.17
$hbox 503 "bip01 l hand"	    -0.50   -2.17   -2.73     8.01    3.05    2.82
$hbox 504 "bip01 head"	     0.00   -2.50   -4.00    10.00    5.50    4.00
$hbox 505 "bip01 r upperarm"	    -1.50   -4.00   -4.00    13.50    4.00    4.00
$hbox 505 "bip01 r forearm"	    -3.15   -3.14   -3.36    12.59    4.28    4.00
$hbox 505 "bip01 r hand"	    -0.69   -2.16   -2.79     8.11    3.09    2.74

// .qc block generated by HLMV ends.

$sequence "pistol_idle" {
	"marine_anims/Pistol_idle"
	cmdlist lockfeet
	fadein 0.2
	fadeout 0.2
	loop
	activity "ACT_IDLE_PISTOL" 1
	rotate -90
}

$sequence "Pistol_run" {
	"pis_b"
	"pis_r"
	"pis_f"
	"pis_l"
	"pis_b"
	blend "move_yaw" -180 180
	blendwidth 5
	activity "ACT_RUN_PISTOL" 1
	loop
	fadein 0.2
	fadeout 0.2
	walkframe 60 LX LY
}

$sequence "cower_idle" {
	"marine_anims/Cower_idle"
	cmdlist lockfeet
	fadein 0.2
	fadeout 0.2
	rotate -90
	loop
}