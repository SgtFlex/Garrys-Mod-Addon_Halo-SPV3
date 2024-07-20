ENT.Base 			= "base_ai"
ENT.Type 			= "ai"
ENT.PrintName 		= "Dropship Base"
ENT.Author 			= "SgtFlex"
ENT.Purpose 		= "To spawn units."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if CLIENT then
    function ENT:Initialize()
        hook.Add("PostDrawSkyBox",self,function(self)
            self:Draw()
        end)
    end
end

drive.Register( "drive_example", 
{
	--
	-- Calculates the view when driving the entity
	--
	CalcView =  function( self, view )

		--
		-- Use the utility method on drive_base.lua to give us a 3rd person view
		--
		self:CalcView_ThirdPerson( view, 100, 2, { self.Entity } )
		view.angles.roll = 0
        view.origin = self.Entity:GetPos() + Vector(0,0,500) + view.angles:Forward()*-800
	end,

	--
	-- Called before each move. You should use your entity and cmd to 
	-- fill mv with information you need for your move. 
	--
	StartMove =  function( self, mv, cmd )
		-- Set observer mode to chase, so the entity will be drawn.
		self.Player:SetObserverMode( OBS_MODE_CHASE )
		--
		-- Update move position and velocity from our entity
		--
		mv:SetOrigin( self.Entity:GetNetworkOrigin() )
		mv:SetVelocity( self.Entity:GetAbsVelocity() )
		if (mv:KeyPressed(IN_WALK)) then
			self.Entity.DownT = CurTime()
			local ents = ents.FindInSphere(self.Entity:GetAttachment(self.Entity:LookupAttachment("Latch"))["Pos"], 500)
			for k, v in pairs(ents) do
				self.Entity:PickupEntity(v)
			end
		elseif (mv:KeyDown(IN_WALK)) then
			if ((CurTime() > self.Entity.DownT + 0.5) and self.Entity.bIsUnloading == false and #self.Entity.CarriedEnts > 0) then
				self.Entity.DropAll(self.Entity)
			end
		else
			self.Entity.DownT = 0
		end
		

		if (mv:KeyPressed(IN_RELOAD)) then
			self.Entity:SetEngineOn(!self.Entity.bEngineOn)
		end

		if (mv:KeyPressed(IN_JUMP)) then
			self.Entity:SetupSpawnTable()
			self.Entity:SpawnUnits()
		end

		if (mv:KeyPressed(IN_USE)) then
			self.Entity.MoveLocation = nil
			self:Stop()
		end


	end,
	Move = function( self, mv )
		self.Entity.DesiredControlRotation = mv:GetMoveAngles()
		self.Entity.MoveLocation = nil
		if ( mv:KeyDown( IN_FORWARD) ) then 
			self.Entity.MoveLocation = mv:GetOrigin() + mv:GetMoveAngles():Forward()*300
			debugoverlay.Cross(self.Entity.MoveLocation, 300)
		elseif (mv:KeyDown(IN_BACK)) then
			self.Entity:Strafe(mv:GetMoveAngles():Forward()*-1)
		end
		if (mv:KeyDown(IN_MOVERIGHT)) then
			self.Entity:Strafe(mv:GetMoveAngles():Right())
		elseif(mv:KeyDown(IN_MOVELEFT)) then
			self.Entity:Strafe(mv:GetMoveAngles():Right()*-1)
		end
		if (mv:KeyDown(IN_SPEED)) then
			self.Entity:Strafe(mv:GetMoveAngles():Up())
		elseif(mv:KeyDown(IN_DUCK)) then
			self.Entity:Strafe(mv:GetMoveAngles():Up()*-1)
		end		
	end,

	--
	-- The move is finished. Use mv to set the new positions
	-- on your entities/players.
	--
	FinishMove =  function( self, mv )
		--
		-- If we have a physics object update that too. But only on the server.
	end,

}, "drive_base" )