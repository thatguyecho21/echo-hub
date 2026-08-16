local CoreGui = game:GetService("CoreGui")

for _, v in ipairs(CoreGui:GetChildren()) do
    if v:IsA("ScreenGui") then
        pcall(function()
            if v:FindFirstChild("Rayfield") or v.Name:lower():find("rayfield") then
                v:Destroy()
            end
        end)
    end
end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/gen2"))()

local window = Rayfield:CreateWindow({
    name = "ECHO HUB | LOADER",
    subtitle = "Click a button and it will launch the script.",
})

local loader = window:CreateTab({ name = "Loader", icon = "settings" })

loader:CreateButton({
    name = "Residence Massacre",
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thatguyecho21/echo-hub/refs/heads/main/Games/RM.lua"))()
    end,
})
