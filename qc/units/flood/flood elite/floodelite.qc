// Created by Crowbar 0.68

$modelname "hce\spv3\flood\elite\FloodElite.mdl"
$bodygroup "empty"
{
	blank
}
$bodygroup "Body"
{
	studio "Torso.smd"
	studio "Torso_Damaged.smd"
}
$bodygroup "Upper Armor"
{
	blank
	studio "Upper_Armor.smd"
	studio "Upper_Biomass.smd"
}
$bodygroup "Legs"
{
	studio "Legs.smd"
	studio "Legs_Armored.smd"
	studio "Legs_Armored_HG.smd"
}
$bodygroup "Right Arm"
{
	studio "RightArm_Runner.SMD"
	studio "RightArm.SMD"
	studio "RightArm_HG.SMD"
	studio "RightArm_Damaged.smd"
}
$bodygroup "Left Arm"
{
	studio "LeftArm_Runner.SMD"
	studio "LeftArm.SMD"
	studio "LeftArm_HG.SMD"
	studio "LeftArm_Damaged.SMD"
}
$bodygroup "Head"
{
	studio "Head.SMD"
	studio "Head_Damaged.SMD"
}
$texturegroup "skinfamilies"
{
	{"elite_main_diff"}
	{"elite_main_diff_blue"}
	{"elite_main_diff_red"}
	{"elite_main_diff_gold"}
}

$surfaceprop "alienflesh"

$contents "solid"

$illumposition 4.774 5.93 45.194

$cdmaterials "models\hce\spv3\flood\elite\"
$cdmaterials "models\hce\spv3\flood\infector\"
$cdmaterials "models\hce\spv3\cov\elite\"

$cbox 0 0 0 0 0 0

$bbox -45.166 -22.752 -0.123 33.307 32.301 90.512

