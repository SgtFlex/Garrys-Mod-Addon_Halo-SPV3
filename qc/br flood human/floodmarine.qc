// Created by Crowbar 0.68

$modelname "hce\spv3\flood\human\FloodMarine.mdl"
$bodygroup "empty"
{
	blank
}
$bodygroup "Body"
{
	studio "Torso.smd"
	studio "Torso_ODST.smd"
	studio "Torso_Damaged.smd"
}
$bodygroup "Legs"
{
	studio "Legs.smd"
	studio "Legs_ODST.smd"
}
$bodygroup "Right Arm"
{
	studio "RightArm.SMD"
	studio "RightArm_ODST.SMD"
	studio "RightArm_Damaged.SMD"
}
$bodygroup "Left Arm"
{
	studio "LeftArm.SMD"
	studio "LeftArm_Damaged.SMD"
}
$bodygroup "Head"
{
	studio "Head.SMD"
	studio "Head_ODST.SMD"
	studio "Head_Damaged.SMD"
}


$surfaceprop "alienflesh"

$contents "solid"

$illumposition -0.296 9.352 39.109

$cdmaterials "models\hce\spv3\flood\infector\"
$cdmaterials "models\hce\spv3\flood\human\"
$cdmaterials "models\hce\spv3\flood\elite\"
$cdmaterials "models\hce\spv3\unsc\armored\"
$cdmaterials "models\hce\spv3\unsc\marine\"
$cdmaterials "models\hce\spv3\unsc\odst\"

$cbox 0 0 0 0 0 0

$bbox -51.017 -22.024 -0.15 32.314 21.431 78.369

$definebone "bip01 pelvis" "" -0.94362 0 41.900246 -89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "bip01 l thigh" "bip01 pelvis" -0.000004 0.000006 4.145658 0.000091 177.770399 -179.999896 0 0 0 0 0 0
$definebone "bip01 l calf" "bip01 l thigh" 18.255096 0 0.000001 0 -10.959193 0 0 0 0 0 0 0
$definebone "bip01 l foot" "bip01 l calf" 17.94173 -0.000001 -0.000002 0 8.729414 0 0 0 0 0 0 0
$definebone "bip01 r thigh" "bip01 pelvis" 0.000004 -0.000006 -4.145669 0.000091 177.770399 -179.999896 0 0 0 0 0 0
$definebone "bip01 r calf" "bip01 r thigh" 18.255091 0 0.000001 0 -10.959193 0 0 0 0 0 0 0
$definebone "bip01 r foot" "bip01 r calf" 17.941729 0 -0.000002 0 8.729414 0 0 0 0 0 0 0
$definebone "bip01 spine" "bip01 pelvis" 3.966858 -0.004378 0.000003 -0.000057 -1.954416 -0.000229 0 0 0 0 0 0
$definebone "bip01 spine1" "bip01 spine" 5.50042 -0.008529 0 0 -3.000007 0 0 0 0 0 0 0
$definebone "bip01 l clavicle" "bip01 spine1" 10.399788 -0.262664 1.766676 -78.010568 -138.608102 -42.065359 0 0 0 0 0 0
$definebone "bip01 l upperarm" "bip01 l clavicle" 6.395038 -0.000001 0 36.408142 -2.107684 9.359726 0 0 0 0 0 0
$definebone "bip01 l forearm" "bip01 l upperarm" 12.312595 0 -0.000023 -0.000004 -3.959483 0.000001 0 0 0 0 0 0
$definebone "bip01 l hand" "bip01 l forearm" 11.16275 0 -0.000008 -4.221729 2.192709 -93.824362 0 0 0 0 0 0
$definebone "frame spike-long-base" "bip01 l forearm" 10.042134 -1.986004 3.535759 -1.409361 -86.391265 13.636114 0 0 0 0 0 0
$definebone "frame spike-long-mid" "frame spike-long-base" 2.774686 13.764343 -3.18528 0.000001 0.000001 -4.999971 0 0 0 0 0 0
$definebone "frame spike-long-end" "frame spike-long-mid" 2.238559 10.837673 -1.352428 0 0.000001 38.500018 0 0 0 0 0 0
$definebone "frame spike-med-base" "bip01 l forearm" 10.711076 1.101643 4.243965 -3.133104 -83.738017 14.557027 0 0 0 0 0 0
$definebone "frame spike-med-mid" "frame spike-med-base" -1.069823 11.67802 -3.162025 0.000001 0 46.999959 0 0 0 0 0 0
$definebone "frame spike-med-end" "frame spike-med-mid" -0.931786 4.790424 -8.046471 0.000001 0 -14.99998 0 0 0 0 0 0
$definebone "frame spike-short-base" "bip01 l forearm" 3.395483 -0.131721 3.583965 -1.409304 -86.391149 14.636038 0 0 0 0 0 0
$definebone "frame spike-short-mid" "frame spike-short-base" -0.211607 4.764573 3.156567 0.000001 0.000001 -11.999915 0 0 0 0 0 0
$definebone "frame spike-short-end" "frame spike-short-mid" 0.637548 6.050802 2.782951 0 0.000001 -32.500004 0 0 0 0 0 0
$definebone "bip01 neck" "bip01 spine1" 10.726906 -0.002677 0.000401 17.872501 -5.432385 -8.958769 0 0 0 0 0 0
$definebone "bip01 head" "bip01 neck" 3.402527 0 0 41.565222 7.533019 -15.050629 0 0 0 0 0 0
$definebone "bip01 ponytail1" "bip01 head" 1.209797 0.741654 -0.000008 -0.00006 112.480675 -0.000164 0 0 0 0 0 0
$definebone "bip01 r clavicle" "bip01 spine1" 10.398949 -0.262712 -1.890186 78.01078 -138.609059 42.064379 0 0 0 0 0 0
$definebone "bip01 r upperarm" "bip01 r clavicle" 6.395037 0 -0.000004 -36.408023 -2.107568 -9.359723 0 0 0 0 0 0
$definebone "bip01 r forearm" "bip01 r upperarm" 12.312588 -0.000001 0 0.000001 -3.959482 0 0 0 0 0 0 0
$definebone "bip01 r hand" "bip01 r forearm" 11.162755 0.000001 -0.000015 4.221783 2.192767 93.824362 0 0 0 0 0 0
$definebone "frame gun" "bip01 r hand" 2 2.5 0 0 15 20 0 0 0 0 0 0

