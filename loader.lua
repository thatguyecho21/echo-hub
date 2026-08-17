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



--// Loader \\--

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--// Variables \\--

local configName = "Default"

--// Window \\--

local Window = WindUI:CreateWindow({
    Title = "ECHO HUB",
    Author = "[GAME NAME]",
    Icon = "shield-user",
    Theme = "Dark",
    Folder = "MyHub",
    HideSearchBar = false,
    User = {
        Enabled = true,
        Anonymous = false,
    }
})

--// Tabs \\--

local Tab = Window:Tab({
    Title = "Main",
    Icon = "list",
})

local Settings = Window:Tab({
    Title = "Settings", 
    Icon = "settings",
})

--// Main \\--

Tab:Toggle({
    Title = "Enable Feature",
    Value = false,
    Callback = function(state)
        print("Feature enabled:", state)
    end,
})

Tabs.Main:Paragraph({
    Title = "Important Information",
    Desc = "This is a paragraph description that displays standard text inside the section.",
    Icon = "info", -- Optional Lucide icon name
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

--// Settings \\--

Settings:Section({ Title = "Configuration Manager" })

Settings:Input({
    Title = "Config Name",
    Value = configName,
    Placeholder = "Type config name here...",
    Callback = function(text)
        configName = text
    end
})

Settings:Button({
    Title = "Save Configuration",
    Icon = "save",
    Callback = function()
        Window:SaveConfig(configName)
        WindUI:Notify({
            Title = "Config Saved",
            Content = "Config '" .. configName .. "' has been saved.",
            Duration = 3
        })
    end
})

Settings:Button({
    Title = "Load Configuration",
    Icon = "folder-open",
    Callback = function()
        Window:LoadConfig(configName)
        WindUI:Notify({
            Title = "Config Loaded",
            Content = "Config '" .. configName .. "' loaded successfully.",
            Duration = 3
        })
    end
})

Settings:Button({
    Title = "Delete Configuration",
    Icon = "trash-2",
    Callback = function()
        local folderPath = Window.Folder or "MyHub"
        local filePath = folderPath .. "/" .. configName .. ".json"
        
        if isfile and isfile(filePath) then
            delfile(filePath)
            WindUI:Notify({
                Title = "Config Deleted",
                Content = "Config '" .. configName .. "' was completely deleted.",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Error",
                Content = "Could not find a config named '" .. configName .. "'.",
                Duration = 3
            })
        end
    end
})

Settings:Section({ Title = "Theme Picker" })

Settings:Dropdown({
    Title  = "Theme",
    Values = { "Dark", "Light", "Rose", "Plant", "Red", "Indigo", "Sky", "Violet", "Amber", "Midnight", "Crimson", "Mellowsi", "Rainbow" },
    Value  = 1,
    Callback = function(selected)
        WindUI:SetTheme(selected)
    end,
})

--// Notification \\--

WindUI:Notify({
    Title = "Success",
    Content = "Script is loaded. Welcome.",
    Icon = "solar:bell-bold",
    Duration = 3,
})
