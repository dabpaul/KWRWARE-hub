--[Obfuscated by Hercules v1.6.2 | hercules-obfuscator.xyz/discord | hercules-obfuscator.xyz/source]
return (function(...) pcall((function()
    return function()
        while true do error() end
    end
end)())  

local dbg = debug
local function antitamper()
  if type(dbg.getinfo) ~= "function" or pcall(string.dump, dbg.getinfo) then return true end
  for _, f in ipairs({pcall, string.dump, dbg.getinfo, dbg.getlocal, dbg.getupvalue}) do
    local i = dbg.getinfo(f)
    if not i or i.what ~= "C" or pcall(string.dump, f) or dbg.getlocal(f, 1) or dbg.getupvalue(f, 1) then
      return true
    end
  end
end

local function antibeautify()
  local i
  (function()
  i = dbg.getinfo(2, "Sl")
  end)()
  return not i or i.linedefined ~= 2 or i.currentline ~= 2
end

if antibeautify() or antitamper() then
  print("HERCULES: Tamper Detected!")
  return
end

local executed = false while not executed do if math.random(0, 1) == 0 then local _ = 416 else executed = true end end local executed = false while not executed do if math.random(0, 1) == 0 then local _ = 473 else executed = true end end local executed = false while not executed do if math.random(0, 1) == 0 then local _ = 950 else executed = true end end local executed = false while not executed do if math.random(0, 1) == 0 then local _ = 985 else executed = true end end local executed = false while not executed do if math.random(0, 1) == 0 then local _ = 963 else executed = true end end local executed = false while not executed do if math.random(0, 1) == 0 then local _ = 174 else executed = true end end -- core.lua (this is the actual main script, safe to obfuscate)
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success or not Rayfield then
    warn("Failed to load Rayfield")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "KWRware",
    Icon = 0,
    LoadingTitle = "Loading KWRware",
    LoadingSubtitle = "by KWRware builders",
    ShowText = "KWRware",
    Theme = "Amethyst",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "KWRware configuration"
    },
    Discord = {
        Enabled = true,
        Invite = "6n3hkKCJpc",
        RememberJoins = true
    },
    KeySystem = false,
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

local function isCurrentGame(placeId)
    return game.PlaceId == placeId
end

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
tabMain:CreateParagraph({Title = "Update log", Content = "1.0A"})

local games = {
    {"Universal", "WIP"},
    {"99 nights", "eF Hub", "https://api.exploitingis.fun/loader", true},
    {"Grow a Garden", "Blackhub", "https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain", 126884695634066},
    {"Gunfight Arena", "elite hub", "https://pastefy.app/6kD0H2i4/raw", 14518422161},
    {"Jailbreak", "WIP"},
    {"The Strongest Battlegrounds", "WIP"},
    {"South Bronx", "WIP"},
    {"Total Drama Island", "WIP"},
    {"Pure Soccer", "WIP"},
    {"Type://Soul", "WIP"},
    {"Basketball Legends", "WIP"},
    {"Steal A Brainrot", "WIP"},
    {"3008", "WIP"},
    {"Baddies", "WIP"}
}

for _, info in ipairs(games) do
    local tab = Window:CreateTab(info[1], nil)
    tab:CreateSection("Scripts")
    tab:CreateButton({
        Name = info[2],
        Callback = function()
            if info[2] == "WIP" then
                Rayfield:Notify({Title = "WIP", Content = "Work In Progress", Duration = 2.5})
                return
            end

            if info[4] and not isCurrentGame(info[4]) then
                Rayfield:Notify({Title = "Game Not Supported", Content = "This script is not supported in this game.", Duration = 3})
                return
            end

            local success, result = pcall(function()
                loadstring(game:HttpGet(info[3], true))()
            end)

            Rayfield:Notify({
                Title = success and "Executed!" or "Error",
                Content = success and (info[2] .. " loaded successfully.") or ("Failed to load " .. info[2] .. ": " .. result),
                Duration = success and 2.5 or 3
            })
        end,
    })
end end)(...)
