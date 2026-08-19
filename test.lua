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

                                                 Made by: echo
                                             Version: 0.5.0 [BETA]

]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Loader \\--

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--// Variables \\--

local RS = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

local world1 = Vector3.new(-9460, 392, -254)
local world2 = Vector3.new(-3603, 158, -9381)
local world3 = Vector3.new(-8079, 284, 2740)
local world4 = Vector3.new(-7761, 22, 5740)
local world5 = Vector3.new(-1332, 26, 7562)
local w1autoWin = false
local w2autoWin = false
local w3autoWin = false
local w4autoWin = false
local w5autoWin = false
local autoRebirth = false

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

Window:Tag({
    Title = "BETA",
    Icon = "bug",
    Color = Color3.fromHex("#ff0000"),
    Border = true,
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

Auto:Section({ Title = "Auto Win • Choose ONE" })

Auto:Toggle({
    Title = "Auto Win",
    Desc = "World 1",
    Value = false,
    Callback = function(state)
        w1autoWin = state
        if state then
            task.spawn(function()
                while w1autoWin do
                    if player.Character then
                        player.Character:PivotTo(CFrame.new(world1))
                    else
                        warn("Character not found!")
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Auto:Toggle({
    Title = "Auto Win",
    Desc = "World 2",
    Value = false,
    Callback = function(state)
        w2autoWin = state
        if state then
            task.spawn(function()
                while w2autoWin do
                    if player.Character then
                        player.Character:PivotTo(CFrame.new(world2))
                    else
                        warn("Character not found!")
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Auto:Toggle({
    Title = "Auto Win",
    Desc = "World 3",
    Value = false,
    Callback = function(state)
        w3autoWin = state
        if state then
            task.spawn(function()
                while w3autoWin do
                    if player.Character then
                        player.Character:PivotTo(CFrame.new(world3))
                    else
                        warn("Character not found!")
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Auto:Toggle({
    Title = "Auto Win",
    Desc = "World 4",
    Value = false,
    Callback = function(state)
        w4autoWin = state
        if state then
            task.spawn(function()
                while w4autoWin do
                    if player.Character then
                        player.Character:PivotTo(CFrame.new(world4))
                    else
                        warn("Character not found!")
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Auto:Toggle({
    Title = "Auto Win",
    Desc = "World 5",
    Value = false,
    Callback = function(state)
        w5autoWin = state
        if state then
            task.spawn(function()
                while w5autoWin do
                    if player.Character then
                        player.Character:PivotTo(CFrame.new(world5))
                    else
                        warn("Character not found!")
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Auto:Section({ Title = "Auto Rebirth" })

Auto:Toggle({
    Title = "Auto Rebirth",
    Desc = "Automatically rebirths when you are able to",
    Value = false,
    Callback = function(state)
        autoRebirth = state
        if state then
            task.spawn(function()
                while autoRebirth do
                    RS:WaitForChild("Remotes"):WaitForChild("Rebirth"):FireServer()
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
    Title = "Success!",
    Content = "Script is loaded.",
    Icon = "solar:bell-bold",
    Duration = 2,
})
