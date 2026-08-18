--[[
         ███             ███             ███             ███             ███             ███             ███   
       ███░            ███░            ███░            ███░            ███░            ███░            ███░    
     ███░            ███░            ███░            ███░            ███░            ███░            ███░      
   ███░            ███░            ███░            ███░            ███░            ███░            ███░        
 ███░            ███░            ███░            ███░            ███░            ███░            ███░          
██░            ███░            ███░            ███░            ███░            ███░            ███░            
░            ███░            ███░            ███░            ███░            ███░            ███░            ██
            ░░░             ░░░             ░░░             ░░░             ░░░             ░░░             ░░░
     █░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░       ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░█       
   ███░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░       
 ███░ ░▒▓█▓▒░     ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░       
██░   ░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░     █░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░        
░     ░▒▓█▓▒░     ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░   ███░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░     ██
      ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ███░ ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░   ███░
      ░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░███░   ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓███████▓▒░  ███░  
        ░░░             ░░░             ░░░             ░░░             ░░░             ░░░             ░░░    
 ███             ███             ███             ███             ███             ███             ███           
██░            ███░            ███░            ███░            ███░            ███░            ███░            
░            ███░            ███░            ███░            ███░            ███░            ███░            ██
           ███░            ███░            ███░            ███░            ███░            ███░            ███░
         ███░            ███░            ███░            ███░            ███░            ███░            ███░  
       ███░            ███░            ███░            ███░            ███░            ███░            ███░    
     ███░            ███░            ███░            ███░            ███░            ███░            ███░      
    ░░░             ░░░             ░░░             ░░░             ░░░             ░░░             ░░░        
             ███             ███             ███             ███             ███             ███             ██

                                               Made by: echo :P

]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Loader \\--

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--// Variables \\--

local player = game.Players.LocalPlayer
local world1 = workspace.Map.World1.Stages.Stage9.NormalWin
local autoWin = false

--// Window \\--

local Window = WindUI:CreateWindow({
    Title = "ECHO HUB",
    Author = "+1 Speed Monkey Escape",
    Icon = "shield-user",
    Theme = "Midnight",
    Folder = "+1_Speed_Monkey_Escape",
    HideSearchBar = false,
    User = {
        Enabled = true,
        Anonymous = false,
    }
})

--// Tabs \\--

local Auto = Window:Tab({
    Title = "Auto",
    Icon = "refresh-ccw",
})

local Settings = Window:Tab({
    Title = "Settings", 
    Icon = "settings",
})

--// Auto \\--

Auto:Toggle({
    Title = "Auto Win",
    Desc = "[ONLY WORKS FOR WORLD 1]",
    Value = false,
    Callback = function(state)
        autoWin = state
        if state then
            task.spawn(function()
                while autoWin do
                    if world1 and player.Character and targetModel then
                        player.Character:PivotTo(targetModel:GetPivot())
                    else
                        warn("Target model or Character not found!")
                        break
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

--// Settings \\--

Settings:Section({ Title = "COMING SOON" })

--// Notification \\--

WindUI:Notify({
    Title = "Success",
    Content = "Script is loaded. Welcome.",
    Icon = "solar:bell-bold",
    Duration = 3,
})
