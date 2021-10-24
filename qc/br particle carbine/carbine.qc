// Created by Crowbar 0.68

$modelname "hce\spv3\weapons\cov\carbine\Carbine.mdl"

$bodygroup "Body"
{
	studio "Carbine.smd"
}


$surfaceprop	weapon


$illumposition 0 -12.876 -0.363

$cdmaterials "models\hce\spv3\weapon\cov\particle_carbine\"

$attachment "muzzle" "frame gun" 38 0 1.1 rotate 0 0 0

$collisionmodel "Generic_Gun_Phys.SMD" {
	$automass

}

$bbox -12.922 -2.981 -8.502 38.674 2.981 7.776

$definebone "frame gun" "" 0.000000 0.000000 0.000000 0.000000 -89.999985 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame barrel" "frame gun" 11.096354 0.000000 1.182982 -0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "frame clip" "frame gun" 6.057764 0.000000 4.483402 30.000015 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
      $definebone "carbine_gray" "" 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000



$sequence "ragdoll" {
	"carbine_anims\ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