$definebone "bip01 pelvis" "" 1.680644 0.000003 50.602871 -89.999982 -90.000037 0 0 0 0 0 0 0
$definebone "bip01 l thigh" "bip01 pelvis" -0.000004 0.000006 4.582232 -4.499819 147.836043 -179.999937 0 0 0 0 0 0
$definebone "bip01 l calf" "bip01 l thigh" 22.690996 -0.000002 -0.000001 0 -87.646784 0 0 0 0 0 0 0
$definebone "bip01 l horselink" "bip01 l calf" 9.769852 0 -0.000003 0 40.941848 0 0 0 0 0 0 0
$definebone "bip01 l foot" "bip01 l horselink" 13.116445 0.000007 -0.000001 -3.808278 14.46117 2.399089 0 0 0 0 0 0
$definebone "bip01 r thigh" "bip01 pelvis" 0.000004 -0.000006 -4.582244 4.500051 148.027985 -179.984979 0 0 0 0 0 0
$definebone "bip01 r calf" "bip01 r thigh" 22.691004 0.000002 0.000001 0.000001 -87.941513 0 0 0 0 0 0 0
$definebone "bip01 r horselink" "bip01 r calf" 9.769836 0.000004 0 0.000001 41.927854 -0.000057 0 0 0 0 0 0
$definebone "bip01 r foot" "bip01 r horselink" 13.11644 0.000005 0.000001 3.808221 13.961208 -2.399031 0 0 0 0 0 0
$definebone "bip01 spine" "bip01 pelvis" 4.375946 1.140536 0.000001 -0.000115 5.045581 -0.000229 0 0 0 0 0 0
$definebone "bip01 spine1" "bip01 spine" 5.308685 -0.011845 0 0 0 0 0 0 0 0 0 0
$definebone "bip01 l clavicle" "bip01 spine1" 13.543896 0.117731 2.943414 -63.106078 -170.112377 -11.109364 0 0 0 0 0 0
$definebone "bip01 l upperarm" "bip01 l clavicle" 11.6786 -0.000002 -0.000015 50.757362 13.432939 8.06278 0 0 0 0 0 0
$definebone "bip01 l forearm" "bip01 l upperarm" 14.947941 0 0.000006 0.000004 -20.526387 0.000001 0 0 0 0 0 0
$definebone "bip01 l hand" "bip01 l forearm" 16.399921 0.000004 -0.000004 12.761661 7.30584 -83.923996 0 0 0 0 0 0
$definebone "frame spike-long-base" "bip01 l forearm" 9.634766 0.019244 4.756966 6.170927 -83.920267 44.971396 0 0 0 0 0 0
$definebone "frame spike-long-mid" "frame spike-long-base" 0.000002 18.259247 -5.092022 0 0.000001 -4.999979 0 0 0 0 0 0
$definebone "frame spike-long-end" "frame spike-long-mid" 0.000014 10.269184 -9.555416 0 0.000001 38.500065 0 0 0 0 0 0
$definebone "frame spike-med-base" "bip01 l forearm" 12.589516 1.717342 3.81011 3.317312 -82.553027 46.110611 0 0 0 0 0 0
$definebone "frame spike-med-mid" "frame spike-med-base" 0.000004 12.697727 -7.177292 0.000001 0 46.999959 0 0 0 0 0 0
$definebone "frame spike-med-end" "frame spike-med-mid" 0.000002 -2.808689 -10.042124 0.000001 -0.000001 -14.999977 0 0 0 0 0 0
$definebone "frame spike-short-base" "bip01 l forearm" 12.86747 -0.825063 3.459301 6.170985 -83.920267 45.971377 0 0 0 0 0 0
$definebone "frame spike-short-mid" "frame spike-short-base" 0 11.039921 -4.580833 0.000001 0 -11.999975 0 0 0 0 0 0
$definebone "frame spike-short-end" "frame spike-short-mid" 0.000012 8.616884 -5.996655 0 0 -32.500004 0 0 0 0 0 0
$definebone "bip01 neck" "bip01 spine1" 14.874561 -0.003165 -0.002423 44.003675 -9.117076 43.263989 0 0 0 0 0 0
$definebone "bip01 neck1" "bip01 neck" 6.166199 -0.003815 -0.000006 -20.999826 -68.777908 -0.017645 0 0 0 0 0 0
$definebone "bip01 head" "bip01 neck1" 13.285259 0.000008 0.000004 16.102757 -117.441387 -10.530328 0 0 0 0 0 0
$definebone "bip01 r clavicle" "bip01 spine1" 13.543896 0.117747 -2.943413 63.106085 -170.113115 11.108735 0 0 0 0 0 0
$definebone "bip01 r upperarm" "bip01 r clavicle" 11.678602 -0.000001 0 -50.757359 13.432936 -8.062834 0 0 0 0 0 0
$definebone "bip01 r forearm" "bip01 r upperarm" 14.947937 -0.000001 0.000006 -0.000002 -20.526327 0 0 0 0 0 0 0
$definebone "bip01 r hand" "bip01 r forearm" 16.399918 0.000004 0.000004 -12.761603 7.305898 83.924051 0 0 0 0 0 0
$definebone "frame gun" "bip01 r hand" 2 2.5 0 0 15 20 0 0 0 0 0 0

$bonemerge	"bip01 r hand"
$bonemerge	"frame gun"
$hierarchy "frame gun" "bip01 r hand"
$attachment "Cannon" "frame gun" 0 0 0 rotate 0 0 0
$attachment "anim_attachment_LH" "bip01 l hand" 0 0 0 rotate 0 0 0


$definebone "frame antenna-large-base" "bip01 spine1" 14.86755 7.001571 6.938114 -26.457586 88.302537 88.375988 0 0 0 0 0 0
$definebone "frame antenna-large-middle" "frame antenna-large-base" 3.820966 0 3.035812 0 11.500006 0 0 0 0 0 0 0
$definebone "frame antenna-large-top" "frame antenna-large-middle" 3.447501 -0.164927 5.116066 0 -11.000045 0 0 0 0 0 0 0
$definebone "frame antenna-large-frond" "frame antenna-large-top" 4.655443 -0.086834 3.456131 -3.483813 -5.51025 0.335868 0 0 0 0 0 0
$definebone "frame antenna-medium-base" "bip01 spine1" 13.254887 8.451454 3.842932 21.499957 84.954344 89.999982 0 0 0 0 0 0
$definebone "frame antenna-medium-top" "frame antenna-medium-base" 4.638492 0.059068 1.151527 0.000001 0 0 0 0 0 0 0 0
$definebone "frame antenna-medium-frond" "frame antenna-medium-top" 3.035828 0.000002 1.156807 0.995343 -5.500795 -0.095913 0 0 0 0 0 0
$definebone "frame antenna-small-base" "bip01 spine1" 12.356068 8.685801 6.277413 -30.500087 84.954398 89.999982 0 0 0 0 0 0
$definebone "frame antenna-small-frond" "frame antenna-small-base" 7.083794 -0.468578 1.752647 0 -10.000009 0 0 0 0 0 0 0

