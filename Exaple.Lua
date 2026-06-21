-- Vector UI | Example Usage

local Vector = loadstring(game:HttpGet("https://raw.githubusercontent.com/norbertkamana21-sudo/Vector-Ui-library/refs/heads/main/Vector.lua"))()

-- Create Window
local Window = Vector:CreateWindow({
    Title = "Vector UI",
    Subtitle = "Example Showcase",
    Size = UDim2.fromOffset(650, 450),
    Acrylic = true,
    Theme = "Dark"
})

-- Create Tabs
local Main = Window:CreateTab("Main", "home")
local Settings = Window:CreateTab("Settings", "settings")
local Credits = Window:CreateTab("Credits", "info")

--------------------------------------------------
-- MAIN TAB
--------------------------------------------------

Main:CreateLabel({
    Title = "Welcome",
    Content = "Thank you for using Vector UI."
})

Main:CreateButton({
    Title = "Print Hello",
    Description = "Demonstrates button callbacks.",
    Callback = function()
        print("Hello from Vector!")
    end
})

Main:CreateToggle({
    Title = "Auto Farm",
    Default = false,
    Callback = function(Value)
        print("Auto Farm:", Value)
    end
})

Main:CreateSlider({
    Title = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(Value)
        print("WalkSpeed:", Value)
    end
})

Main:CreateDropdown({
    Title = "Select Team",
    Values = {
        "Red",
        "Blue",
        "Green"
    },
    Default = "Red",
    Callback = function(Value)
        print("Selected:", Value)
    end
})

Main:CreateTextbox({
    Title = "Player Name",
    Placeholder = "Enter username...",
    Callback = function(Text)
        print("Username:", Text)
    end
})

Main:CreateKeybind({
    Title = "Toggle UI",
    Default = Enum.KeyCode.RightShift,
    Callback = function()
        Window:Toggle()
    end
})

--------------------------------------------------
-- SETTINGS TAB
--------------------------------------------------

Settings:CreateColorPicker({
    Title = "Accent Color",
    Default = Color3.fromRGB(255, 140, 50),
    Callback = function(Color)
        print(Color)
    end
})

Settings:CreateButton({
    Title = "Save Configuration",
    Callback = function()
        Vector:SaveConfig("Default")
    end
})

Settings:CreateButton({
    Title = "Load Configuration",
    Callback = function()
        Vector:LoadConfig("Default")
    end
})

--------------------------------------------------
-- CREDITS TAB
--------------------------------------------------

Credits:CreateParagraph({
    Title = "Vector UI",
    Content = [[
A modern Lua UI library focused on clean design,
smooth animations, and developer-friendly APIs.
]]
})

Credits:CreateButton({
    Title = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/CAVv6DumQy")
        Vector:Notify({
            Title = "Copied",
            Content = "Discord invite copied to clipboard.",
            Duration = 3
        })
    end
})

--------------------------------------------------
-- NOTIFICATION EXAMPLE
--------------------------------------------------

Vector:Notify({
    Title = "Welcome",
    Content = "Vector UI loaded successfully.",
    Duration = 5
})
