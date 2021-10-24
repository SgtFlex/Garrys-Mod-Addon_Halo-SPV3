
$scale 1
$modelname	"hce/spv3/weapons/unsc/FragGrenade.mdl"
$body FragGrenade "FragGrenade_Base.smd"
$cdmaterials "models/hce/spv3/weapon/unsc/frag_grenade"
$surfaceprop	weapon
$sequence idle "FragGrenade_Base.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "FragGrenade_Phys.smd" {
	$automass
}
