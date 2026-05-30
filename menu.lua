-- [[ SCRIPT MOD MENU HARRY V3.0 - FULL DRAGGABLE UPDATE ]] --

if game.CoreGui:FindFirstChild("MyModMenu") then
    game.CoreGui.MyModMenu:Destroy()
end

local MyModMenu = Instance.new("ScreenGui")
MyModMenu.Name = "MyModMenu"
MyModMenu.Parent = game.CoreGui
MyModMenu.ResetOnSpawn = false

local DogImageID = "rbxassetid://18225573650" 
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- ==========================================
--  PHẦN 1: GIAO DIỆN CHÀO MỪNG (LOADING SCREEN)
-- ==========================================
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = MyModMenu
LoadingFrame.Size = UDim2.new(0, 300, 0, 160)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadingFrame.BorderSizePixel = 0

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 0)
LoadingCorner.Parent = LoadingFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 150)
UIStroke.Thickness = 2
UIStroke.Parent = LoadingFrame

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = LoadingFrame
LoadingText.Size = UDim2.new(1, 0, 0.5, 0)
LoadingText.Position = UDim2.new(0, 0, 0.1, 0)
LoadingText.Text = "HARRY V3.0 PRO"
LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingText.Font = Enum.Font.FredokaOne
LoadingText.TextSize = 26
LoadingText.BackgroundTransparency = 1

local SubText = Instance.new("TextLabel")
SubText.Parent = LoadingFrame
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Position = UDim2.new(0, 0, 0.65, 0)
SubText.Text = "Đang tích hợp tính năng kéo thả Menu chính..."
SubText.TextColor3 = Color3.fromRGB(150, 150, 150)
SubText.Font = Enum.Font.SourceSansItalic
SubText.TextSize = 13
SubText.BackgroundTransparency = 1

-- ==========================================
--  PHẦN 2: GIAO DIỆN CHÍNH HÌNH VUÔNG + DRAGGABLE
-- ==========================================
local MenuIcon = Instance.new("ImageButton")
MenuIcon.Name = "MenuIcon"
MenuIcon.Parent = MyModMenu
MenuIcon.Size = UDim2.new(0, 55, 0, 55)
MenuIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
MenuIcon.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MenuIcon.Image = DogImageID
MenuIcon.Visible = false

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(0, 255, 150)
IconStroke.Thickness = 2
IconStroke.Parent = MenuIcon

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = MyModMenu
MainFrame.Size = UDim2.new(0, 260, 0, 460)
MainFrame.Position = UDim2.new(0.15, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
local OriginalSize = MainFrame.Size

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 0)
MainCorner.Parent = MainFrame

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.Color = Color3.fromRGB(0, 255, 150)
MainFrameStroke.Thickness = 2
MainFrameStroke.Parent = MainFrame

local MenuLogo = Instance.new("ImageLabel")
MenuLogo.Name = "MenuLogo"
MenuLogo.Parent = MainFrame
MenuLogo.Size = UDim2.new(0, 70, 0, 70)
MenuLogo.Position = UDim2.new(0.5, -35, 0, 10)
MenuLogo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MenuLogo.Image = DogImageID
local LogoCorner = Instance.new("UICorner") ; LogoCorner.CornerRadius = UDim.new(0,0) ; LogoCorner.Parent = MenuLogo

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(0, 255, 150)
LogoStroke.Thickness = 1.5
LogoStroke.Parent = MenuLogo

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Position = UDim2.new(0, 0, 0, 85)
Title.Text = "HARRY V3.0 - PRO MENU"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 15
Title.BackgroundTransparency = 1

local SearchBar = Instance.new("TextBox")
SearchBar.Name = "SearchBar"
SearchBar.Parent = MainFrame
SearchBar.Size = UDim2.new(0, 230, 0, 30)
SearchBar.Position = UDim2.new(0, 15, 0, 115)
SearchBar.PlaceholderText = "🔍 Nhập từ khóa cần tìm..."
SearchBar.Text = ""
SearchBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.Font = Enum.Font.SourceSans
SearchBar.TextSize = 14
local SearchCorner = Instance.new("UICorner") ; SearchCorner.CornerRadius = UDim.new(0,0) ; SearchCorner.Parent = SearchBar

