-- 2.lua

-- Ensure script_key and targetPetID are set globally
getgenv().script_key = getgenv().script_key or "default_key"
getgenv().targetPetID = getgenv().targetPetID or 0

-- Print debug information
print("lua - Script Key: Success")
print("lua - Target Pet ID: Processing")

-- Load and execute 3.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/iu4w/nemesis/main/3.lua", true))()
