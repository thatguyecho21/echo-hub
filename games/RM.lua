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
                                                     v0.4.0
                                                     [BETA]

]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Services & Variables \\--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local plr = Players.LocalPlayer
local char = plr.Character
local overdrive = char.Sprint.Overdrive
local breath = char.Breath
local PlayerESP = false
local MutantESP = false
local InfStam = false
local InfO2 = false

--// Functions \\--

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

--// Loader \\--

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--// Window \\--

local Window = WindUI:CreateWindow({
    Title = "ECHO HUB",
    Author = "Residence Massacre",
    Icon = "shield-user",
    Theme = "Midnight",
    Folder = "Residence_Massacre",
    HideSearchBar = false,
    User = {
        Enabled = true,
        Anonymous = false,
    }
})

Window:Tag({
    Title = "v0.4.0",
    Icon = "wrench",
    Color = Color3.fromHex("#4e4e4f"),
    Border = true,
})

--// Tabs \\--

local Nights = Window:Tab({
    Title = "Nights",
    Icon = "moon",
})

local Memories = Window:Tab({
    Title = "Memories",
    Icon = "ghost",
})

local Settings = Window:Tab({
    Title = "Settings", 
    Icon = "settings",
})

--// Nights \\--

Nights:Section({ Title = "Global (ALL NIGHTS)" })

Nights:Toggle({
  Title = "Mutant ESP",
  Desc = "Highlights the Mutant.",
  Callback = function(state)
    MutantESP = state
  end,
})

Nights:Toggle({
  Title = "Player ESP",
  Desc = "Highlights all Players in the server.",
  Callback = function(state)
    PlayerESP = state
  end,
})

Nights:Toggle({
  Title = "Infinite Stamina",
  Desc = "Your stamina never runs out!",
  Callback = function(state)
    InfStam = state
  end,
})

Nights:Section({ Title = "Night 1" })

Nights:Toggle({
  Title = "Infinite Oxygen",
  Desc = "Your oxygen never runs out!",
  Callback = function(state)
    InfO2 = state
  end,
})

Nights:Section({ Title = "Night 2" })

Nights:Section({ Title = "Night 3" })

--// Memories \\--

Memories:Section({ Title = "Global (ALL MEMORIES)" })

Memories:Section({ Title = "Spirit Helper" })

Memories:Button({
  Title = "Auto Win",
  Desc = "ACTIVATE IN SPIRIT MINIGAME.",
  Callback = function()
    print("TEST")

    WindUI:Notify({
    Title = "Spirit Helper",
    Content = "DON'T MOVE. LET THE SCRIPT DO IT.",
    Icon = "bell-ring",
    Duration = 2,
})
end,
})

Memories:Section({ Title = "Mansion Incident" })

Memories:Button({
  Title = "Auto Win",
  Desc = "ACTIVATE IN MANSION MINIGAME.",
  Callback = function()
    print("TEST")

    WindUI:Notify({
    Title = "Mansion Incident",
    Content = "DON'T MOVE. LET THE SCRIPT DO IT.",
    Icon = "bell-ring",
    Duration = 2,
})
end,
})

Memories:Section({ Title = "The Bunker" })

Memories:Button({
  Title = "Auto Win",
  Desc = "ACTIVATE IN BUNKER MINIGAME.",
  Callback = function()
    print("TEST")

    WindUI:Notify({
    Title = "The Bunker",
    Content = "DON'T MOVE. LET THE SCRIPT DO IT.",
    Icon = "bell-ring",
    Duration = 2,
})
end,
})

--// Settings \\--

Settings:Section({ Title = "COMING SOON" })

--// Notification \\--

WindUI:Notify({
    Title = "Success!",
    Content = "Script has loaded.",
    Icon = "bell-ring",
    Duration = 2,
})
