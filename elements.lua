if not game:IsLoaded() then
    game.Loaded:Wait()
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local Window = nil

-- remove if game without respawns
plr.CharacterAdded:Connect(function(newChar)
    char = newChar
    hrp = char:WaitForChild("HumanoidRootPart")
end)

local function Noclip(state)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

local function section(tab, t)
    tab:Section({
        Title = t,
    })
end

local function button(tab, t, d, c)
    tab:Button({
        Title = t,
        Desc = d,
        Callback = c,
    })
end

local function lockedbutton(tab, t, d, c)
    tab:Button({
        Title = t,
        Desc = d,
        Locked = true,
        LockedTitle = "PATCHED",
        Callback = c,
    })
end

local function toggle(tab, t, d, c)
    tab:Toggle({
        Title = t,
        Desc = d,
        Callback = c,
    })
end

local function lockedtoggle(tab, t, d, c)
    tab:Toggle({
        Title = t,
        Desc = d,
        Locked = true,
        LockedTitle = "PATCHED",
        Callback = c,
    })
end

local function notify(t, c, i, d)
    WindUI:Notify({
        Title = t,
        Content = c,
        Icon = i,
        Duration = d,
    })
end

local function done()
    notify("Success", "Script Successfully loaded", "bell-ring", 3)
    notify("Toggle", "Press RightShift to toggle UI", "info", 5)
end

local function error()
    notify("Error", "Game Unsupported (script.lua)", "circle-x", 5)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

if game.PlaceId == 0 then
notify("Error", "lobby notification", "circle-x", 5)

------------------------------------------------------------------------------------------------------------------------------------------------------------

elseif game.PlaceId == 0 then
Window = WindUI:CreateWindow({
    Title = "ECHO HUB",
    Author = "[GAME NAME]",
    Icon = "shield-user",
    Theme = "Midnight",
    -- (add later) Folder = "GAME_NAME",
    ToggleKey = Enum.KeyCode.RightShift,
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

local Information = Window:Tab({
    Title = "Information",
    Icon  = "info",
})

local Main = Window:Tab({
    Title = "Main",
    Icon  = "circle-question-mark",
})

local Settings = Window:Tab({
    Title = "Settings",
    Icon  = "settings",
})

done()

------------------------------------------------------------------------------------------------------------------------------------------------------------

else
error()
end
