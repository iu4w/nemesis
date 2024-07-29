-- 1.lua

getgenv().script_key = getgenv().script_key or "default_key"
getgenv().targetPetID = getgenv().targetPetID or 0

-- Load and execute 2.lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/iu4w/nemesis/main/2.lua", true))()
