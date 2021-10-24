
$scale 1
$modelname	"hce/spv3/weapons/unsc/BattleRifle.mdl"
$body BattleRifle "BattleRifle.smd"
$cdmaterials "models\hce\spv3\weapon\unsc\battle_rifle"
$surfaceprop	weapon
$collisionmodel "BattleRifle.smd" {
	$automass

}

$definebone "bip01 pelvis" "" -0.94362 0 41.900246 -89.999982 -89.999982 0 0 0 0 0 0 0
$definebone "bip01 spine" "bip01 pelvis" 3.966858 -0.004378 0.000003 -0.000057 -1.954416 -0.000229 0 0 0 0 0 0
$definebone "bip01 spine1" "bip01 spine" 5.500423 -0.008529 0 0 -3.000007 0 0 0 0 0 0 0
$definebone "bip01 r clavicle" "bip01 spine1" 10.398945 -0.26271 -1.890186 69.517495 177.275784 -2.859174 0 0 0 0 0 0
$definebone "bip01 r upperarm" "bip01 r clavicle" 6.39504 0 -0.000004 19.756443 0.329394 -6.120908 0 0 0 0 0 0
$definebone "bip01 r forearm" "bip01 r upperarm" 12.312589 0.000004 -0.000004 0.000002 -3.959482 0.000115 0 0 0 0 0 0
$definebone "bip01 r hand" "bip01 r forearm" 11.162758 0.000001 -0.000011 4.221728 2.192709 93.824471 0 0 0 0 0 0
$definebone "frame gun" "bip01 r hand" 3.884346 1.269054 0.250286 11.978946 -12.145161 -3.300466 0 0 0 0 0 0

$sequence "ragdoll" {
	"BattleRifle_ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}


$attachment "muzzle" "frame gun" 23.5 0 3.7 rotate 0 0 0