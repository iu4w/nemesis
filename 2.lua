-- 2.lua

print("2.lua - Script Key: ", getgenv().script_key)
print("2.lua - Target Pet ID: ", getgenv().targetPetID)

-- Load and execute 3.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/iu4w/nemesis/main/3.lua", true))()
