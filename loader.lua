if _G.Rayfield then
    _G.Rayfield:Destroy()
    _G.Rayfield = nil
end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu"))()
_G.Rayfield = Rayfield

local window = Rayfield:CreateWindow({
    name = "ECHO HUB | LOADER",
    subtitle = "Click a button and it will launch the script.",
})

local loader = window:CreateTab({ 
    name = "Loader", 
    icon = false 
})

loader:CreateButton({
    name = "Residence Massacre",
    callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://githubusercontent.com"))()
        end)
        if not success then
            warn("Failed to load script: " .. tostring(err))
        end
    end,
})
