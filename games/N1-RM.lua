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

                                                Made by: echo :)
                                                     v0.1.0
                                                     [BETA]

]]

--// Loading Check \\--

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Scripts \\--

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--// Lobby Checker \\--

if game.GameId == 14437001043 then
    WindUI:Notify({
        Title = "ECHO HUB",
        Content = "Get in a game first!",
        Duration = 3
    })

    return
end

--// Services & Variables \\--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local overdrive = char.Sprint.Overdrive
local breath = char.Breath
local PlayerESP = false
local MutantESP = false
local InfStam = false
local InfO2 = false

--// Functions \\--

local function button(tab, t, d, c)
    tab:Button({
        Title = t,
        Desc = d,
        Callback = c
    })
end

local function toggle(tab, t, d, c)
    tab:Toggle({
        Title = t,
        Desc = d,
        Callback = c
    })
end

local function highlightPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            if not character:FindFirstChild("PlayerESP") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "PlayerESP"
                highlight.Adornee = character
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = character
            end
        end
    end
end

local function unhighlightPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            local highlight = character:FindFirstChild("PlayerESP")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

local function highlightMutant()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Mutant" then
            if not obj:FindFirstChild("MutantESP") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "MutantESP"
                highlight.Adornee = obj
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = obj
            end
        end
    end
end

local function unhighlightMutant()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Mutant" then
            local highlight = obj:FindFirstChild("MutantESP")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- Player ESP
RunService.Heartbeat:Connect(function()
    if PlayerESP then
        highlightPlayers()
    else
        unhighlightPlayers()
    end
end)

-- Mutant ESP
RunService.Heartbeat:Connect(function()
    if MutantESP then
        highlightMutant()
    else
        unhighlightMutant()
    end
end)

-- Stamina
task.spawn(function()
    while task.wait() do
        if InfStam then
            overdrive.Value = math.huge
        else
            overdrive.Value = 0
        end
    end
end)

-- Oxygen
task.spawn(function()
    while task.wait() do
        if InfO2 then
            breath.Value = 20
        end
    end
end)

--// Window \\--

local Window = WindUI:CreateWindow({
    Title = "ECHO HUB",
    Author = "Residence Massacre | Night 1",
    Icon = "shield-user",
    Theme = "Midnight",
    Folder = "Residence_Massacre_N1",
    HideSearchBar = false,
    User = {
        Enabled = true,
        Anonymous = false,
    }
})

Window:Tag({
    Title = "v0.1.0",
    Icon = "wrench",
    Color = Color3.fromHex("#4e4e4f"),
    Border = true,
})

--// Tabs \\--

local Main = Window:Tab({
    Title = "Main",
    Icon = "house",
})

local Teleports = Window:Tab({
    Title = "Teleports",
    Icon = "map-pin",
})

local Settings = Window:Tab({
    Title = "Settings", 
    Icon = "settings",
})

--// Main \\--

Main:Section({ Title = "Main" })

toggle(Main, "Mutant ESP", "Highlights the Mutant", function(state)
    MutantESP = state
end)

toggle(Main, "Player ESP", "Highlights all Players", function(state)
    PlayerESP = state
end)

toggle(Main, "Infinite Stamina", "You never run out of stamina", function(state)
    InfStam = state
end)

toggle(Main, "Infinite Oxygen", "You never run out of oxygen", function(state)
    InfO2 = state
end)

--// Teleports \\--

Teleports:Section({ Title = "Teleports" })

button(Teleports, "SafeSpot", "TP to Safespot", function()
    print("TEST")
end)

button(Teleports, "SafeSpot", "TP to Safespot", function()
    print("TEST")
end)

button(Teleports, "SafeSpot", "TP to Safespot", function()
    print("TEST")
end)

button(Teleports, "SafeSpot", "TP to Safespot", function()
    print("TEST")
end)

button(Teleports, "SafeSpot", "TP to Safespot", function()
    print("TEST")
end)

--// Settings \\--

Settings:Section({ Title = "COMING SOON" })

--// Notification \\--

WindUI:Notify({
    Title = "Success!",
    Content = "Script has loaded.",
    Icon = "bell-ring",
    Duration = 2,
})
