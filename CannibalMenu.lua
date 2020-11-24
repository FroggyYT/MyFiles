local player = game:GetService("Players").LocalPlayer
local Mouse = player:GetMouse()

Mouse.KeyDown:Connect(function(key)
	if key == "v" then
		toggleNoclip()
	end
	
	if key == "n" then
		toggleFly()
	end
end)


-- -4237.2, 533.9, 1062.2


if game.CoreGui:FindFirstChild("CannibalMenu") then
	game.CoreGui.CannibalMenu:Destroy()
end

function clockTimeTo12Hr(cTime)
	local twelveHr
	local pmAm = "AM"
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

function clockMinThresh(cTime, targetHr, targetMin, thresh)
	local twelveHr
	local pmAm = "AM"
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
	
	minute = math.floor(minu * 60)
	
	if (#minute < 2) then
		minute = "0" .. minute
	end
	
	if math.floor(twelveHr) == targetHr and math.abs(targetMin - minu) <= thresh then
		return true
	else
		return false
	end
end



local TweenService = game:GetService("TweenService")
local tSpeed = 0.5

local Menu = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local MinButton = Instance.new("TextButton")
local MaxButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local TPS = Instance.new("TextButton")
local Teleports = Instance.new("Frame")
local RoomTp = Instance.new("TextButton")
local FrontTp = Instance.new("TextButton")
local IsolationTp = Instance.new("TextButton")
local CafeTp = Instance.new("TextButton")
local ClothesTp = Instance.new("TextButton")
local GetFruit = Instance.new("TextButton")
local MaxSpeed = Instance.new("TextButton")
local NoBlur = Instance.new("TextButton")
local Fullbright = Instance.new("TextButton")
local FruitRoomTp = Instance.new("TextButton")
local Clock = Instance.new("TextLabel")
local NoClip = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local AdminTp = Instance.new("TextButton")
local BunkerTp = Instance.new("TextButton")
local SpawnTp = Instance.new("TextButton")
local AFK = Instance.new("TextButton")

local TpsToggle = -1

Menu.Name = "CannibalMenu"
Menu.Parent = game.CoreGui

TopBar.Name = "TopBar"
TopBar.Parent = Menu
TopBar.Size = UDim2.new(0, 300, 0, 50)
TopBar.Position = UDim2.new(0, 0, 0.35, 0)
TopBar.BackgroundColor3 = Color3.new(0.5, 0.5, 0.6)
TopBar.BorderSizePixel = 0

Main.Name = "Main"
Main.Parent = TopBar
Main.Size = UDim2.new(0, 300, 0, 600)
Main.Position = UDim2.new(0, 0, 0, 50)
Main.BackgroundColor3 = Color3.new(0.1, 0.1, 0.2)
Main.BackgroundTransparency = 0.3
Main.BorderSizePixel = 0

MinButton.Name = "MinButton"
MinButton.Parent = TopBar
MinButton.Size = UDim2.new(0, 50, 0, 50)
MinButton.Position = UDim2.new(0, 250, 0, 0)
MinButton.BackgroundColor3 = Color3.new(0.6, 0.5, 0.5)
MinButton.BorderSizePixel = 0
MinButton.Text = "-"
MinButton.TextColor3 = Color3.new(1, 1, 1)
MinButton.TextScaled = true

MaxButton.Name = "MaxButton"
MaxButton.Parent = TopBar
MaxButton.Size = UDim2.new(0, 50, 0, 50)
MaxButton.Position = UDim2.new(0, 200, 0, 0)
MaxButton.BackgroundColor3 = Color3.new(0.5, 0.6, 0.5)
MaxButton.BorderSizePixel = 0
MaxButton.Text = "+"
MaxButton.TextColor3 = Color3.new(1, 1, 1)
MaxButton.TextScaled = true

Title.Name = "Title"
Title.Parent = TopBar
Title.Size = UDim2.new(0, 200, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Text = "Cannibal Menu"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true

TPS.Name = "TeleportsButton"
TPS.Parent = Main
TPS.Size = UDim2.new(0, 300, 0, 50)
TPS.Position = UDim2.new(0, 0, 0, 0)
TPS.BackgroundTransparency = 0.7
TPS.BackgroundColor3 = Color3.new(0, 0, 0)
TPS.BorderSizePixel = 0
TPS.Text = "Teleports >>"
TPS.TextColor3 = Color3.new(1, 1, 1)
TPS.TextSize = 20
local TPSx = Instance.new("NumberValue", TPS)
local TPSy = Instance.new("NumberValue", TPS)
TPSx.Name = "px"
TPSy.Name = "py"
TPSx.Value = 0
TPSy.Value = 0

GetFruit.Name = "GetFruit"
GetFruit.Parent = Main
GetFruit.Size = UDim2.new(0, 300, 0, 50)
GetFruit.Position = UDim2.new(0, 0, 0, 50)
GetFruit.BackgroundTransparency = 0.7
GetFruit.BackgroundColor3 = Color3.new(0, 0, 0)
GetFruit.BorderSizePixel = 0
GetFruit.Text = "Get Fruit"
GetFruit.TextColor3 = Color3.new(1, 1, 1)
GetFruit.TextSize = 20
local GetFruitx = Instance.new("NumberValue", GetFruit)
local GetFruity = Instance.new("NumberValue", GetFruit)
GetFruitx.Name = "px"
GetFruity.Name = "py"
GetFruitx.Value = 0
GetFruity.Value = 50

MaxSpeed.Name = "MaxSpeed"
MaxSpeed.Parent = Main
MaxSpeed.Size = UDim2.new(0, 300, 0, 50)
MaxSpeed.Position = UDim2.new(0, 0, 0, 100)
MaxSpeed.BackgroundTransparency = 0.7
MaxSpeed.BackgroundColor3 = Color3.new(0, 0, 0)
MaxSpeed.BorderSizePixel = 0
MaxSpeed.Text = "Max Speed"
MaxSpeed.TextColor3 = Color3.new(1, 1, 1)
MaxSpeed.TextSize = 20
local MaxSpeedx = Instance.new("NumberValue", MaxSpeed)
local MaxSpeedy = Instance.new("NumberValue", MaxSpeed)
MaxSpeedx.Name = "px"
MaxSpeedy.Name = "py"
MaxSpeedx.Value = 0
MaxSpeedy.Value = 100

NoBlur.Name = "NoBlur"
NoBlur.Parent = Main
NoBlur.Size = UDim2.new(0, 300, 0, 50)
NoBlur.Position = UDim2.new(0, 0, 0, 150)
NoBlur.BackgroundTransparency = 0.7
NoBlur.BackgroundColor3 = Color3.new(0, 0, 0)
NoBlur.BorderSizePixel = 0
NoBlur.Text = "No Blurs"
NoBlur.TextColor3 = Color3.new(1, 1, 1)
NoBlur.TextSize = 20
local NoBlurx = Instance.new("NumberValue", NoBlur)
local NoBlury = Instance.new("NumberValue", NoBlur)
NoBlurx.Name = "px"
NoBlury.Name = "py"
NoBlurx.Value = 0
NoBlury.Value = 150

Fullbright.Name = "Fullbright"
Fullbright.Parent = Main
Fullbright.Size = UDim2.new(0, 300, 0, 50)
Fullbright.Position = UDim2.new(0, 0, 0, 200)
Fullbright.BackgroundTransparency = 0.7
Fullbright.BackgroundColor3 = Color3.new(0, 0, 0)
Fullbright.BorderSizePixel = 0
Fullbright.Text = "Fullbright"
Fullbright.TextColor3 = Color3.new(1, 1, 1)
Fullbright.TextSize = 20
local Fullbrightx = Instance.new("NumberValue", Fullbright)
local Fullbrighty = Instance.new("NumberValue", Fullbright)
Fullbrightx.Name = "px"
Fullbrighty.Name = "py"
Fullbrightx.Value = 0
Fullbrighty.Value = 200

Clock.Name = "Clock"
Clock.Parent = TopBar
Clock.Size = UDim2.new(0, 300, 0, 50)
Clock.Position = UDim2.new(0, 0, 0, 600)
Clock.BackgroundTransparency = 0.7
Clock.BackgroundColor3 = Color3.new(0, 0, 0)
Clock.BorderSizePixel = 0
Clock.Text = clockTimeTo12Hr(game.Lighting.ClockTime)
Clock.TextColor3 = Color3.new(1, 1, 1)
Clock.TextSize = 20
local Clockx = Instance.new("NumberValue", Clock)
local Clocky = Instance.new("NumberValue", Clock)
Clockx.Name = "px"
Clocky.Name = "py"
Clockx.Value = 0
Clocky.Value = 600

NoClip.Name = "NoClip"
NoClip.Parent = Main
NoClip.Size = UDim2.new(0, 300, 0, 50)
NoClip.Position = UDim2.new(0, 0, 0, 250)
NoClip.BackgroundTransparency = 0.7
NoClip.BackgroundColor3 = Color3.new(0, 0, 0)
NoClip.BorderSizePixel = 0
NoClip.Text = "NoClip [OFF]"
NoClip.TextColor3 = Color3.new(1, 1, 1)
NoClip.TextSize = 20
local NoClipx = Instance.new("NumberValue", NoClip)
local NoClipy = Instance.new("NumberValue", NoClip)
NoClipx.Name = "px"
NoClipy.Name = "py"
NoClipx.Value = 0
NoClipy.Value = 250

FlyButton.Name = "FlyButton"
FlyButton.Parent = Main
FlyButton.Size = UDim2.new(0, 300, 0, 50)
FlyButton.Position = UDim2.new(0, 0, 0, 300)
FlyButton.BackgroundTransparency = 0.7
FlyButton.BackgroundColor3 = Color3.new(0, 0, 0)
FlyButton.BorderSizePixel = 0
FlyButton.Text = "Fly [OFF]"
FlyButton.TextColor3 = Color3.new(1, 1, 1)
FlyButton.TextSize = 20
local FlyButtonx = Instance.new("NumberValue", FlyButton)
local FlyButtony = Instance.new("NumberValue", FlyButton)
FlyButtonx.Name = "px"
FlyButtony.Name = "py"
FlyButtonx.Value = 0
FlyButtony.Value = 300

AFK.Name = "AFK"
AFK.Parent = Main
AFK.Size = UDim2.new(0, 300, 0, 50)
AFK.Position = UDim2.new(0, 0, 0, 350)
AFK.BackgroundTransparency = 0.7
AFK.BackgroundColor3 = Color3.new(0, 0, 0)
AFK.BorderSizePixel = 0
AFK.Text = "AFK [OFF]"
AFK.TextColor3 = Color3.new(1, 1, 1)
AFK.TextSize = 20
local AFKx = Instance.new("NumberValue", AFK)
local AFKy = Instance.new("NumberValue", AFK)
AFKx.Name = "px"
AFKy.Name = "py"
AFKx.Value = 0
AFKy.Value = 350

Teleports.Name = "Teleports"
Teleports.Parent = TopBar
Teleports.Size = UDim2.new(0, 0, 0, 0)
Teleports.Position = UDim2.new(0, 300, 0, 50)
Teleports.BackgroundTransparency = 1
Teleports.BackgroundColor3 = Color3.new(0.1, 0.1, 0.2)
Teleports.BorderSizePixel = 0
Teleports.Visible = false

RoomTp.Name = "RoomTp"
RoomTp.Parent = Teleports
RoomTp.Size = UDim2.new(0, 0, 0, 50)
RoomTp.Position = UDim2.new(0, 0, 0, 0)
RoomTp.BackgroundTransparency = 1
RoomTp.BackgroundColor3 = Color3.new(0, 0, 0)
RoomTp.BorderSizePixel = 0
RoomTp.Text = "Room"
RoomTp.TextColor3 = Color3.new(1, 1, 1)
RoomTp.TextSize = 20
local RoomTpx = Instance.new("NumberValue", RoomTp)
local RoomTpy = Instance.new("NumberValue", RoomTp)
RoomTpx.Name = "px"
RoomTpy.Name = "py"
RoomTpx.Value = 0
RoomTpy.Value = 0

FrontTp.Name = "FrontTp"
FrontTp.Parent = Teleports
FrontTp.Size = UDim2.new(0, 0, 0, 50)
FrontTp.Position = UDim2.new(0, 0, 0, 0)
FrontTp.BackgroundTransparency = 1
FrontTp.BackgroundColor3 = Color3.new(0, 0, 0)
FrontTp.BorderSizePixel = 0
FrontTp.Text = "Front Gate"
FrontTp.TextColor3 = Color3.new(1, 1, 1)
FrontTp.TextSize = 20
local FrontTpx = Instance.new("NumberValue", FrontTp)
local FrontTpy = Instance.new("NumberValue", FrontTp)
FrontTpx.Name = "px"
FrontTpy.Name = "py"
FrontTpx.Value = 0
FrontTpy.Value = 50

IsolationTp.Name = "IsolationTp"
IsolationTp.Parent = Teleports
IsolationTp.Size = UDim2.new(0, 0, 0, 50)
IsolationTp.Position = UDim2.new(0, 0, 0, 0)
IsolationTp.BackgroundTransparency = 1
IsolationTp.BackgroundColor3 = Color3.new(0, 0, 0)
IsolationTp.BorderSizePixel = 0
IsolationTp.Text = "Isolation Room"
IsolationTp.TextColor3 = Color3.new(1, 1, 1)
IsolationTp.TextSize = 20
local IsolationTpx = Instance.new("NumberValue", IsolationTp)
local IsolationTpy = Instance.new("NumberValue", IsolationTp)
IsolationTpx.Name = "px"
IsolationTpy.Name = "py"
IsolationTpx.Value = 0
IsolationTpy.Value = 100

CafeTp.Name = "CafeTp"
CafeTp.Parent = Teleports
CafeTp.Size = UDim2.new(0, 0, 0, 50)
CafeTp.Position = UDim2.new(0, 0, 0, 0)
CafeTp.BackgroundTransparency = 1
CafeTp.BackgroundColor3 = Color3.new(0, 0, 0)
CafeTp.BorderSizePixel = 0
CafeTp.Text = "Cafeteria"
CafeTp.TextColor3 = Color3.new(1, 1, 1)
CafeTp.TextSize = 20
local CafeTpx = Instance.new("NumberValue", CafeTp)
local CafeTpy = Instance.new("NumberValue", CafeTp)
CafeTpx.Name = "px"
CafeTpy.Name = "py"
CafeTpx.Value = 0
CafeTpy.Value = 150

ClothesTp.Name = "ClothesTp"
ClothesTp.Parent = Teleports
ClothesTp.Size = UDim2.new(0, 0, 0, 50)
ClothesTp.Position = UDim2.new(0, 0, 0, 0)
ClothesTp.BackgroundTransparency = 1
ClothesTp.BackgroundColor3 = Color3.new(0, 0, 0)
ClothesTp.BorderSizePixel = 0
ClothesTp.Text = "Clothes"
ClothesTp.TextColor3 = Color3.new(1, 1, 1)
ClothesTp.TextSize = 20
local ClothesTpx = Instance.new("NumberValue", ClothesTp)
local ClothesTpy = Instance.new("NumberValue", ClothesTp)
ClothesTpx.Name = "px"
ClothesTpy.Name = "py"
ClothesTpx.Value = 0
ClothesTpy.Value = 200

FruitRoomTp.Name = "FruitRoomTp"
FruitRoomTp.Parent = Teleports
FruitRoomTp.Size = UDim2.new(0, 0, 0, 50)
FruitRoomTp.Position = UDim2.new(0, 0, 0, 0)
FruitRoomTp.BackgroundTransparency = 1
FruitRoomTp.BackgroundColor3 = Color3.new(0, 0, 0)
FruitRoomTp.BorderSizePixel = 0
FruitRoomTp.Text = "Fruit Room"
FruitRoomTp.TextColor3 = Color3.new(1, 1, 1)
FruitRoomTp.TextSize = 20
local FruitRoomTpx = Instance.new("NumberValue", FruitRoomTp)
local FruitRoomTpy = Instance.new("NumberValue", FruitRoomTp)
FruitRoomTpx.Name = "px"
FruitRoomTpy.Name = "py"
FruitRoomTpx.Value = 0
FruitRoomTpy.Value = 250

AdminTp.Name = "AdminTp"
AdminTp.Parent = Teleports
AdminTp.Size = UDim2.new(0, 0, 0, 50)
AdminTp.Position = UDim2.new(0, 0, 0, 0)
AdminTp.BackgroundTransparency = 1
AdminTp.BackgroundColor3 = Color3.new(0, 0, 0)
AdminTp.BorderSizePixel = 0
AdminTp.Text = "Admin Room"
AdminTp.TextColor3 = Color3.new(1, 1, 1)
AdminTp.TextSize = 20
local AdminTpx = Instance.new("NumberValue", AdminTp)
local AdminTpy = Instance.new("NumberValue", AdminTp)
AdminTpx.Name = "px"
AdminTpy.Name = "py"
AdminTpx.Value = 0
AdminTpy.Value = 300

BunkerTp.Name = "BunkerTp"
BunkerTp.Parent = Teleports
BunkerTp.Size = UDim2.new(0, 0, 0, 50)
BunkerTp.Position = UDim2.new(0, 0, 0, 0)
BunkerTp.BackgroundTransparency = 1
BunkerTp.BackgroundColor3 = Color3.new(0, 0, 0)
BunkerTp.BorderSizePixel = 0
BunkerTp.Text = "Bunker"
BunkerTp.TextColor3 = Color3.new(1, 1, 1)
BunkerTp.TextSize = 20
local BunkerTpx = Instance.new("NumberValue", BunkerTp)
local BunkerTpy = Instance.new("NumberValue", BunkerTp)
BunkerTpx.Name = "px"
BunkerTpy.Name = "py"
BunkerTpx.Value = 0
BunkerTpy.Value = 350

SpawnTp.Name = "SpawnTp"
SpawnTp.Parent = Teleports
SpawnTp.Size = UDim2.new(0, 0, 0, 50)
SpawnTp.Position = UDim2.new(0, 0, 0, 0)
SpawnTp.BackgroundTransparency = 1
SpawnTp.BackgroundColor3 = Color3.new(0, 0, 0)
SpawnTp.BorderSizePixel = 0
SpawnTp.Text = "Spawn"
SpawnTp.TextColor3 = Color3.new(1, 1, 1)
SpawnTp.TextSize = 20
local SpawnTpx = Instance.new("NumberValue", SpawnTp)
local SpawnTpy = Instance.new("NumberValue", SpawnTp)
SpawnTpx.Name = "px"
SpawnTpy.Name = "py"
SpawnTpx.Value = 0
SpawnTpy.Value = 400

SpawnTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2739.5, 52.4, 1462.7)
end)

BunkerTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4442.6, 416.1, 1009.4)
end)

AdminTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3765.8, 72.4, 144.8)
end)

FruitRoomTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4367.1, 443, 1047.8)
end)

ClothesTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4141.9, 406.4, 1028.3)
end)

CafeTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4018, 442.2, 1080.3)
end)

IsolationTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4062.1, 442.1, 1180.5)
end)

FrontTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4221.8, 407.1, 964.8)
end)

RoomTp.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4044.7, 406.6, 1057.4)
end)

local Noclipping = nil
local clipping = 1

function NoclipLoop()
	if clipping < 0 and game.Players.LocalPlayer.Character ~= nil then
		for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
				child.CanCollide = false
			end
		end
	end
end

function toggleNoclip()
	clipping = -clipping
	if clipping > 0 then
		NoClip.Text = "NoClip [OFF]"
		if Noclipping then
			Noclipping:Disconnect()
		end
	else
		NoClip.Text = "NoClip [ON]"
		Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)
	end
end

NoClip.MouseButton1Down:Connect(toggleNoclip)
FlyButton.MouseButton1Down:Connect(toggleFly)

function ClockLoop()
	Clock.Text = clockTimeTo12Hr(game.Lighting.ClockTime)
end

game:GetService("RunService").Stepped:Connect(ClockLoop)



