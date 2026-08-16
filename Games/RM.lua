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
    name = "ECHO HUB",
    subtitle = "RESIDENCE MASSACRE SCRIPT",
})

local n1 = window:CreateTab({ name = "Night 1", icon = "house" })
local n2 = window:CreateTab({ name = "Night 2", icon = "factory" })
local n3 = window:CreateTab({ name = "Night 3", icon = "shelving-unit" })

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
