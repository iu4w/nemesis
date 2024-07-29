-- This script assumes that script_key and targetPetID are set globally before execution
local validKeys = {
    ["D1e19KzI4PpPSx7OiuxR7B8jhQO5lw"] = "nit",
    ["T5BJEVof3b7caXB7D8lX8DIWCntpAT"] = "username2",
    ["CtKyJ74pDw461DHeQLA72mLCpQSLCP"] = "username3",
    ["7J7l5KT0ZdYN0ZBNFDiq1ZKWGVipPB"] = "username4",
    ["oFLCJFUDa3QZhCsPaX5Jwvy9Qrcd8u"] = "username5",
    ["rO64vLNyEreqOtqLyEOWRfl5L9rB51"] = "username6",
    ["79huniyhsquI2EI711lMEnSPlDXZsi"] = "username7",
    ["ByQJVuKiSVuhuPabNnLAgn1HFHOL44"] = "username8",
    ["6fr0B1u7VwZiwV3IAqYsK3KRKFM7qJ"] = "username9",
    ["iqPXtpxhQiIHyZgpFkEL3wKz9bK1EE"] = "username10",
    ["M0G331MHhNStrhISjNH1L3vt8fwfon"] = "username11",
    ["Hf4wLvvsGxR3aDY4UsNP4Ysf1auPSV"] = "username12",
    ["f5lsKPf05t26aeua2w4CwvUkUF8xSN"] = "username13",
    ["HaaJ2WMxQU7sTGrKZ23kFVhKlPY6o4"] = "username14",
    ["HwYRlX5NeTgkt0co8Uz30UEiqrkCoW"] = "username15",
    ["6aIyhlnLmZIB8BCyllVhcwzJUzsnfr"] = "username16",
    ["69A3YFgDvRfdEpLCGTiFaPNDd9rjDG"] = "username17",
    ["skYJbKUbRQdlOR9OAl36VhAK94swJQ"] = "username18",
    ["7On6HHtf5zSFAQgvAu8pfGjmhtNq4v"] = "username19",
    ["Yc989vwLcXhvQtNSkKvL5IwzJwx08n"] = "username20",
    ["KVblzobIjl9YvhtGoQPvs9H3CRyQjA"] = "username21",
    ["IKtgVoTAJGpQjQg52EWkZ29mnyNdfu"] = "username22",
    ["NFhkvy6ozAQAdSCXCqndFP28hBPb4M"] = "username23",
    ["WUDeqteqfGYKbl8suj25dRSbwNQmHV"] = "username24",
    ["YJE9RecOJHLYdoqiEUnsWQpBiyBbIm"] = "username25",
    ["QpGfDiskuXjlTdX42YxdCVjTYXAGSE"] = "username26",
    ["t8D6uyKPMtkYYl28aj9rgRRFLAA9Gy"] = "username27",
    ["Aekxm3w4PTz0SmnGRehYV1j7D6aZX4"] = "username28",
    ["krkhQiPmoDVbWhnldJKHA64uVDoQ5E"] = "username29",
    ["iIvbWjeOugy57rHbMz7vpAp37kafrh"] = "username30",
    ["qNkbDUxplI5C9pwrirGtQxnQ6LHsWl"] = "username31",
    ["QcLRVVLEzDV8Tf1h4f5FE5iEVwl2oN"] = "username32",
    ["MWfd6dfYua97si0fDar9Y5w3di5RTM"] = "username33",
    ["5JNTRKR4krK1wIWUuUKKBVJGKikfiV"] = "username34",
    ["xwztdSnIN0dyMXDkhunwfmfs9m0tl2"] = "username35",
    ["QbyeGXEdcfeUpMLyWnCnnbqOXRvu4P"] = "username36",
    ["KroRp3QBB7FT7yC4RThvu6dCnrFhUf"] = "username37",
    ["uEdFxr0vdwRtGaxS5P0dn5BrzrYfiF"] = "username38",
    ["a6D2moJhxmynAhWXwW2TIjwYQGqxGj"] = "username39",
    ["EvcmppavbKxYcjJsoyWq8h9TihvzAW"] = "username40",
    ["ahI5Wp44ROT5fmlVyHTaAC3VOK8fiT"] = "username41",
    ["9enQAPNKYlPf2xrhcTgQsDEpRHr5gP"] = "username42",
    ["G7F9QHFnlcVnKly1LI2VMrG8eYdV8n"] = "username43",
    ["jlTMpXKmNflk2ui34cuAJ1sMqL5nHp"] = "username44",
    ["p1np7T5NEk1yaJEjNLSa17vxQTNLrB"] = "username45",
    ["48MZBIJSgU39Q0pmsCwz9NaMYmkl86"] = "username46",
    ["cf2QH043maCR3ay2OtWxmy0zQLnzm2"] = "username47",
    ["6dKY4Jg0qJ4r4nJa8J1DKtYqsBhRUe"] = "username48",
    ["TsXUyKFweIcGj2Y4CeLT4GbiOkz5qr"] = "username49",
    ["AaRrMb87hbITXkG9ZJGAo5KrnYfaKK"] = "username50",
    ["CVsriH7lv5Iy609gM9YwJ2VlJL0jhl"] = "username51",
    ["zKe7Mp3zcfYOQE5vAazttUILLya2NP"] = "username52",
    ["ri4ZEdUPqN8fJm0PfXhU3q6FQ44k9z"] = "username53",
    ["2V6XgcXd3vpfFivrMMmVS07V6DEuta"] = "username54",
    ["BInPkOviL3wnLlgcZ3GcSYJSV1TzdG"] = "username55",
    ["G03PegRsqKGOdNq5sZneUCf7TZijx8"] = "username56",
    ["ZjNGMxbRXrB6yGaWWQ3HrAh1kvP3IV"] = "username57",
    ["Cl2aRAQxIP8Z6M8uvAcwDB2ELHJDDO"] = "username58",
    ["2s1sOxwrZPZc7NfP5Sd833f897vn8R"] = "username59",
    ["IOh8Tr4kqzRC90gpwxbMG1rLx2iNBx"] = "username60",
    ["zESVPqElmjdw4yqwmjZP6aQPJfCElq"] = "username61",
    ["uCYSBv6SoHA9O37N1LvEOnHyy1Li9h"] = "username62",
    ["hVxv3RCrSgisoF3ObfK8OCrKrAEUal"] = "username63",
    ["df2AQjlVGB9HpzgqXepIkZH6HgilXT"] = "username64",
    ["Gzh0Yx3Ncwt4cQpaH2dD8HCkfg5EdL"] = "username65",
    ["R8TARFYu2MJAyyHsVs4SExOGPAyIsE"] = "username66",
    ["yQCb9wewJhTiWzX5047wo8FsgOJcxf"] = "username67",
    ["c1Zla5UIRfH39LDdZP2JP0hWiBk99f"] = "username68",
    ["dGCIKmEVHS7XhKMTV0G7Nm16jSbQWM"] = "username69",
    ["a7fHC5MkAwjtuzVMZRXj7mnxICw9Nb"] = "username70",
    ["LZw5a3xZO8BYhaq6Lyds55DiC3yqty"] = "username71",

    -- Add more keys here
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
