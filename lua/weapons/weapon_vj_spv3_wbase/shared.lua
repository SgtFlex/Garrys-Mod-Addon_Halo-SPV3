if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Weapon Base"
SWEP.Author 					= "Mayhem"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is tihs weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/smg.mdl"
SWEP.ViewModel = SWEP.WorldModel
SWEP.HoldType 					= "ar2"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 3  -- Damage
SWEP.Primary.NumberOfShots		= 1	 -- How many shots per attack?
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 60 -- Max amount of bullets per clip
SWEP.Primary.TakeAmmo 			= 1	 -- How much ammo should it take on each shot?
SWEP.Primary.Recoil				= 0.6 -- How much recoil does the player get?
SWEP.Primary.Burst				= false -- Is it a burst weapon?
SWEP.Primary.Automatic			= true -- Is it automatic?
SWEP.Primary.Ammo				= "AR2" -- Ammo type
SWEP.Primary.Sound				= {"weapons/smg/fire/fire1.ogg", "weapons/smg/fire/fire2.ogg", "weapons/smg/fire/fire3.ogg"}
SWEP.Primary.HasDistantSound	= false -- Does it have a distant sound when the gun is shot?
SWEP.Primary.DisableBulletCode	= false -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Projectile = "obj_vj_spv3_pr_shot"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_MuzzleFlash = true
SWEP.PrimaryEffects_MuzzleParticles = {}
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_DynamicLightColor = Color(14, 171, 255)
SWEP.Primary.Projectile = "obj_vj_spv3_pr_shot"
SWEP.Primary.ProjectileSpeed = 4000
SWEP.ReloadSound = {"weapons/smg/reload/reload_full_1.ogg", "weapons/smg/reload/reload_full_2.ogg"}
SWEP.NPC_ReloadSound = SWEP.ReloadSound -- Sounds it plays when the base detects the SNPC playing a reload animation

SWEP.NPC_NextPrimaryFire = 2 -- Next time it can use primary fire

SWEP.NPC_TimeUntilFire = 0.06 -- How much time until the bullet/projectile is fired?
SWEP.NPC_ExtraShotsPerFire = 9
SWEP.NPC_HasReload = true
SWEP.NPC_TimeUntilFireExtraTimers = {} -- Extra timers, which will make the gun fire again! | The seconds are counted after the self.NPC_TimeUntilFire!
SWEP.Primary.Delay				= SWEP.NPC_TimeUntilFireExtraTimers[1] -- Time until it can shoot again

SWEP.NPC_CustomSpread = 1 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.Color = Color(255,255,255)
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
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

function SWEP:CustomOnPrimaryAttack_BeforeShoot()
if (CLIENT) then return end
if (self.Primary.DisableBulletCode==false) then return end
	for i=1, self.Primary.NumberOfShots do
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
			phy:ApplyForceCenter(((self.Owner:GetEnemy():GetPos() + self.Owner:GetEnemy():OBBCenter() - self:GetAttachment(self:LookupAttachment("muzzle"))["Pos"]):GetNormalized()*self.Primary.ProjectileSpeed  + self:PredictPos(self.Owner:GetEnemy(), 1) + Vector(math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread),math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread),math.random(-self.NPC_CustomSpread,self.NPC_CustomSpread))*50))
			end
		end
	end
end

function SWEP:PredictPos(entity, multiplier)
	if ((entity:IsPlayer()) && (IsValid(entity:GetVehicle())==false)) then
		return (self:GetOwner():GetEnemy():GetVelocity()*multiplier)
	elseif ((entity:IsPlayer() == false)) then
		return  (self:GetOwner():GetEnemy():GetGroundSpeedVelocity()*multiplier)
	else
		return (self:GetOwner():GetEnemy():GetVehicle():GetParent():GetVelocity()*multiplier)
	end
end