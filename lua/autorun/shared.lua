if CLIENT then
	net.Receive("vj_spv3_open_menu", function() 
		local allS = vgui.Create( "DFrame" )
		allS:SetPos(ScrW() * .4, ScrH() * .5) 
		allS:SetSize(300, 200) 
		allS:SetTitle( "Settings" ) 
		allS:Center()
		allS:SetVisible( true ) 
		allS:SetDraggable( false ) 
		allS:ShowCloseButton( true ) 
		allS:MakePopup()

		local reset = vgui.Create("DButton", allS)
		local output = {}
		reset:SetFont("DermaDefaultBold")
		reset:SetText("Config Spawners/Dropships")
		reset:SetSize(200,25)
		reset:SetPos(allS:GetWide()*.2, 50)
		reset:CenterHorizontal(0.5)
		reset:SetColor(Color(0,0,0,255))
		reset.DoClick = function(reset)
			local Frame = vgui.Create( "DFrame" )
			Frame:SetPos(ScrW() * .4, ScrH() * .5) 
			Frame:SetSize(500, 700) 
			Frame:SetTitle( "Configure Phantom" ) 
			Frame:Center()
			Frame:SetVisible( true ) 
			Frame:SetDraggable( false ) 
			Frame:ShowCloseButton( true ) 
			Frame:MakePopup()

			local label = vgui.Create("DLabel", Frame)
			label:SetText("\"Reinforcement Strength\" is the accumulative strength of all the units\n that the phantom drops off. You can randomize this amount with the\n Min and Max Sliders. Having a low Max Unit strength means\n that the phantom will drop off more lower-tier units, while having a high\n Min Unit strength means the phantom will drop less, but more\n powerful high-tier units.")
			label:SetPos(Frame:GetWide()*.05, 270)
			label:SetSize(Frame:GetWide()*.9, 75)

			local totStr = vgui.Create("DNumSlider", Frame)
			totStr:SetText("Min Reinforcement Strength")
			totStr:SetMin(1)
			totStr:SetMax(300)
			totStr:SetSize(Frame:GetWide()*.9, 20)
			totStr:SetPos(Frame:GetWide()*.05, 350)
			totStr:SetDecimals(0)
			totStr:SetConVar("vj_spv3_phan")
			totStr:SetConVar("vj_spv3_phantomMinReinfStr")

			local totMaxStr = vgui.Create("DNumSlider", Frame)
			totMaxStr:SetText("Max Reinforcement Strength")
			totMaxStr:SetMin(1)
			totMaxStr:SetMax(300)
			totMaxStr:SetSize(Frame:GetWide()*.9, 20)
			totMaxStr:SetPos(Frame:GetWide()*.05, 380)
			totMaxStr:SetDecimals(0)
			totMaxStr:SetConVar("vj_spv3_phan")
			totMaxStr:SetConVar("vj_spv3_phantomMaxReinfStr")

			local minStr = vgui.Create("DNumSlider", Frame)
			minStr:SetText("Minimum Unit Strength")
			minStr:SetMin(1)
			minStr:SetMax(15)
			minStr:SetSize(Frame:GetWide()*.9, 20)
			minStr:SetPos(Frame:GetWide()*.05, 410)
			minStr:SetDecimals(0)
			minStr:SetConVar("vj_spv3_phantomMinUnitStr")

			local maxStr = vgui.Create("DNumSlider", Frame)
			maxStr:SetText("Maximum Unit Strength")
			maxStr:SetMin(1)
			maxStr:SetMax(15)
			maxStr:SetSize(Frame:GetWide()*.9, 20)
			maxStr:SetPos(Frame:GetWide()*.05, 440)
			maxStr:SetDecimals(0)
			maxStr:SetConVar("vj_spv3_phantomMaxUnitStr")


			local nSlider1 = vgui.Create("DNumSlider", Frame)
			nSlider1:SetText("Dropship Assist Time")
			nSlider1:SetMin(1)
			nSlider1:SetMax(120)
			nSlider1:SetSize(Frame:GetWide()*.9, 20)
			nSlider1:SetPos(Frame:GetWide()*.05, 30)
			nSlider1:SetConVar("vj_spv3_phantomAssistTime")
			nSlider1:SetDefaultValue(GetConVar("vj_spv3_phantomAssistTime"):GetFloat())

			local nSlider2 = vgui.Create("DNumSlider", Frame)
			nSlider2:SetText("Number of times Biomass spreads (exponential!)")
			nSlider2:SetMin(0)
			nSlider2:SetMax(5)
			nSlider2:SetSize(Frame:GetWide()*.9, 20)
			nSlider2:SetPos(Frame:GetWide()*.05, 60)
			nSlider2:SetDecimals(0)
			nSlider2:SetConVar("vj_spv3_biomassSpread")
			nSlider2:SetDefaultValue(GetConVar("vj_spv3_biomassSpread"):GetInt())

			local nSlider3 = vgui.Create("DNumSlider", Frame)
			nSlider3:SetText("Multiplies spawn of infection forms")
			nSlider3:SetMin(0.5)
			nSlider3:SetMax(10)
			nSlider3:SetSize(Frame:GetWide()*.9, 20)
			nSlider3:SetPos(Frame:GetWide()*.05, 90)
			nSlider3:SetConVar("vj_spv3_infModifier")
			nSlider3:SetDefaultValue(GetConVar("vj_spv3_infModifier"):GetFloat())

			local nSlider7 = vgui.Create("DNumSlider", Frame)
			nSlider7:SetText("Map: SPV3 NPC limit")
			nSlider7:SetMin(0)
			nSlider7:SetMax(200)
			nSlider7:SetSize(Frame:GetWide()*.9, 20)
			nSlider7:SetPos(Frame:GetWide()*.05, 120)
			nSlider7:SetConVar("vj_spv3_mapLimit")
			nSlider7:SetDecimals(0)
			nSlider7:SetDefaultValue(GetConVar("vj_spv3_mapLimit"):GetInt())


			local nSlider4 = vgui.Create("DNumSlider", Frame)
			nSlider4:SetText("Map: Flood Weight")
			nSlider4:SetMin(0)
			nSlider4:SetMax(100)
			nSlider4:SetSize(Frame:GetWide()*.9, 20)
			nSlider4:SetPos(Frame:GetWide()*.05, 150)
			nSlider4:SetConVar("vj_spv3_mapFlood")
			nSlider4:SetDefaultValue(GetConVar("vj_spv3_mapFlood"):GetFloat())

			local nSlider5 = vgui.Create("DNumSlider", Frame)
			nSlider5:SetText("Map: Cov Weight")
			nSlider5:SetMin(0)
			nSlider5:SetMax(100)
			nSlider5:SetSize(Frame:GetWide()*.9, 20)
			nSlider5:SetPos(Frame:GetWide()*.05, 180)
			nSlider5:SetConVar("vj_spv3_mapCov")
			nSlider5:SetDefaultValue(GetConVar("vj_spv3_mapCov"):GetFloat())

			local nSlider6 = vgui.Create("DNumSlider", Frame)
			nSlider6:SetText("Map: UNSC Weight")
			nSlider6:SetMin(0)
			nSlider6:SetMax(100)
			nSlider6:SetSize(Frame:GetWide()*.9, 20)
			nSlider6:SetPos(Frame:GetWide()*.05, 210)
			nSlider6:SetConVar("vj_spv3_mapUNSC")
			nSlider6:SetDefaultValue(GetConVar("vj_spv3_mapUNSC"):GetFloat())








			local value = 5
			local customSpawn = vgui.Create("DCheckBoxLabel", Frame)
			customSpawn:SetPos(Frame:GetWide()*.05, 240)
			customSpawn:SetText("Use custom spawning?")
			if (GetConVar("vj_spv3_phantomSpawns"):GetInt()==0) then
				customSpawn:SetChecked(false)
			else
				customSpawn:SetChecked(true)
			end

			local numberScratch = vgui.Create("DNumberWang", Frame)
			numberScratch:SetPos(Frame:GetWide()*.05, 270)
			numberScratch:SetSize(100, 20)
			numberScratch.OnValueChanged = function(self)
				value = tonumber(self:GetValue())
				if (value >= 10) then
					output[1] = tostring(value)
				else
					output[1] = "0"..tostring(value)
				end				
			end

			local meButton = vgui.Create("DButton", Frame)
			meButton:SetFont("DermaDefaultBold")
			meButton:SetText("Initialize Table")
			meButton:SetSize(150,25)
			meButton:SetPos(Frame:GetWide()*.05, 300)
			meButton:SetColor(Color(0,0,0,255))
			local combobox = {}
			local form = nil
			local scrollpanel = nil
			meButton.DoClick = function(reset)
				scrollpanel = vgui.Create("DScrollPanel", Frame)
				scrollpanel:SetSize(Frame:GetWide()*.9, 320)
				scrollpanel:SetPos(Frame:GetWide()*.05, 330)
				
				for k=1, value do
					combobox[k] = vgui.Create("DComboBox", scrollpanel)
					scrollpanel:AddItem(combobox[k])
					combobox[k]:Dock( TOP )
					combobox[k]:DockMargin( 0, 0, 0, 5 )
					combobox[k]:AddChoice( "Grunt Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Grunt Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Grunt Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Grunt Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite Zealot" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Elite HG Zealot" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Ultra" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Chieftain" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Brute Warchieftain" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Hunter Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Hunter Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Hunter Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Mkm Minor" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Mkm Major" ) -- 10 will be used as convar value
					combobox[k]:AddChoice( "Jackal Mkm Spec-Ops" ) -- 10 will be used as convar value
					combobox[k]:ChooseOptionID(1)
				end


			end

			local SetButton = vgui.Create("DButton", Frame)
			SetButton:SetFont("DermaDefaultBold")
			SetButton:SetText("Set Phantom Spawns")
			SetButton:SetSize(150,25)
			SetButton:SetPos(Frame:GetWide()*.05, Frame:GetTall()*.95)
			SetButton:SetColor(Color(0,0,0,255))
			SetButton.DoClick = function(reset)
				for k=1, #combobox do
					if (combobox[k]:GetSelectedID() < 10) then
						output[k+1] = tostring("0"..combobox[k]:GetSelectedID())
					else
						output[k+1] = tostring(combobox[k]:GetSelectedID())
					end
				end
				local outputString = ""
				for k=1, #output do
					outputString = outputString..tostring(output[k])
				end
				print(outputString)
				LocalPlayer():ConCommand("vj_spv3_phantomSpawns "..outputString)
			end
			if (customSpawn:GetChecked()==false) then
				local x,y = maxStr:GetPos()
				Frame:SetSize(500, y + 30)
			else
				local x,y = SetButton:GetPos()
				Frame:SetSize(500, y + 30)
			end
			Frame:Center()
			customSpawn.OnChange = function(self)
				if (customSpawn:GetChecked()==false) then
					local x,y = maxStr:GetPos()
					Frame:SetSize(500, y + 30)
					Frame:Center()
				else
					local x,y = SetButton:GetPos()
					Frame:SetSize(500, y + 30)
					Frame:Center()
				end
				numberScratch:SetVisible(customSpawn:GetChecked())
				meButton:SetVisible(customSpawn:GetChecked())
				if (scrollpanel!=nil) then
					scrollpanel:SetVisible(customSpawn:GetChecked())
				end
				totStr:SetVisible(!customSpawn:GetChecked())
				totMaxStr:SetVisible(!customSpawn:GetChecked())
				minStr:SetVisible(!customSpawn:GetChecked())
				maxStr:SetVisible(!customSpawn:GetChecked())
				
				label:SetVisible(!customSpawn:GetChecked())
				if (customSpawn:GetChecked()==false) then
					LocalPlayer():ConCommand("vj_spv3_phantomSpawns "..0)
				end
			end
			numberScratch:SetVisible(customSpawn:GetChecked())
			meButton:SetVisible(customSpawn:GetChecked())
			if (form!=nil) then
				form:SetVisible(customSpawn:GetChecked())
			end


			totStr:SetVisible(!customSpawn:GetChecked())
			totMaxStr:SetVisible(!customSpawn:GetChecked())
			minStr:SetVisible(!customSpawn:GetChecked())
			maxStr:SetVisible(!customSpawn:GetChecked())
			label:SetVisible(!customSpawn:GetChecked())
			minStr.OnValueChanged = function(self)
				maxStr:SetMin(minStr:GetValue())
			end
			maxStr.OnValueChanged = function(self)
				minStr:SetMax(maxStr:GetValue())
			end
			totStr.OnValueChanged = function(self)
				totMaxStr:SetMin(totStr:GetValue())
			end
			totMaxStr.OnValueChanged = function(self)
				totStr:SetMax(totMaxStr:GetValue())
			end
		end
		local damageConfig = vgui.Create("DButton", allS)
		damageConfig:SetFont("DermaDefaultBold")
		damageConfig:SetText("Config Damage/Health")
		damageConfig:SetSize(200,25)
		damageConfig:SetPos(allS:GetWide()*.3, 100)
		damageConfig:CenterHorizontal(0.5)
		damageConfig:SetColor(Color(0,0,0,255))
		damageConfig.DoClick = function(damageConfig)
			local Frame = vgui.Create( "DFrame" )
			Frame:SetPos(ScrW() * .4, ScrH() * .5) 
			Frame:SetSize(400, 500) 
			Frame:SetTitle("Configure SPV3 Damage/Health") 
			Frame:Center()
			Frame:SetVisible( true ) 
			Frame:SetDraggable( false ) 
			Frame:ShowCloseButton( true ) 
			Frame:MakePopup()

			local nSlider1 = vgui.Create("DNumSlider", Frame)
			nSlider1:SetText("Health Modifier")
			nSlider1:SetMin(0.01)
			nSlider1:SetMax(100)
			nSlider1:SetSize(Frame:GetWide()*.9, 20)
			nSlider1:SetPos(Frame:GetWide()*.05, 30)
			nSlider1:SetConVar("vj_spv3_HealthModifier")
			nSlider1:SetDefaultValue(GetConVar("vj_spv3_HealthModifier"):GetFloat())

			local nSlider2 = vgui.Create("DNumSlider", Frame)
			nSlider2:SetText("Shield Modifier")
			nSlider2:SetMin(0.01)
			nSlider2:SetMax(100)
			nSlider2:SetSize(Frame:GetWide()*.9, 20)
			nSlider2:SetPos(Frame:GetWide()*.05, 60)
			nSlider2:SetConVar("vj_spv3_ShieldModifier")
			nSlider2:SetDefaultValue(GetConVar("vj_spv3_ShieldModifier"):GetFloat())

			local nSlider3 = vgui.Create("DNumSlider", Frame)
			nSlider3:SetText("Damage Modifier")
			nSlider3:SetMin(0.01)
			nSlider3:SetMax(100)
			nSlider3:SetSize(Frame:GetWide()*.9, 20)
			nSlider3:SetPos(Frame:GetWide()*.05, 90)
			nSlider3:SetConVar("vj_spv3_damageModifier")
			nSlider3:SetDefaultValue(GetConVar("vj_spv3_damageModifier"):GetFloat())

			local nSlider4 = vgui.Create("DNumSlider", Frame)
			nSlider4:SetText("SPV3 NPC Vulnerability")
			nSlider4:SetMin(0.01)
			nSlider4:SetMax(100)
			nSlider4:SetSize(Frame:GetWide()*.9, 20)
			nSlider4:SetPos(Frame:GetWide()*.05, 120)
			nSlider4:SetConVar("vj_spv3_npctakedamagemodifier")
			nSlider4:SetDefaultValue(GetConVar("vj_spv3_npctakedamagemodifier"):GetFloat())

			local x, y = nSlider4:GetPos()
			Frame:SetSize(400, y + 30)
			Frame:Center()
		end
		local miscConfig = vgui.Create("DButton", allS)
		miscConfig:SetFont("DermaDefaultBold")
		miscConfig:SetText("Config Miscellaneous")
		miscConfig:SetSize(200,25)
		miscConfig:SetPos(allS:GetWide()*.3, 150)
		miscConfig:CenterHorizontal(0.5)
		miscConfig:SetColor(Color(0,0,0,255))
		miscConfig.DoClick = function(miscConfig)
			local Frame = vgui.Create( "DFrame" )
			Frame:SetPos(ScrW() * .4, ScrH() * .5) 
			Frame:SetSize(400, 600) 
			Frame:SetTitle("Configure Miscellaneous") 
			Frame:Center()
			Frame:SetVisible( true ) 
			Frame:SetDraggable( false ) 
			Frame:ShowCloseButton( true ) 
			Frame:MakePopup()

			local check1 = vgui.Create("DCheckBoxLabel", Frame)
			check1:SetPos(Frame:GetWide()*.05, 30)
			check1:SetText("UNSC friendly fire retaliation?")
			check1:SetConVar("vj_spv3_ffretal")

			local check2 = vgui.Create("DCheckBoxLabel", Frame)
			check2:SetPos(Frame:GetWide()*.05, 60)
			check2:SetText("Covenant can use UNSC weapons?")
			check2:SetConVar("vj_spv3_covUNSCWeps")

			local check3 = vgui.Create("DCheckBoxLabel", Frame)
			check3:SetPos(Frame:GetWide()*.05, 90)
			check3:SetText("UNSC can use Covenant weapons?")
			check3:SetConVar("vj_spv3_UNSCCovWeps")

			local nSliderFWep = vgui.Create("DNumSlider", Frame)
			nSliderFWep:SetText("Flood spawn with weapon chance")
			nSliderFWep:SetMin(0)
			nSliderFWep:SetMax(100)
			nSliderFWep:SetSize(Frame:GetWide()*.9, 20)
			nSliderFWep:SetPos(Frame:GetWide()*.05, 120)
			nSliderFWep:SetConVar("vj_spv3_floodWeps")

			local nSliderFWep = vgui.Create("DNumSlider", Frame)
			nSliderFWep:SetText("Flood elites have shield chance")
			nSliderFWep:SetMin(0)
			nSliderFWep:SetMax(100)
			nSliderFWep:SetSize(Frame:GetWide()*.9, 20)
			nSliderFWep:SetPos(Frame:GetWide()*.05, 150)
			nSliderFWep:SetConVar("vj_spv3_floodEliteShield")

			local check5 = vgui.Create("DCheckBoxLabel", Frame)
			check5:SetPos(Frame:GetWide()*.05, 180)
			check5:SetText("Infection forms explode (thus causing chain kills)?")
			check5:SetConVar("vj_spv3_InfFormsExplode")

			local dbox1 = vgui.Create("DComboBox", Frame)
			dbox1:SetPos(Frame:GetWide()*.05, 210)
			dbox1:SetText("What is transformable by the Flood?")
			dbox1:SetSize(Frame:GetWide()*.8, 20)
			dbox1:AddChoice("Anything can be transformed by the Flood.", "vj_spv3_floodOption infect_anything")
			dbox1:AddChoice("Only Halo-related NPCs can be transformed by the Flood.", "vj_spv3_floodOption infect_onlyHalo")
			dbox1:AddChoice("Nothing can be transformed by the Flood.", "vj_spv3_floodOption infect_nothing")
			dbox1.OnSelect = function(dbox1)
				local none, result = dbox1:GetSelected()
				LocalPlayer():ConCommand(result)
				print(result)
			end

			local x, y = dbox1:GetPos()
			Frame:SetSize(400, y + 30)
			Frame:Center()
		end
	end)
end