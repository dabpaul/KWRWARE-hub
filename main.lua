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

task.wait(0.5)


Rayfield:Notify({
    Title = "Loaded KWRware!",
    Content = "very sigma",
    Duration = 3.5,
    Image = nil,

})

-- === gamename & placeid ===
-- 3008 tab - 2768379856
-- Baddies - 11158043705
-- Steal Brainrot - 109983668079237
-- Basketball Legends - 14259168147
-- Type://Soul Tab - 14067600077
-- Pure Soccer Tab - 88920112778598
-- Total Roblox Island Tab - 4889315193
-- South Bronx Tab - 10179538382
-- The Strongest Battlegrounds - 10449761463
-- Jailbreak Tab - 606849621
-- Gunfight Arena Tab - 14518422161
-- Grow a Garden Tab - 126884695634066
-- 99 nights Tab - 79546208627805


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

local Paragraph = tabMain:CreateParagraph({Title = "Update log", Content = "1.1"})

local Paragraph = tabMain:CreateParagraph({Title = "===WARNING===", Content = "using any of the buttons we have down there, there is a risk of getting banned in the game if they got an anticheat for the specific buttons we have in maintab"})

local Toggle = tabMain:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local UserInputService = game:GetService("UserInputService")

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


local WalkSpeedValue = 16
local player = game.Players.LocalPlayer

local function applyWalkSpeed()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = WalkSpeedValue
    end
end

WalkSpeedInput = tabMain:CreateInput({
   Name = "WalkSpeed",
   CurrentValue = tostring(WalkSpeedValue),
   PlaceholderText = "Enter WalkSpeed",
   RemoveTextAfterFocusLost = false,
   Flag = "WalkSpeedInput",
   Callback = function(Text)
       local value = tonumber(Text)
       if value then
           WalkSpeedValue = value
           if player.Character and player.Character:FindFirstChild("Humanoid") then
               player.Character.Humanoid.WalkSpeed = WalkSpeedValue
           end
       end
   end,
})


player.CharacterAdded:Connect(function()
    task.wait(0.5) 
    applyWalkSpeed()
end)


local JumpPowerValue = 50 

local function applyJumpPower()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = JumpPowerValue
    end
end

JumpPowerInput = tabMain:CreateInput({
   Name = "JumpPower",
   CurrentValue = tostring(JumpPowerValue),
   PlaceholderText = "Enter JumpPower",
   RemoveTextAfterFocusLost = false,
   Flag = "JumpPowerInput",
   Callback = function(Text)
       local value = tonumber(Text)
       if value then
           JumpPowerValue = value
           if player.Character and player.Character:FindFirstChild("Humanoid") then
               player.Character.Humanoid.JumpPower = JumpPowerValue
           end
       end
   end,
})


tabMain:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        WalkSpeedValue = 16
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = WalkSpeedValue
        end
        WalkSpeedInput:Set(tostring(WalkSpeedValue))
        Rayfield:Notify({
            Title = "Reset",
            Content = "WalkSpeed has been reset to 16",
            Duration = 2.5,
        })
    end,
})

tabMain:CreateButton({
    Name = "Reset JumpPower",
    Callback = function()
        JumpPowerValue = 50
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = JumpPowerValue
        end
        JumpPowerInput:Set(tostring(JumpPowerValue))
        Rayfield:Notify({
            Title = "Reset",
            Content = "JumpPower has been reset to 50",
            Duration = 2.5,
        })
    end,
})


player.CharacterAdded:Connect(function()
    task.wait(0.5)
    applyJumpPower()
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local noclipEnabled = false
local noclipConnection = nil

local function enableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
    end

    noclipConnection = RunService.Stepped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function()
    if noclipEnabled then
        wait(0.5)
        enableNoclip()
    end
end)

local noclipToggle = tabMain:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Toggle_Noclip",
    Callback = function(Value)
        noclipEnabled = Value

        if noclipEnabled then
            Rayfield:Notify({
                Title = "Noclip Enabled",
                Content = "",
                Duration = 2.5,
            })
            enableNoclip()
        else
            Rayfield:Notify({
                Title = "Noclip Disabled",
                Content = "",
                Duration = 2.5,
            })
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local HBE_Enabled = false
local HBE_Size = 7
local HBE_TeamCheck = false
local HBE_Transparency = 0.8

local function expandHitbox(player)
    if player == LocalPlayer then return end
    if HBE_TeamCheck and player.Team == LocalPlayer.Team then return end

    local character = player.Character
    if not character then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Size = Vector3.new(HBE_Size, HBE_Size, HBE_Size)
        hrp.Transparency = HBE_Transparency
        hrp.Material = Enum.Material.Neon
        hrp.CanCollide = false
    end
end

local function resetHitbox(player)
    if player == LocalPlayer then return end
    if HBE_TeamCheck and player.Team == LocalPlayer.Team then return end

    local character = player.Character
    if not character then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Size = Vector3.new(2, 2, 1)
        hrp.Transparency = 1
        hrp.Material = Enum.Material.Plastic
        hrp.CanCollide = true
    end
end

