if (!SPV3) then SPV3 = {} end

function SPV3.TransformNPC(infForm, TransformingNPC)
	if (TransformingNPC:IsPlayer()==true) then infForm:Remove() return end
	local NPCInfo = {}
	NPCInfo.Model = TransformingNPC:GetModel()
	NPCInfo.Pos = TransformingNPC:GetPos()
	NPCInfo.Ang = TransformingNPC:GetAngles()
	NPCInfo.Color = TransformingNPC:GetColor()
	NPCInfo.Skin = TransformingNPC:GetSkin()
	NPCInfo.Bodygroups = TransformingNPC:GetBodyGroups()
	if (IsValid(TransformingNPC:GetActiveWeapon())) then NPCInfo.Weapon = TransformingNPC:GetActiveWeapon():GetClass() end
	NPCInfo.Health = TransformingNPC.StartHealth or TransformingNPC:GetMaxHealth()
	if (TransformingNPC.ShieldIsArmor == false) then
		NPCInfo.Shields = TransformingNPC.ShieldMaxHealth
	elseif (TransformingNPC.ShieldIsArmor == true) then
		NPCInfo.Health = NPCInfo.Health + TransformingNPC.ShieldMaxHealth
		NPCInfo.Shields = 0
	else
		NPCInfo.Shields = 0
	end
	NPCInfo.HasCloak = TransformingNPC.HasCloak or false
	local FloodClass = SPV3.GetTransformUnit(TransformingNPC:GetClass(), NPCInfo)
	if (FloodClass == false) then infForm:Unlatch() return end
	timer.Simple(0.1, function()
		for _,v in pairs(ents.FindInSphere(NPCInfo.Pos, 150)) do
			if (v:GetClass()=="prop_ragdoll" and v:GetModel()==enemyModel) then
				v:Remove()
			end
		end
    end)
    if (TransformingNPC.HasDeathRagdoll) then
		TransformingNPC.HasDeathRagdoll=false
		TransformingNPC.HasDeathAnimation=false
	end
	if (TransformingNPC:LookupSequence("Transform")!=-1) then
		TransformingNPC:Remove()
		local imposter = SPV3.CreateImposter(NPCInfo)
		-- if (TransformingNPC.SoundTbl_Transform) then
		-- 	TransformingNPC:EmitSound(VJ_PICKRANDOMTABLE(TransformingNPC.SoundTbl_Transform))
		-- end
		infForm:SetPos(select(1, imposter:GetBonePosition(infForm.LatchedBone)))
		infForm:SetMoveType(MOVETYPE_NONE)
		infForm:FollowBone(imposter, infForm.LatchedBone)
		infForm:SetMoveType(MOVETYPE_NONE)
		infForm:SetPos(select(1, imposter:GetBonePosition(infForm.LatchedBone)))
		timer.Create("Transform"..imposter:GetCreationID(), imposter:SequenceDuration(imposter:LookupSequence("Transform")), 1, function()
			if (IsValid(imposter)) then 
				imposter:Remove() 
			end
			if (IsValid(infForm)) then
				SPV3.SpawnInfected(FloodClass, NPCInfo)
				infForm:Remove()
			end
		end)
	else
		SPV3.SpawnInfected(FloodClass, NPCInfo)
		infForm:Remove()
	end
end


function SPV3.SpawnInfected(FloodClass, NPCInfo)
	
	local FloodNPC = ents.Create(FloodClass) --Has to be initialized again, otherwise spawned combat form doesn't attack
	FloodNPC.Appearance["Color"] = NPCInfo.Color
	FloodNPC.Appearance["Skin"] = NPCInfo.Skin
	FloodNPC.ExtraWeapons = {}
	table.insert(FloodNPC.ExtraWeapons, NPCInfo.Weapon)
	FloodNPC.SpawnedFromInf = true
	FloodNPC.StartHealth =  NPCInfo.Health * 0.75
	FloodNPC.ShieldMaxHealth =  NPCInfo.Shields
	FloodNPC.IsInvis = NPCInfo.HasCloak
	FloodNPC:Spawn()
	FloodNPC:SetAngles(NPCInfo.Ang)
	FloodNPC:SetPos(NPCInfo.Pos)
	ParticleEffect("CarrierDeath", FloodNPC:GetPos() + FloodNPC:OBBCenter(), FloodNPC:GetAngles(), nil)
	FloodNPC:VJ_ACT_PLAYACTIVITY(ACT_COVER_PISTOL_LOW,true,1.5,false)

	return FloodNPC
end

