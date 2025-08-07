local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "KWRware",
    Icon = 0,  -- Icon in Topbar. Use Lucide Icons (string) or Roblox Image (number). 0 = no icon
    LoadingTitle = "Loading KWRware",
    LoadingSubtitle = "by KWRware builders",
    ShowText = "KWRware",  -- For mobile users to unhide Rayfield UI
    Theme = "Amethyst",  -- See https://docs.sirius.menu/rayfield/configuration/themes

    ToggleUIKeybind = "K",  -- Keybind to toggle UI visibility

    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false,  -- Disable version mismatch warnings

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,  -- Custom folder for your hub/game
        FileName = "KWRware configuration"
    },

    Discord = {
        Enabled = true,  -- Prompt to join Discord server if supported
        Invite = "6n3hkKCJpc",  -- Discord invite code (without discord.gg/)
        RememberJoins = true  -- Remember Discord join status
    },

    KeySystem = false,  -- Enable to use Rayfield’s key system
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

task.wait(0.5) -- Minimal required wait to ensure window is initialized before creating tabs


Rayfield:Notify({
    Title = "Loaded KWRware!",
    Content = "very sigma",
    Duration = 3.5,
    Image = nil,

})

-- === gamename & placeid ===
-- 3008 tab  
-- Baddies
-- Steal A Brainrot 
-- Basketball Legends 
-- Type://Soul Tab 
-- Pure Soccer Tab 
-- Total Drama Island Tab 
-- South Bronx Tab 
-- The Strongest Battlegrounds 
-- Jailbreak Tab 
-- Gunfight Arena Tab - 14518422161
-- Grow a Garden Tab - 126884695634066
-- 99 nights Tab 


-- Game check helper function (specific per script)
local function isCurrentGame(placeId)
    return game.PlaceId == placeId
end

-- === Main ===

local tabMain = Window:CreateTab("Main", nil)
tabMain:CreateSection("Main")
tabMain:CreateButton({
    Name = "Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/6n3hkKCJpc")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Discord invite link copied to clipboard.",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

local Paragraph = tabMain:CreateParagraph({Title = "Update log", Content = "1.0A"})

local Toggle = tabMain:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local UserInputService = game:GetService("UserInputService")

        -- Disconnect previous connection if needed (optional)
        if _G.InfiniteJumpConnection then
            _G.InfiniteJumpConnection:Disconnect()
            _G.InfiniteJumpConnection = nil
        end

        if Value then
            _G.InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
                if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                    Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end,
})


local Slider = tabMain:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)            
   end,
})

local Slider = tabMain:CreateSlider({
   Name = "JumpPower Slider",
   Range = {0, 1000},
   Increment = 1,
   Suffix = "Jump Power",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)            
   end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local HBE_Enabled = false
local HBE_Size = 7
local HBE_TeamCheck = false


local function expandHitbox(player)
    if player == LocalPlayer then return end
    if HBE_TeamCheck and player.Team == LocalPlayer.Team then return end

    local character = player.Character
    if not character then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Size = Vector3.new(HBE_Size, HBE_Size, HBE_Size)
        hrp.Transparency = 0.8
        hrp.Material = Enum.Material.Neon
        hrp.CanCollide = false
    end
end

RunService.Heartbeat:Connect(function()
    if HBE_Enabled then
        for _, player in ipairs(Players:GetPlayers()) do
            expandHitbox(player)
        end
    end
end)

local Paragraph = tabMain:CreateParagraph({Title = "===HBE===", Content = "Down here is HBE related"})

local Toggle = tabMain:CreateToggle({
   Name = "Hitbox Expander",
   CurrentValue = false,
   Flag = "Toggle_HBE",
   Callback = function(Value)
    HBE_Enabled = Value

    if Value then
        Rayfield:Notify({
            Title = "Hitbox Expander Enabled",
            Content = "Hitboxes have been expanded.",
            Duration = 3,
        })
    else
        Rayfield:Notify({
            Title = "Hitbox Expander Disabled",
            Content = "Hitboxes have been reset to normal.",
            Duration = 3,
        })

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                    hrp.Material = Enum.Material.Plastic
                end
            end
        end
    end
end,

})

local Keybind = tabMain:CreateKeybind({
    Name = "Toggle Hitbox (Keybind)",
    CurrentKeybind = "Y",
    HoldToInteract = false,
    Flag = "Keybind_Hitbox",
    Callback = function()
        HBE_Enabled = not HBE_Enabled

        Rayfield:Notify({
            Title = "Hitbox Expander",
            Content = HBE_Enabled and "Enabled" or "Disabled",
            Duration = 3,
        })

        if not HBE_Enabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 1
                        hrp.Material = Enum.Material.Plastic
                        hrp.CanCollide = true
                    end
                end
            end
        end
    end,
})


local TeamCheckToggle = tabMain:CreateToggle({
    Name = "Team Check",
    CurrentValue = true,
    Flag = "Toggle_TeamCheck",
    Callback = function(Value)
        HBE_TeamCheck = Value

        Rayfield:Notify({
            Title = "Team Check " .. (Value and "Enabled" or "Disabled"),
            Content = Value and "Only enemies will be affected." or "All players will be affected.",
            Duration = 3,
        })
    end,
})


local Slider = tabMain:CreateSlider({
   Name = "Hitbox Size",
   Range = {3, 50},
   Increment = 0.5,
   Suffix = "Size",
   CurrentValue = 7,
   Flag = "Slider_HBE_Size",
   Callback = function(Value)
      HBE_Size = Value
   end,
})

-- === Universal ===

local tabUniversal = Window:CreateTab("Universal", nil)
tabUniversal:CreateSection("Scripts")
tabUniversal:CreateButton({
    Name = "WIP",
    Callback = function()
        -- Work in Progress
        Rayfield:Notify({
            Title = "Executed!",
            Content = "Script Executed.",
            Duration = 2.5,
            Image = nil,
        })  
    end,
})

-- === 99 nights Tab ===
local tab99nights = Window:CreateTab("99 nights", nil)
tab99nights:CreateSection("Scripts")
tab99nights:CreateButton({
    Name = "eF Hub",
    Callback = function()
        local success, result = pcall(function()
            loadstring(game:HttpGet('https://api.exploitingis.fun/loader', true))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "Executed!",
                Content = "eF Hub loaded successfully.",
                Duration = 2.5,
                Image = nil,
            })
        else
            
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to load eF Hub: " .. result,
                Duration = 3,
                Image = nil,
            })
        end
    end,
})


