// Created by Crowbar 0.68

$modelname "hce\spv3\weapons\unsc\assault_rifle\AssaultRifle.mdl"

$bodygroup "Body"
{
	studio "Assault_Rifle.smd"
}


$surfaceprop weapon

$contents "solid"

$illumposition -29.794 -0.884 53.882

$cdmaterials "models\hce\spv3\weapon\unsc\assault_rifle\"

$attachment "muzzle" "frame gun001" 23.5 0 4.7 rotate 0 0 0

$collisionmodel "Generic_Gun_Phys.SMD" {
	$automass

}

$bbox -7.427 -59.588 41.9 9.194 0 65.864

      $definebone "bip01 pelvis" "" -0.943620 0.000000 41.900246 -89.999985 -89.999985 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "bip01 spine" "bip01 pelvis" 3.966858 -0.004378 0.000003 -0.000057 -1.954416 -0.000229 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "bip01 spine1" "bip01 spine" 5.500427 -0.008529 0.000000 -0.000000 -3.000007 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "bip01 r clavicle" "bip01 spine1" 10.398945 -0.262710 -1.890186 69.517494 177.275787 -2.859174 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "bip01 r upperarm" "bip01 r clavicle" 6.395041 0.000000 0.000000 19.756447 0.329394 -6.120907 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "bip01 r forearm" "bip01 r upperarm" 12.312590 0.000004 -0.000004 0.000004 -3.959482 0.000115 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "bip01 r hand" "bip01 r forearm" 11.162762 0.000001 -0.000011 4.221731 2.192708 93.824471 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame gun001" "bip01 r hand" 3.884346 1.269054 0.250286 11.978948 -12.145160 -3.300467 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000



$sequence "ragdoll" {
	"assaultrifle_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
