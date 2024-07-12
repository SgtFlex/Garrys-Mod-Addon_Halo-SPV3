SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Needler"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/needler/needler.mdl"
SWEP.Primary.Sound				= {"weapons/needler/fire/Needler_Shot_1.ogg","weapons/needler/fire/Needler_Shot_2.ogg","weapons/needler/fire/Needler_Shot_3.ogg",}
SWEP.ReloadSound = {"weapons/needler/reload/base.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Delay				= 0.1-- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Damage				= 3
SWEP.Primary.ClipSize			= 20 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.65 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 1
SWEP.NPC_CustomSpread 			= 0.05 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.12 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_nr_shot"
SWEP.Primary.ProjectileSpeed = 1000
SWEP.PrintName					= "Needler"
SWEP.HoldType 					= "pistol"
SWEP.PrimaryEffects_DynamicLightColor = Color(220, 0, 255, 255)
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	if (self:GetOwner():IsNPC()) then
		self.Primary.Damage	= self.Primary.Damage * GetConVarNumber("vj_spv3_damageModifier") -- Damage
		self.TargetedEnemy = self:GetOwner():GetEnemy()
	elseif (self:GetOwner():IsPlayer()) then
		local trace = {
			start = self:GetOwner():EyePos(),
			endpos = self:GetOwner():EyePos() + self:GetOwner():EyeAngles():Forward() * 5000,
			filter = self,
		}
		local tr = util.TraceLine(trace)
		self.TargetedEnemy = tr.HitEntity
	end
	
	local Needle = ents.Create(self.Primary.Projectile)
	local OwnerPos = self.Owner:GetShootPos()
	local OwnerAng = self.Owner:GetAimVector():Angle()
	if (self.Owner:IsPlayer()) then Needle:SetPos(OwnerPos) else Needle:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos) end
	if (self.Owner:IsPlayer() or self.Owner:IsNPC()) then Needle:SetAngles(OwnerAng) else Needle:SetAngles(self:GetAngles()) end
	
	Needle:Activate()
	Needle:Spawn()
	--Needle.TargetedEnemy = self:GetOwner():GetEnemy()
	local phy = Needle:GetPhysicsObject()
	if phy:IsValid() then
		if self.Owner:IsPlayer() then
			phy:ApplyForceCenter(self.Owner:GetAimVector() * self.Primary.ProjectileSpeed) else //200000
			phy:ApplyForceCenter(((self.Owner:GetEnemy():GetPos() + self.Owner:GetEnemy():OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzle"))["Pos"]):GetNormalized()*self.Primary.ProjectileSpeed))
		end
	end
	Needle:SetOwner(self:GetOwner())
end