$bonemerge	"bip01 r hand"
$bonemerge	"frame gun"
$hierarchy "frame gun" "bip01 r hand"
$attachment "Cannon" "frame gun" 0 0 0 rotate 0 0 0
$attachment "anim_attachment_LH" "bip01 l hand" 0 0 0 rotate 0 0 0


$definebone "frame antenna-large-base" "bip01 spine1" 10.624153 3.249797 2.094748 -26.457588 98.302541 88.375988 0 0 0 0 0 0
$definebone "frame antenna-large-middle" "frame antenna-large-base" 3.085092 -1.813377 3.201218 -0.000001 11.500016 0.000001 0 0 0 0 0 0
$definebone "frame antenna-large-top" "frame antenna-large-middle" 1.53336 -3.023419 3.928413 0 -11.000037 0.000058 0 0 0 0 0 0
$definebone "frame antenna-large-frond" "frame antenna-large-top" 3.894852 -1.556581 3.662926 -3.483812 -5.510188 0.335868 0 0 0 0 0 0
$definebone "frame antenna-medium-base" "bip01 spine1" 9.165527 4.917836 1.432911 21.499996 94.954437 90.000078 0 0 0 0 0 0
$definebone "frame antenna-medium-top" "frame antenna-medium-base" 2.959974 1.010248 0.523544 0 -0.000002 0 0 0 0 0 0 0
$definebone "frame antenna-medium-frond" "frame antenna-medium-top" 3.058137 0.921206 0.836468 0.995342 -5.500799 -0.095913 0 0 0 0 0 0
$definebone "frame antenna-small-base" "bip01 spine1" 9.673679 3.411026 3.42217 -30.500036 94.954355 89.999982 0 0 0 0 0 0
$definebone "frame antenna-small-frond" "frame antenna-small-base" 6.008244 -0.581355 3.128155 0 -9.999997 0 0 0 0 0 0 0

$ikchain l_foot "bip01 l foot" Z 0 height 36
$ikchain r_foot "bip01 r foot" Z 0 height 36

$cmdlist lockfeet {
    ikrule l_foot footstep
    ikrule r_foot footstep
}

$sectionframes 30 120

$poseparameter "move_yaw" -180 180 loop 0

$animation "death1" "floodmarine_anims\death1.smd" {
	fps 30
	walkframe 47 LX LY
}

$animation "death2" "floodmarine_anims\death2.smd" {
	fps 30
	walkframe 39 LX LY
}

$animation "wF" "floodmarine_anims\wF.smd" {
	fps 30
	loop
	walkframe 64 LX LY
}

$animation "rf" "floodmarine_anims\rf.smd" {
	fps 30
	loop
	walkframe 29 LX LY
}

$animation "melee1" "floodmarine_anims\melee1.smd" {
	fps 30
	walkframe 49 LX LY
}

$animation "melee2" "floodmarine_anims\melee2.smd" {
	fps 30
	walkframe 44 LX LY
}

$animation "death_airborne" "floodmarine_anims/Die_Airborne.SMD" {
	fps 30
	loop
}

