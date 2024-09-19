-- Gui to Lua
-- Version: 3.2

-- Instances:

local InventoryExporter2 = Instance.new("ScreenGui")
local WholeFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ExportMode = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local _0ToDiscord = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local FullToDiscord = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local WindowControlFrame = Instance.new("Frame")
local VisibleButton = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local DestroyButton = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local WindowLabel = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
local UICorner_9 = Instance.new("UICorner")
local AspectRatio = Instance.new("UIAspectRatioConstraint")

--Properties:

InventoryExporter2.Name = "InventoryExporter2"
InventoryExporter2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
InventoryExporter2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

WholeFrame.Name = "WholeFrame"
WholeFrame.Parent = InventoryExporter2
WholeFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WholeFrame.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
WholeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
WholeFrame.BorderSizePixel = 0
WholeFrame.Position = UDim2.new(0.579584777, 0, 0.5, 0)
WholeFrame.Size = UDim2.new(0, 276, 0, 74)

MainFrame.Name = "MainFrame"
MainFrame.Parent = WholeFrame
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, 0, 0.64864862, 0)
MainFrame.Size = UDim2.new(0, 263, 0, 42)

UICorner.CornerRadius = UDim.new(1, 8)
UICorner.Parent = MainFrame

ExportMode.Name = "ExportMode"
ExportMode.Parent = MainFrame
ExportMode.BackgroundColor3 = Color3.fromRGB(230, 226, 255)
ExportMode.BorderColor3 = Color3.fromRGB(0, 0, 0)
ExportMode.BorderSizePixel = 0
ExportMode.Position = UDim2.new(0.0312783122, 0, 0.102941602, 0)
ExportMode.Size = UDim2.new(0, 122, 0, 34)
ExportMode.Font = Enum.Font.SourceSans
ExportMode.Text = "JSON"
ExportMode.TextColor3 = Color3.fromRGB(0, 0, 0)
ExportMode.TextSize = 14.000

UICorner_2.Parent = ExportMode

_0ToDiscord.Name = "0ToDiscord"
_0ToDiscord.Parent = MainFrame
_0ToDiscord.BackgroundColor3 = Color3.fromRGB(230, 226, 255)
_0ToDiscord.BorderColor3 = Color3.fromRGB(0, 0, 0)
_0ToDiscord.BorderSizePixel = 0
_0ToDiscord.Position = UDim2.new(0.525574863, 0, 0.102941602, 0)
_0ToDiscord.Size = UDim2.new(0, 56, 0, 34)
_0ToDiscord.Font = Enum.Font.SourceSans
_0ToDiscord.Text = "0️⃣"
_0ToDiscord.TextColor3 = Color3.fromRGB(0, 0, 0)
_0ToDiscord.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(5, 8)
UICorner_3.Parent = _0ToDiscord

FullToDiscord.Name = "FullToDiscord"
FullToDiscord.Parent = MainFrame
FullToDiscord.BackgroundColor3 = Color3.fromRGB(230, 226, 255)
FullToDiscord.BorderColor3 = Color3.fromRGB(0, 0, 0)
FullToDiscord.BorderSizePixel = 0
FullToDiscord.Position = UDim2.new(0.740180969, 0, 0.102941602, 0)
FullToDiscord.Size = UDim2.new(0, 56, 0, 34)
FullToDiscord.Font = Enum.Font.SourceSans
FullToDiscord.Text = "📝"
FullToDiscord.TextColor3 = Color3.fromRGB(0, 0, 0)
FullToDiscord.TextSize = 14.000

UICorner_4.CornerRadius = UDim.new(5, 8)
UICorner_4.Parent = FullToDiscord

WindowControlFrame.Name = "WindowControlFrame"
WindowControlFrame.Parent = WholeFrame
WindowControlFrame.AnchorPoint = Vector2.new(0.5, 0.5)
WindowControlFrame.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
WindowControlFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
WindowControlFrame.BorderSizePixel = 0
WindowControlFrame.Position = UDim2.new(0.50064218, 0, 0.163474008, 0)
WindowControlFrame.Size = UDim2.new(0, 275, 0, 34)

