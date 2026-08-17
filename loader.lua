local WindUI = loadstring(game:HttpGet("https://githubusercontent.com"))()

local Window = WindUI:CreateWindow({
    Title = "My Script Hub",
    Icon = "zap",
    Author = "Developer",
    Folder = "MyHubConfig"
})

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "home"
})

-- Use 'Desc' for buttons/toggles
MainTab:Button({
    Title = "Kill All Enemies",
    Desc = "This acts as your description / hover tooltip text.",
    Callback = function()
        print("Enemies cleared!")
    end
})

-- Use 'Desc' for sections/paragraphs if you want raw text
MainTab:Paragraph({
    Title = "Notice",
    Desc = "This puts a raw text description block directly on the page."
})
