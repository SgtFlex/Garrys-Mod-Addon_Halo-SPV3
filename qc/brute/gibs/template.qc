$origin 0 0 0 -90
$scale 1
$modelname	"hce/spv3/cov/brute/garbage/ultra_leg_2.mdl"
$body ultra_leg_2 "ultra_leg_2.smd"
$cdmaterials "models/hce/spv3/cov/brute"
$surfaceprop	combine_metal
$sequence idle "ultra_leg_2.smd"  activity ACT_IDLE -1 loop fps 30
$collisionmodel "ultra_leg_2.smd" {
	$automass
}

$texturegroup "skinfamilies"
{
	{"brute_armour_very_common"	"brute_armour_common"		"brute_armour_uncommon"		"brute_armour_rare"}
	{"blue_very_common"			"blue_common"				"blue_uncommon"				"blue_rare"}
	{"red_very_common"			"red_common"				"red_uncommon"				"red_rare"}
	{"gold_very_common"			"gold_common"				"gold_uncommon"				"gold_rare"}
}