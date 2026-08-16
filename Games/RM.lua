if _G.Rayfield then
    _G.Rayfield:Destroy()
    _G.Rayfield = nil
end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()
_G.Rayfield = Rayfield

local window = Rayfield:CreateWindow({
    name = "ECHO HUB",
    subtitle = "RESIDENCE MASSACRE SCRIPT",
})

local n1 = window:CreateTab({ name = "Night 1", icon = false })
local n2 = window:CreateTab({ name = "Night 2", icon = false })
local n3 = window:CreateTab({ name = "Night 3", icon = false })

n1:CreateButton({
    name = "Say hello",
    callback = function()
        Rayfield:Notify({ title = "Hello", content = "Your first element works." })
    end,
})

n1:CreateToggle({
    name = "Auto Sprint",
    currentvalue = false,
    callback = function(value)
        print("Auto Sprint:", value)
    end,
})
