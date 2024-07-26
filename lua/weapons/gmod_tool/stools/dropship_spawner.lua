TOOL.Name = "Dropship Spawner"
TOOL.Category = "Tools"
TOOL.Tab = "DrVrej"
TOOL.Command = nil
TOOL.ConfigName = "" 

TOOL.ClientConVar[ "Health" ] = "1500"
TOOL.ClientConVar[ "AIDriven" ] = "true"
TOOL.ClientConVar[ "EngineOn" ] = "true"
TOOL.ClientConVar[ "Class" ] = "dropship_halo_spv3_unsc_pelican"

if (CLIENT) then
	language.Add("tool.dropship_spawner.name", "Dropship Spawner")
	language.Add("tool.dropship_spawner.desc", "Spawn dropships. Configure them in DrVrej->Dropship Spawner")
	language.Add("tool.dropship_spawner.0", "Left-click to spawn a dropship with the current parameters")
end

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

	return true
end
 
function TOOL:RightClick( trace )
end


local function UpdateToolGun(Panel)
	local CarryTable = {}
	for k, v in pairs(Panel.CarryPanel.items) do
		if (v.TextEntry:GetValue() != nil and v.TextEntry:GetValue() != "") then
			CarryTable[v.TextEntry:GetValue()] = v.NWang:GetValue()
		end
	end

	local NPCTable = {}
	for k, v in pairs(Panel.NPCPanel.items) do
		if (v.TextEntry:GetValue() != nil and v.TextEntry:GetValue() != "") then
			NPCTable[v.TextEntry:GetValue()] = v.NWang:GetValue()
		end
	end

	local DropshipConfig = {}
	DropshipConfig["NPCSpawns"] = NPCTable
	DropshipConfig["CarrySpawns"] = CarryTable
	file.Write("dropship_config.json", util.TableToJSON(DropshipConfig, true))
end

local function BuildNPCPanel(Panel)
	local frame = vgui.Create("DFrame", Panel)
	frame:SetSize(250, 500)
	frame:SetDraggable(false)
	frame:SetSizable(false)
	frame:ShowCloseButton(false)
	frame:SetTitle("NPC Spawn List")
	frame.items = {}
	frame.AddItem = function(frame)
		local item = vgui.Create("DPanel", frame)
		item:Dock(TOP)
		item.TextEntry = vgui.Create("DTextEntry", item)
		item.TextEntry:Dock(FILL)
		item.TextEntry.Parent = item
		item.TextEntry.OnLoseFocus = function(self)
			if (self:GetText()=="" and #frame.items > 1) then
				table.RemoveByValue(frame.items, item)
				item:Remove()
				frame:InvalidateLayout(true)
				frame:SizeToChildren(false, true)
			elseif (self:GetText()!="" and frame.items[#frame.items] == self.Parent) then
				frame:AddItem()
			end
			UpdateToolGun(Panel)
			hook.Call( "OnTextEntryLoseFocus", nil, self ) --Hook needs to be here or user input will get stuck
		end
		item.NWang = vgui.Create("DNumberWang", item)
		item.NWang:SetMin(1)
		item.NWang:SetDecimals(0)
		item.NWang:Dock(RIGHT)
		item.NWang.OnValueChanged = function(value)
			UpdateToolGun(Panel)
		end
		frame:InvalidateLayout()

		table.insert(frame.items, item)
		frame:InvalidateLayout(true)
		frame:SizeToChildren(false, true)
		return item
	end
	frame:AddItem()
	
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
	frame.AddItem = function()
		local item = vgui.Create("DPanel", frame)
		item:Dock(TOP)

		item.TextEntry = vgui.Create("DTextEntry", item)
		item.TextEntry:Dock(FILL)
		item.TextEntry.Parent = item
		item.TextEntry.OnLoseFocus = function(self)
			if (self:GetText()=="" and #frame.items > 1) then
				table.RemoveByValue(frame.items, item)
				item:Remove()
			elseif (self:GetText()!="" and frame.items[#frame.items] == self.Parent) then
				frame:AddItem()
				frame:InvalidateLayout(true)
				frame:SizeToChildren(false, true)
			end
			UpdateToolGun(Panel)
			
			hook.Call( "OnTextEntryLoseFocus", nil, self ) --Hook needs to be here or user input will get stuck
		end

		item.NWang = vgui.Create("DNumberWang", item)
		item.NWang:SetMin(1)
		item.NWang:SetDecimals(0)
		item.NWang:Dock(RIGHT)
		item.NWang.OnValueChanged = function(value)
			UpdateToolGun(Panel)
		end
		frame:InvalidateLayout()
		table.insert(frame.items, item)
		frame:InvalidateLayout(true)
		frame:SizeToChildren(false, true)
		return item
	end
	frame:AddItem()
	
	

	return frame
end



function TOOL.BuildCPanel(Panel)
	Panel:ControlHelp("NOTE: These settings will only apply to newly spawned sentinel emitters")
	Panel:AddControl("TextBox", {Label = "Type of dropship", Command = "Dropship_Spawner_Class"})
	Panel:AddControl("Slider", {Label = "Health",min = 1,max = 10000,Command = "Dropship_Spawner_Health"})
	Panel:AddControl("Checkbox", {Label = "AI Driven", Command = "Dropship_Spawner_AIDriven"})
	Panel:AddControl("Checkbox", {Label = "Engine On", Command = "Dropship_Spawner_EngineOn"})

	Panel.NPCPanel = BuildNPCPanel(Panel)
	Panel:AddItem(Panel.NPCPanel)

	Panel.CarryPanel = BuildCarryPanel(Panel)
	Panel:AddItem(Panel.CarryPanel)

	local DropshipConfig = util.JSONToTable(file.Read("dropship_config.json", "DATA"))
	PrintTable(DropshipConfig["CarrySpawns"])
	for oldItem, amount in pairs(DropshipConfig["CarrySpawns"]) do
		local item = Panel.CarryPanel:AddItem()
		item.TextEntry:SetValue(oldItem)
		item.NWang:SetValue(amount)
	end

	for oldItem, amount in pairs(DropshipConfig["NPCSpawns"]) do
		local item = Panel.NPCPanel:AddItem()
		item.TextEntry:SetValue(oldItem)
		item.NWang:SetValue(amount)
	end
end

