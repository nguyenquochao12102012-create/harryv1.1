-- [[ SCRIPT MOD MENU - ADD LOADING EFFECT ]] --

if game.CoreGui:FindFirstChild("MyModMenu") then
    game.CoreGui.MyModMenu:Destroy()
end

local MyModMenu = Instance.new("ScreenGui")
MyModMenu.Name = "MyModMenu"
MyModMenu.Parent = game.CoreGui
MyModMenu.ResetOnSpawn = false

-- ==========================================
--  PHẦN 1: GIAO DIỆN CHÀO MỪNG (LOADING SCREEN)
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = MyModMenu
LoadingFrame.Size = UDim2.new(0, 300, 0, 150)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -75) -- Căn chính giữa màn hình
LoadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadingFrame.BorderSizePixel = 0

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 12)
LoadingCorner.Parent = LoadingFrame

-- Hiệu ứng viền phát sáng màu đỏ/xanh cho ngầu
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 85)
UIStroke.Thickness = 2
UIStroke.Parent = LoadingFrame

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = LoadingFrame
LoadingText.Size = UDim2.new(1, 0, 0.6, 0)
LoadingText.Position = UDim2.new(0, 0, 0.1, 0)
LoadingText.Text = "HACK BY HARRY V1"
LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingText.Font = Enum.Font.FredokaOne -- Kiểu chữ dày, hiện đại
LoadingText.TextSize = 24
LoadingText.BackgroundTransparency = 1

local SubText = Instance.new("TextLabel")
SubText.Parent = LoadingFrame
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Position = UDim2.new(0, 0, 0.65, 0)
SubText.Text = "Đang tải dữ liệu cấu trúc..."
SubText.TextColor3 = Color3.fromRGB(150, 150, 150)
SubText.Font = Enum.Font.SourceSansItalic
SubText.TextSize = 14
SubText.BackgroundTransparency = 1

-- ==========================================
--  PHẦN 2: KHỞI TẠO MENU CHÍNH & ICON (MẶC ĐỊNH ẨN)
-- ==========================================
local MenuIcon = Instance.new("TextButton")
MenuIcon.Name = "MenuIcon"
MenuIcon.Parent = MyModMenu
MenuIcon.Size = UDim2.new(0, 50, 0, 50)
MenuIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
MenuIcon.BackgroundColor3 = Color3.fromRGB(255, 0, 85) -- Đổi sang tông màu hồng đỏ cho tiệp với logo mới
MenuIcon.Text = "HR"
MenuIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuIcon.Font = Enum.Font.SourceSansBold
MenuIcon.TextSize = 16
MenuIcon.Visible = false -- Ẩn đi khi đang load

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = MenuIcon

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = MyModMenu
MainFrame.Size = UDim2.new(0, 250, 0, 320)
MainFrame.Position = UDim2.new(0.15, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "HARRY V1 - MOD MENU"
Title.TextColor3 = Color3.fromRGB(255, 0, 85)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Kéo thả Icon
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
MenuIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MenuIcon.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
        local delta = input.Position - dragStart
        MenuIcon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

MenuIcon.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- --- CODE LOGIC CÁC TÍNH NĂNG (Giữ nguyên từ bản trước) ---
local LocalPlayer = game.Players.LocalPlayer

-- 1. Tốc độ
local SpeedInput = Instance.new("TextBox")
SpeedInput.Parent = MainFrame; SpeedInput.Size = UDim2.new(0, 210, 0, 35); SpeedInput.Position = UDim2.new(0, 20, 0, 55)
SpeedInput.PlaceholderText = "Nhập tốc độ chạy..."; SpeedInput.Text = ""; SpeedInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50); SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.FocusLost:Connect(function(ep) if ep then local s = tonumber(SpeedInput.Text) if s and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = s end end end)

