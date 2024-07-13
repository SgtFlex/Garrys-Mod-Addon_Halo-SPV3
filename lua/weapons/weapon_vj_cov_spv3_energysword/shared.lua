SWEP.Base = "weapon_vj_spv3_base"
SWEP.PrintName = "SPV3 Energy Sword"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Halo CE SPV3"
SWEP.Spawnable = true

	-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
SWEP.Slot = 0 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos = 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
end

SWEP.ViewModel 					= "models/weapons/c_stunstick.mdl"
SWEP.WorldModel					= "models/hce/spv3/weapons/cov/energysword/energysword.mdl"
SWEP.HoldType = "melee"
SWEP.Primary.Delay				= 1-- Time until it can shoot again
SWEP.Primary.Burst						= false -- Is it a burst weapon?
SWEP.Primary.Automatic					= false -- Is it automatic?
SWEP.Primary.Damage = 300 -- Damage
SWEP.IsMeleeWeapon = true -- Should this weapon be a melee weapon?

SWEP.NPC_NextPrimaryFire = 1.2 -- Next time it can use primary fire
SWEP.NPC_TimeUntilFire = 0.8 -- How much time until the bullet/projectile is fired?
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