RunService.Heartbeat:Connect(function()
    if HBE_Enabled then
        for _, player in ipairs(Players:GetPlayers()) do
            expandHitbox(player)
        end
    end
end)

local function setupPlayer(player)
    player.CharacterAdded:Connect(function(character)
        if HBE_Enabled then
            task.wait(0.5)
            expandHitbox(player)
        end

        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.Died:Connect(function()
                resetHitbox(player)
            end)
        end
    end)
end

for _, player in ipairs(Players:GetPlayers()) do
    setupPlayer(player)
end


Players.PlayerAdded:Connect(setupPlayer)

local Paragraph = tabMain:CreateParagraph({Title = "=== HBE ===", Content = "Down here is HBE related (wont work in some games)"})


tabMain:CreateToggle({
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
                resetHitbox(player)
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
    CurrentValue = false,
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

local Paragraph = tabMain:CreateParagraph({Title = "=== malicious ===", Content = "sigma"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local highlights = {}
local ESP_Enabled = false

local fillUseTeamColor = true
local outlineUseTeamColor = true
local fillColor = Color3.new(0, 0, 0)
local outlineColor = Color3.new(1, 1, 1)
local fillTransparency = 0.5
local outlineTransparency = 0.5

local function createHighlight(player)
    if player == LocalPlayer or not player.Character then return end
    if highlights[player] then highlights[player]:Destroy() end

    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = player.Character
    highlight.FillTransparency = fillTransparency
    highlight.OutlineTransparency = outlineTransparency
    highlight.FillColor = fillUseTeamColor and player.TeamColor.Color or fillColor
    highlight.OutlineColor = outlineUseTeamColor and player.TeamColor.Color or outlineColor
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = player.Character

    highlights[player] = highlight
end

local function removeHighlight(player)
    if highlights[player] then
        highlights[player]:Destroy()
        highlights[player] = nil
    end
end

local function updateAllHighlights()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createHighlight(player)
        end
    end
end

local function setupCharacterListener(player)
    player.CharacterAdded:Connect(function()
        if ESP_Enabled then
            repeat task.wait() until player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            task.wait(0.3)
            createHighlight(player)
        end
    end)
end

tabMain:CreateToggle({
    Name = "ESP Charms",
    CurrentValue = false,
    Flag = "ESP_Highlight_Toggle",
    Callback = function(state)
        ESP_Enabled = state

        if state then
 
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    setupCharacterListener(player)
                    createHighlight(player)
                end
            end


            Players.PlayerAdded:Connect(function(player)
                if ESP_Enabled then
                    setupCharacterListener(player)
                    repeat task.wait() until player.Character
                    task.wait(0.3)
                    createHighlight(player)
                end
            end)


            Players.PlayerRemoving:Connect(function(player)
                removeHighlight(player)
            end)
        else

            for _, hl in pairs(highlights) do
                hl:Destroy()
            end
            highlights = {}
        end
    end
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local TouchFling_Enabled = false
local TouchFling_Thread

if not ReplicatedStorage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
    local detection = Instance.new("Decal")
    detection.Name = "juisdfj0i32i0eidsuf0iok"
    detection.Parent = ReplicatedStorage
end

local function Fling()
    local movel = 0.1

    while TouchFling_Enabled do
        RunService.Heartbeat:Wait()

        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local originalVel = hrp.Velocity
            hrp.Velocity = originalVel * 10000 + Vector3.new(0, 10000, 0)
            RunService.RenderStepped:Wait()
            hrp.Velocity = originalVel
            RunService.Stepped:Wait()
            hrp.Velocity = originalVel + Vector3.new(0, movel, 0)
            movel = -movel
        end
    end
end

tabMain:CreateToggle({
    Name = "Touch Fling (Invisible)",
    CurrentValue = false,
    Flag = "Toggle_TouchFling",
    Callback = function(Value)
        TouchFling_Enabled = Value

        if Value then
            TouchFling_Thread = coroutine.create(Fling)
            coroutine.resume(TouchFling_Thread)

            Rayfield:Notify({
                Title = "Touch Fling Enabled",
                Content = "You are now flinging on touch.",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Touch Fling Disabled",
                Content = "Touch fling has been stopped.",
                Duration = 3
            })
        end
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local noclipEnabled = false
local noclipConnection = nil

local function enableNoclip()
    if noclipConnection then
        noclipConnection:Disconnect()
    end

    noclipConnection = RunService.Stepped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function()
    if noclipEnabled then
        wait(0.5)
        enableNoclip()
    end
end)

local noclipToggle = tabMain:CreateToggle({
    Name = "Antifling",
    CurrentValue = false,
    Flag = "Toggle_Nofling",
    Callback = function(Value)
        noclipEnabled = Value

        if noclipEnabled then
            Rayfield:Notify({
                Title = "Anti-fling Enabled",
                Content = "",
                Duration = 2.5,
            })
            enableNoclip()
        else
            Rayfield:Notify({
                Title = "Anti-fling Disabled",
                Content = "",
                Duration = 2.5,
            })
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end,
})

local Button = tabMain:CreateButton({
   Name = "Fly Script",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

-- === Universal ===

local tabUniversal = Window:CreateTab("Universal", nil)
tabUniversal:CreateSection("Scripts")

local function SafeExecute(name, url)
    local success, result = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)

    if success then
        Rayfield:Notify({
            Title = name .. " Loaded",
            Content = "Script executed successfully.",
            Duration = 3,
        })
    else
        Rayfield:Notify({
            Title = "Error: " .. name,
            Content = "Failed to load script:\n" .. tostring(result),
            Duration = 4,
        })
    end
end

tabUniversal:CreateButton({
    Name = "Airhub V2",
    Callback = function()
        SafeExecute("Airhub V2", "https://raw.githubusercontent.com/Exunys/AirHub-V2/main/src/Main.lua")
    end,
})

tabUniversal:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        SafeExecute("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
    end,
})

tabUniversal:CreateButton({
    Name = "Fates ESP",
    Callback = function()
        SafeExecute("Fates ESP", "https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua")
    end,
})

tabUniversal:CreateButton({
    Name = "Zars GUI",
    Callback = function()
        SafeExecute("Zars GUI", "https://raw.githubusercontent.com/BumbleBeeSaga/BumbleBeeSaga/main/ZARSGUI.")
    end,
})

tabUniversal:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        SafeExecute("Nameless Admin", "https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua")
    end,
})

tabUniversal:CreateButton({
    Name = "Open Aimbot OP",
    Callback = function()
        SafeExecute("Open Aimbot OP", "https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua")
    end,
})

tabUniversal:CreateButton({
    Name = "Invisible",
    Callback = function()
        SafeExecute("Invisible", "https://pastebin.com/raw/3Rnd9rHf")
    end,
})

tabUniversal:CreateButton({
    Name = "AleXScript",
    Callback = function()
        SafeExecute("AleXScript", "https://raw.githubusercontent.com/AleXsjsju/Project-Script-Roblox/refs/heads/main/AleXsjsjuScript")
    end,
})

-- === 3008 Tab ===
local tab3008 = Window:CreateTab("3008", nil)
tab3008:CreateSection("Scripts")
tab3008:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(2768379856) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === 99 nights Tab ===
local tab99nights = Window:CreateTab("99 nights", nil)
tab99nights:CreateSection("Scripts")
tab99nights:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(79546208627805) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Basketball Legends Tab ===
local tabBasketballLegends = Window:CreateTab("Basketball Legends", nil)
tabBasketballLegends:CreateSection("Scripts")
tabBasketballLegends:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(14259168147) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Baddies Tab ===
local tabBaddies = Window:CreateTab("Baddies", nil)
tabBaddies:CreateSection("Scripts")
tabBaddies:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(11158043705) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Grow a Garden Tab ===
local tabGrowaGarden = Window:CreateTab("Grow a Garden", nil)
tabGrowaGarden:CreateSection("Scripts")
tabGrowaGarden:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(126884695634066) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Gunfight Arena Tab ===
local tabGunfightArena = Window:CreateTab("Gunfight Arena", nil)
tabGunfightArena:CreateSection("Scripts")
tabGunfightArena:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(14518422161) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Jailbreak Tab ===
local tabJailbreak = Window:CreateTab("Jailbreak", nil)
tabJailbreak:CreateSection("Scripts")
tabJailbreak:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(606849621) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Pure Soccer Tab ===
local tabPureSoccer = Window:CreateTab("Pure Soccer", nil)
tabPureSoccer:CreateSection("Scripts")
tabPureSoccer:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(88920112778598) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === South Bronx Tab ===
local tabSouthBronx = Window:CreateTab("South Bronx", nil)
tabSouthBronx:CreateSection("Scripts")
tabSouthBronx:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(10179538382) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Steal A Brainrot Tab ===
local tabStealABrainrot = Window:CreateTab("Steal A Brainrot", nil)
tabStealABrainrot:CreateSection("Scripts")
tabStealABrainrot:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(109983668079237) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === The Strongest Battlegrounds Tab ===
local tabTheStrongestBattlegrounds = Window:CreateTab("The Strongest Battlegrounds", nil)
tabTheStrongestBattlegrounds:CreateSection("Scripts")
tabTheStrongestBattlegrounds:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(10449761463) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Total Roblox Island Tab ===
local tabTotalRobloxIsland = Window:CreateTab("Total Roblox Island", nil)
tabTotalRobloxIsland:CreateSection("Scripts")
tabTotalRobloxIsland:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(4889315193) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})

-- === Type://Soul Tab ===
local tabTypeSoul = Window:CreateTab("Type://Soul", nil)
tabTypeSoul:CreateSection("Scripts")
tabTypeSoul:CreateButton({
    Name = "WIP",
    Callback = function()
        if not isCurrentGame(14067600077) then
            Rayfield:Notify({
                Title = "Game Not Supported",
                Content = "This script is not supported in this game.",
                Duration = 3,
            })
            return
        end
        Rayfield:Notify({
            Title = "WIP",
            Content = "Work In Progress",
            Duration = 2.5,
        })
    end,
})