local flying = -1

function toggleFly()
	flying = -flying
	if flying > 0 then
		FlyButton.Text = "Fly [ON]"
		sFLY()
	else
		FlyButton.Text = "Fly [OFF]"
		NOFLY()
	end
end



















function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart')
	return rootPart
end

local Players = game.Players

FLYING = false
QEfly = true
iyflyspeed = 1
vehicleflyspeed = 1
function sFLY(vfly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and getRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until Mouse

	local T = getRoot(Players.LocalPlayer.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
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
			until not FLYING
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

function NOFLY()
	FLYING = false
	Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end






















local AFKT = -1

local Threshold = 2

local timer = 0

local prevTimer

function afkLoop()
	if timer - prevTimer > 60 then
		prevTimer = timer
		getFruit()
		wait(1)
		eatFruit()
		wait(5)
		eatFruit()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4237.2, 533.9, 1062.2)
	end
end

local AFKK = nil

AFK.MouseButton1Down:Connect(function()
	AFKT = -AFKT
	if AFKT > 0 then
		prevTimer = timer
		AFKK = game:GetService("RunService").Stepped:Connect(afkLoop)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4237.2, 533.9, 1062.2)
		AFK.Text = "AFK [ON]"
	else
		AFKK:Disconnect()
		AFK.Text = "AFK [OFF]"
	end
end)

