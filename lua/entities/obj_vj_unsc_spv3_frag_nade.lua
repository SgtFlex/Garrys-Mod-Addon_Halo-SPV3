/*--------------------------------------------------
	*** Copyright (c) 2012-2020 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('bases/spv3_grenade_proj_base/init.lua')

ENT.Sound_Trail = "grenades/frag nade/trail/armed.wav"

ENT.FuseTime = 1
ENT.Bounciness = 0.35