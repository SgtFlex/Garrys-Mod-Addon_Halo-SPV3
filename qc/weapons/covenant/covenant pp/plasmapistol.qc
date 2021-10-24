// Created by Crowbar 0.68

$modelname "hce\spv3\weapons\cov\plasma_pistol\PlasmaPistol.mdl"

$definebone "frame gun" "" 0.000000 -4.494970 10.656643 0.000000 -89.999985 0.000000 0.000000 0.000000 -4.000000 0.000000 0.000000 0.000000

$bodygroup "Body"
{
	studio "Plasma_pistol.smd"
}


$surfaceprop weapon

$contents "solid"

$illumposition 0 -5.253 0.04

$cdmaterials "models\hce\spv3\weapon\cov\plasma_pistol\"

$attachment "muzzle" "frame gun" 7 0 -2.2 rotate 0 0 0

$collisionmodel "Generic_Gun_Phys.SMD" {
	$automass

}


$bbox -1.761 -1.044 -5.254 12.267 1.044 5.334




$sequence "ragdoll" {
	"plasmapistol_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
