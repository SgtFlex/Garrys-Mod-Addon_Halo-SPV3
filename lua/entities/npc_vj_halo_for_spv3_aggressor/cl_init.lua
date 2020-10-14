if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('shared.lua')
require('sound_vj_track')
/*--------------------------------------------------
	=============== Creature SNPC Base ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to make creature SNPCs
--------------------------------------------------*/
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.sentFX = "sentBeamFX"
ENT.sentFXOrigin = "sentBeamFXOrigin"
ENT.Laser = Material("cable/redlaser")
ENT.firingOffset = Vector(20, 0, -18)

local target = Vector(5000, 5000, 5000)
local shootPos = Vector(0, 0, 0)
local firingPos
local spawnParticles = 1
function ENT:Initialize() 
	timer.Simple(0.1, function() hook.Add("PostDrawTranslucentRenderables", self, function() self:DrawBeam() end) end)
		spawnParticles = true
end
function ENT:Draw()
	self:DrawModel()
	self:CustomOnDraw()
end
function ENT:DrawTranslucent() self:Draw() end
function ENT:BuildBonePositions(NumBones,NumPhysBones) end
function ENT:SetRagdollBones(bIn) self.m_bRagdollSetup = bIn end
function ENT:DoRagdollBone(PhysBoneNum,BoneNum) /*self:SetBonePosition(BoneNum,Pos,Angle)*/ end
//function ENT:CalcAbsolutePosition(pos, ang) end
function ENT:CustomOnDraw()
end
-- Custom functions ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DrawBeam()
	-- print("I am drawing!"..CurTime())
	if (self:LookupAttachment("barrel") != 0) then 
		firingPos = self:GetAttachment(self:LookupAttachment("barrel"))["Pos"]
	else 
		firingPos = self:GetPos() + self:GetForward()*self.firingOffset.x + self:GetUp()*self.firingOffset.z
	end
    render.SetMaterial( self.Laser )
    if (self:GetNWBool("firing")==true) then
    	render.DrawBeam( firingPos, self:GetNWVector("SentinelBeam1",Vector( 0, 0, 0 )), 35, 1, 1, Color( 0, 0, 0, 0) )
    	if (spawnParticles == true) then
	    	local effect = EffectData()
	    	effect:SetOrigin(firingPos)
	    	effect:SetEntity(self)
	    	util.Effect(self.sentFXOrigin, effect)
	    	effect:SetOrigin(self:GetNWVector("SentinelBeam1"))
	    	util.Effect(self.sentFX, effect)
    	end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*net.Receive("vj_creature_onthememusic",function(len)
	//BroadcastLua(print("Theme music net code is running!"))
	local selfEntity = net.ReadEntity()
	if !IsValid(selfEntity) then return end
	//print(selfEntity)
	selfEntity.VJ_IsPlayingSoundTrack = true
	selfEntity:SetNetworkedBool("VJ_IsPlayingSoundTrack",true)
	local TracksTable = net.ReadTable()
	local entSoundLevel = net.ReadFloat()
	if !sound_vj_track.IsPlaying(1) then
		sound_vj_track.Play(1,TracksTable,entSoundLevel)
	end
	local t = sound_vj_track.Duration(1)
	if !t then return end
	local tCurTime = RealTime()
	local tmEnd = t + tCurTime

hook.Add("Think","thememusic_client_runtrack",function()
	//local numEnts = #util.VJ_GetSNPCsWithActiveSoundTracks()
	local fadeouttime = net.ReadFloat()
	if RealTime() >= tmEnd && IsValid(selfEntity) then
		tmEnd = RealTime() + sound_vj_track.Duration(1)
		sound_vj_track.Play(1,TracksTable,entSoundLevel)
	end
	//print(#util.VJ_GetSNPCsWithActiveSoundTracks())
	if (!selfEntity:IsValid()) then
	if #util.VJ_GetSNPCsWithActiveSoundTracks() <= 0 then
		sound_vj_track.FadeOut(1,fadeouttime)
		hook.Remove("Think","thememusic_client_runtrack")
		end
	end
 end)
end)*/