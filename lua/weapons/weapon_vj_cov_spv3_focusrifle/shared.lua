SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName = "SPV3 Focus Rifle"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/focusrifle.mdl"
SWEP.Primary.Sound				= {}
SWEP.ReloadSound = {"weapons/brute shot/reload/reload_full_1.ogg", "weapons/brute shot/reload/reload_full_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.Delay				= 0.05-- Time until it can shoot again
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.TracerType 		= "ToolTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Damage				= 3
SWEP.Primary.ClipSize			= 3000 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 2 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 30
SWEP.NPC_CustomSpread 			= 0.3 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.04 -- How much time until the bullet/projectile is fired?
SWEP.NPC_HasReload = false
SWEP.PrimaryEffects_DynamicLightColor = Color(255, 93, 0, 255)
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	self.firingSound = CreateSound(self, "weapons/focus rifle/fire/OMG_LAZOR_2.ogg")
	self.firingSound:Play()
	if (!timer.Exists("currentFiring"..self:GetCreationID())) then
		timer.Create("currentFiring"..self:GetCreationID(), 0.051, 1, function() if (IsValid(self)) then self.firingSound:Stop() end end)
	else
		timer.Remove("currentFiring"..self:GetCreationID())
		timer.Create("currentFiring"..self:GetCreationID(), 0.051, 1, function() if (IsValid(self)) then self.firingSound:Stop() end end)
	end
if (CLIENT) then return end
if (self.Primary.DisableBulletCode==false) then return end
	local SpawnBlaserRod = ents.Create(self.Primary.Projectile)
	local OwnerPos = self.Owner:GetShootPos()
	local OwnerAng = self.Owner:GetAimVector():Angle()
	if self.Owner:IsPlayer() then SpawnBlaserRod:SetPos(OwnerPos) else SpawnBlaserRod:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos) end
	if self.Owner:IsPlayer() then SpawnBlaserRod:SetAngles(OwnerAng) else SpawnBlaserRod:SetAngles(self.Owner:GetAngles()) end
	SpawnBlaserRod:SetOwner(self.Owner)
	SpawnBlaserRod:Activate()
	SpawnBlaserRod:Spawn()
	local phy = SpawnBlaserRod:GetPhysicsObject()
	if phy:IsValid() then
		if self.Owner:IsPlayer() then
		phy:ApplyForceCenter(self.Owner:GetAimVector() * self.Primary.ProjectileSpeed) else //200000
		phy:ApplyForceCenter(((self.Owner:GetEnemy():GetPos() + self.Owner:GetEnemy():OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzle"))["Pos"] + Vector(math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread),math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread),math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread))*25):GetNormalized()*self.Primary.ProjectileSpeed  + self:PredictPos(self.Owner:GetEnemy(), 1)))
		end
	end
end