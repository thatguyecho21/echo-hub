local guiContainer

if typeof(gethui) == "function" then
    local ok, result = pcall(gethui)
    if ok and result then
        guiContainer = result
    end
end

guiContainer = guiContainer or game:GetService("CoreGui")

for _, gui in ipairs(guiContainer:GetChildren()) do
    if gui:IsA("ScreenGui") then
        gui:Destroy()
    end
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
