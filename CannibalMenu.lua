local version = 1

local prevInject = false

if getgenv().inject then
	prevInject = true
else
	getgenv().inject = true
end

getgenv().timer = 0

LiterallyAllTheCode = function()
	local player = game:GetService("Players").LocalPlayer
	local Mouse = player:GetMouse()

	local noClipBind = "v"
	local flyBind = "n"
	local unlockBind = "r"
	local doorBind = "t"











	getgenv().Noclipping = nil
	getgenv().clipping = 1

	getgenv().NoclipLoop = function()
		if getgenv().clipping < 0 and game.Players.LocalPlayer.Character ~= nil then
			for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
					child.CanCollide = false
				end
			end
		end
	end

	getgenv().toggleNoclip = function()
		getgenv().clipping = -getgenv().clipping
		if getgenv().clipping > 0 then
			getgenv().NoClip.Text = "NoClip [OFF] (" .. noClipBind .. ")"
			if getgenv().Noclipping then
				getgenv().Noclipping:Disconnect()
			end
		else
			getgenv().NoClip.Text = "NoClip [ON] (" .. noClipBind .. ")"
			getgenv().Noclipping = game:GetService("RunService").Stepped:Connect(getgenv().NoclipLoop)
		end
	end














	function clockTimeTo12Hr(cTime)
		local twelveHr
		local pmAm = " AM"
		local hr = math.floor(cTime)
		local minute = ""
		
		if hr > 12 then
			pmAm = " PM"
			twelveHr = cTime - 12
		else
			twelveHr = cTime
			pmAm = " AM"
		end
		
		local minu = twelveHr - math.floor(twelveHr)
		
		if (math.floor(twelveHr) == 0) then
			twelveHr = 12 + (minu)
		end
		
		minute = tostring(math.floor(minu * 60))
		
		if (#minute < 2) then
			minute = "0" .. minute
		end
		
		return tostring(math.floor(twelveHr)) .. ":" .. minute .. pmAm
	end













	getgenv().flying = -1

	getgenv().toggleFly = function()
		getgenv().flying = -getgenv().flying
		if getgenv().flying > 0 then
			getgenv().FlyButton.Text = "Fly [ON] (" .. flyBind .. ")"
			getgenv().sFLY()
		else
			getgenv().FlyButton.Text = "Fly [OFF] (" .. flyBind .. ")"
			getgenv().NOFLY()
		end
	end




	getgenv().AFKT = -1

	getgenv().timer = 0

	getgenv().prevTimer = 0

	getgenv().afkLoop = function()
		if getgenv().timer - getgenv().prevTimer > 60 then
			getgenv().prevTimer = getgenv().timer
			getFruit()
			wait(1)
			eatFruit()
			wait(5)
			eatFruit()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4237.2, 533.9, 1062.2)
		end
	end

	getgenv().AFKK = nil













	getgenv().getRoot = function(char)
		local rootPart = char:FindFirstChild('HumanoidRootPart')
		return rootPart
	end

	local Players = game.Players

	getgenv().FLYING = false
	QEfly = true
	iyflyspeed = 1
	vehicleflyspeed = 1
	getgenv().sFLY = function(vfly)
		repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
		repeat wait() until Mouse

		local T = getRoot(Players.LocalPlayer.Character)
		local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local SPEED = 0

		local function FLY()
			getgenv().FLYING = true
			local BG = Instance.new('BodyGyro', T)
			local BV = Instance.new('BodyVelocity', T)
			BG.P = 9e4
			BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			BG.cframe = T.CFrame
			BV.velocity = Vector3.new(0, 0, 0)
			BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
			spawn(function()
				repeat wait()
					if not vfly and Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
						Players.LocalPlayer.Character:FindFirstChild('Humanoid').PlatformStand = true
					end
					if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
						SPEED = 50
					elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
						SPEED = 0
					end
					if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
					elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
						BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					else
						BV.velocity = Vector3.new(0, 0, 0)
					end
					BG.cframe = workspace.CurrentCamera.CoordinateFrame
				until not getgenv().FLYING
				CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				SPEED = 0
				BG:destroy()
				BV:destroy()
				if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
				end
			end)
		end
		Mouse.KeyDown:connect(function(KEY)
			if KEY:lower() == 'w' then
				if vfly then
					CONTROL.F = vehicleflyspeed
				else
					CONTROL.F = iyflyspeed
				end
			elseif KEY:lower() == 's' then
				if vfly then
					CONTROL.B = - vehicleflyspeed
				else
					CONTROL.B = - iyflyspeed
				end
			elseif KEY:lower() == 'a' then
				if vfly then
					CONTROL.L = - vehicleflyspeed
				else
					CONTROL.L = - iyflyspeed
				end
			elseif KEY:lower() == 'd' then 
				if vfly then
					CONTROL.R = vehicleflyspeed
				else
					CONTROL.R = iyflyspeed
				end
			elseif QEfly and KEY:lower() == 'e' then
				if vfly then
					CONTROL.Q = vehicleflyspeed*2
				else
					CONTROL.Q = iyflyspeed*2
				end
			elseif QEfly and KEY:lower() == 'q' then
				if vfly then
					CONTROL.E = -vehicleflyspeed*2
				else
					CONTROL.E = -iyflyspeed*2
				end
			end
		end)
		Mouse.KeyUp:connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = 0
			elseif KEY:lower() == 's' then
				CONTROL.B = 0
			elseif KEY:lower() == 'a' then
				CONTROL.L = 0
			elseif KEY:lower() == 'd' then
				CONTROL.R = 0
			elseif KEY:lower() == 'e' then
				CONTROL.Q = 0
			elseif KEY:lower() == 'q' then
				CONTROL.E = 0
			end
		end)
		FLY()
	end

	getgenv().NOFLY = function()
		getgenv().FLYING = false
		Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end













	getgenv().unlock = function()
		local player = game.Players.LocalPlayer.Character.HumanoidRootPart
		local closest = game.Workspace.Interactables:FindFirstChild("Crank", true)

		function dist(p1, p2)
			return (p1.Position - p2.Position).Magnitude
		end

		for i, v in pairs(game.Workspace.Interactables:GetDescendants()) do
			if v.Name == "Crank" and dist(v, player) < dist(closest, player) then
				closest = v
			end
		end

		game.ReplicatedStorage.Events.Interactables:FireServer(closest.ToggleLock)
	end
	
	getgenv().toggleDoor = function()
		local player = game.Players.LocalPlayer.Character.HumanoidRootPart
		local closest = game.Workspace.Interactables:FindFirstChild("OpenCloseLockableDoor", true)

		function dist(p1, p2)
			return (p1.Position - p2.Position).Magnitude
		end

		for i, v in pairs(game.Workspace.Interactables:GetDescendants()) do
			if v.Name == "OpenCloseLockableDoor" and dist(v.Parent, player) < dist(closest.Parent, player) then
				closest = v
			end
		end

		game.ReplicatedStorage.Events.Interactables:FireServer(closest)
	end









	if prevInject and getgenv().MouseKeyDown then
		getgenv().MouseKeyDown:Disconnect()
	end

	getgenv().MouseKeyDown = Mouse.KeyDown:Connect(function(key)
		if key == noClipBind then
			getgenv().toggleNoclip()
		end
		
		if key == flyBind then
			getgenv().toggleFly()
		end
		
		if key == unlockBind then
			getgenv().unlock()
		end
		
		if key == doorBind then
			getgenv().toggleDoor()
		end
	end)







	getgenv().tSpeed = 0.5

	local TweenService = game:GetService("TweenService")





	








	--[[if game.CoreGui:FindFirstChild("CannibalMenu") then
		game.CoreGui.CannibalMenu:Destroy()
	end]]--

	





	local Menu = getgenv().Menu or Instance.new("ScreenGui"); getgenv().Menu = Menu
	getgenv().Menu.Name = "CannibalMenu"
	getgenv().Menu.Parent = game.CoreGui

	local TopBar = getgenv().TopBar or Instance.new("Frame"); getgenv().TopBar = TopBar
	getgenv().TopBar.Name = "TopBar"
	getgenv().TopBar.Parent = getgenv().Menu
	getgenv().TopBar.Size = UDim2.new(0, 300, 0, 50)
	getgenv().TopBar.Position = UDim2.new(0, 0, 0.35, 0)
	getgenv().TopBar.BackgroundColor3 = Color3.new(0.5, 0.5, 0.6)
	getgenv().TopBar.BorderSizePixel = 0

	local Main = getgenv().Main or Instance.new("Frame"); getgenv().Main = Main
	getgenv().Main.Name = "Main"
	getgenv().Main.Parent = getgenv().TopBar
	getgenv().Main.Size = UDim2.new(0, 300, 0, 600)
	getgenv().Main.Position = UDim2.new(0, 0, 0, 50)
	getgenv().Main.BackgroundColor3 = Color3.new(0.1, 0.1, 0.2)
	getgenv().Main.BackgroundTransparency = 0.3
	getgenv().Main.BorderSizePixel = 0

	local Teleports = getgenv().Teleports or Instance.new("Frame"); getgenv().Teleports = Teleports
	getgenv().Teleports.Name = "Teleports"
	getgenv().Teleports.Parent = getgenv().TopBar
	getgenv().Teleports.Size = UDim2.new(0, 0, 0, 0)
	getgenv().Teleports.Position = UDim2.new(0, 300, 0, 50)
	getgenv().Teleports.BackgroundTransparency = 1
	getgenv().Teleports.BackgroundColor3 = Color3.new(0.1, 0.1, 0.2)
	getgenv().Teleports.BorderSizePixel = 0
	getgenv().Teleports.Visible = false







	local TitleLabel = getgenv().TitleLabel or Instance.new("TextLabel"); getgenv().TitleLabel = TitleLabel
	getgenv().TitleLabel.Name = "TitleLabel"
	getgenv().TitleLabel.Parent = getgenv().TopBar
	getgenv().TitleLabel.Size = UDim2.new(0, 200, 0, 50)
	getgenv().TitleLabel.Position = UDim2.new(0, 0, 0, 0)
	getgenv().TitleLabel.BackgroundTransparency = 1
	getgenv().TitleLabel.BorderSizePixel = 0
	getgenv().TitleLabel.Text = "Cannibal Menu"
	getgenv().TitleLabel.TextColor3 = Color3.new(1, 1, 1)
	getgenv().TitleLabel.TextScaled = true


	local MinButton = getgenv().MinButton or Instance.new("TextButton"); getgenv().MinButton = MinButton
	local MaxButton = getgenv().MaxButton or Instance.new("TextButton"); getgenv().MaxButton = MaxButton

	getgenv().MinButton.Name = "MinButton"
	getgenv().MinButton.Parent = getgenv().TopBar
	getgenv().MinButton.Size = UDim2.new(0, 50, 0, 50)
	getgenv().MinButton.Position = UDim2.new(0, 250, 0, 0)
	getgenv().MinButton.BackgroundColor3 = Color3.new(0.6, 0.5, 0.5)
	getgenv().MinButton.BorderSizePixel = 0
	getgenv().MinButton.Text = "-"
	getgenv().MinButton.TextColor3 = Color3.new(1, 1, 1)
	getgenv().MinButton.TextScaled = true


	local Clock = getgenv().Clock or Instance.new("TextLabel"); getgenv().Clock = Clock
	getgenv().Clock.Name = "Clock"
	getgenv().Clock.Parent = TopBar
	getgenv().Clock.Size = UDim2.new(0, 300, 0, 50)
	getgenv().Clock.Position = UDim2.new(0, 0, 0, 600)
	getgenv().Clock.BackgroundTransparency = 0.7
	getgenv().Clock.BackgroundColor3 = Color3.new(0, 0, 0)
	getgenv().Clock.BorderSizePixel = 0
	getgenv().Clock.Text = clockTimeTo12Hr(game.Lighting.ClockTime)
	getgenv().Clock.TextColor3 = Color3.new(1, 1, 1)
	getgenv().Clock.TextSize = 20
	getgenv().Clockx = Instance.new("NumberValue", getgenv().Clock)
	getgenv().Clocky = Instance.new("NumberValue", getgenv().Clock)
	getgenv().Clockx.Name = "px"
	getgenv().Clocky.Name = "py"
	getgenv().Clockx.Value = 0
	getgenv().Clocky.Value = 600



	getgenv().ClockLoop = function()
		getgenv().Clock.Text = clockTimeTo12Hr(game.Lighting.ClockTime)
	end

	if getgenv().cl then
		getgenv().cl:Disconnect()
	end

	getgenv().cl = game:GetService("RunService").Stepped:Connect(getgenv().ClockLoop)


	if prevInject then
		local goal = {}
		goal.Size = UDim2.new(0, 300, 0, 600)
		goal.Transparency = 0.3
		goal.Visible = true
		getgenv().Main.Active = true
		
		local info = TweenInfo.new(getgenv().tSpeed)
		
		local tween = TweenService:Create(getgenv().Main, info, goal)
		
		tween:Play()
		
		for i,v in pairs(getgenv().Main:GetChildren()) do
			local goal = {}
			goal.Position = UDim2.new(0, v.px.Value, 0, v.py.Value)
			goal.BackgroundTransparency = 0.7
			goal.TextTransparency = 0
			goal.Visible = true
			v.Active = true
			
			local info = TweenInfo.new(getgenv().tSpeed)
			
			local tween = TweenService:Create(v, info, goal)
			
			tween:Play()
		end
		
		local goal = {}
		goal.Position = UDim2.new(0, getgenv().Clock.px.Value, 0, getgenv().Clock.py.Value)
		
		local info = TweenInfo.new(getgenv().tSpeed)
		
		local tween = TweenService:Create(getgenv().Clock, info, goal)
		
		tween:Play()
	end





	if prevInject and getgenv().MinButtonMB then
		getgenv().MinButtonMB:Disconnect()
	end

	getgenv().MinButtonMB = getgenv().MinButton.MouseButton1Down:Connect(function()
		local goal = {}
		goal.Size = UDim2.new(0, 300, 0, 50)
		
		local info = TweenInfo.new(getgenv().tSpeed)
		
		local tween = TweenService:Create(getgenv().Main, info, goal)
		
		tween:Play()

		for i,v in pairs(getgenv().Main:GetChildren()) do
			local goal = {}
			goal.Position = UDim2.new(0, 0, 0, -50)
			goal.Transparency = 1
			goal.Visible = false
			v.Active = false
			
			local info = TweenInfo.new(getgenv().tSpeed)
			
			local tween = TweenService:Create(v, info, goal)
			
			tween:Play()
		end
		
		local goal = {}
		goal.Position = UDim2.new(0, 0, 0, 50)
		
		local info = TweenInfo.new(getgenv().tSpeed)
		
		local tween = TweenService:Create(getgenv().Clock, info, goal)
		
		tween:Play()
		
		getgenv().TpsToggle = -1
		getgenv().tweenTps()
	end)

	if prevInject and getgenv().MaxButtonMD then
		getgenv().MaxButtonMD:Disconnect()
	end

	getgenv().MaxButtonMD = getgenv().MaxButton.MouseButton1Down:Connect(function()
		local goal = {}
		goal.Size = UDim2.new(0, 300, 0, 600)
		goal.Transparency = 0.3
		goal.Visible = true
		getgenv().Main.Active = true
		
		local info = TweenInfo.new(getgenv().tSpeed)
		
		local tween = TweenService:Create(getgenv().Main, info, goal)
		
		tween:Play()
		
		for i,v in pairs(getgenv().Main:GetChildren()) do
			local goal = {}
			goal.Position = UDim2.new(0, v.px.Value, 0, v.py.Value)
			goal.BackgroundTransparency = 0.7
			goal.TextTransparency = 0
			goal.Visible = true
			v.Active = true
			
			local info = TweenInfo.new(getgenv().tSpeed)
			
			local tween = TweenService:Create(v, info, goal)
			
			tween:Play()
		end
		
		local goal = {}
		goal.Position = UDim2.new(0, getgenv().Clock.px.Value, 0, getgenv().Clock.py.Value)
		
		local info = TweenInfo.new(getgenv().tSpeed)
		
		local tween = TweenService:Create(getgenv().Clock, info, goal)
		
		tween:Play()
	end)

	getgenv().MaxButton.Name = "MaxButton"
	getgenv().MaxButton.Parent = getgenv().TopBar
	getgenv().MaxButton.Size = UDim2.new(0, 50, 0, 50)
	getgenv().MaxButton.Position = UDim2.new(0, 200, 0, 0)
	getgenv().MaxButton.BackgroundColor3 = Color3.new(0.5, 0.6, 0.5)
	getgenv().MaxButton.BorderSizePixel = 0
	getgenv().MaxButton.Text = "+"
	getgenv().MaxButton.TextColor3 = Color3.new(1, 1, 1)
	getgenv().MaxButton.TextScaled = true






	local MainTable = getgenv().MainTable or {}; getgenv().MainTable = MainTable
	local TeleportsTable = getgenv().TeleportsTable or {}; getgenv().TeleportsTable = TeleportsTable
	getgenv().MainTable = {}
	getgenv().TeleportsTable = {}


	getgenv().TpsToggle = -1

	getgenv().tweenTps = function()
		if (getgenv().TpsToggle > 0) then
			local goal = {}
			goal.Size = UDim2.new(0, 300, 0, 600)
			goal.Transparency = 0.3
			goal.Visible = true
			getgenv().Teleports.Active = true
		
			local info = TweenInfo.new(getgenv().tSpeed)
		
			local tween = TweenService:Create(Teleports, info, goal)
		
			tween:Play()
		
			getgenv().TeleportsButton.Text = "Teleports <<"
			
			--
			
			for i,v in pairs(getgenv().Teleports:GetChildren()) do
				local goal = {}
				goal.Position = UDim2.new(0, v.px.Value, 0, v.py.Value)
				goal.Size = UDim2.new(0, 300, 0, 50)
				goal.BackgroundTransparency = 0.7
				goal.TextTransparency = 0
				goal.Visible = true
				v.Active = true
				
				local info = TweenInfo.new(getgenv().tSpeed)
				
				local tween = TweenService:Create(v, info, goal)
				
				tween:Play()
			end
		else
			local goal = {}
			goal.Size = UDim2.new(0, 0, 0, 0)
			goal.Transparency = 1
			goal.Visible = false
			getgenv().Teleports.Active = false
		
			local info = TweenInfo.new(getgenv().tSpeed)
		
			local tween = TweenService:Create(Teleports, info, goal)
		
			tween:Play()
		
			getgenv().TeleportsButton.Text = "Teleports >>"
			
			--
			
			for i,v in pairs(getgenv().Teleports:GetChildren()) do
				local goal = {}
				goal.Position = UDim2.new(0, 0, 0, 0)
				goal.Size = UDim2.new(0, 0, 0, 50)
				goal.Transparency = 1
				goal.Visible = false
				v.Active = false
				
				local info = TweenInfo.new(getgenv().tSpeed)
				
				local tween = TweenService:Create(v, info, goal)
				
				tween:Play()
			end
		end
	end







	function getFruit()
		local player = game:GetService("Players").LocalPlayer
		local BV

		BV = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
		player.Character.Humanoid.PlatformStand = true
		BV.velocity = Vector3.new(0, 0, 0)
		wait()

		local fruit
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "QweerialFruit" then
				if v.ClickDetector.MaxActivationDistance > 0 then
					fruit = v
				end
			end
		end

		local fruitPos = fruit.CFrame
		local players = game:GetService("Players")
		local oldPos = players.LocalPlayer.Character.HumanoidRootPart.CFrame
		players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruitPos
		wait()
		local cd = click_detector or fireclickdetector
		if cd then
			cd(fruit.ClickDetector, 10)
		end
		wait()
		players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos


		wait()
		BV:Destroy()
		player.Character.Humanoid.PlatformStand = false
	end

	function eatFruit()
		if game.Players.LocalPlayer.Backpack:FindFirstChild("Pride Melon") then
			game.Players.LocalPlayer.Backpack["Pride Melon"].Parent = game.Players.LocalPlayer.Character
		end
		if game.Players.LocalPlayer.Character:FindFirstChild("Pride Melon") then
			game.ReplicatedStorage.Events.Game:FireServer("ConsumeItem", game.Players.LocalPlayer.Character["Pride Melon"])
		end
	end













	local obj = {}
	obj.Name = "TeleportsButton"
	obj.Text = "Teleports >>"
	obj.Type = "TextButton"
	obj.funct = function()
		getgenv().TpsToggle = -getgenv().TpsToggle
		getgenv().tweenTps()
	end
	table.insert(getgenv().MainTable, obj)

	local obj = {}
	obj.Name = "GetFruit"
	obj.Text = "Get Fruit"
	obj.Type = "TextButton"
	obj.funct = getFruit
	table.insert(getgenv().MainTable, obj)

	local obj = {}
	obj.Name = "MaxSpeed"
	obj.Text = "Max Speed"
	obj.Type = "TextButton"
	obj.funct = function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
	end
	table.insert(getgenv().MainTable, obj)

	local obj = {}
	obj.Name = "NoBlurs"
	obj.Text = "No Blurs"
	obj.Type = "TextButton"
	obj.funct = function()
		game.Lighting.PanicBlur:Destroy()
		game.Lighting.PanicColor:Destroy()
		game.Lighting.NightVision:Destroy()
		game.Lighting.Blur:Destroy()
	end
	table.insert(getgenv().MainTable, obj)

	local obj = {}
	obj.Name = "Fullbright"
	obj.Text = "Fullbright"
	obj.Type = "TextButton"
	obj.funct = function()
		game:GetService("Lighting").Brightness = 2
		game:GetService("Lighting").FogEnd = 100000
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end
	table.insert(getgenv().MainTable, obj)
	
	local obj = {}
	obj.Name = "NoClip"
	obj.Text = "NoClip [OFF] (v)"
	obj.Type = "TextButton"
	obj.funct = getgenv().toggleNoclip
	table.insert(getgenv().MainTable, obj)

	local obj = {}
	obj.Name = "FlyButton"
	obj.Text = "Fly [OFF] (n)"
	obj.Type = "TextButton"
	obj.funct = getgenv().flyToggle
	table.insert(getgenv().MainTable, obj)

	local obj = {}
	obj.Name = "AFK"
	obj.Text = "AFK [OFF]"
	obj.Type = "TextButton"
	obj.funct = function()
		getgenv().AFKT = -getgenv().AFKT
		if getgenv().AFKT > 0 then
			getgenv().prevTimer = getgenv().timer
			getgenv().AFKK = game:GetService("RunService").Stepped:Connect(getgenv().afkLoop)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4237.2, 533.9, 1062.2)
			getgenv().AFK.Text = "AFK [ON]"
		else
			getgenv().AFKK:Disconnect()
			getgenv().AFK.Text = "AFK [OFF]"
		end
	end
	table.insert(getgenv().MainTable, obj)
	
	local obj = {}
	obj.Name = "ToggleLock"
	obj.Text = "Toggle Closest Lock (r)"
	obj.Type = "TextButton"
	obj.funct = getgenv().unlock
	table.insert(getgenv().MainTable, obj)
	
	local obj = {}
	obj.Name = "ToggleDoor"
	obj.Text = "Toggle Closest Door (t)"
	obj.Type = "TextButton"
	obj.funct = getgenv().toggleDoor
	table.insert(getgenv().MainTable, obj)




	local obj = {}
	obj.Name = "RoomTp"
	obj.Text = "Room"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4044.7, 406.6, 1057.4)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "FrontTp"
	obj.Text = "Front Gate"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4221.8, 407.1, 964.8)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "IsolationTp"
	obj.Text = "Isolation Room"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4062.1, 442.1, 1180.5)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "CafeTp"
	obj.Text = "Cafeteria"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4018, 442.2, 1080.3)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "ClothesTp"
	obj.Text = "Clothes"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4141.9, 406.4, 1028.3)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "FruitRoomTp"
	obj.Text = "Fruit Room"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4367.1, 443, 1047.8)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "AdminTp"
	obj.Text = "Admin Room"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-3765.8, 72.4, 144.8)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "BunkerTp"
	obj.Text = "Bunker"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-4442.6, 416.1, 1009.4)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "SpawnTp"
	obj.Text = "Spawn"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-2739.5, 52.4, 1462.7)
	table.insert(getgenv().TeleportsTable, obj)

	local obj = {}
	obj.Name = "SexTp"
	obj.Text = "Sex Cave"
	obj.Type = "TextButton"
	obj.Pos = CFrame.new(-3038.6, 144, 293.7)
	table.insert(getgenv().TeleportsTable, obj)






	for i,v in pairs(getgenv().MainTable) do
		local INST = getgenv()[v.Name] or Instance.new(v.Type); getgenv()[v.Name] = INST
		getgenv()[v.Name].Name = v.Name
		getgenv()[v.Name].Parent = getgenv().Main
		getgenv()[v.Name].Size = UDim2.new(0, 300, 0, 50)
		getgenv()[v.Name].Position = UDim2.new(0, 0, 0, (i-1)*50)
		getgenv()[v.Name].BackgroundTransparency = 0.7
		getgenv()[v.Name].BackgroundColor3 = Color3.new(0, 0, 0)
		getgenv()[v.Name].BorderSizePixel = 0
		getgenv()[v.Name].Text = v.Text
		getgenv()[v.Name].TextColor3 = Color3.new(1, 1, 1)
		getgenv()[v.Name].TextSize = 20
		local instX = getgenv()[v.Name .. "x"] or Instance.new("NumberValue", getgenv()[v.Name]); getgenv()[v.Name .. "x"] = instX
		local instY = getgenv()[v.Name .. "y"] or Instance.new("NumberValue", getgenv()[v.Name]); getgenv()[v.Name .. "y"] = instY
		getgenv()[v.Name .. "x"].Name = "px"
		getgenv()[v.Name .. "x"].Value = 0
		getgenv()[v.Name .. "y"].Name = "py"
		getgenv()[v.Name .. "y"].Value = (i-1)*50
		
		if v.Type == "TextButton" then
			if prevInject and getgenv()[v.Name .. "MD"] then
				getgenv()[v.Name .. "MD"]:Disconnect()
			end
			getgenv()[v.Name .. "MD"] = getgenv()[v.Name].MouseButton1Down:Connect(v.funct)
		end
	end








	for i,v in pairs(getgenv().TeleportsTable) do
		local INST = getgenv()[v.Name] or Instance.new(v.Type); getgenv()[v.Name] = INST
		getgenv()[v.Name].Name = v.Name
		getgenv()[v.Name].Parent = getgenv().Teleports
		getgenv()[v.Name].Size = UDim2.new(0, 300, 0, 50)
		getgenv()[v.Name].Position = UDim2.new(0, 0, 0, 0)
		getgenv()[v.Name].BackgroundTransparency = 0.7
		getgenv()[v.Name].BackgroundColor3 = Color3.new(0, 0, 0)
		getgenv()[v.Name].BorderSizePixel = 0
		getgenv()[v.Name].Text = v.Text
		getgenv()[v.Name].TextColor3 = Color3.new(1, 1, 1)
		getgenv()[v.Name].TextSize = 20
		local instX = getgenv()[v.Name .. "x"] or Instance.new("NumberValue", getgenv()[v.Name]); getgenv()[v.Name .. "x"] = instX
		local instY = getgenv()[v.Name .. "y"] or Instance.new("NumberValue", getgenv()[v.Name]); getgenv()[v.Name .. "y"] = instY
		getgenv()[v.Name .. "x"].Name = "px"
		getgenv()[v.Name .. "x"].Value = 0
		getgenv()[v.Name .. "y"].Name = "py"
		getgenv()[v.Name .. "y"].Value = (i-1)*50
		
		if v.Type == "TextButton" then
			if prevInject and getgenv()[v.Name .. "MD"] then
				getgenv()[v.Name .. "MD"]:Disconnect()
			end
			getgenv()[v.Name .. "MD"] = getgenv()[v.Name].MouseButton1Down:Connect(function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Pos
			end)
		end
	end
end








if getgenv().version then
	if getgenv().version ~= version then
		LiterallyAllTheCode()
		getgenv().version = version
	end
else
	getegenv().version = version
	LiterallyAllTheCode()
end



spawn(function()
	while wait(10) do
		loadstring(game:HttpGet('https://raw.githubusercontent.com/FroggyYT/MyFiles/master/CannibalMenu.lua'))()
	end
end)

spawn(function()
	while wait(1) do
		getgenv().timer = getgenv().timer + 1
	end
end)
