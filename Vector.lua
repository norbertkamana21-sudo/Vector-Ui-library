local Vector = {}
Vector.__index = Vector

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function Vector:CreateWindow(Config)

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "VectorUI"
    ScreenGui.ResetOnSpawn = false

    pcall(function()
        ScreenGui.Parent = game:GetService("CoreGui")
    end)

    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer.PlayerGui
    end

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 650, 0, 400)
    Main.Position = UDim2.new(0.5, -325, 0.5, -200)
    Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Main.BorderSizePixel = 0
    Main.Parent = ScreenGui

    Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1,0,0,40)
    Title.BackgroundTransparency = 1
    Title.Text = Config.Title or "Vector"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.TextSize = 24
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Main

    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(0,150,1,-40)
    TabContainer.Position = UDim2.new(0,0,0,40)
    TabContainer.BackgroundColor3 = Color3.fromRGB(25,25,25)
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = Main

    local TabLayout = Instance.new("UIListLayout")
    TabLayout.Padding = UDim.new(0,5)
    TabLayout.Parent = TabContainer

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1,-150,1,-40)
    Content.Position = UDim2.new(0,150,0,40)
    Content.BackgroundTransparency = 1
    Content.Parent = Main

    local Window = {}
    local CurrentTab

    function Window:CreateTab(Name)

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1,-10,0,35)
        TabButton.Text = Name
        TabButton.TextColor3 = Color3.new(1,1,1)
        TabButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
        TabButton.Parent = TabContainer

        Instance.new("UICorner", TabButton)

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1,0,1,0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = Content

        local Layout = Instance.new("UIListLayout")
        Layout.Padding = UDim.new(0,8)
        Layout.Parent = Page

        if not CurrentTab then
            CurrentTab = Page
            Page.Visible = true
        end

        TabButton.MouseButton1Click:Connect(function()
            for _,v in ipairs(Content:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end

            Page.Visible = true
        end)

        local Tab = {}

        function Tab:CreateButton(Data)

            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1,-20,0,40)
            Button.Position = UDim2.new(0,10,0,0)
            Button.Text = Data.Title
            Button.BackgroundColor3 = Color3.fromRGB(255,140,50)
            Button.TextColor3 = Color3.new(1,1,1)
            Button.Parent = Page

            Instance.new("UICorner", Button)

            Button.MouseButton1Click:Connect(function()
                if Data.Callback then
                    Data.Callback()
                end
            end)

            return Button
        end

        return Tab
    end

    function Window:Destroy()
        ScreenGui:Destroy()
    end

    return Window
end

return setmetatable({}, Vector)
