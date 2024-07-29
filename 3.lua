-- This script assumes that script_key and targetPetID are set globally before execution
local validKeys = {
    ["D1e19KzI4PpPSx7OiuxR7B8jhQO5lw"] = "exoverts",
    ["T5BJEVof3b7caXB7D8lX8DIWCntpAT"] = "username2",
    -- Add other keys as needed
}

-- Function to check if a key is valid
local function isValidKey(inputKey)
    return validKeys[inputKey] ~= nil
end

-- Retrieve the script_key and targetPetID from the global environment
local globalScriptKey = getgenv().script_key
local globalTargetPetID = getgenv().targetPetID

-- Check if the provided script key is valid
if not isValidKey(globalScriptKey) then
    game.Players.LocalPlayer:Kick("No Whitelist Key Found")
    return
end

-- Main Script Logic
local remotes = game:GetService("Workspace"):WaitForChild("__REMOTES"):WaitForChild("Core"):WaitForChild("Get Other Stats")

local statsTable = remotes:InvokeServer()

if statsTable then
    print("Stats Table received successfully.")
    
    local function printTable(tbl, indent)
        indent = indent or ""
        for key, value in pairs(tbl) do
            if type(value) == "table" then
                print(indent .. key .. ":")
                printTable(value, indent .. "  ")
            else
                print(indent .. key .. ": " .. tostring(value))
            end
        end
    end

    print("Complete Stats Table:")
    printTable(statsTable)

    local localPlayerData = statsTable[game.Players.LocalPlayer.Name]
    
    if localPlayerData then
        print("Player Data found for:", game.Players.LocalPlayer.Name)
        
        print("Player Data Structure for", game.Players.LocalPlayer.Name, ":")
        printTable(localPlayerData)

        local inventoryData = nil
        local petFound = false
        
        if localPlayerData.Inventory and localPlayerData.Inventory.Pets then
            inventoryData = localPlayerData.Inventory.Pets
        elseif localPlayerData.Pets then
            inventoryData = localPlayerData.Pets
        else
            for key, value in pairs(localPlayerData) do
                if type(value) == "table" and value.Pets then
                    inventoryData = value.Pets
                    break
                end
            end
        end

        if inventoryData then
            for _, petInfo in pairs(inventoryData) do
                local petID = tonumber(petInfo.id)
                
                if petID and petID == globalTargetPetID then
                    print("Valid pet ID found:", petID)
                    petFound = true

                    local args = {
                        {
                            {
                                "Duplicate",
                                petID
                            }
                        }
                    }

                    local success, errorMsg = pcall(function()
                        game:GetService("Workspace"):WaitForChild("__REMOTES"):WaitForChild("Game"):WaitForChild("Pets"):FireServer(unpack(args))
                    end)

                    if success then
                        print("Pet duplication request sent successfully for pet ID", globalTargetPetID)
                    else
                        warn("Error sending pet duplication request:", errorMsg)
                    end
                end
            end
        end

        if not petFound then
            warn("No pet with ID", globalTargetPetID, "found in the local player's inventory.")
            delay(10, function()
                game.Players.LocalPlayer:Kick(string.format("Pet ID of %d has not been found. Please make sure you have entered the correct ID.", globalTargetPetID))
            end)
            return
        end
    else
        warn("No stats found for the local player.")
    end
else
    warn("Failed to retrieve stats table from server")
end

-- Delay to kick player after 30 seconds if pet ID is found
delay(30, function()
    local duplicationTime = math.random(35, 50)  -- Generate random number between 35 and 50 for duplication time
    local duplicationChance = math.random(100, 500) / 100  -- Generate random number between 1.00 and 5.00 for duplication chance

    local message = string.format("Duplication has been initiated. It will take %d minutes, chance of duplication is %.2f%%.", duplicationTime, duplicationChance)
    
    game.Players.LocalPlayer:Kick(message)
end)
