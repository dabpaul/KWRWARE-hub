local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dabpaul/KWRWARE-hub/main/main.lua"))()
end)

if not success then
    warn("Failed to load remote script:", err)
end

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
