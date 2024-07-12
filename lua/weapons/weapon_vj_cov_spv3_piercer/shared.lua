SWEP.Base = "weapon_vj_spv3_wbase"
SWEP.PrintName					= "SPV3 Piercer"
SWEP.Author = "SgtFlex"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "VJ Base"

SWEP.WorldModel					= "models/hce/spv3/weapons/cov/piercer.mdl"
SWEP.Primary.Sound				= {"weapons/piercer/fire/1.ogg", "weapons/piercer/fire/2.ogg", "weapons/piercer/fire/3.ogg"}
SWEP.ReloadSound = {"weapons/piercer/reload/SPV3_wpn_BruteSpike_rld_1.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.Primary.TracerType 		= "AirboatGunHeavyTracer" -- Tracer type (Examples: AR2)
SWEP.Primary.Delay				= 0.1-- Time until it can shoot again
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Damage				= 5
SWEP.Primary.ClipSize			= 40 -- Max amount of bullets per clip
SWEP.NPC_NextPrimaryFire 		= 1.65 -- Next time it can use primary fire
SWEP.NPC_ExtraShotsPerFire		= 4
SWEP.NPC_CustomSpread 			= 1.15 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_TimeUntilFire 			= 0.08 -- How much time until the bullet/projectile is fired?
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_piercer_shot"
SWEP.Primary.Burst				= true -- Is it a burst weapon?
SWEP.PrintName					= "Piercer"
SWEP.HoldType 					= "pistol"
SWEP.ViewModel 					= "models/weapons/c_pistol.mdl"


function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	self.targetedEnemy = self:GetOwner():GetEnemy()
if (CLIENT) then return end
if (self.Primary.DisableBulletCode==false) then return end
	local SpawnBlaserRod = ents.Create(self.Primary.Projectile)
	local OwnerPos = self.Owner:GetShootPos()
	local OwnerAng = self.Owner:GetAimVector():Angle()
	if self.Owner:IsPlayer() then SpawnBlaserRod:SetPos(OwnerPos) else SpawnBlaserRod:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos) end
	if self.Owner:IsPlayer() then SpawnBlaserRod:SetAngles(OwnerAng) else SpawnBlaserRod:SetAngles(self.Owner:GetAngles()) end
	SpawnBlaserRod:SetOwner(self)
	SpawnBlaserRod:Activate()
	SpawnBlaserRod:Spawn()
	local phy = SpawnBlaserRod:GetPhysicsObject()
	if phy:IsValid() then
		if self.Owner:IsPlayer() then
		phy:ApplyForceCenter(self.Owner:GetAimVector() * self.Primary.ProjectileSpeed) else //200000
		phy:ApplyForceCenter(((self.Owner:GetEnemy():GetPos() + self.Owner:GetEnemy():OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzle"))["Pos"] + Vector(math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread),math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread),math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread))*25):GetNormalized()*self.Primary.ProjectileSpeed))
		end
	end
end