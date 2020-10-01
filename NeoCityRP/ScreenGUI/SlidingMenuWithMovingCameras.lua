wait(5)

-- Services
local Tween = game:GetService("TweenService")

-- Variables
local Sidebar = script.Parent:WaitForChild("Sidebar")
local PlayBtn = Sidebar:WaitForChild("Play")
local CreditsBtn = Sidebar:WaitForChild("Credits")
local Title = Sidebar:WaitForChild("Title")

local Cam = workspace.CurrentCamera
local CamPoints = workspace:WaitForChild("CameraPoints")

--Tweens
local SlideOutSide = Tween:Create(Sidebar,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position = UDim2.new(0,0,0,0)})-- Slides out Sidebar

local HoverOverPlayBtn = Tween:Create(PlayBtn, TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0.1,0)})
local LeavePlayBtn = Tween:Create(PlayBtn, TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size = UDim2.new(0.9,0,0.09,0)})

local HoverOverCreditsBtn = Tween:Create(CreditsBtn, TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size = UDim2.new(1,0,0.1,0)})
local LeaveCreditsBtn = Tween:Create(CreditsBtn, TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size = UDim2.new(0.9,0,0.09,0)})

SlideOutSide:Play()	--Play Tween

--PlayBtn
PlayBtn.MouseEnter:Connect(function()
	HoverOverPlayBtn:Play()
	print("Entered")
end)

PlayBtn.MouseLeave:Connect(function()
	LeavePlayBtn:Play()
	print("Left")
end)

--CreditsBtn
CreditsBtn.MouseEnter:Connect(function()
	HoverOverCreditsBtn:Play()
	print("Entered")
end)

CreditsBtn.MouseLeave:Connect(function()
	LeaveCreditsBtn:Play()
	print("Left")
end)

--Camera Tweening
local function TweenCameraPos(Point, Speed)
	Tween:Create(Cam, TweenInfo.new(Speed, Enum.EasingStyle.Linear), {CFrame = Point.CFrame}):Play()
end

Cam.CameraType = Enum.CameraType.Scriptable
Cam.FieldOfView = 50

while true do
	TweenCameraPos(CamPoints:FindFirstChild("1"), 6)
	wait(10)
	TweenCameraPos(CamPoints:FindFirstChild("2"), 6)
	wait(10)
	TweenCameraPos(CamPoints:FindFirstChild("3"), 6)
	wait(10)
end