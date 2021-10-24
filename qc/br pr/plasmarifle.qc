// Created by Crowbar 0.68

$modelname "hce\spv3\weapons\cov\plasma_rifle\PlasmaRifle.mdl"

$bodygroup "Body"
{
	studio "Plasma_Rifle.smd"
}


$surfaceprop weapon

$contents "solid"

$illumposition 0.058 0.715 -0.547

$cdmaterials "models\hce\spv3\weapon\cov\plasma_rifle\"

$attachment "muzzle" "frame gun" 9.5 0 0.2 rotate 0 0 0

$collisionmodel "Generic_Gun_Phys.SMD" {
	$automass

}

$bbox -12.409 -2.654 -8.451 10.979 2.769 7.356

      $definebone "frame gun" "" 0.000000 0.000000 0.000000 0.000000 -89.999985 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame rod_left" "frame gun" -0.405407 0.285201 5.237916 -0.000019 -180.000000 104.999023 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame wing_left" "frame rod_left" 0.000000 0.001093 1.408152 -0.000000 0.000000 -14.996999 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame rod_right" "frame gun" -0.405407 -0.285199 5.237916 -0.000000 0.000000 104.999046 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame wing_right" "frame rod_right" 0.000000 0.001091 1.408152 -0.000000 0.000000 -14.996999 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000


$sequence "ragdoll" {
	"plasmarifle_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
