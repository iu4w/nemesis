-- 2.lua

-- Ensure script_key and targetPetID are set in the global environment
getgenv().script_key = getgenv().script_key or "default_key"
getgenv().targetPetID = getgenv().targetPetID or 0

-- Load and execute the next script
loadstring(game:HttpGet("https://raw.githubusercontent.com/iu4w/nemesis/main/3.lua", true))()

