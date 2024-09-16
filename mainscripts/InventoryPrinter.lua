local G2L = {}

-- Create the main ScreenGui
G2L["1"] = Instance.new("ScreenGui")
G2L["1"].Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
G2L["1"].Name = "InventoryExporterGUI"
G2L["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create the MainFrame
G2L["2"] = Instance.new("Frame")
G2L["2"].Parent = G2L["1"]
G2L["2"].BorderSizePixel = 0
G2L["2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["2"].Size = UDim2.new(0, 184, 0, 165)
G2L["2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["2"].Position = UDim2.new(0.5954347252845764, 0, 0.35209235548973083, 0);
G2L["2"].Name = "MainFrame"
G2L["2"].Draggable = true

-- Create the ExportWindow
G2L["3"] = Instance.new("TextBox")
G2L["3"].Parent = G2L["2"]
G2L["3"].CursorPosition = -1
G2L["3"].BorderSizePixel = 0
G2L["3"].TextSize = 14
G2L["3"].BackgroundColor3 = Color3.fromRGB(204, 204, 204)
G2L["3"].TextColor3 = Color3.fromRGB(0, 0, 0)
G2L["3"].FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["3"].Size = UDim2.new(0, 184, 0, 137)
G2L["3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["3"].Text = ""
G2L["3"].Name = "ExportWindow"
G2L["3"].MultiLine = true
G2L["3"].ClearTextOnFocus = false

-- Create the RefreshButton
G2L["4"] = Instance.new("TextButton")
G2L["4"].Parent = G2L["2"]
G2L["4"].BorderSizePixel = 0
G2L["4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["4"].TextSize = 14
G2L["4"].FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["4"].TextColor3 = Color3.fromRGB(0, 0, 0)
G2L["4"].Size = UDim2.new(0, 20, 0, 20)
G2L["4"].Name = "RefreshButton"
G2L["4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["4"].Text = "🔃"
G2L["4"].Position = UDim2.new(0.7251275181770325, 0, -0.1515151560306549, 0);

-- Create the TextLabel
G2L["5"] = Instance.new("TextLabel")
G2L["5"].Parent = G2L["2"]
G2L["5"].BorderSizePixel = 0
G2L["5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["5"].FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["5"].TextSize = 14
G2L["5"].TextColor3 = Color3.fromRGB(0, 0, 0)
G2L["5"].Size = UDim2.new(0, 162, 0, 17)
G2L["5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["5"].Text = "Inventory Exporter by imrooli"
G2L["5"].Position = UDim2.new(0.05978260934352875, 0, 0.8916666507720947, 0);

-- Create the ToggleFrame
G2L["6"] = Instance.new("Frame")
G2L["6"].Parent = G2L["1"]
G2L["6"].BorderSizePixel = 0
G2L["6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["6"].Size = UDim2.new(0, 20, 0, 19)
G2L["6"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["6"].Position = UDim2.new(0.7703201770782471, 0, 0.32285940647125244, 0);
G2L["6"].Name = "ToggleFrame"

-- Create the ToggleButton
G2L["7"] = Instance.new("TextButton")
G2L["7"].Parent = G2L["6"]
G2L["7"].BorderSizePixel = 0
G2L["7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["7"].TextSize = 14
G2L["7"].FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["7"].TextColor3 = Color3.fromRGB(0, 0, 0)
G2L["7"].Size = UDim2.new(0, 20, 0, 19)
G2L["7"].Name = "ToggleButton"
G2L["7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["7"].Text = "❌"

-- StarterGui.InventoryExporterGUI.ToggleFrame.DestroyButton
G2L["8"] = Instance.new("TextButton", G2L["6"]);
G2L["8"].BorderSizePixel = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"].TextSize = 14;
G2L["8"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"].TextColor3 = Color3.fromRGB(0, 0, 0);
G2L["8"].Size = UDim2.new(0, 20, 0, 19);
G2L["8"].Name = [[DestroyButton]];
G2L["8"].BorderColor3 = Color3.fromRGB(0, 0, 0);
G2L["8"].Text = [[🔥]];
G2L["8"].Position = UDim2.new(-2.75, 0, 0, 0);

-- StarterGui.InventoryExporterGUI.ToggleFrame.DiscordButton
G2L["9"] = Instance.new("TextButton", G2L["6"]);
G2L["9"].BorderSizePixel = 0;
G2L["9"].BackgroundColor3 = Color3.fromRGB(255, 255, 255);
G2L["9"].TextSize = 14;
G2L["9"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"].TextColor3 = Color3.fromRGB(0, 0, 0);
G2L["9"].Size = UDim2.new(0, 20, 0, 19);
G2L["9"].Name = [[DiscordButton]];
G2L["9"].BorderColor3 = Color3.fromRGB(0, 0, 0);
G2L["9"].Text = [[💬]];
G2L["9"].Position = UDim2.new(-4, 0, 0, 0);

-- StarterGui.InventoryExporterGUI.ToggleFrame.Discord0Button
G2L["a"] = Instance.new("TextButton", G2L["6"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["TextSize"] = 14;
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Size"] = UDim2.new(0, 20, 0, 19);
G2L["a"]["Name"] = [[Discord0Button]];
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[0️⃣]];
G2L["a"]["Position"] = UDim2.new(-5.349999904632568, 0, 0, 0);

-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")
local HttpService = game:GetService("HttpService")

local webhookUrl = "https://discord.com/api/webhooks/1285166908190232597/FpcxKVOj-OPS-iVXx_q2dB7CRZI-Pun7Aofom_MgvTholCFXWK-dpuu2em5E7GISmauy"

local request = request or http_request or httprequest or http

local function getInventoryVars()
    local menus = gui and gui:FindFirstChild("Menus")
    local children = menus and menus:FindFirstChild("Children")
    local eggs = children and children:FindFirstChild("Eggs")
    local content = eggs and eggs:FindFirstChild("Content")
    
    if not (gui and menus and children and eggs and content) then
        warn("Error: One or more required GUI elements are missing.")
        return nil
    end
    
    print("Debug: All required GUI elements found.")
    return content:FindFirstChild("EggRows") and content.EggRows:GetChildren() or content:GetChildren()
end

-- Function to parse quantities
local function parseQuantity(quantityText)
    if not quantityText or quantityText == "" then 
        return 0 
    end

    quantityText = string.gsub(quantityText, "x", "")
    local numerator = string.match(quantityText, "(%d+)/")
    return tonumber(numerator) or tonumber(quantityText) or 0
end

-- Retrieve and format inventory data
local function getInventory()
    local inventoryItems = getInventoryVars()
    if not inventoryItems then return end
    
    local inventoryData = {}

    for _, eggRow in pairs(inventoryItems) do
        local typeName = eggRow:FindFirstChild("TypeName")
        local eggSlot = eggRow:FindFirstChild("EggSlot")
        
        if typeName and eggSlot then
            local itemName = typeName.Text
            local itemQuantity = parseQuantity(eggSlot.Count.Text)
            inventoryData[itemName] = itemQuantity
        else
            warn("Warning: Missing TypeName or EggSlot in eggRow.")
        end
    end

    if player.CoreStats and player.CoreStats.Honey then
        inventoryData["Honey"] = player.CoreStats.Honey.Value
    else
        warn("Warning: Unable to find Honey value in CoreStats.")
    end

    -- Debug prints to verify inventory data
    print("Debug: Inventory Data")
    for k, v in pairs(inventoryData) do
        print(k, v)
    end

    local jsonData = HttpService:JSONEncode(inventoryData)
    if jsonData then
        print("Debug: Successfully encoded inventory data to JSON.")
        G2L["3"].Text = jsonData
    else
        warn("Error: Failed to encode inventory data to JSON.")
    end

    return inventoryData
end

-- Function to send data to the Discord webhook
local function sendToWebhook(webhookUrl, inventoryData)
    local content = "Inventory Data:\n"
    for itemName, itemQuantity in pairs(inventoryData) do
        content = content .. itemName .. ": " .. itemQuantity .. "\n"
    end

    -- Define the maximum message length for Discord
    local maxLength = 2000
    
    -- Function to split content by lines without breaking inventory names and values
    local function splitContent(content, maxLength)
        local chunks = {}
        local currentChunk = ""
        
        for line in content:gmatch("[^\r\n]+") do
            if #currentChunk + #line + 1 > maxLength then
                table.insert(chunks, currentChunk)
                currentChunk = line .. "\n"
            else
                currentChunk = currentChunk .. line .. "\n"
            end
        end
        
        if #currentChunk > 0 then
            table.insert(chunks, currentChunk)
        end
        
        return chunks
    end
    
    -- Split the content into chunks if it exceeds the maximum length
    local chunks = splitContent(content, maxLength)
    
    for _, chunk in ipairs(chunks) do
        local payload = HttpService:JSONEncode({
            content = chunk
        })
        
        local response = request({
            Url = webhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = payload
        })
        
        if response then
            print("Debug: Successfully sent chunk to webhook.")
            print("Debug: Response status code: " .. tostring(response.StatusCode))
            print("Debug: Response body: " .. tostring(response.Body))
        else
            warn("Error: Failed to send chunk to webhook.")
        end
    end
end

-- Function to filter out items with a quantity of 0
local function filterZeroQuantity(inventoryData)
    local filteredData = {}
    
    for itemName, itemQuantity in pairs(inventoryData) do
        if itemQuantity > 0 then
            filteredData[itemName] = itemQuantity
        end
    end
    
    return filteredData
end



-- Connect button click events
G2L["4"].MouseButton1Click:Connect(function()
    getInventory()
end)

G2L["7"].MouseButton1Click:Connect(function()
    G2L["2"].Visible = not G2L["2"].Visible
end)

G2L["8"].MouseButton1Click:Connect(function()
    G2L["1"]:Destroy()
end)

G2L["9"].MouseButton1Click:Connect(function()
    local inventoryData = getInventory()
    sendToWebhook(webhookUrl, inventoryData)
end)

G2L["a"].MouseButton1Click:Connect(function()
    local inventoryData = getInventory()
    local filteredData = filterZeroQuantity(inventoryData)
    sendToWebhook(webhookUrl, filteredData)
end)