$sequence "Die_Airborne" {
	"death_Airborne"
	fadein 0.2
	fadeout 0.2
}

$sequence "ragdoll" {
	"floodmarine_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_1" {
	"floodmarine_anims\Idle_1.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_2" {
	"floodmarine_anims\Idle_2.smd"
	cmdlist lockfeet
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "Idle_3" {
	"floodmarine_anims\Idle_3.smd"
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

$sequence "Walk" {
	"wF"
	ikrule l_foot footstep range .. 25 14 ..
	ikrule r_foot footstep range .. 64 48 ..
	activity "ACT_WALK" 1
	blend "move_yaw" -180 180
	{ event 1100 14 "Longmove" }
	{ event 1100 47 "Longmove" }
	{ event 1100 64 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Run" {
	"rf"
	ikrule l_foot footstep range .. 15 23 ..
	ikrule r_foot footstep range .. 29 7 ..
	activity "ACT_RUN" 1
	blend "move_yaw" -180 180
	{ event 1100 17 "Shortmove" }
	{ event 1100 29 "Shortmove" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_1" {
	"melee1"
	activity "ACT_MELEE1" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee" }
	{ event 1100 17 "Step" }
	{ event 1100 17 "Hit" }
	{ event 1100 19 "Hit" }
	{ event 1100 40 "Step" }
	{ event 1100 49 "Step" }
	fadein 0.2
	fadeout 0.2
}

$sequence "Melee_2" {
	"melee2"
	activity "ACT_MELEE2" 1
	blend "move_yaw" -180 180
	{ event 1100 0 "Melee" }
	{ event 1100 10 "Step" }
	{ event 1100 21 "Step" }
	{ event 1100 29 "Step" }
	{ event 1100 37 "Step" }
	{ event 1100 12 "Hit" }
	{ event 1100 14 "Hit" }
	fadein 0.2
	fadeout 0.2
}

$collisionjoints "floodmarine_physics.smd"
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
	$jointconstrain "bip01 l calf" z limit -90 10 0

	$jointconstrain "bip01 r thigh" x limit 0 0 0
	$jointconstrain "bip01 r thigh" y limit -40 20 0
	$jointconstrain "bip01 r thigh" z limit -70 40 0

	$jointconstrain "bip01 r calf" x limit 0 0 0
	$jointconstrain "bip01 r calf" y limit 0 0 0
	$jointconstrain "bip01 r calf" z limit -90 10 0

	$jointconstrain "bip01 r foot" x limit -30 30 0
	$jointconstrain "bip01 r foot" y limit -30 30 0
	$jointconstrain "bip01 r foot" z limit -30 30 0

	$jointconstrain "bip01 spine1" x limit -30 30 0
	$jointconstrain "bip01 spine1" y limit -30 30 0
	$jointconstrain "bip01 spine1" z limit -50 50 0

	$jointconstrain "bip01 l upperarm" x limit 0 0 0
	$jointconstrain "bip01 l upperarm" y limit -60 20 0
	$jointconstrain "bip01 l upperarm" z limit -80 80 0

	$jointconstrain "bip01 l forearm" x limit 0 0 0
	$jointconstrain "bip01 l forearm" y limit 0 0 0
	$jointconstrain "bip01 l forearm" z limit -90 3 0

	$jointconstrain "frame spike-med-base" x limit -40 40 0
	$jointconstrain "frame spike-med-base" y limit -40 40 0
	$jointconstrain "frame spike-med-base" z limit -40 40 0

	$jointconstrain "frame spike-med-mid" x limit -30 10 0
	$jointconstrain "frame spike-med-mid" y limit -40 40 0
	$jointconstrain "frame spike-med-mid" z limit -40 40 0

	$jointconstrain "frame spike-short-mid" x limit -50 10 0
	$jointconstrain "frame spike-short-mid" y limit -40 40 0
	$jointconstrain "frame spike-short-mid" z limit -40 40 0

	$jointconstrain "frame spike-short-end" x limit -40 40 0
	$jointconstrain "frame spike-short-end" y limit -40 40 0
	$jointconstrain "frame spike-short-end" z limit -40 40 0

	$jointconstrain "bip01 l hand" x limit -30 30 0
	$jointconstrain "bip01 l hand" y limit -40 40 0
	$jointconstrain "bip01 l hand" z limit -40 40 0

	$jointconstrain "frame spike-long-base" x limit -40 40 0
	$jointconstrain "frame spike-long-base" y limit -40 40 0
	$jointconstrain "frame spike-long-base" z limit -40 40 0

	$jointconstrain "bip01 r upperarm" x limit 0 0 0
	$jointconstrain "bip01 r upperarm" y limit -20 60 0
	$jointconstrain "bip01 r upperarm" z limit -80 80 0

	$jointconstrain "bip01 r forearm" x limit 0 0 0
	$jointconstrain "bip01 r forearm" y limit 0 0 0
	$jointconstrain "bip01 r forearm" z limit -90 3 0

	$jointconstrain "bip01 r hand" x limit -40 40 0
	$jointconstrain "bip01 r hand" y limit -40 40 0
	$jointconstrain "bip01 r hand" z limit -40 40 0

	$jointconstrain "frame antenna-large-base" x limit -50 50 0
	$jointconstrain "frame antenna-large-base" y limit -50 50 0
	$jointconstrain "frame antenna-large-base" z limit -50 50 0

	$jointconstrain "frame antenna-large-top" x limit -50 50 0
	$jointconstrain "frame antenna-large-top" y limit -50 50 0
	$jointconstrain "frame antenna-large-top" z limit -50 50 0

	$jointconstrain "frame antenna-medium-base" x limit -50 50 0
	$jointconstrain "frame antenna-medium-base" y limit -50 50 0
	$jointconstrain "frame antenna-medium-base" z limit -50 50 0

	$jointconstrain "frame antenna-medium-top" x limit -50 50 0
	$jointconstrain "frame antenna-medium-top" y limit -50 50 0
	$jointconstrain "frame antenna-medium-top" z limit -50 50 0

	$jointconstrain "frame antenna-small-base" x limit -50 50 0
	$jointconstrain "frame antenna-small-base" y limit -50 50 0
	$jointconstrain "frame antenna-small-base" z limit -50 50 0

	$jointconstrain "frame antenna-small-frond" x limit -50 50 0
	$jointconstrain "frame antenna-small-frond" y limit -50 50 0
	$jointconstrain "frame antenna-small-frond" z limit -50 50 0

	$jointconstrain "frame spike-long-mid" x limit -50 20 0
	$jointconstrain "frame spike-long-mid" y limit -40 40 0
	$jointconstrain "frame spike-long-mid" z limit -40 40 0

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

$sequence "Airborne" {
	"floodmarine_anims/Airborne.SMD"
	activity "ACT_JUMP" 1
	fadein 0.2
	fadeout 0.2
	rotate -90
}
// .qc block generated by HLMV begins.

$surfaceprop "alienflesh"


$hboxset "default"

$hbox 0 "bip01 pelvis"	    -9.64   -8.77   -7.25     4.52    6.80    7.25
$hbox 0 "bip01 l thigh"	    -0.75   -3.50   -3.50    19.53    3.50    3.50
$hbox 0 "bip01 l calf"	    -3.71   -3.50   -3.50    19.46    3.50    3.50
$hbox 0 "bip01 l foot"	     0.00   -4.79   -3.60     5.92    8.73    2.39
$hbox 0 "bip01 r thigh"	    -1.23   -3.50   -3.50    19.70    3.50    3.50
$hbox 0 "bip01 r calf"	    -4.11   -3.50   -3.50    15.90    3.50    3.50
$hbox 0 "bip01 r foot"	     0.00   -4.79   -2.39     5.92    8.73    3.60
$hbox 0 "bip01 spine"	    -1.40   -3.50   -6.00     8.60    3.50    6.00
$hbox 0 "bip01 spine1"	     0.00   -5.00   -7.50    10.00    5.00    7.50
$hbox 503 "bip01 l clavicle"	     0.00   -3.50   -3.36     7.29    3.66    3.20
$hbox 503 "bip01 l upperarm"	    -3.50   -2.50   -2.50    11.50    2.50    2.50
$hbox 503 "bip01 l forearm"	    -3.50   -3.00   -3.00    11.50    3.00    3.00
$hbox 503 "bip01 l hand"	    -0.92   -1.32   -2.68     5.68    3.80    2.06
$hbox 500 "bip01 neck"	     0.00   -2.34   -3.25     6.93    3.54    2.31
$hbox 500 "bip01 head"	     1.13   -3.50   -3.29     8.13    3.50    3.71
$hbox 502 "bip01 r clavicle"	     0.00   -3.37   -2.75     6.96    3.18    3.56
$hbox 502 "bip01 r upperarm"	    -3.50   -2.50   -2.50    11.50    2.50    2.50
$hbox 502 "bip01 r forearm"	    -4.41   -2.50   -2.50    11.84    2.50    2.50
$hbox 502 "bip01 r hand"	    -0.36   -1.72   -1.68     7.35    3.02    3.25
$hbox 501 "bip01 spine1"	     4.50    3.50   -0.50    11.50    6.50    6.50

// .qc block generated by HLMV ends.



//Yellow = X
//Green = Y
//Blue = Z
