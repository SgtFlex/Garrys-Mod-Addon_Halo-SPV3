function EFFECT:Init( data )
	local Pos = data:GetOrigin()
	
	local emitter = ParticleEmitter( Pos )
	
	for i = 1,5 do

		local particle = emitter:Add( "particles/flamelet1", Pos + Vector( math.random(-10,10),math.random(-10,10), 0 ) ) 
		 
		if particle == nil then particle = emitter:Add( "particles/flamelet1", Pos + Vector(   math.random(0,0),math.random(0,0),math.random(0,0) ) ) end
		
		if (particle) then
			particle:SetVelocity(Vector(math.random(0,0),math.random(0,0),math.random(0,0)))
			particle:SetDieTime(math.random(1, 1.3)) 
			particle:SetStartAlpha(100)
			particle:SetEndAlpha(255)
			particle:SetStartSize(math.random(10, 20)) 
			particle:SetEndSize(0)
			particle:SetAngles( Angle(0,0,0) )
			particle:SetAngleVelocity( Angle(0,0,0) ) 
			particle:SetRoll(math.Rand( 0, 360 ))
			particle:SetColor(math.random(0,74),math.random(0,169),math.random(93,255),math.random(0,0))
			particle:SetGravity( Vector(0,0,70) ) 
			particle:SetAirResistance(0)  
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