# Vector-Ui-library
Official vector UI library
# Quick Start

```lua
local Vector = loadstring(game:HttpGet("YOUR_VECTOR_URL_HERE"))()
```

Create a window, add tabs, then add components:

```lua
local Window = Vector:CreateWindow({
    Title = "Vector UI"
})

local Main = Window:CreateTab("Main")

Main:CreateButton({
    Title = "Click Me",
    Callback = function()
        print("Hello!")
    end
})
```
