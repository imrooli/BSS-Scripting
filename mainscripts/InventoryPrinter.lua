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

-- StarterGui.InventoryExporterGUI.ToggleFrame.WebhookMode
G2L["b"] = Instance.new("TextButton", G2L["6"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["TextSize"] = 14;
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Size"] = UDim2.new(0, 47, 0, 19);
G2L["b"]["Name"] = [[WebhookMode]];
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[EMBED]];
G2L["b"]["Position"] = UDim2.new(-8.100000381469727, 0, 0, 0);

-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")
local HttpService = game:GetService("HttpService")
local outputFormat = "TEXT"


local webhookUrl = "https://discord.com/api/webhooks/1285166908190232597/FpcxKVOj-OPS-iVXx_q2dB7CRZI-Pun7Aofom_MgvTholCFXWK-dpuu2em5E7GISmauy"

local request = request or http_request or httprequest or http

-- functions

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


local function truncateContent(content, maxLength)
    local result = {}
    local currentLength = 0

    while #content > maxLength do
        local splitIndex = content:sub(1, maxLength):match(".*()") or maxLength
        table.insert(result, content:sub(1, splitIndex - 1))
        content = content:sub(splitIndex)
    end

    table.insert(result, content)
    return result
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

local function sendToWebhook(webhookUrl, inventoryData, outputFormat)
    local maxLength = 2000
    local maxEmbedLength = 6000
    local maxFields = 25

    local function createPlainTextContent(inventoryData)
        local content = "Inventory Data:\n"
        for itemName, itemQuantity in pairs(inventoryData) do
            content = content .. itemName .. ": " .. itemQuantity .. "\n"
        end
        return content
    end

    local function createEmbedContent(inventoryData)
        local fields = {}
        for itemName, itemQuantity in pairs(inventoryData) do
            table.insert(fields, {
                name = itemName,
                value = tostring(itemQuantity),
                inline = true
            })
        end

        local embeds = {}
        while #fields > 0 do
            local embedFields = {}
            while #embedFields < maxFields and #fields > 0 do
                table.insert(embedFields, table.remove(fields, 1))
            end

            local embedData = {
                title = "Inventory Data",
                fields = embedFields,
                color = 3447003 -- Blue color
            }
            table.insert(embeds, embedData)
        end

        return embeds
    end

    local function createJsonContent(inventoryData)
        return HttpService:JSONEncode(inventoryData)
    end

    -- Function to truncate content to fit within Discord's character limit
    local function truncateContent(content, maxLength)
        local messages = {}
        while #content > maxLength do
            local splitIndex = content:sub(1, maxLength):match(".*()") or maxLength
            local messagePart = content:sub(1, splitIndex - 1)
            table.insert(messages, messagePart)
            content = content:sub(splitIndex)
        end
        if #content > 0 then
            table.insert(messages, content)
        end
        return messages
    end

    -- Choose the format and prepare messages
    local messages
    if outputFormat == "EMBED" then
        local embedData = createEmbedContent(inventoryData)
        local jsonData = HttpService:JSONEncode({ embeds = embedData })
        messages = truncateContent(jsonData, maxLength)
        print("Debug: Embed format selected.")
        print("Debug: Embed JSON data: " .. jsonData)
    elseif outputFormat == "JSON" then
        local jsonData = createJsonContent(inventoryData)
        messages = truncateContent(jsonData, maxLength)
        print("Debug: JSON format selected.")
        print("Debug: JSON data: " .. jsonData)
    else
        local textContent = createPlainTextContent(inventoryData)
        messages = truncateContent(textContent, maxLength)
        print("Debug: Plain text format selected.")
        print("Debug: Plain text content: " .. textContent)
    end

    -- Send each chunk of the message
    for i, messagePart in ipairs(messages) do
        local postPayload
        if outputFormat == "EMBED" then
            postPayload = HttpService:JSONEncode({ embeds = { { title = "Inventory Data", description = messagePart, color = 3447003 } } })
        elseif outputFormat == "JSON" then
            postPayload = HttpService:JSONEncode({ content = messagePart })
        else
            postPayload = HttpService:JSONEncode({ content = messagePart })
        end

        print("Debug: Sending message part " .. i .. ": " .. postPayload)
        local response = request({
            Url = webhookUrl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = postPayload
        })

        if response then
            print("Debug: Successfully sent part of the data to webhook.")
            print("Debug: Response status code: " .. tostring(response.StatusCode))
            print("Debug: Response body: " .. tostring(response.Body))
        else
            warn("Error: Failed to send part of the data to webhook.")
        end
    end
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
    sendToWebhook(webhookUrl, inventoryData, outputFormat)
end)

G2L["a"].MouseButton1Click:Connect(function()
    local inventoryData = getInventory()
    local filteredData = filterZeroQuantity(inventoryData)
    sendToWebhook(webhookUrl, filteredData, outputFormat)
end)

G2L["b"].MouseButton1Click:Connect(function()
    if outputFormat == "TEXT" then
        outputFormat = "EMBED"
        G2L["b"].Text = "JSON"
    elseif outputFormat == "EMBED" then
        outputFormat = "JSON"
        G2L["b"].Text = "TEXT"
    else
        outputFormat = "TEXT"
        G2L["b"].Text = "EMBED"
    end
    print("Debug: Switched to " .. outputFormat .. " format.")
end)


