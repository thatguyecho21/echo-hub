local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "My Hub",
    Icon = "star",
    Theme = "Dark",
    Folder = "MyHub",
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "home",
})

local Settings = Window:Tab({
    Title = "Settings", 
    Icon = "settings" 
})

Tab:Toggle({
    Title = "Enable Feature",
    Value = false,
    Callback = function(state)
        print("Feature enabled:", state)
    end,
})

Tab:Button({
    Title = "Run Action",
    Icon = "play",
    Callback = function()
        print("Button clicked")
    end,
})

Tab:Slider({
    Title = "Walk Speed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 100,
        Default = 16,
    },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})

Tab:Dropdown({
    Title = "Select Team",
    Values = { "Red", "Blue", "Green" },
    Value = 1,
    Callback = function(selectedValue)
        print("Team selected:", selectedValue)
    end,
})

Settings:Dropdown({
    Title  = "Theme",
    Values = (function()
        local names = {}
        for name in pairs(WindUI:GetThemes()) do
            table.insert(names, name)
        end
        table.sort(names)
        return names
    end)(),
    Value    = WindUI:GetCurrentTheme(),
    Callback = function(selected)
        WindUI:SetTheme(selected)
    end,
})

WindUI:Notify({
    Title = "Hub Loaded",
    Content = "Welcome! My Hub is ready.",
    Icon = "solar:bell-bold",
    Duration = 3,
})
