if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "[SPV3] Grenade Base"
SWEP.Author 					= "Sgt Flexxx"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Halo SPV3"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel					= "models/weapons/c_grenade.mdl"
SWEP.WorldModel					= "models/spitball_medium.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.HoldType 					= "slam" -- List of holdtypes are in the GMod wiki
SWEP.HoldType 					= "rpg"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
SWEP.Primary.DisableBulletCode	= true -- The bullet won't spawn, this can be used when creating a projectile-based weapon
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 0.03 -- Next time it can use primary fire
SWEP.NPC_CustomSpread	 		= 0 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_CanBePickedUp = true -- Can this weapon be picked up by NPCs? (Ex: Rebels)
if (CLIENT) then
SWEP.Slot						= 4 -- Which weapon slot you want your SWEP to be in? (1 2 3 4 5 6) 
SWEP.SlotPos					= 4 -- Which part of that slot do you want the SWEP to be in? (1 2 3 4 5 6)
SWEP.UseHands					= true
end
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 0	 -- Damage
SWEP.Primary.Delay 				= 1.3
SWEP.Primary.ClipSize			= -1 -- Max amount of bullets per clip
SWEP.Primary.DefaultClip		= 1
SWEP.Primary.Tracer				= 1
SWEP.Primary.Recoil				= 0 -- How much recoil does the player get?
SWEP.Primary.Force				= 2 -- Force applied on the object the bullet hits
SWEP.Primary.TakeAmmo			= 1 -- How much ammo should it take on each shot?
SWEP.Primary.Automatic		= false
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Ammo				= "plasma_grenade" -- Ammo type
SWEP.Primary.DisableBulletCode	= false -- The bullet won't spawn, this can be used when creating a projectile-based weapon
SWEP.Primary.Sound				= {"grenades/throw_generic.ogg"} -- npc/roller/mine/rmine_explode_shock1.ogg
SWEP.DrawAmmo = true
SWEP.Reload_TimeUntilAmmoIsSet	= 1 -- Time until ammo is set to the weapon
SWEP.Reload_TimeUntilFinished	= 1.5 -- How much time until the player can play idle animation, shoot, etc.
SWEP.PickupSound = "grenades/pickup_generic.ogg"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"
SWEP.EntToThrow = "obj_vj_cov_spv3_plasma_nade"

SWEP.HasDeploySound = true -- Does the weapon have a deploy sound?
SWEP.DeploySound =  SWEP.PickupSound -- Sound played when the weapon is deployed
-- Pick one of the following options! Delete the option that you have not selected!


-- All functions and variables are located inside the base files. It can be found in the GitHub Repository: https://github.com/DrVrej/VJ-Base



function SWEP:PrimaryAttack()
	self:GetOwner():EmitSound(self.Primary.Sound[1])
	timer.Simple(0.15, function()
		local Grenade = ents.Create(self.EntToThrow)
		Grenade:SetPos(self:GetOwner():EyePos())
		Grenade:Spawn()
		Grenade:GetPhysicsObject():SetVelocity((self:GetOwner():GetAimVector() + Vector(0, 0, 0.15)):GetNormalized()*1000)
		Grenade:GetPhysicsObject():AddAngleVelocity(VectorRand(-500, 500))
		Grenade:SetOwner(self:GetOwner())
		self:TakePrimaryAmmo( 1 )
		if self:Ammo1() <= 0 then
			self.Owner:StripWeapon(self:GetClass()) 
		end
		
	end)
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay)
	
end



-- function SWEP:OwnerChanged()
-- 	self:EmitSound(VJ_PICKRANDOMTABLE(self.PickupSound))
-- end

function SWEP:EquipAmmo(Player)
	self:EmitSound(VJ_PICKRANDOMTABLE(self.PickupSound))
end