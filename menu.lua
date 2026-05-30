-- [[ SCRIPT MOD MENU HARRY V2.1 - ADD SEARCH BAR ]] --

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
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadingFrame.BorderSizePixel = 0

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(0, 12)
LoadingCorner.Parent = LoadingFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 255, 255) -- Đổi sang màu xanh Neon cho bản V2.1 Search
UIStroke.Thickness = 2
UIStroke.Parent = LoadingFrame

local LoadingText = Instance.new("TextLabel")
LoadingText.Parent = LoadingFrame
LoadingText.Size = UDim2.new(1, 0, 0.6, 0)
LoadingText.Position = UDim2.new(0, 0, 0.1, 0)
LoadingText.Text = "HACK BY HARRY V2.1"
LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingText.Font = Enum.Font.FredokaOne
LoadingText.TextSize = 24
LoadingText.BackgroundTransparency = 1

local SubText = Instance.new("TextLabel")
SubText.Parent = LoadingFrame
SubText.Size = UDim2.new(1, 0, 0.3, 0)
SubText.Position = UDim2.new(0, 0, 0.65, 0)
SubText.Text = "Đang tích hợp bộ lọc từ khóa..."
SubText.TextColor3 = Color3.fromRGB(150, 150, 150)
SubText.Font = Enum.Font.SourceSansItalic
SubText.TextSize = 14
SubText.BackgroundTransparency = 1

-- ==========================================
--  PHẦN 2: MENU CHÍNH VÀ THANH TÌM KIẾM
-- ==========================================
local MenuIcon = Instance.new("TextButton")
MenuIcon.Name = "MenuIcon"
MenuIcon.Parent = MyModMenu
MenuIcon.Size = UDim2.new(0, 50, 0, 50)
MenuIcon.Position = UDim2.new(0.05, 0, 0.2, 0)
MenuIcon.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MenuIcon.Text = "HR V2.1"
MenuIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
MenuIcon.Font = Enum.Font.SourceSansBold
MenuIcon.TextSize = 13
MenuIcon.Visible = false

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(1, 0)
IconCorner.Parent = MenuIcon

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = MyModMenu
MainFrame.Size = UDim2.new(0, 260, 0, 430)
MainFrame.Position = UDim2.new(0.15, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "HARRY V2.1 - SEARCH"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- [MỚI] KHỞI TẠO THANH TÌM KIẾM (SEARCH BAR)
local SearchBar = Instance.new("TextBox")
SearchBar.Name = "SearchBar"
SearchBar.Parent = MainFrame
SearchBar.Size = UDim2.new(0, 230, 0, 30)
SearchBar.Position = UDim2.new(0, 15, 0, 48)
SearchBar.PlaceholderText = "🔍 Nhập từ khóa để tìm chức năng..."
SearchBar.Text = ""
SearchBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.Font = Enum.Font.SourceSans
SearchBar.TextSize = 14

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBar

-- Khung chứa cuộn danh sách chức năng (Hạ thấp vị trí xuống để nhường chỗ cho thanh Search)
local Container = Instance.new("ScrollingFrame")
Container.Parent = MainFrame
Container.Size = UDim2.new(1, 0, 1, -85)
Container.Position = UDim2.new(0, 0, 0, 85)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 560)
Container.ScrollBarThickness = 4

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Container
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- Kéo thả Icon
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

-- Hàm mẫu tạo nhanh nút bấm (Đổi sang gán đối tượng vào thuộc tính Name để bộ lọc tìm kiếm quét được)
local function CreateButton(text, order)
    local btn = Instance.new("TextButton")
    btn.Name = text -- Gán Name trùng với Text để dễ tìm kiếm
    btn.Size = UDim2.new(0, 220, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.LayoutOrder = order
    btn.Parent = Container
    local cr = Instance.new("UICorner")
    cr.CornerRadius = UDim.new(0, 6)
    cr.Parent = btn
    return btn
end

-- ==========================================
--  PHẦN 3: LẬP TRÌNH CÁC CHỨC NĂNG
-- ==========================================
local LocalPlayer = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- 1. Tốc độ
local SpeedInput = Instance.new("TextBox")
SpeedInput.Name = "Nhập Tốc Độ Chạy"
SpeedInput.Size = UDim2.new(0, 220, 0, 35); SpeedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.PlaceholderText = "Nhập Tốc độ chạy..."; SpeedInput.LayoutOrder = 1; SpeedInput.Parent = Container
SpeedInput.FocusLost:Connect(function(ep) if ep and tonumber(SpeedInput.Text) then LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(SpeedInput.Text) end end)

-- 2. Nhảy cao
local JumpInput = Instance.new("TextBox")
JumpInput.Name = "Nhập Lực Nhảy Cao"
JumpInput.Size = UDim2.new(0, 220, 0, 35); JumpInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40); JumpInput.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpInput.PlaceholderText = "Nhập Lực nhảy..."; JumpInput.LayoutOrder = 2; JumpInput.Parent = Container
JumpInput.FocusLost:Connect(function(ep) if ep and tonumber(JumpInput.Text) then LocalPlayer.Character.Humanoid.JumpPower = tonumber(JumpInput.Text) LocalPlayer.Character.Humanoid.UseJumpPower = true end end)