VisibleButton.Name = "VisibleButton"
VisibleButton.Parent = WindowControlFrame
VisibleButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
VisibleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
VisibleButton.BorderSizePixel = 0
VisibleButton.Position = UDim2.new(0.73152256, 0, 0.0588235296, 0)
VisibleButton.Size = UDim2.new(0, 30, 0, 30)
VisibleButton.Font = Enum.Font.SourceSans
VisibleButton.Text = "👁️"
VisibleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
VisibleButton.TextSize = 14.000

UICorner_5.CornerRadius = UDim.new(5, 8)
UICorner_5.Parent = VisibleButton

DestroyButton.Name = "DestroyButton"
DestroyButton.Parent = WindowControlFrame
DestroyButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
DestroyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
DestroyButton.BorderSizePixel = 0
DestroyButton.Position = UDim2.new(0.862883091, 0, 0.0559683405, 0)
DestroyButton.Size = UDim2.new(0, 30, 0, 30)
DestroyButton.Font = Enum.Font.SourceSans
DestroyButton.Text = "🔥"
DestroyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
DestroyButton.TextSize = 14.000

UICorner_6.CornerRadius = UDim.new(5, 8)
UICorner_6.Parent = DestroyButton

WindowLabel.Name = "WindowLabel"
WindowLabel.Parent = WindowControlFrame
WindowLabel.BackgroundColor3 = Color3.fromRGB(181, 181, 181)
WindowLabel.BackgroundTransparency = 1.000
WindowLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
WindowLabel.Position = UDim2.new(0.019910777, 0, -0.015026317, 0)
WindowLabel.Size = UDim2.new(0, 190, 0, 32)
WindowLabel.Font = Enum.Font.SourceSans
WindowLabel.Text = "Inventory Exporter by imrooli"
WindowLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WindowLabel.TextSize = 14.000
WindowLabel.TextWrapped = true

UICorner_7.Parent = WindowLabel

UICorner_8.Parent = WindowControlFrame

UICorner_9.Parent = WholeFrame

AspectRatio.Name = "AspectRatio"
AspectRatio.Parent = WholeFrame
AspectRatio.AspectRatio = 3.730

-- Script

-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")
local HttpService = game:GetService("HttpService")
local outputFormat = "JSON"

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

local function parseQuantity(quantityText)
	if not quantityText or quantityText == "" then 
		return 0 
	end

	quantityText = string.gsub(quantityText, "x", "")
	local numerator = string.match(quantityText, "(%d+)/")
	return tonumber(numerator) or tonumber(quantityText) or 0
end

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
		return "```\n" .. content .. "```"
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
		return "```\n" .. HttpService:JSONEncode(inventoryData) .. "```"
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

VisibleButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
	if WholeFrame.BackgroundTransparency == 0 then
		WholeFrame.BackgroundTransparency = 1
	else
		WholeFrame.BackgroundTransparency = 0
	end
end)

DestroyButton.MouseButton1Click:Connect(function()
	InventoryExporter2:Destroy()
end)

FullToDiscord.MouseButton1Click:Connect(function()
	local inventoryData = getInventory()
	sendToWebhook(webhookUrl, inventoryData, outputFormat)
end)

_0ToDiscord.MouseButton1Click:Connect(function()
	local inventoryData = getInventory()
	local filteredData = filterZeroQuantity(inventoryData)
	sendToWebhook(webhookUrl, filteredData, outputFormat)
end)

ExportMode.MouseButton1Click:Connect(function()
	if outputFormat == "TEXT" then
		outputFormat = "EMBED"
		ExportMode.Text = "JSON"
	elseif outputFormat == "EMBED" then
		outputFormat = "JSON"
		ExportMode.Text = "TEXT"
	else
		outputFormat = "TEXT"
		ExportMode.Text = "EMBED"
	end
	print("Debug: Switched to " .. outputFormat .. " format.")
end)