-- === Grow a Garden Tab ===
local tabGarden = Window:CreateTab("Grow a Garden", nil)
tabGarden:CreateSection("Scripts")

tabGarden:CreateButton({
    Name = "Blackhub",
    Callback = function()
        if not isCurrentGame(126884695634066) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
                Image = nil,
            })
            return
        end
        
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "Executed!",
                Content = "Blackhub loaded successfully.",
                Duration = 2.5,
                Image = nil,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to load Blackhub: " .. result,
                Duration = 3,
                Image = nil,
            })
        end
    end,
})

-- === Gunfight Arena Tab ===
local tabGunfight = Window:CreateTab("Gunfight Arena", nil)
tabGunfight:CreateSection("Scripts")

tabGunfight:CreateButton({
    Name = "elite hub",
    Callback = function()
        if not isCurrentGame(14518422161) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
                Image = nil,
            })
            return
        end
        
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/6kD0H2i4/raw"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "Executed!",
                Content = "elite hub loaded successfully.",
                Duration = 2.5,
                Image = nil,
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to load elite hub: " .. result,
                Duration = 3,
                Image = nil,
            })
        end
    end,
})

-- === Jailbreak Tab ===
local tabJailbreak = Window:CreateTab("Jailbreak", nil)
tabJailbreak:CreateSection("Scripts")
tabJailbreak:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === The Strongest Battlegrounds Tab ===
local tabStrongestBattlegrounds = Window:CreateTab("The Strongest Battlegrounds", nil)
tabStrongestBattlegrounds:CreateSection("Scripts")
tabStrongestBattlegrounds:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === South Bronx Tab ===
local tabSouthBronx = Window:CreateTab("South Bronx", nil)
tabSouthBronx:CreateSection("Scripts")
tabSouthBronx:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === Total Drama Island Tab ===
local tabTotalDramaIsland = Window:CreateTab("Total Drama Island", nil)
tabTotalDramaIsland:CreateSection("Scripts")
tabTotalDramaIsland:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === Pure Soccer Tab ===
local tabPureSoccer = Window:CreateTab("Pure Soccer", nil)
tabPureSoccer:CreateSection("Scripts")
tabPureSoccer:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === Type://Soul Tab ===
local tabTypeSoul = Window:CreateTab("Type://Soul", nil)
tabTypeSoul:CreateSection("Scripts")
tabTypeSoul:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === Basketball Legends Tab ===
local tabBasketballLegends = Window:CreateTab("Basketball Legends", nil)
tabBasketballLegends:CreateSection("Scripts")
tabBasketballLegends:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === Steal A Brainrot Tab ===
local tabStealABrainrot = Window:CreateTab("Steal A Brainrot", nil)
tabStealABrainrot:CreateSection("Scripts")
tabStealABrainrot:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === 3008 Tab ===
local tab3008 = Window:CreateTab("3008", nil)
tab3008:CreateSection("Scripts")
tab3008:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})

-- === Baddies Tab ===
local tabBaddies = Window:CreateTab("Baddies", nil)
tabBaddies:CreateSection("Scripts")
tabBaddies:CreateButton({
    Name = "WIP",
    Callback = function()
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
            Image = nil,
        })
    end,
})
