
$scale 1
$modelname	"hce/spv3/weapons/cov/Piercer.mdl"
$body Piercer "Piercer.smd"
$cdmaterials "models\hce\spv3\weapon\cov\piercer"
$surfaceprop	combine_metal
$sequence idle "Piercer.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "Piercer.smd" {
	$automass

}

$sequence "ragdoll" {
	"Piercer_Ragdoll.smd"
	activity "ACT_DIE_RAGDOLL" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$definebone "frame gun" "" 3.884346 1.269054 0.250286 11.978946 -12.145161 -3.300466 0 0 0 0 0 270

$attachment "muzzle" "frame gun" 15 0 5.5 rotate 0 0 0