local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.Size = UDim2.new(1, 0, 1, -155)
Container.Position = UDim2.new(0, 0, 0, 150)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 520)
Container.ScrollBarThickness = 3

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Container
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 7)

-- ==========================================
--  HỆ THỐNG KÉO THẢ (DRAG) CHO CẢ ICON VÀ MENU
-- ==========================================
local UserInputService = game:GetService("UserInputService")

local function MakeDraggable(guiObject)
    local dragging, dragInput, dragStart, startPos
    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Kích hoạt kéo thả cho Icon tròn và khung Menu chính luôn
MakeDraggable(MenuIcon)
MakeDraggable(MainFrame)

-- Hiệu ứng mở/đóng menu mượt
MenuIcon.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        local closeTween = TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 260, 0, 0)})
        closeTween:Play()
        closeTween.Completed:Connect(function() MainFrame.Visible = false end)
    else
        MainFrame.Size = UDim2.new(0, 260, 0, 0)
        MainFrame.Visible = true
        TweenService:Create(MainFrame, tweenInfo, {Size = OriginalSize}):Play()
    end
end)

local function CreateButton(text, order)
    local btn = Instance.new("TextButton")
    btn.Name = text
    btn.Size = UDim2.new(0, 220, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.LayoutOrder = order
    btn.Parent = Container
    local cr = Instance.new("UICorner") ; cr.CornerRadius = UDim.new(0, 0) ; cr.Parent = btn
    local bs = Instance.new("UIStroke") ; bs.Color = Color3.fromRGB(60, 60, 60) ; bs.Thickness = 1 ; bs.Parent = btn
    return btn
end

-- ==========================================
--  PHẦN 3: LẬP TRÌNH CÁC CHỨC NĂNG CHUẨN VẬT LÝ
-- ==========================================
local LocalPlayer = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- 1. Tốc độ chạy
local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "Nhập Tốc Độ Chạy Speed"
SpeedInput.Size = UDim2.new(0, 220, 0, 35); SpeedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.PlaceholderText = "Nhập Tốc độ chạy..."; SpeedInput.Text = ""; SpeedInput.LayoutOrder = 1; SpeedInput.Parent = Container
local sCorner = Instance.new("UICorner") ; sCorner.CornerRadius = UDim.new(0,0) ; sCorner.Parent = SpeedInput
SpeedInput.FocusLost:Connect(function(ep) if ep and tonumber(SpeedInput.Text) then LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(SpeedInput.Text) end end)

-- 2. Lực Nhảy Cao
local JumpInput = Instance.new("TextBox")
JumpInput.Name = "Nhập Lực Nhảy Cao Jump"
JumpInput.Size = UDim2.new(0, 220, 0, 35); JumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); JumpInput.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpInput.PlaceholderText = "Nhập Lực nhảy cao..."; JumpInput.Text = ""; JumpInput.LayoutOrder = 2; JumpInput.Parent = Container
local jCorner = Instance.new("UICorner") ; jCorner.CornerRadius = UDim.new(0,0) ; jCorner.Parent = JumpInput
JumpInput.FocusLost:Connect(function(ep) if ep and tonumber(JumpInput.Text) then LocalPlayer.Character.Humanoid.JumpPower = tonumber(JumpInput.Text) LocalPlayer.Character.Humanoid.UseJumpPower = true end end)

-- 3. Dịch chuyển tọa độ
local TeleportInput = Instance.new("TextBox")
TeleportInput.Name = "Dịch Chuyển Tọa Độ Teleport Tele"
TeleportInput.Size = UDim2.new(0, 220, 0, 35); TeleportInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); TeleportInput.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportInput.PlaceholderText = "Nhập tọa độ X, Y, Z để Tele..."; TeleportInput.Text = ""; TeleportInput.LayoutOrder = 3; TeleportInput.Parent = Container
local tCorner = Instance.new("UICorner") ; tCorner.CornerRadius = UDim.new(0,0) ; tCorner.Parent = TeleportInput
TeleportInput.FocusLost:Connect(function(ep)
    if ep and TeleportInput.Text ~= "" then
        pcall(function()
            local coords = {}
            for coord in string.gmatch(TeleportInput.Text, "[^,]+") do table.insert(coords, tonumber(coord)) end
            if #coords == 3 then LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(coords[1], coords[2], coords[3]) end
        end)
    end
end)