-- 2. Bay
local FlyButton = Instance.new("TextButton")
FlyButton.Parent = MainFrame; FlyButton.Size = UDim2.new(0, 210, 0, 35); FlyButton.Position = UDim2.new(0, 20, 0, 100)
FlyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60); FlyButton.Text = "Bay Tự Do: TẮT"; FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local flying = false
FlyButton.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        FlyButton.Text = "Bay Tự Do: BẬT"; FlyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 85)
        local char = LocalPlayer.Character; local bg = Instance.new("BodyGyro", char.HumanoidRootPart); bg.maxTorque = Vector3.new(4e5, 4e5, 4e5); bg.cframe = char.HumanoidRootPart.CFrame
        local bv = Instance.new("BodyVelocity", char.HumanoidRootPart); bv.maxForce = Vector3.new(4e5, 4e5, 4e5); bv.velocity = Vector3.new(0, 0.1, 0)
        spawn(function()
            while flying and char and char:FindFirstChild("HumanoidRootPart") do
                game:GetService("RunService").RenderStepped:Wait()
                local cam = workspace.CurrentCamera; bv.velocity = cam.CFrame.LookVector * (char.Humanoid.WalkSpeed * 2); bg.cframe = cam.CFrame
            end
            bg:Destroy(); bv:Destroy()
        end)
    else FlyButton.Text = "Bay Tự Do: TẮT"; FlyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60) end
end)

-- 3. Tàng hình
local InvisibilityButton = Instance.new("TextButton")
InvisibilityButton.Parent = MainFrame; InvisibilityButton.Size = UDim2.new(0, 210, 0, 35); InvisibilityButton.Position = UDim2.new(0, 20, 0, 145)
InvisibilityButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60); InvisibilityButton.Text = "Tàng Hình: TẮT"; InvisibilityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
local invisible = false
InvisibilityButton.MouseButton1Click:Connect(function()
    invisible = not invisible; local char = LocalPlayer.Character
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                if part.Name ~= "HumanoidRootPart" then part.Transparency = invisible and 1 or 0 end
            end
        end
        InvisibilityButton.Text = invisible and "Tàng Hình: BẬT" or "Tàng Hình: TẮT"
        InvisibilityButton.BackgroundColor3 = invisible and Color3.fromRGB(255, 0, 85) or Color3.fromRGB(60, 60, 60)
    end
end)

-- 4. Dịch chuyển
local TeleportInput = Instance.new("TextBox")
TeleportInput.Parent = MainFrame; TeleportInput.Size = UDim2.new(0, 210, 0, 35); TeleportInput.Position = UDim2.new(0, 20, 0, 200)
TeleportInput.PlaceholderText = "Nhập tên người chơi..."; TeleportInput.Text = ""; TeleportInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50); TeleportInput.TextColor3 = Color3.fromRGB(255, 255, 255)
local TeleportButton = Instance.new("TextButton")
TeleportButton.Parent = MainFrame; TeleportButton.Size = UDim2.new(0, 210, 0, 35); TeleportButton.Position = UDim2.new(0, 20, 0, 245)
TeleportButton.BackgroundColor3 = Color3.fromRGB(255, 0, 85); TeleportButton.Text = "Dịch Chuyển"; TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255); TeleportButton.Font = Enum.Font.SourceSansBold
TeleportButton.MouseButton1Click:Connect(function()
    local targetName = string.lower(TeleportInput.Text); local foundPlayer = nil
    for _, p in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(p.Name), 1, #targetName) == targetName or string.sub(string.lower(p.DisplayName), 1, #targetName) == targetName then foundPlayer = p; break end
    end
    if foundPlayer and foundPlayer.Character and foundPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = foundPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
    end
end)

-- ==========================================
--  PHẦN 3: HIỆU ỨNG ĐẾM NGƯỢC ĐỂ VÀO MENU
-- ==========================================
task.wait(1.5)
SubText.Text = "Đang kiểm tra thiết bị Android..."
task.wait(1.5)
SubText.Text = "Kết nối thành công với Delta X!"
task.wait(1)

-- Hoàn tất loading: Xóa bảng chào và hiện nút Menu chính
LoadingFrame:Destroy()
MenuIcon.Visible = true
