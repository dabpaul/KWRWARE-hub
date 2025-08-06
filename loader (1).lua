-- loader.lua (public, NOT obfuscated)
local success, response = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/yourname/KWRWARE-hub/main/core.lua")
end)

if success and response then
    local ok, err = pcall(function()
        loadstring(response)()
    end)
    if not ok then warn("[KWRWARE] Core script error:", err) end
else
    warn("[KWRWARE] Failed to fetch core script:", response)
end