$ikchain l_foot "bip01 l foot" Z 0 height 36
$ikchain r_foot "bip01 r foot" Z 0 height 36

$cmdlist lockfeet {
    ikrule l_foot footstep
    ikrule r_foot footstep
}



$poseparameter "move_yaw" -180 180 loop 0

$animation "death1" "floodelite_anims\death1.smd" {
	fps 30
	walkframe 58 LX LY
}

$animation "death2" "floodelite_anims\death2.smd" {
	fps 30
	walkframe 48 LX LY
}

$animation "death3" "floodelite_anims\death3.smd" {
	fps 30
	walkframe 39 LX LY
}

$animation "death4" "floodelite_anims\death4.smd" {
	fps 30
	walkframe 56 LX LY
}

$animation "wF" "floodelite_anims\wF.smd" {
	fps 30
	loop
	walkframe 35 LX LY
}

$animation "wF_armed" "floodelite_anims\wF_armed.smd" {
	rotate -90
	fps 30
	loop
	walkframe 35 LX LY
}

$animation "rf" "floodelite_anims\rf.smd" {
	fps 30
	loop
	walkframe 23 LX LY
}

$animation "rf2" "floodelite_anims\rf2.smd" {
	fps 30
	loop
	walkframe 21 LX LY
}

$animation "rf3" "floodelite_anims\rf3.smd" {
	fps 30
	loop
	walkframe 39 LX LY
}

$animation "melee1" "floodelite_anims\melee1.smd" {
	fps 30
	walkframe 50 LX LY
}

$animation "melee2" "floodelite_anims\melee2.smd" {
	fps 30
	walkframe 36 LX LY
}

$animation "death_airborne" "floodelite_anims/Die_Airborne.SMD" {
	fps 30
	loop
	rotate -90
}

$sequence "Die_Airborne" {
	"death_Airborne"
	fadein 0.2
	fadeout 0.2
}

