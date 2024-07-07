ENT.Base 			= "base_ai"
ENT.Type 			= "ai"
ENT.PrintName 		= "Pelican (armed)"
ENT.Author 			= "SgtFlex"
ENT.Contact 		= "http://vrejgaming.webs.com/"
ENT.Purpose 		= "Spawns units."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if (CLIENT) then
local Name = "Pelican (armed)"
local LangName = "npc_vj_halo_unsc_spv3_pelican_armed"
language.Add(LangName, Name)
killicon.Add(LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
language.Add("#"..LangName, Name)
killicon.Add("#"..LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
end