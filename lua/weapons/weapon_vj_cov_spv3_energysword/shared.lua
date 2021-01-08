if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('weapons/weapon_vj_spv3_wbase/shared.lua')

SWEP.PrintName					= "SMG"
SWEP.WorldModel					= "models/hce/spv3/weapons/cov/energysword/energysword.mdl"
SWEP.HoldType = "melee"
SWEP.Primary.Damage = 300 -- Damage
SWEP.IsMeleeWeapon = true -- Should this weapon be a melee weapon?

SWEP.NPC_NextPrimaryFire = 0.5 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire = 0.5 -- How much time until the bullet/projectile is fired?
SWEP.MeleeWeaponDistance = 150 -- If it's this close, it will attack

SWEP.Primary.Sound				= {
	"weapons/energy sword/hit/hit (1).ogg",
	"weapons/energy sword/hit/hit (2).ogg",
	"weapons/energy sword/hit/hit (3).ogg",
	"weapons/energy sword/hit/hit (4).ogg",
	"weapons/energy sword/hit/hit (5).ogg",
	"weapons/energy sword/hit/hit (6).ogg",
	"weapons/energy sword/hit/hit (7).ogg",
	"weapons/energy sword/hit/hit (8).ogg",
	"weapons/energy sword/hit/hit (9).ogg",
	"weapons/energy sword/hit/hit (10).ogg",
	"weapons/energy sword/hit/hit (11).ogg",
}

function SWEP:CustomOnInitialize() 
	self:EmitSound("weapons/energy sword/ready/ready.ogg")
	if (self:GetOwner():IsNPC()) then
		self.Primary.Damage	= self.Primary.Damage * GetConVarNumber("vj_spv3_damageModifier") -- Damage
	end
	self:SetColor(self.Color)
	self:GetOwner().HasWeaponReload = self.NPC_HasReload
	local Owner = self:GetOwner()
	for i=1,(self.NPC_ExtraShotsPerFire) do
		table.insert(self.NPC_TimeUntilFireExtraTimers, self.NPC_TimeUntilFire*(1+#self.NPC_TimeUntilFireExtraTimers))
	end
	if (self.Primary.Burst ==false) then
		if Owner.ExtraShotCount then
			for i=1,(Owner.ExtraShotCount) do
				table.insert(self.NPC_TimeUntilFireExtraTimers, self.NPC_TimeUntilFire*(1+#self.NPC_TimeUntilFireExtraTimers))
			end
		end
	end
end