if Rayfield then
    Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "ECHO HUB | LOADER",
    subtitle = "Click a button and it will launch the script.",
})

local loader = window:CreateTab({ name = "Loader", icon = "93364949241311" })

loader:CreateButton({
    name = "Residence Massacre",
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thatguyecho21/echo-hub/refs/heads/main/Games/RM.lua"))()
    end,
})