-- 4. Wallhop Nhảy bám tường
local WallhopBtn = CreateButton("Wallhop Nhảy Bám Tường: TẮT", 4)
local wallhopEnabled = false
WallhopBtn.MouseButton1Click:Connect(function()
    wallhopEnabled = not wallhopEnabled
    WallhopBtn.Text = wallhopEnabled and "Wallhop Nhảy Bám Tường: BẬT" or "Wallhop Nhảy Bám Tường: TẮT"
    WallhopBtn.BackgroundColor3 = wallhopEnabled and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    WallhopBtn.TextColor3 = wallhopEnabled and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
end)
UserInputService.JumpRequest:Connect(function()
    if wallhopEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- 5. Noclip Xuyên Tường
local NoclipBtn = CreateButton("Noclip Xuyên Tường: TẮT", 5)
local noclip = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    NoclipBtn.Text = noclip and "Noclip Xuyên Tường: BẬT" or "Noclip Xuyên Tường: TẮT"
    NoclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    NoclipBtn.TextColor3 = noclip and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
end)
RunService.Stepped:Connect(function()
    if noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- 6. Bay Tự Do Theo Hướng Camera (Có bay cao)
local FlyBtn = CreateButton("Bay Tự Do (Theo Camera): TẮT", 6)
local flying = false
local flySpeed = 60
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "Bay Tự Do (Theo Camera): BẬT" or "Bay Tự Do (Theo Camera): TẮT"
    FlyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    FlyBtn.TextColor3 = flying and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    
    local char = LocalPlayer.Character
    if flying and char and char:FindFirstChild("HumanoidRootPart") then
        local p = char.HumanoidRootPart
        local bg = Instance.new("BodyGyro", p)
        bg.maxTorque = Vector3.new(4e5, 4e5, 4e5)
        bg.cframe = p.CFrame
        
        local bv = Instance.new("BodyVelocity", p)
        bv.maxForce = Vector3.new(4e5, 4e5, 4e5)
        bv.velocity = Vector3.new(0, 0, 0)
        
        spawn(function()
            while flying and char and p.Parent do
                RunService.RenderStepped:Wait()
                bg.cframe = workspace.CurrentCamera.CFrame
                
                local moveDir = char.Humanoid.MoveDirection
                if moveDir.Magnitude > 0 then
                    local camCFrame = workspace.CurrentCamera.CFrame
                    local lookVec = camCFrame.LookVector
                    
                    local flyVector = Vector3.new(0,0,0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) or moveDir.Magnitude > 0 then
                        flyVector = lookVec
                    end
                    
                    bv.velocity = flyVector * flySpeed
                else
                    bv.velocity = Vector3.new(0, 0, 0)
                end
            end
            bg:Destroy(); bv:Destroy()
        end)
    end
end)

-- 7. Hành Động Nằm Phẳng Cố Định Chống Lật
local LieBtn = CreateButton("Hành Động Nằm: TẮT", 7)
local lyingDown = false
LieBtn.MouseButton1Click:Connect(function()
    lyingDown = not lyingDown
    LieBtn.Text = lyingDown and "Hành Động Nằm: BẬT" or "Hành Động Nằm: TẮT"
    LieBtn.BackgroundColor3 = lyingDown and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    LieBtn.TextColor3 = lyingDown and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local p = char.HumanoidRootPart
        local rootJoint = p:FindFirstChild("RootJoint") or char.LowerTorso:FindFirstChild("Root")
        if rootJoint then
            if lyingDown then
                char.Humanoid.PlatformStand = true
                rootJoint.C0 = CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(90), 0, 0)
            else
                char.Humanoid.PlatformStand = false
                rootJoint.C0 = char.Humanoid.RigType == Enum.HumanoidRigType.R6 and CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(180), 0) or CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(180), 0)
            end
        end
    end
end)