$sequence "ragdoll" {
	"floodelite_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_1" {
	"floodelite_anims\Idle_1.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_2" {
	"floodelite_anims\Idle_2.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Die_1" {
	"death1"
	activity "ACT_DIE_SIMPLE" 1
	{ event 1100 0 "Death_Front" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_2" {
	"death2"
	activity "ACT_DIE_SIMPLE" 1
	{ event 1100 0 "Death_Back" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_3" {
	"death3"
	activity "ACT_DIE_SIMPLE" 1
	{ event 1100 0 "Death_Right" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Die_4" {
	"death4"
	activity "ACT_DIE_SIMPLE" 1
	{ event 1100 0 "Death_Left" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Walk" {
	"wF"
	ikrule l_foot footstep range .. 11 3 ..
	ikrule r_foot footstep range .. 1 22 ..
	activity "ACT_WALK" 1
	blend "move_yaw" -180 180
	{ event 1100 1 "Step" }
	{ event 1100 3 "Longmove" }
	{ event 1100 15 "Step" }
	{ event 1100 23 "Longmove" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Walk_armed" {
	"wF_armed"
	ikrule l_foot footstep range .. 11 3 ..
	ikrule r_foot footstep range .. 1 22 ..
	activity "ACT_WALK_PISTOL" 1
	{ event 1100 1 "Step" }
	{ event 1100 3 "Longmove" }
	{ event 1100 15 "Step" }
	{ event 1100 23 "Longmove" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run1" {
	"rf"
	ikrule l_foot footstep range .. 8 15 ..
	ikrule r_foot footstep range .. 20 3 ..
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	{ event 1100 3 "Shortmove" }
	{ event 1100 8 "Step" }
	{ event 1100 15 "Shortmove" }
	{ event 1100 20 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run2" {
	"rf2"
	ikrule l_foot footstep range .. 8 15 ..
	ikrule r_foot footstep range .. 20 3 ..
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	{ event 1100 3 "Shortmove" }
	{ event 1100 8 "Step" }
	{ event 1100 15 "Shortmove" }
	{ event 1100 19 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run3" {
	"rf3"
	ikrule l_foot footstep range .. 7 11 ..
	ikrule r_foot footstep range .. 18 22 ..
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	{ event 1100 2 "Shortmove" }
	{ event 1100 7 "Step" }
	{ event 1100 12 "Shortmove" }
	{ event 1100 18 "Step" }
	{ event 1100 22 "Shortmove" }
	{ event 1100 27 "Step" }
	{ event 1100 32 "Shortmove" }
	{ event 1100 38 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_1" {
	"melee1"
	activity "ACT_MELEE1" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee1" }
	{ event 1100 13 "Hit" }
	{ event 1100 28 "Hit" }
	{ event 1100 45 "Hit" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_2" {
	"melee2"
	activity "ACT_MELEE2" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee2" }
	{ event 1100 16 "Hit" }
	fadein 0.2
	fadeout 0.2
}

$collisionjoints "floodelite_physics.smd"
{
	$mass 90
	$inertia 10
	$damping 0.01
	$rotdamping 1.5
	$rootbone "bip01 pelvis"


	$jointconstrain "bip01 l thigh" x limit 0 0 0
	$jointconstrain "bip01 l thigh" y limit -20 40 0
	$jointconstrain "bip01 l thigh" z limit -70 40 0

	$jointconstrain "bip01 l calf" x limit 0 0 0
	$jointconstrain "bip01 l calf" y limit 0 0 0
	$jointconstrain "bip01 l calf" z limit -50 50 0

	$jointconstrain "bip01 l horselink" x limit 0 0 0
	$jointconstrain "bip01 l horselink" y limit 0 0 0
	$jointconstrain "bip01 l horselink" z limit -60 60 0

	$jointconstrain "bip01 r thigh" x limit 0 0 0
	$jointconstrain "bip01 r thigh" y limit -40 20 0
	$jointconstrain "bip01 r thigh" z limit -70 40 0

	$jointconstrain "bip01 r calf" x limit 0 0 0
	$jointconstrain "bip01 r calf" y limit 0 0 0
	$jointconstrain "bip01 r calf" z limit -50 50 0

	$jointconstrain "bip01 r horselink" x limit 0 0 0
	$jointconstrain "bip01 r horselink" y limit 0 0 0
	$jointconstrain "bip01 r horselink" z limit -60 60 0

	$jointconstrain "bip01 r foot" x limit -30 30 0
	$jointconstrain "bip01 r foot" y limit -30 30 0
	$jointconstrain "bip01 r foot" z limit -30 30 0

	$jointconstrain "bip01 spine" x limit -30 30 0
	$jointconstrain "bip01 spine" y limit -30 30 0
	$jointconstrain "bip01 spine" z limit -50 50 0

	$jointconstrain "bip01 spine1" x limit -30 30 0
	$jointconstrain "bip01 spine1" y limit -30 30 0
	$jointconstrain "bip01 spine1" z limit -30 30 0

	$jointconstrain "bip01 l clavicle" x limit 0 0 0
	$jointconstrain "bip01 l clavicle" y limit 0 0 0
	$jointconstrain "bip01 l clavicle" z limit 0 0 0

	$jointconstrain "bip01 l upperarm" x limit 0 0 0
	$jointconstrain "bip01 l upperarm" y limit -60 20 0
	$jointconstrain "bip01 l upperarm" z limit -80 80 0

	$jointconstrain "bip01 l forearm" x limit 0 0 0
	$jointconstrain "bip01 l forearm" y limit 0 0 0
	$jointconstrain "bip01 l forearm" z limit -90 3 0

	$jointconstrain "bip01 l hand" x limit -30 30 0
	$jointconstrain "bip01 l hand" y limit -40 40 0
	$jointconstrain "bip01 l hand" z limit -40 40 0

	$jointconstrain "frame spike-long-mid" x limit -50 20 0
	$jointconstrain "frame spike-long-mid" y limit 0 0 0
	$jointconstrain "frame spike-long-mid" z limit 0 0 0

	$jointconstrain "frame spike-short-mid" x limit -50 10 0
	$jointconstrain "frame spike-short-mid" y limit 0 0 0
	$jointconstrain "frame spike-short-mid" z limit 0 0 0

	$jointconstrain "bip01 r upperarm" x limit 0 0 0
	$jointconstrain "bip01 r upperarm" y limit -20 60 0
	$jointconstrain "bip01 r upperarm" z limit -80 80 0

	$jointconstrain "frame spike-med-mid" x limit -30 10 0
	$jointconstrain "frame spike-med-mid" y limit 0 0 0
	$jointconstrain "frame spike-med-mid" z limit 0 0 0

	$jointconstrain "frame antenna-large-middle" x limit -50 50 0
	$jointconstrain "frame antenna-large-middle" y limit -50 50 0
	$jointconstrain "frame antenna-large-middle" z limit -50 50 0

	$jointconstrain "frame antenna-large-frond" x limit -50 50 0
	$jointconstrain "frame antenna-large-frond" y limit -50 50 0
	$jointconstrain "frame antenna-large-frond" z limit -50 50 0

	$jointconstrain "frame antenna-medium-base" x limit -50 50 0
	$jointconstrain "frame antenna-medium-base" y limit -50 50 0
	$jointconstrain "frame antenna-medium-base" z limit -50 50 0

	$jointconstrain "frame antenna-medium-frond" x limit -50 50 0
	$jointconstrain "frame antenna-medium-frond" y limit -50 50 0
	$jointconstrain "frame antenna-medium-frond" z limit -50 50 0

	$jointconstrain "frame antenna-small-base" x limit -50 50 0
	$jointconstrain "frame antenna-small-base" y limit -50 50 0
	$jointconstrain "frame antenna-small-base" z limit -50 50 0

	$jointconstrain "frame antenna-small-frond" x limit -50 50 0
	$jointconstrain "frame antenna-small-frond" y limit -50 50 0
	$jointconstrain "frame antenna-small-frond" z limit -50 50 0

	$jointconstrain "bip01 r forearm" x limit 0 0 0
	$jointconstrain "bip01 r forearm" y limit 0 0 0
	$jointconstrain "bip01 r forearm" z limit -90 3 0

	$jointconstrain "bip01 l foot" x limit -30 30 0
	$jointconstrain "bip01 l foot" y limit -30 30 0
	$jointconstrain "bip01 l foot" z limit -30 30 0

	$jointconstrain "bip01 r hand" x limit -40 40 0
	$jointconstrain "bip01 r hand" y limit -40 40 0
	$jointconstrain "bip01 r hand" z limit -40 40 0
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

$animation leap "floodelite_anims/Leap.smd" {
	fps 30
	loop
}
$sequence "Airborne" {
	"leap"
	activity "ACT_JUMP" 1
	fadein 0.2
	fadeout 0.2
	rotate -90
}

// .qc block generated by HLMV begins.

$surfaceprop "alienflesh"


$hboxset "default"

$hbox 0 "bip01 pelvis"	    -6.90   -6.57   -7.93     7.01    7.19    9.52
$hbox 0 "bip01 l thigh"	     1.96   -5.00   -5.00    21.96    5.00    5.00
$hbox 0 "bip01 l calf"	    -2.73   -4.50   -3.50    11.27    4.50    3.50
$hbox 0 "bip01 l horselink"	    -3.95   -6.50   -5.29    13.33    4.20    4.80
$hbox 0 "bip01 l foot"	    -4.66   -8.22   -6.63    11.62   10.62    5.90
$hbox 0 "bip01 r thigh"	     0.00   -5.00   -5.00    20.00    5.00    5.00
$hbox 0 "bip01 r calf"	    -1.80   -5.29   -2.98    12.36    4.00    3.84
$hbox 0 "bip01 r horselink"	    -3.96   -6.42   -4.80    13.30    4.20    5.29
$hbox 0 "bip01 r foot"	    -4.76   -8.22   -5.90    11.62   10.62    6.63
$hbox 0 "bip01 spine"	    -5.47   -7.50   -7.50     5.47    7.50    7.50
$hbox 0 "bip01 spine1"	    -5.00   -7.50  -10.00    15.00    7.50   10.00
$hbox 503 "bip01 l upperarm"	    -5.00   -5.00   -5.00    15.00    5.00    5.00
$hbox 503 "bip01 l forearm"	    -0.64   -4.15   -3.56    16.41    3.85    4.45
$hbox 503 "bip01 l hand"	    -0.66   -2.38   -3.47    13.92    3.74    4.62
$hbox 500 "bip01 head"	    -1.00  -13.50   -3.93     9.00    9.50    3.93
$hbox 502 "bip01 r upperarm"	    -4.00   -5.00   -5.00    16.00    5.00    5.00
$hbox 502 "bip01 r forearm"	    -2.48   -2.50   -2.50    16.40    2.50    2.50
$hbox 502 "bip01 r hand"	    -0.51   -1.41   -4.62    10.69    3.88    3.47
$hbox 501 "bip01 spine1"	     8.00    4.50    0.00    18.00    9.50   10.00

// .qc block generated by HLMV ends.