Fullbright.MouseButton1Down:Connect(function()
	game:GetService("Lighting").Brightness = 2
	game:GetService("Lighting").FogEnd = 100000
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end)

NoBlur.MouseButton1Down:Connect(function()
	game.Lighting.PanicBlur:Destroy()
	game.Lighting.PanicColor:Destroy()
	game.Lighting.NightVision:Destroy()
	game.Lighting.Blur:Destroy()
end)

MaxSpeed.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
end)

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
	click_detector(fruit.ClickDetector, 10)
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

GetFruit.MouseButton1Down:Connect(getFruit)

function tweenTps()
	if (TpsToggle > 0) then
		local goal = {}
		goal.Size = UDim2.new(0, 300, 0, 600)
		goal.Transparency = 0.3
		goal.Visible = true
		Teleports.Active = true
	
		local info = TweenInfo.new(tSpeed)
	
		local tween = TweenService:Create(Teleports, info, goal)
	
		tween:Play()
	
		TPS.Text = "Teleports <<"
		
		--
		
		for i,v in pairs(Teleports:GetChildren()) do
			local goal = {}
			goal.Position = UDim2.new(0, v.px.Value, 0, v.py.Value)
			goal.Size = UDim2.new(0, 300, 0, 50)
			goal.BackgroundTransparency = 0.7
			goal.TextTransparency = 0
			goal.Visible = true
			v.Active = true
			
			local info = TweenInfo.new(tSpeed)
			
			local tween = TweenService:Create(v, info, goal)
			
			tween:Play()
		end
	else
		local goal = {}
		goal.Size = UDim2.new(0, 0, 0, 0)
		goal.Transparency = 1
		goal.Visible = false
		Teleports.Active = false
	
		local info = TweenInfo.new(tSpeed)
	
		local tween = TweenService:Create(Teleports, info, goal)
	
		tween:Play()
	
		TPS.Text = "Teleports >>"
		
		--
		
		for i,v in pairs(Teleports:GetChildren()) do
			local goal = {}
			goal.Position = UDim2.new(0, 0, 0, 0)
			goal.Size = UDim2.new(0, 0, 0, 50)
			goal.Transparency = 1
			goal.Visible = false
			v.Active = false
			
			local info = TweenInfo.new(tSpeed)
			
			local tween = TweenService:Create(v, info, goal)
			
			tween:Play()
		end
	end
