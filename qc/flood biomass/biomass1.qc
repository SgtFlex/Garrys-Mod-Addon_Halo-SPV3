
$scale 1
$modelname	"hce/spv3/flood/Biomass1/Biomass1.mdl"
$cdmaterials "models/hce/spv3/flood/Biomass"
$surfaceprop	flesh
$sequence "idle" {
	"Biomass1_anim.smd"
	fadein 0.2
	fadeout 0.2
	rotate -90
	loop
}
$collisionmodel "Biomass2_blob.smd" {
	$automass

}
$bodygroup "Body"
{
	studio "Biomass1_under.smd"
	studio "Biomass2_under.smd"
	studio "Biomass3_under.smd"
}
$bodygroup "Blob"
{
	studio "Biomass1_blob.smd"
	studio "Biomass2_blob.smd"
	studio "Biomass3_blob.smd"
	blank
}