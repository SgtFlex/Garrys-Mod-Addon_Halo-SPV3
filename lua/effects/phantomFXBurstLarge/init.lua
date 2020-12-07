function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	
	local emitter = ParticleEmitter( Pos )
	
	for i = 1,10 do

		local particle = emitter:Add( "particles/flamelet1", Pos + Vector( math.random(-27,27),math.random(-27,27),math.random(-10,10) ) ) 
		 
		if particle == nil then particle = emitter:Add( "particles/flamelet1", Pos + Vector(   math.random(0,0),math.random(0,0),math.random(0,0) ) ) end
		
		if (particle) then
			particle:SetVelocity(Vector(math.random(0,0),math.random(0,0),math.random(0,0)))
			particle:SetDieTime(3) 
			particle:SetStartAlpha(math.random(50, 75))
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.random(150, 225)) 
			particle:SetEndSize(math.random(150, 225))
			particle:SetAngles( Angle(0,0,0) )
			particle:SetAngleVelocity( Angle(0,0,0) ) 
			particle:SetRoll(math.Rand( 0, 360 ))
			particle:SetColor(math.random(0,74),math.random(0,169),math.random(93,255),math.random(0,0))
			particle:SetGravity( Vector(0,0,70) ) 
			particle:SetAirResistance(0 )  
			particle:SetCollide(false)
			particle:SetBounce(0)
		end
	end

	emitter:Finish()
		
end

function EFFECT:Think()		
	return false
end

function EFFECT:Render()
end