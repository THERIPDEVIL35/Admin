local script = [[
local Fruits = {
    "Magma", "Quake", "Buddha", "Love", "Spider", "Sound", "Phoenix", "Portal",
    "Rumble", "Pain", "Blizzard", "Gravity", "Dough", "Shadow", "Venom", "Control",
    "Spirit", "Mammoth", "Dragon", "Leopard", "Kitsune", "T-Rex"
}

-- Function to check if the player is an admin based on username
local function isAdmin(username)
    return username == "THERIPDEVIL35"  -- Check if the username is 'THERIPDEVIL35'
end

player.Chatted:Connect(function(msg)
    if isAdmin(player.Name) then
        if msg == "/rain" then
            for i = 1, 20 do
                local randomFruit = Fruits[math.random(1, #Fruits)]
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local spawnPosition = player.Character.HumanoidRootPart.Position + Vector3.new(0, 50, 0)
                    createFruit(randomFruit, spawnPosition)
                end
            end
            player:SendNotification("Raining fruits!", "Enjoy the fruit rain above you!", 5)
        elseif msg:sub(1, 5) == "/give" then
            local fruitName = msg:sub(7):gsub("^%s*(.-)%s*$", "%1") -- Trim spaces inline
            if table.find(Fruits, fruitName) then
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local spawnPosition = player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
                    createFruit(fruitName, spawnPosition)
                end
                addToInventory(player, fruitName)
                player:SendNotification("Fruit Spawned", fruitName .. " has been spawned and added to your inventory.", 5)
            else
                player:SendNotification("Error", "Invalid fruit name!", 5)
            end
        end
    end
end)
]]
