$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/weapons/cov/EnergySword/EnergySword.mdl"
$body EnergySword "EnergySword.smd"
$cdmaterials "models/hce/spv3/weapon/cov/EnergySword"
$surfaceprop	combine_glass
$sequence idle "EnergySword.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "Generic_Gun_Phys.SMD" {
	$automass
}



$definebone "frame gun" "" 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "frame blades" "frame gun" 0.000000 0.000000 0.804741 -0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000
$definebone "frame handle" "frame blades" 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000