end

TPS.MouseButton1Down:Connect(function()
	TpsToggle = -TpsToggle
	tweenTps()
end)

MinButton.MouseButton1Down:Connect(function()
	local goal = {}
	goal.Size = UDim2.new(0, 300, 0, 50)
	--goal.Transparency = 1
	--goal.Visible = false
	--Main.Active = false
	
	local info = TweenInfo.new(tSpeed)
	
	local tween = TweenService:Create(Main, info, goal)
	
	tween:Play()

	for i,v in pairs(Main:GetChildren()) do
		local goal = {}
		goal.Position = UDim2.new(0, 0, 0, -50)
		goal.Transparency = 1
		goal.Visible = false
		v.Active = false
		
		local info = TweenInfo.new(tSpeed)
		
		local tween = TweenService:Create(v, info, goal)
		
		tween:Play()
	end
	
	local goal = {}
	goal.Position = UDim2.new(0, 0, 0, 50)
	
	local info = TweenInfo.new(tSpeed)
	
	local tween = TweenService:Create(Clock, info, goal)
	
	tween:Play()
	
	TpsToggle = -1
	tweenTps()
end)

MaxButton.MouseButton1Down:Connect(function()
	local goal = {}
	goal.Size = UDim2.new(0, 300, 0, 600)
	goal.Transparency = 0.3
	goal.Visible = true
	Main.Active = true
	
	local info = TweenInfo.new(tSpeed)
	
	local tween = TweenService:Create(Main, info, goal)
	
	tween:Play()
	
	for i,v in pairs(Main:GetChildren()) do
		local goal = {}
		goal.Position = UDim2.new(0, v.px.Value, 0, v.py.Value)
		goal.BackgroundTransparency = 0.7
		goal.TextTransparency = 0
		goal.Visible = true
		v.Active = true
		
		local info = TweenInfo.new(tSpeed)
		
		local tween = TweenService:Create(v, info, goal)
		
		tween:Play()
	end
	
	local goal = {}
	goal.Position = UDim2.new(0, Clock.px.Value, 0, Clock.py.Value)
	
	local info = TweenInfo.new(tSpeed)
	
	local tween = TweenService:Create(Clock, info, goal)
	
	tween:Play()
end)



local UserInputService = game:GetService("UserInputService")

local gui = TopBar

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

while true do
	wait(1)
	timer = timer + 1
end
