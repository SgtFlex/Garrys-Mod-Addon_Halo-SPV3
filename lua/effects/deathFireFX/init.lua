/*

This effect goes in lua/effects/<Your effect name>/init.lua

How to use: Example Code:

	local OurEnt = LocalPlayer() 
	local part = EffectData()
	if OurEnt ~= NULL then
	part:SetStart( OurEnt:GetPos() + Vector(0,0,70) )
	part:SetOrigin( OurEnt:GetPos() + Vector(0,0,70) )
	part:SetEntity( OurEnt )
	part:SetScale( 1 )
	util.Effect( "Your Effect name", part)
	end 
	
You can use this in ENT:Think() or PrimaryEffect in an entity or hook.Add("Think","Effect", function() ... end)

Think is for animated effects
*/
function EFFECT:Init( data )
	
	local Pos = data:GetOrigin()
	
	local emitter = ParticleEmitter( Pos )
	
	for i = 1,50 do

		local particle = emitter:Add( "particles/fire_glow", Pos + Vector( math.random(-30,30),math.random(-30,30),math.random(-30,30) ) ) 
		 
		if particle == nil then particle = emitter:Add( "particles/fire_glow", Pos + Vector(   math.random(-30,30),math.random(-30,30),math.random(-20,0) ) ) end
		
		if (particle) then
			particle:SetVelocity(Vector(math.random(-150,150),math.random(-150,150),math.random(150, 150)))
			particle:SetDieTime(math.random(.5, 1.5)) 
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(math.random(0, 50))
			particle:SetStartSize(50) 
			particle:SetEndSize(math.random(0, 10))
			particle:SetAngles( Angle(0,0,0) )
			particle:SetAngleVelocity( Angle(0,0,0) ) 
			particle:SetRoll(math.Rand( 0, 360 ))
			particle:SetColor(math.random(30,97),math.random(98,206),math.random(154,255),math.random(255,255))			particle:SetGravity( Vector(0,0,-350) ) 
			particle:SetAirResistance(0 )  
			particle:SetCollide(true)
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