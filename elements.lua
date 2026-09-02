local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local char = plr.Character or plr.CharacterAdded:Wait()

function Noclip(state)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end

function section(tab, t)
    tab:Section({
        Title = t,
    })
end

function button(tab, t, d, c)
    tab:Button({
        Title = t,
        Desc = d,
        Callback = c,
    })
end

function lockedbutton(tab, t, d, c)
    tab:Button({
        Title = t,
        Desc = d,
        Locked = true,
        LockedTitle = "PATCHED",
        Callback = c,
    })
end

function toggle(tab, t, d, c)
    tab:Toggle({
        Title = t,
        Desc = d,
        Callback = c,
    })
end

function lockedtoggle(tab, t, d, c)
    tab:Toggle({
        Title = t,
        Desc = d,
        Locked = true,
        LockedTitle = "PATCHED",
        Callback = c,
    })
end

function notify(t, c, i, d)
    WindUI:Notify({
        Title = t,
        Content = c,
        Icon = i,
        Duration = d,
    })
end
