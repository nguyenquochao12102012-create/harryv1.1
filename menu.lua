-- [[ SCRIPT MOD MENU HARRY V2.6 - SQUARE TOTAL UPDATE (SEARCH & TELE) ]] --

if game.CoreGui:FindFirstChild("MyModMenu") then
    game.CoreGui.MyModMenu:Destroy()
end

local MyModMenu = Instance.new("ScreenGui")
MyModMenu.Name = "MyModMenu"
MyModMenu.Parent = game.CoreGui
MyModMenu.ResetOnSpawn = false

-- ID Hình ảnh chú chó streamer từ ảnh của bạn
local DogImageID = "rbxassetid://18225573650" 

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

-- Chỉnh góc vuông cho giao diện loading
local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 0) -- 0 pixel = Hình vuông hoàn toàn
LoadingCorner.Parent = LoadingFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 150) -- Màu xanh Neon
UIStroke.Thickness = 2
UIStroke.Parent = LoadingFrame

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = LoadingFrame
LoadingText.Size = UDim2.new(1, 0, 0.5, 0)
LoadingText.Position = UDim2.new(0, 0, 0.1, 0)
LoadingText.Text = "HARRY V2.6 PRO"
LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingText.Font = Enum.Font.FredokaOne
LoadingText.TextSize = 26
LoadingText.BackgroundTransparency = 1

local SubText = Instance.new("TextLabel")
SubText.Parent = LoadingFrame
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Position = UDim2.new(0, 0, 0.65, 0)
SubText.Text = "Đang đồng bộ Search, Teleport & Hình vuông..."
SubText.TextColor3 = Color3.fromRGB(150, 150, 150)
SubText.Font = Enum.Font.SourceSansItalic
SubText.TextSize = 13
SubText.BackgroundTransparency = 1

-- ==========================================
--  PHẦN 2: MENU CHÍNH HÌNH VUÔNG CÓ LOGO CHÓ & SEARCH BAR
-- ==========================================
local MenuIcon = Instance.new("ImageButton")
MenuIcon.Name = "MenuIcon"
MenuIcon.Parent = MyModMenu
MenuIcon.Size = UDim2.new(0, 55, 0, 55)
MenuIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
MenuIcon.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MenuIcon.Image = DogImageID -- Hình chú chó ngoài nút bật/tắt
MenuIcon.Visible = false

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(0, 255, 150)
IconStroke.Thickness = 2
IconStroke.Parent = MenuIcon

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = MyModMenu
MainFrame.Size = UDim2.new(0, 260, 0, 460) -- Tăng một chút chiều cao để chứa cả Logo và Search
MainFrame.Position = UDim2.new(0.15, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 0) -- HÌNH VUÔNG GÓC CẠNH
MainCorner.Parent = MainFrame

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.Color = Color3.fromRGB(0, 255, 150)
MainFrameStroke.Thickness = 2
MainFrameStroke.Parent = MainFrame

-- Logo chú chó gamer bên trong Menu chính (Hình vuông luôn)
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
Title.Text = "HARRY V2.6 - PRO MENU"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 15
Title.BackgroundTransparency = 1

-- THANH TÌM KIẾM ĐƯỢC GIỮ LẠI (THIẾT KẾ HÌNH VUÔNG)
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

-- Khung chứa danh sách cuộn các nút bấm
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

-- Logic kéo thả nút icon
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
MenuIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MenuIcon.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and dragging then
        local delta = input.Position - dragStart
        MenuIcon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
MenuIcon.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- Hàm tạo nút bấm hình vuông
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
    
    local cr = Instance.new("UICorner") ; cr.CornerRadius = UDim.new(0, 0) ; cr.Parent = btn -- Ép nút con thành hình vuông
    local bs = Instance.new("UIStroke") ; bs.Color = Color3.fromRGB(60, 60, 60) ; bs.Thickness = 1 ; bs.Parent = btn
    return btn
end

-- ==========================================
--  PHẦN 3: LẬP TRÌNH TẤT CẢ CÁC CHỨC NĂNG
-- ==========================================
local LocalPlayer = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- 1. Tốc độ chạy (Ô Nhập hình vuông)
local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "Nhập Tốc Độ Chạy Speed"
SpeedInput.Size = UDim2.new(0, 220, 0, 35); SpeedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.PlaceholderText = "Nhập Tốc độ chạy..."; SpeedInput.Text = ""; SpeedInput.LayoutOrder = 1; SpeedInput.Parent = Container
local sCorner = Instance.new("UICorner") ; sCorner.CornerRadius = UDim.new(0,0) ; sCorner.Parent = SpeedInput
SpeedInput.FocusLost:Connect(function(ep) if ep and tonumber(SpeedInput.Text) then LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(SpeedInput.Text) end end)

-- 2. Lực Nhảy Cao (Ô Nhập hình vuông)
local JumpInput = Instance.new("TextBox")
JumpInput.Name = "Nhập Lực Nhảy Cao Jump"
JumpInput.Size = UDim2.new(0, 220, 0, 35); JumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); JumpInput.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpInput.PlaceholderText = "Nhập Lực nhảy cao..."; JumpInput.Text = ""; JumpInput.LayoutOrder = 2; JumpInput.Parent = Container
local jCorner = Instance.new("UICorner") ; jCorner.CornerRadius = UDim.new(0,0) ; jCorner.Parent = JumpInput
JumpInput.FocusLost:Connect(function(ep) if ep and tonumber(JumpInput.Text) then LocalPlayer.Character.Humanoid.JumpPower = tonumber(JumpInput.Text) LocalPlayer.Character.Humanoid.UseJumpPower = true end end)

-- 3. GIỮ CHỨC NĂNG TELEPORT: Ô nhập tọa độ dịch chuyển (Hình vuông)
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
    WallhopBtn.TextColor3 = wallhopEnabled and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 2
            


