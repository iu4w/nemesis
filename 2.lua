-- 2.lua

print("2.lua - Script Key: Checking if " .. getgenv().script_key .. " is Valid")
print("2.lua - Target Pet ID: Checking if " .. .. getgenv().targetPetID .. " isValid")

-- Load and execute 3.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/iu4w/nemesis/main/3.lua", true))()
