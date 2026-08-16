if Rayfield then
    Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "ECHO HUB",
    subtitle = "RESIDENCE MASSACRE SCRIPT",
})

local n1 = window:CreateTab({ name = "Night 1", icon = "93364949241311" })
local n2 = window:CreateTab({ name = "Night 2", icon = "93364949241311" })
local n3 = window:CreateTab({ name = "Night 3", icon = "93364949241311-unit" })

n1:CreateButton({
    name = "Say hello",
    callback = function()
        window:Notify({ title = "Hello", content = "Your first element works." })
    end,
})

n1:CreateToggle({
    name = "Auto Sprint",
    callback = function(value)
        print("Auto Sprint:", value)
    end,
})