function SPV3.GetTransformUnit(NPCClass)
	if (GetConVarString("vj_spv3_floodOption") == "nothing") then return false end
	if (string.find(tostring(NPCClass), "marine") or string.find(tostring(NPCClass), "crewman")) then
		return ("npc_vj_halo_flood_spv3_marine")
	elseif (string.find(tostring(NPCClass), "odst")) then
		return ("npc_vj_halo_flood_spv3_odst")
	end
	if (string.find(tostring(NPCClass), "elite")) and (string.find(tostring(NPCClass), "hg")) then
		return ("npc_vj_halo_flood_spv3_elite_hg")
	elseif (string.find(tostring(NPCClass), "elite")) and (string.find(tostring(NPCClass), "oss")) then
		return ("npc_vj_halo_flood_spv3_elite_oss")
	elseif (string.find(tostring(NPCClass), "elite")) then
		local random = math.random(0,100)
		if (random > 90) then
			return ("npc_vj_halo_flood_spv3_elite_runner")
		elseif (random <=90 and random >= 75) then
			return ("npc_vj_halo_flood_spv3_elite_suicide")
		else
			return ("npc_vj_halo_flood_spv3_elite")
		end
	elseif (string.find(tostring(NPCClass), "grunt")) then
		return ("npc_vj_halo_flood_spv3_carrier")
	elseif (string.find(tostring(NPCClass), "jackal") or string.find(tostring(NPCClass), "skirm")) then
		return ("npc_vj_halo_flood_spv3_jackal")
	elseif (string.find(tostring(NPCClass), "brute")) then
		return ("npc_vj_halo_flood_spv3_brute")
	end
	if (string.find(tostring(NPCClass), "nat")) then
		if (string.find(tostring(NPCClass), "wolf")) then
			return ("npc_vj_halo_flood_spv3_wolf")
		end
	end
	if (GetConVarString("vj_spv3_floodOption") == "infect_anything") then
		return ("npc_vj_halo_flood_spv3_marine")
	end
	return ("npc_vj_halo_flood_spv3_marine")
end

function SPV3.CreateImposter(NPCInfo)
	local imposter = ents.Create("prop_dynamic")
	imposter:SetModel(NPCInfo.Model)
	imposter:SetSkin(NPCInfo.Skin)
	imposter:SetAngles(NPCInfo.Ang)
	imposter:SetPos(NPCInfo.Pos)
	imposter:Spawn()
	ParticleEffectAttach("Flood_transform", 1, imposter, 0)
	-- for k, v in pairs(NPCInfo.Bodygroups) do
	-- 	imposter:SetBodygroup(NPCInfo.Bodygroups[k]["id"], npc:GetBodygroup(NPCInfo.Bodygroups[k]["id"]))
	-- end
	imposter:SetColor(NPCInfo.Color)
	imposter:ResetSequenceInfo()
	imposter:SetSequence("Transform")

	return imposter
end

function SPV3.StickNeedle(entity, needle)
	if (entity.needles==nil) then entity.needles = {} end
	table.insert(entity.needles, needle)
	if ((entity:IsNPC() or entity:IsPlayer()) and #entity.needles <= 7) then
		for i,j in pairs(entity.needles) do
			timer.Adjust("Needles"..j:GetCreationID(), 1.5, nil, nil)
		end
	end
	if (!(timer.Exists("Needles"..needle:GetCreationID()))) then
		timer.Create("Needles"..needle:GetCreationID(), 1.5, 1, function()
			if (!IsValid(entity)) then return end
			if ((entity:IsNPC() or entity:IsPlayer())) then
				if (entity.needles and #entity.needles == 7) then
					SPV3.Supercombine(entity, needle)
				else
					entity:TakeDamage(10 * GetConVarNumber("vj_spv3_damageModifier"), needle:GetOwner(), needle:GetOwner())
					table.remove(entity.needles)
					needle:Remove()
					needle:EmitSound("weapons/needler/expire/1.ogg") 
					ParticleEffect("hcea_hunter_needler_pistol_impact", needle:LocalToWorld(Vector(0,0,0)), needle:GetAngles(), nil)
				end			
			end
		end)
	end
end

function SPV3.Supercombine(entity, needle)
	if (entity.OnStuckByEntity) then entity:OnStuckByEntity(this) end
	local needles = entity.Needles
	table.Empty(entity.Needles)
	for k, v in pairs(needles) do
		v:Detonate()
	end
	entity:EmitSound("weapons/needler/super/superneedleboom.ogg")
	local BlastInfo = DamageInfo()
	BlastInfo:SetDamageType(DMG_BLAST)
	BlastInfo:SetDamage(25 * GetConVarNumber("vj_spv3_damageModifier"))
	BlastInfo:SetDamagePosition(entity:GetPos())
	if (IsValid(needle:GetOwner())) then BlastInfo:SetAttacker(needle:GetOwner()) end
	BlastInfo:SetReportedPosition(entity:GetPos())
	util.BlastDamageInfo(BlastInfo, entity:GetPos(), 50)
	util.ScreenShake(entity:GetPos(),16,100,1,800)
	ParticleEffect("hcea_hunter_shade_cannon_explode_ground", entity:LocalToWorld(Vector(0,0,20)), entity:GetAngles(), nil)
	
end