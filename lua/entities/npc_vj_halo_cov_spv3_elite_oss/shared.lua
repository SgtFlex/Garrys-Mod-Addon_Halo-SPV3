ENT.Base 			= "spv3_snpc_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Elite Minor"
ENT.Author 			= "Mayhem"
ENT.Contact 		= "http://vrejgaming.webs.com/"
ENT.Purpose 		= "Let it eat you."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if CLIENT then
	local string_lower = string.lower
	local string_find = string.find
	local scale0 = Vector(0,0,0)
	local scale1 = Vector(1,1,1)
	local matLaser = Material("sprites/avp/turret_laser_fade")
	local matLaserStart = Material("vj_base/effects/muzzlestarlarge_01")
	local laserColor = Color(255,0,0,135)
    function ENT:Initialize()
		self.Mat_cloakfactor = 0.999
		self.CL_PreviousVisionMode = 0
	end

	local math_abs = math.abs
	local blueFX = Vector(0,0.4,6)
	local androidFX = Vector(2,2,2)
	local whiteFX = Vector(1,1,1)
    matproxy.Add({
        name = "AVP_Cloak",
        init = function(self,mat,values)
            self.Result = values.resultvar
            self.CloakColorTint = mat:GetVector("$cloakcolortint") or whiteFX
        end,
        bind = function(self,mat,ent)
            if (!IsValid(ent)) then return end
            local ply = LocalPlayer()

            local parent = ent:GetParent()
            local checkEnt = IsValid(parent) && parent or ent
            ent.Mat_cloakfactor = ent.Mat_cloakfactor or (IsValid(parent) && parent.Mat_cloakfactor or 0)
            local curValue = ent.Mat_cloakfactor
            local finalResult = curValue or 0
            local disruptTime = ent.VJ_AVP_Predator && checkEnt:GetCloakDisruptTime() or 0
            if checkEnt.GetCloaked then
                if checkEnt:GetCloaked() then
                    if disruptTime > CurTime() then
                        local remaining = disruptTime -CurTime()
                        finalResult = 0.97 +math.sin(CurTime() *2) *0.03
                    else
                        finalResult = checkEnt:IsNPC() && (checkEnt:GetSprinting() or (checkEnt.GetJumpPosition && checkEnt:GetJumpPosition() != scale0)) && 0.97 or 0.997
                    end
                else
                    finalResult = 0
                    finalResultRefract = 0
                end
            end
            ent.Mat_cloakfactor = Lerp(FrameTime() *0.3,curValue,finalResult)
            self.CloakColorTint = LerpVector(FrameTime() *0.3,self.CloakColorTint, math_abs(curValue -finalResult) > 0.1 && blueFX or whiteFX)
            if IsValid(ply.VJCE_NPC) && ply.VJCE_NPC.VJ_AVP_Predator && ent:GetClass() == "viewmodel" && ent:GetOwner() == ply then
                ent.Mat_cloakfactor = ply.VJCE_NPC.Mat_cloakfactor
                ent.CloakColorTint = ply.VJCE_NPC.CloakColorTint
            end
            mat:SetVector("$cloakcolortint",self.CloakColorTint)
            mat:SetFloat(self.Result,ent.Mat_cloakfactor)

            -- print(ent,ent.Mat_cloakfactor,self.CloakColorTint)
        end
    })
end
