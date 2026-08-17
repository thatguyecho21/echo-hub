-- Load Wind UI Framework from official community CDN
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "SAB Dynamic Teleport",
    Icon = "rbxassetid://10888331510",
    Author = "Community Dev",
    Folder = "SAB_Adaptive_Nav"
})

local NavTab = Window:Tab({
    Title = "Navigation",
    Icon = "rbxassetid://10888331510"
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local isTweening = false
local SAFE_SPEED = 45 -- Speed limit tailored to dodge automated lag metrics

-- Core Function: Dynamically fetches your actual active base object
local function getMyBaseObject()
    -- Common pathways used in SAB workspace hierarchy mapping
    local pathways = {
        Workspace:FindFirstChild("Bases"),
        Workspace:FindFirstChild("Tycoons"),
        Workspace:FindFirstChild("Plots")
    }
    
    for _, folder in pairs(pathways) do
        if folder then
            for _, base in pairs(folder:GetChildren()) do
                -- Checks if the base is named after you, or contains an Owner value matching your profile
                local ownerValue = base:FindFirstChild("Owner")
                if base.Name == LocalPlayer.Name or (ownerValue and ownerValue.Value == LocalPlayer) then
                    return base
                end
            end
        end
    end
    return nil
end

NavTab:Button({
    Title = "Return to My Base",
    Desc = "Scans current server configuration and safely tweens to your assigned plot",
    Callback = function()
        if isTweening then return end
        
        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        -- Locate your assigned base plot dynamically
        local myBase = getMyBaseObject()
        
        if myBase then
            -- Fallback target selector: looks for a main pad, a collector, or uses the base pivot point
            local targetPart = myBase:FindFirstChild("MainPart") 
                or myBase:FindFirstChild("Collector") 
                or myBase:FindFirstChild("Spawn")
                or myBase:FindFirstChildWhichIsA("BasePart")
            
            local targetCFrame = targetPart and targetPart.CFrame or myBase:GetPivot()
            
            isTweening = true
            
            -- Calculate distance to maintain steady stealth velocity matrix
            local distance = (hrp.Position - targetCFrame.Position).Magnitude
            local dynamicDuration = distance / SAFE_SPEED
            
            local tweenInfo = TweenInfo.new(
                dynamicDuration,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            )
            
            local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame + Vector3.new(0, 3, 0)}) -- Adds offset to prevent spawning stuck in the floor
            tween:Play()
            tween.Completed:Wait()
            
            isTweening = false
            
            WindUI:Notify({
                Title = "Arrived Safely",
                Content = "Successfully returned to: " .. myBase.Name,
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Scan Failed",
                Content = "Could not identify your assigned base plot on this server.",
                Duration = 4
            })
        end
    end
})
