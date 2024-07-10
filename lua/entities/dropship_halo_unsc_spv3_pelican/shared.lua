ENT.Base 			= "dropship_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Pelican (unarmed)"
ENT.Author 			= "SgtFlex"
ENT.Contact 		= "http://vrejgaming.webs.com/"
ENT.Purpose 		= "Let it eat you."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if (CLIENT) then
local Name = "Pelican (unarmed)"
local LangName = "dropship_halo_unsc_spv3_pelican"
language.Add(LangName, Name)
killicon.Add(LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
language.Add("#"..LangName, Name)
killicon.Add("#"..LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
end