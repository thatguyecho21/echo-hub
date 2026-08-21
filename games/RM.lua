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

if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// Services & Variables \\--

local RunService = game:GetService("RunService")

local espConnection = nil

--// Functions \\--



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
    Title = "v0.2.0",
    Icon = "wrench",
    Color = Color3.fromHex("#ff0000"),
    Border = true,
})

--// Tabs \\--

local N1 = Window:Tab({
    Title = "Night 1",
    Icon = "house",
})

local N2 = Window:Tab({
    Title = "Night 2",
    Icon = "factory",
})

local N3 = Window:Tab({
    Title = "Night 3",
    Icon = "trees",
})

local Memories = Window:Tab({
    Title = "Memories",
    Icon = "ghost",
})

local Settings = Window:Tab({
    Title = "Settings", 
    Icon = "settings",
})

--// Night 1 \\--

N1:Section({ Title = "COMING SOON" })

--// Night 2 \\--

N2:Section({ Title = "COMING SOON" })

--// Night 3 \\--

N3:Section({ Title = "COMING SOON" })

--// Memories \\--

Memories:Section({ Title = "Spirit Helper" })

Memories:Button({
  Title = "Auto Win",
  Desc = "Don't move. Let the script do it.",
  Callback = function()
         print("TEST")
end,
})

Memories:Section({ Title = "Mansion Incident" })

Memories:Button({
  Title = "Auto Win",
  Desc = "Don't move. Let the script do it.",
  Callback = function()
         print("TEST")
end,
})

Memories:Section({ Title = "The Bunker" })

Memories:Button({
  Title = "Auto Win",
  Desc = "Don't move. Let the script do it.",
  Callback = function()
         print("TEST")
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