-- 8. Hành Động Ngồi Thẳng Chống Lật
local SitBtn = CreateButton("Hành Động Ngồi: TẮT", 8)
local sittingDown = false
SitBtn.MouseButton1Click:Connect(function()
    sittingDown = not sittingDown
    SitBtn.Text = sittingDown and "Hành Động Ngồi: BẬT" or "Hành Động Ngồi: TẮT"
    SitBtn.BackgroundColor3 = sittingDown and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    SitBtn.TextColor3 = sittingDown and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)

    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local p = char.HumanoidRootPart
        local rootJoint = p:FindFirstChild("RootJoint") or char.LowerTorso:FindFirstChild("Root")
        if rootJoint then
            if sittingDown then
                char.Humanoid.PlatformStand = true
                rootJoint.C0 = CFrame.new(0, -1, 0) * CFrame.Angles(0, math.rad(180), 0)
                char.Humanoid.Sit = true
            else
                char.Humanoid.PlatformStand = false
                char.Humanoid.Sit = false
                rootJoint.C0 = char.Humanoid.RigType == Enum.HumanoidRigType.R6 and CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(180), 0) or CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(180), 0)
            end
        end
    end
end)

-- 9. JERK TAY CAO ĐỨNG IM MƯỢT MÀ
local JerkBtn = CreateButton("Hành động Jerk: TẮT", 9)
local jerking = false
JerkBtn.MouseButton1Click:Connect(function()
    jerking = not jerking
    JerkBtn.Text = jerking and "Hành động Jerk: BẬT" or "Hành động Jerk: TẮT"
    JerkBtn.BackgroundColor3 = jerking and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    JerkBtn.TextColor3 = jerking and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    
    spawn(function()
        while jerking and task.wait() do
            pcall(function()
                local char = LocalPlayer.Character
                local rShoulder = char:FindFirstChild("Right Shoulder", true) or char.Torso:FindFirstChild("Right Shoulder")
                
                if rShoulder then
                    rShoulder.C0 = rShoulder.C0 * CFrame.Angles(math.rad(65), 0, 0) * CFrame.new(0, 0.2, 0)
                    task.wait(0.04)
                    rShoulder.C0 = rShoulder.C0 * CFrame.Angles(math.rad(-65), 0, 0) * CFrame.new(0, -0.2, 0)
                    task.wait(0.04)
                end
            end)
        end
        pcall(function()
            local char = LocalPlayer.Character
            local rShoulder = char:FindFirstChild("Right Shoulder", true) or char.Torso:FindFirstChild("Right Shoulder")
            if rShoulder then
                rShoulder.C0 = char.Humanoid.RigType == Enum.HumanoidRigType.R6 and CFrame.new(1, 0.5, 0) * CFrame.Angles(0, math.rad(90), 0) or CFrame.new(1, 0.5, 0) * CFrame.Angles(0, 0, 0)
            end
        end)
    end)
end)

-- 10. Tàng Hình Cục Bộ
local InvisBtn = CreateButton("Tàng Hình Cục Bộ: TẮT", 10)
local invisible = false
InvisBtn.MouseButton1Click:Connect(function()
    invisible = not invisible
    InvisBtn.Text = invisible and "Tàng Hình Cục Bộ: BẬT" or "Tàng Hình Cục Bộ: TẮT"
    InvisBtn.BackgroundColor3 = invisible and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(45, 45, 45)
    InvisBtn.TextColor3 = invisible and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                if part.Name ~= "HumanoidRootPart" then part.Transparency = invisible and 1 or 0 end
            end
        end
    end
end)

-- ==========================================
--  LOGIC XỬ LÝ LỌC TÌM KIẾM THEO TỪ KHÓA
-- ==========================================
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local textInput = string.lower(SearchBar.Text)
    for _, child in pairs(Container:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextBox") then
            if textInput == "" then
                child.Visible = true
            else
                if string.find(string.lower(child.Name), textInput) then child.Visible = true else child.Visible = false end
            end
        end
    end
end)

-- ==========================================
--  HIỆU ỨNG KHỞI ĐỘNG
-- ==========================================
task.wait(1.5)
SubText.Text = "Kích hoạt hệ thống kéo thả đa nhiệm..."
task.wait(1)
LoadingFrame:Destroy()
MenuIcon.Visible = true