-- 3. Noclip
local NoclipBtn = CreateButton("Noclip Xuyên Tường: TẮT", 3)
local noclip = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    NoclipBtn.Text = noclip and "Noclip Xuyên Tường: BẬT" or "Noclip Xuyên Tường: TẮT"
    NoclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(50, 50, 50)
end)
RunService.Stepped:Connect(function()
    if noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- 4. Bay tự do
local FlyBtn = CreateButton("Bay Tự Do: TẮT", 4)
local flying = false
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.Text = flying and "Bay Tự Do: BẬT" or "Bay Tự Do: TẮT"
    FlyBtn.BackgroundColor3 = flying and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(50, 50, 50)
    local char = LocalPlayer.Character
    if flying and char then
        local bg = Instance.new("BodyGyro", char.HumanoidRootPart); bg.maxTorque = Vector3.new(4e5, 4e5, 4e5); bg.cframe = char.HumanoidRootPart.CFrame
        local bv = Instance.new("BodyVelocity", char.HumanoidRootPart); bv.maxForce = Vector3.new(4e5, 4e5, 4e5); bv.velocity = Vector3.new(0, 0.1, 0)
        spawn(function()
            while flying and char and char:FindFirstChild("HumanoidRootPart") do
                RunService.RenderStepped:Wait()
                bv.velocity = workspace.CurrentCamera.CFrame.LookVector * (char.Humanoid.WalkSpeed * 2)
                bg.cframe = workspace.CurrentCamera.CFrame
            end
            bg:Destroy(); bv:Destroy()
        end)
    end
end)

-- 5. Nằm
local LieBtn = CreateButton("Trạng Thái: NẰM (Ragdoll)", 5)
LieBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
    end
end)

-- 6. Ngồi
local SitBtn = CreateButton("Trạng Thái: NGỒI GIẢ LẬP", 6)
SitBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Sit = not LocalPlayer.Character.Humanoid.Sit
    end
end)

-- 7. Jerk
local JerkBtn = CreateButton("Hiệu ứng Jerk Giật Giật: TẮT", 7)
local jerking = false
JerkBtn.MouseButton1Click:Connect(function()
    jerking = not jerking
    JerkBtn.Text = jerking and "Hiệu ứng Jerk Giật Giật: BẬT" or "Hiệu ứng Jerk Giật Giật: TẮT"
    JerkBtn.BackgroundColor3 = jerking and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(50, 50, 50)
    spawn(function()
        while jerking and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
            task.wait(0.05)
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(45), 0)
            task.wait(0.05)
            LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(-45), 0)
        end
    end)
end)

-- 8. Biến nhỏ
local SizeBtn = CreateButton("Biến Nhỏ Nhân Vật Khổng Lồ: TẮT", 8)
local smallSize = false
SizeBtn.MouseButton1Click:Connect(function()
    smallSize = not smallSize
    SizeBtn.Text = smallSize and "Biến Nhỏ Nhân Vật Khổng Lồ: BẬT" or "Biến Nhỏ Nhân Vật Khổng Lồ: TẮT"
    SizeBtn.BackgroundColor3 = smallSize and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(50, 50, 50)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local hs = char.Humanoid:FindFirstChild("HeadScale")
        local bds = char.Humanoid:FindFirstChild("BodyBodyTypeScale")
        local bws = char.Humanoid:FindFirstChild("BodyWidthScale")
        local bhs = char.Humanoid:FindFirstChild("BodyHeightScale")
        if hs and bds and bws and bhs then
            hs.Value = smallSize and 0.5 or 1; bds.Value = smallSize and 0.5 or 1; bws.Value = smallSize and 0.5 or 1; bhs.Value = smallSize and 0.5 or 1
        else
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.Size = smallSize and part.Size * 0.5 or part.Size * 2 end
            end
        end
    end
end)

-- 9. Tàng hình
local InvisBtn = CreateButton("Tàng Hình Cục Bộ Ẩn Thân: TẮT", 9)
local invisible = false
InvisBtn.MouseButton1Click:Connect(function()
    invisible = not invisible
    InvisBtn.Text = invisible and "Tàng Hình Cục Bộ Ẩn Thân: BẬT" or "Tàng Hình Cục Bộ Ẩn Thân: TẮT"
    InvisBtn.BackgroundColor3 = invisible and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(50, 50, 50)
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                if part.Name ~= "HumanoidRootPart" then part.Transparency = invisible and 1 or 0 end
            end
        end
    end
end)

-- ==========================================
--  [MỚI] LOGIC XỬ LÝ LỌC TÌM KIẾM (SEARCH FILTER)
-- ==========================================
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
    local textInput = string.lower(SearchBar.Text)
    
    -- Duyệt qua tất cả các phần tử nằm trong ô cuộn danh sách Container
    for _, child in pairs(Container:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextBox") then
            -- Nếu từ khóa rỗng, hiển thị lại toàn bộ các nút
            if textInput == "" then
                child.Visible = true
            else
                -- So sánh tên đối tượng viết thường với từ khóa tìm kiếm
                if string.find(string.lower(child.Name), textInput) then
                    child.Visible = true
                else
                    child.Visible = false -- Ẩn nút nếu không trùng từ khóa
                end
            end
        end
    end
end)

-- ==========================================
--  HIỆU ỨNG CHẠY KHI MỞ
-- ==========================================
task.wait(1.5)
SubText.Text = "Nạp thanh công cụ Search Engine..."
task.wait(1)
LoadingFrame:Destroy()
MenuIcon.Visible = true


