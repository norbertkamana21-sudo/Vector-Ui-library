local Vector = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/norbertkamana21-sudo/Vector/main/Vector.lua"
))()

local Window = Vector:CreateWindow({
    Title = "Vector UI"
})

local Main = Window:CreateTab("Main")

Main:CreateButton({
    Title = "Hello World",
    Callback = function()
        print("Vector button clicked!")
    end
})

local Misc = Window:CreateTab("Misc")

Misc:CreateButton({
    Title = "Destroy UI",
    Callback = function()
        Window:Destroy()
    end
})
