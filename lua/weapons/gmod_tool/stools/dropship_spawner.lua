TOOL.Name = "Dropship Spawner"
TOOL.Category = "Tools"
TOOL.Tab = "DrVrej"
TOOL.Command = nil
TOOL.ConfigName = "" 

TOOL.ClientConVar[ "Health" ] = "1500"
TOOL.ClientConVar[ "AIDriven" ] = "true"
TOOL.ClientConVar[ "EngineOn" ] = "true"
TOOL.ClientConVar[ "Class" ] = "dropship_halo_spv3_unsc_pelican"

function TOOL:LeftClick( trace )
	local ent = ents.Create(self:GetClientInfo("Class"))
	ent:SetPos(trace.HitPos)
	ent.StartHealth = self:GetClientNumber("Health", ent.StartHealth)
	ent.EntClassToCarry = {}
	ent.CustomSpawns = true
	ent.TableSpawns = {}
	local DropshipConfig = util.JSONToTable(file.Read("dropship_config.json", "DATA"))
	for item, amount in pairs(DropshipConfig["CarrySpawns"]) do
		for i = 1, amount do
			table.insert(ent.EntClassToCarry, item)
		end
	end

	for item, amount in pairs(DropshipConfig["NPCSpawns"]) do
		for i = 1, amount do
			table.insert(ent.TableSpawns, item)
		end
	end

	--ent.CarriedEnts = self:GetClientInfo("AIDriven")
	ent.StartAIEnabled = self:GetClientBool("AIDriven", true)
	ent.StartEngineOn = self:GetClientBool("EngineOn", true)
	ent:Spawn()
	undo.Create( "Dropship" )
	undo.AddEntity( ent )
	undo.SetPlayer(self:GetOwner() )
	undo.Finish()
end
 
function TOOL:RightClick( trace )
end

local function BuildNPCPanel(Panel)
	local frame = vgui.Create("DFrame", Panel)
	frame:SetSize(250, 500)
	frame:SetDraggable(false)
	frame:SetSizable(false)
	frame:ShowCloseButton(false)
	frame:SetTitle("NPC Spawn List")
	frame.items = {}
	local function AddItem()
		local item = vgui.Create("DPanel", frame)
		item:Dock(TOP)
		item.CharacterSelect = vgui.Create("DTextEntry", item)
		item.CharacterSelect:Dock(FILL)
		item.NWang = vgui.Create("DNumberWang", item)
		item.NWang:SetMin(1)
		item.NWang:SetDecimals(0)
		item.NWang:Dock(RIGHT)
		frame:InvalidateLayout()

		table.insert(frame.items, item)
		return item
	end
	local addButton = vgui.Create("DButton", frame)
	addButton:Dock(TOP)	
	addButton:SetZPos(9999)
	addButton.DoClick = function()
		AddItem()
		addButton:Dock(TOP)	
	end
	AddItem()
	return frame
end

local function BuildCarryPanel(Panel)
	local frame = vgui.Create("DFrame", Panel)
	frame:SetSize(250, 500)
	frame:SetDraggable(false)
	frame:SetSizable(false)
	frame:ShowCloseButton(false)
	frame:SetTitle("Carried Entities Spawn List")
	frame.items = {}
	local function AddItem()
		local item = vgui.Create("DPanel", frame)
		item:Dock(TOP)
		item.CharacterSelect = vgui.Create("DTextEntry", item)
		item.CharacterSelect:Dock(FILL)
		item.NWang = vgui.Create("DNumberWang", item)
		item.NWang:SetMin(1)
		item.NWang:SetDecimals(0)
		item.NWang:Dock(RIGHT)
		frame:InvalidateLayout()

		table.insert(frame.items, item)
		return item
	end
	local addButton = vgui.Create("DButton", frame)
	addButton:Dock(TOP)	
	addButton:SetZPos(9999)
	addButton.DoClick = function()
		AddItem()
		addButton:Dock(TOP)	
	end
	AddItem()
	

	return frame
end


function TOOL.BuildCPanel(Panel)
	Panel:ControlHelp("NOTE: These settings will only apply to newly spawned sentinel emitters")
	Panel:AddControl("TextBox", {Label = "Type of dropship", Command = "Dropship_Spawner_Class"})
	Panel:AddControl("Slider", {Label = "Health",min = 1,max = 10000,Command = "Dropship_Spawner_Health"})
	Panel:AddControl("Checkbox", {Label = "AI Driven", Command = "Dropship_Spawner_AIDriven"})
	Panel:AddControl("Checkbox", {Label = "Engine On", Command = "Dropship_Spawner_EngineOn"})

	local NPCPanel = BuildNPCPanel(Panel)
	Panel:AddItem(NPCPanel)

	local CarryPanel = BuildCarryPanel(Panel)
	Panel:AddItem(CarryPanel)

	local UpdateButton = vgui.Create("DButton", Panel)
	UpdateButton:Dock(TOP)	
	UpdateButton:SetZPos(9999)
	UpdateButton.DoClick = function()
		print("Updating items")
		local CarryTable = {}
		for k, v in pairs(CarryPanel.items) do
			if (v.CharacterSelect:GetValue() != nil) then
				CarryTable[v.CharacterSelect:GetValue()] = v.NWang:GetValue()
			end
		end

		local NPCTable = {}
		for k, v in pairs(NPCPanel.items) do
			if (v.CharacterSelect:GetValue() != nil) then
				NPCTable[v.CharacterSelect:GetValue()] = v.NWang:GetValue()
			end
		end

		local DropshipConfig = {}
		DropshipConfig["NPCSpawns"] = NPCTable
		DropshipConfig["CarrySpawns"] = CarryTable
		PrintTable(DropshipConfig)
		file.Write("dropship_config.json", util.TableToJSON(DropshipConfig))
	end
	Panel:AddItem(UpdateButton)
end

