-- 1. Load the WindUI Library
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- 2. Create the Main Window
local Window = WindUI:CreateWindow({
    Title = "Instant Teleport",
    Author = "Script User",
    Folder = "TeleportConfig",
    Icon = "sfsymbols:bolt",
    IconSize = 50,
    HideSearchBar = false,
    Theme = "Dark"
})

-- 3. Create a Tab
local Tab = Window:Tab({
    Title = "Teleport",
    Icon = "sfsymbols:location"
})

-- 4. Setup Local Player Variable
local player = game.Players.LocalPlayer

-- 5. Add the Stage 1 Teleport Button
Tab:Button({
    Title = "Teleport to Stage 1 Win",
    Callback = function()
        -- Direct path to your model
        local targetModel = workspace.Map.World1.Stages.Stage1.NormalWin
        
        if targetModel and player.Character then
            -- Instantly snaps your character to the model's pivot point
            player.Character:PivotTo(targetModel:GetPivot())
        else
            warn("Target model or Character not found!")
        end
    end
})
