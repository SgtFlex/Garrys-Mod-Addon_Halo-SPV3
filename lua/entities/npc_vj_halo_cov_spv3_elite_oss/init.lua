AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/elite/elite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(0,0,0)
ENT.bodyGroupTable = {
	1,
	2,
	0,
	7
}
ENT.StartHealth = 50
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldHealth = 0
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.ExtraShotCount = 0
ENT.Skin=0
ENT.HasSword = true
---------------------------------------------------------------------------------------------------------------------------------------------

function ENT:CustomOnInitialize()
	self.material = self:GetMaterial()
	timer.Simple(0.01, function()
		self.weaponMaterial = self:GetActiveWeapon():GetMaterial()
		self:GetActiveWeapon():SetMaterial("models/props_c17/frostedglass_01a")

	end)
	self:SetMaterial("models/props_c17/frostedglass_01a")
	self:AddFlags(FL_NOTARGET)
	self:SetSkin(self.Skin)
	self:RandomizeTraits()
	-- local matEnt = ents.Create("material_modify_control")
	-- matEnt:Spawn()
	-- matEnt:SetKeyValue("MaterialName", "models/hce/spv3/cov/elite/elite_main_diff_blue")
	-- matEnt:SetKeyValue("MaterialVar", "$color2")
	-- matEnt:SetKeyValue("MaterialVarValue", "[5 1 1]")
	self:SetSkin(self.Skin)
-- 	timer.Simple(0.1, function()
-- 	if (self:GetActiveWeapon().HoldType=="ar2") then
-- 		self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
-- 		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_Run = {ACT_RUN_RIFLE}
-- 		self.AnimTbl_TakingCover = {ACT_COVER_MED}
-- 		self.AnimTbl_WeaponAttackCrouch = {ACT_COVER_MED}
-- 	elseif (self:GetActiveWeapon().HoldType == "melee") then
-- 		self.MeleeAttackDamage = 300 * GetConVarNumber("vj_spv3_damageModifier")
-- 		self.AnimTbl_ShootWhileMovingRun = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_ShootWhileMovingWalk = {ACT_MP_RUN_MELEE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_Run = {ACT_MP_RUN_MELEE}
-- 		self.AnimTbl_IdleStand = {ACT_IDLE_MELEE}
-- 		self.AnimTbl_WeaponAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations

-- 		self.Berserked = true
-- 	end
-- end)
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	self.NextMoveTime = 0
	self.NextDodgeTime = 0
	self.NextMoveAroundTime = 0
	self.NextBlockTime = 0
	self.onfire = false
	self.UsingMagic = false
	self:SetColor(self.modelColor)
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end
	self:SetCollisionBounds(Vector(30, 30, 85), Vector(-30, -30, 0))
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	-- Shields & Health --
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self.ShieldHealth = self.ShieldHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self.ShieldActivated = true
	self:SetHealth(self.ShieldHealth + self.StartHealth)

end


ENT.ShieldDelay = 6
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	self:SetMaterial(self.material)
	self:RemoveFlags(FL_NOTARGET)
	self:GetActiveWeapon():SetMaterial(self.weaponMaterial)
	timer.Create("Uncloak"..self:GetCreationID(), 1, 1, function()
		if (IsValid(self) and self:Health()>0) then
			self:SetMaterial("models/props_c17/frostedglass_01a")
			self:AddFlags(FL_NOTARGET)
			self:GetActiveWeapon():SetMaterial("models/props_c17/frostedglass_01a")
		end
	end)
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB) then
			self:FlyingDeath(dmginfo)
		end
	end
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.HasDeathSounds = false -- If set to false, it won't play the death sounds
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter:SetOwner(self)
	self.imposter.Sequence = "Die_Airborne"
	local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
	if (dmginfo:GetDamageType()==DMG_CLUB) then
		velocity = velocity * 0.3
	end
	self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
	self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
	self.imposter:Spawn()
end

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------