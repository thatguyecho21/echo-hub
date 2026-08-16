local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "ECHO HUB | LOADER",
    subtitle = "Click a button and it will launch the script.",
    theme = "default",
})

local loader = window:CreateTab({ name = "Loader", icon = "settings" })

loader:CreateButton({
    name = "Residence Massacre",
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thatguyecho21/echo-hub/refs/heads/main/Games/RM.lua"))()
    end,
})
