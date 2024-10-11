-- Definitions
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local selectedTeleport = nil
local selectedTeleportName = nil
local selectedExportFormat = nil
local discordWebhook = "https://discord.com/api/webhooks/1294264217892950057/bhdRQJSiYOmWeUknFMIrlPjFVJ8lo5JBpYckOEbzrH8Ft6GCxrsR9_YBi3WoJVbpZefq"
local HttpService = game:GetService("HttpService")
local request = request or http_request or httprequest or http


-- Random tables idk

local shopLocations = {
	["Noob Shop"] = CFrame.new(74.5643234, 5.26117945, 292.455231, -0.73478961, -3.27213669e-08, -0.678295076, -2.14354809e-08, 1, -2.50197871e-08, 0.678295076, -3.84469834e-09, -0.73478961), -- Example CFrame, replace with actual locations
	["Pro Shop"] = CFrame.new(160.488632, 69.7453079, -155.565491, 0.999998212, 1.31137341e-08, 0.00187677715, -1.28772273e-08, 1, -1.26029292e-07, -0.00187677715, 1.26004906e-07, 0.999998212),
	["Blue HQ"] = CFrame.new(282.423706, 4.84532213, 97.3404083, -0.0105844624, 2.79670087e-09, -0.999943972, 7.00744618e-09, 1, 2.72268341e-09, 0.999943972, -6.97823532e-09, -0.0105844624),
	["Red HQ"] = CFrame.new(-316.44986, 20.9556866, 214.893997, -0.00307210069, 7.23511064e-08, 0.999995291, -1.54855879e-08, 1, -7.23990183e-08, -0.999995291, -1.57079327e-08, -0.00307210069),
	["Mountain Top Shop"] = CFrame.new(-21.0169411, 176.7453, -159.858551, -0.996453583, -4.72016914e-09, 0.0841442645, -4.78960516e-09, 1, -6.23332996e-10, -0.0841442645, -1.02414022e-09, -0.996453583),
	["Ticket Tent"] = CFrame.new(-233.972992, 18.3839569, 387.430786, -0.999901056, 1.30570585e-08, 0.014068529, 1.34856357e-08, 1, 3.03686356e-08, -0.014068529, 3.0555352e-08, -0.999901056),
	["Royal Jelly Shop"] = CFrame.new(-295.671814, 52.9588852, 64.8962097, -0.0366234183, 8.14068812e-08, -0.99932915, 6.54536336e-08, 1, 7.90627794e-08, 0.99932915, -6.25141752e-08, -0.0366234183),
	["Basic Egg Shop"] = CFrame.new(-134.362411, 5.44531822, 242.655228, 0.721751332, 1.79084179e-08, 0.6921525, -5.6996722e-08, 1, 3.35605819e-08, -0.6921525, -6.36728146e-08, 0.721751332),
	["Ticket Shop"] = CFrame.new(-14.5946474, 184.852707, -221.63884, 0.699741364, 4.4991932e-08, 0.714396238, 2.21649472e-08, 1, -8.46892192e-08, -0.714396238, 7.50951088e-08, 0.699741364),
	["Treat Shop"] = CFrame.new(-231.509308, 6.27219105, 86.6878052, 0.979120672, -5.84129083e-08, -0.203279778, 7.43732826e-08, 1, 7.08752665e-08, 0.203279778, -8.45140207e-08, 0.979120672),
	["Gumdrop Shop"] = CFrame.new(68.5375671, 22.1280251, 25.2423782, -0.0627754182, 7.97089683e-08, -0.998027682, 4.68212704e-08, 1, 7.69214523e-08, 0.998027682, -4.19001474e-08, -0.0627754182),
	["Petal Shop"] = CFrame.new(-498.665466, 52.3153687, 442.365051, -0.999947131, -2.10663504e-08, -0.0102818459, -2.05972004e-08, 1, -4.57349749e-08, 0.0102818459, -4.55207783e-08, -0.999947131),
	["Coconut Cave"] = CFrame.new(-143.300644, 73.0853119, 485.398621, -0.00914451852, 1.96684482e-08, -0.999958217, 3.62612944e-08, 1, 1.93376639e-08, 0.999958217, -3.60829446e-08, -0.00914451852),
	["Stinger Shop"] = CFrame.new(120.381798, 33.9537086, 436.008179, 0.596239209, 3.2025671e-08, -0.802806854, -4.04119238e-10, 1, 3.95919884e-08, 0.802806854, -2.32818653e-08, 0.596239209),
	["Badge Bearer's Guild"] = CFrame.new(-413.174866, 69.5867691, -33.1469803, -0.998216033, 2.02370143e-09, 0.0597051121, 1.72084469e-09, 1, -5.12396126e-09, -0.0597051121, -5.01207742e-09, -0.998216033),
	["Gummy Bear's Lair"] = CFrame.new(272.486053, 25268.5156, -776.354126, 0.999941051, -7.86697285e-08, 0.0108582182, 7.77746507e-08, 1, 8.28554363e-08, -0.0108582182, -8.20060606e-08, 0.999941051),
	["Magic Bean Shop"] = CFrame.new(350.995422, 92.6989746, -84.6951981, -0.997315586, -1.94740757e-08, 0.0732232556, -1.37918565e-08, 1, 7.81069076e-08, -0.0732232556, 7.68873534e-08, -0.997315586),
	["Dapper Bear's Shop"] = CFrame.new(508.793121, 138.776169, -337.510742, 0.425795615, -4.14056274e-08, -0.904819369, 1.12198727e-07, 1, 7.03797953e-09, 0.904819369, -1.04516324e-07, 0.425795615),
	["Diamond Mask Shop"] = CFrame.new(-337.713623, 133.074127, -387.217834, 0.995965242, 1.20655281e-08, 0.0897395909, -6.68184885e-09, 1, -6.02926562e-08, -0.0897395909, 5.94497642e-08, 0.995965242),
	["Demon Mask Shop"] = CFrame.new(293.709259, 27.6833801, 273.165833, -0.0357890725, -8.13550756e-08, -0.999359369, -2.58989852e-09, 1, -8.13144752e-08, 0.999359369, -3.21930316e-10, -0.0357890725),
	["Robo Bear's Shop"] = CFrame.new(-439.942047, 41.8756371, 131.309906, -0.00523442775, 3.7126707e-08, 0.999986291, -6.37086686e-08, 1, -3.74606977e-08, -0.999986291, -6.39038831e-08, -0.00523442775)
}

local ToyLocations = {
	["Blender"] = CFrame.new(-426.684723, 69.8533096, 39.5663033, -0.697269142, 8.58510347e-08, 0.716809392, -7.79856901e-10, 1, -1.20526877e-07, -0.716809392, -8.45986889e-08, -0.697269142),
	["Star Amulet Generators"] = CFrame.new(156.212128, 65.9907913, 319.986908, -0.780864537, -3.67556332e-08, -0.624700367, -3.05788603e-08, 1, -2.0614177e-08, 0.624700367, 3.00574499e-09, -0.780864537),
	["Wind Shrine"] = CFrame.new(-476.382751, 142.254776, 412.184174, -0.0104711987, -7.51809068e-08, 0.999945164, 3.17345616e-08, 1, 7.55173488e-08, -0.999945164, 3.25235803e-08, -0.0104711987),
	["Nectar Condenser"] = CFrame.new(-414.895355, 101.767769, 345.748413, 0.931690216, -1.03381073e-08, 0.363253862, -1.03685061e-09, 1, 3.11190931e-08, -0.363253862, -2.93699944e-08, 0.931690216),
	["Sticker Stack"] = CFrame.new(-415.446075, 112.105675, -150.226974, 0.439947933, 9.4398537e-08, 0.898023248, -1.03350942e-07, 1, -5.44857848e-08, -0.898023248, -6.88406416e-08, 0.439947933),
	["Sticker Printer"] = CFrame.new(200.985977, 162.47821, -197.738541, 0.975076854, -5.09208107e-08, -0.221867323, 5.06067899e-08, 1, -7.10019776e-09, 0.221867323, -4.30475433e-09, 0.975076854),
	["Beequip Storage"] = CFrame.new(-8.56633949, 5.00705719, 276.001434, 0.998524308, -1.47393058e-08, -0.0543069839, 1.98493364e-08, 1, 9.35558973e-08, 0.0543069839, -9.44957961e-08, 0.998524308),
	["Moon Amulet Generator"] = CFrame.new(21.0028954, 88.5581207, -52.1248817, 0.999876678, -2.52783643e-08, 0.0157042742, 2.71362701e-08, 1, -1.18092579e-07, -0.0157042742, 1.18504168e-07, 0.999876678)
}

-- UI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "BSS Toolkit",
	LoadingTitle = "BSS Toolkit",
	LoadingSubtitle = "by imrooli",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = BSSToolkit, -- Create a custom folder for your hub/game
		FileName = "BSSToolkit"
	},
	Discord = {
		Enabled = false,
		Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

-- Home Tab

local HomeTab = Window:CreateTab("Home", 4483362458)
local HomeSection = HomeTab:CreateSection("Home")

local DestroyButton = HomeTab:CreateButton({
	Name = "Destroy",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local MinimizeButton = HomeTab:CreateButton({
	Name = "Minimize",
	Callback = function()
		Minimise()
	end,
})

-- Teleport Tab

local TeleportTab = Window:CreateTab("Teleport", 4483362458) -- Title, Image
local TeleportSection = TeleportTab:CreateSection("Teleport Locations")

local function teleportTo(teleportLocation)
	-- Ensure the character and HumanoidRootPart are available
	local character = game.Players.LocalPlayer.Character
	if not character then
		print("Character not found!")
		return
	end

	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	-- Check if a valid teleport location is provided
	if teleportLocation then
		-- Create a tween to move the player to the teleport location
		local tweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local goal = {CFrame = teleportLocation}

		local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
		tween:Play()

		print("Teleporting to " .. tostring(teleportLocation))
	else
		print("No location selected")
	end
end

-- Teleport Tab Again

local ShopTeleportDropdown = TeleportTab:CreateDropdown({
	Name = "Shop Locations",
	Options = {
		"Noob Shop", 
		"Pro Shop",
		"Blue HQ",
		"Red HQ",
		"Mountain Top Shop",
		"Ticket Tent",
		"Royal Jelly Shop",
		"Basic Egg Shop",
		"Ticket Shop",
		"Treat Shop",
		"Gumdrop Shop",
		"Petal Shop",
		"Coconut Cave",
		"Stinger Shop",
		"Badge Bearer's Guild",
		"Gummy Bear's Lair",
		"Magic Bean Shop",
		"Dapper Bear's Shop",
		"Diamond Mask Shop",
		"Demon Mask Shop",
		"Robo Bear's Shop"
	},
	CurrentOption = {"Noob Shop"},
	MultipleOptions = false,
	Flag = "ShopTPDropdown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ShopTPOption)
		selectedTeleportName = ShopTPOption[1]
		selectedTeleport = shopLocations[selectedTeleportName]
		print("Selected: " .. selectedTeleportName)
	end,
})

local ToyTeleportDropdown = TeleportTab:CreateDropdown({
	Name = "Toy Locations",
	Options = {
		"Blender",
		"Star Amulet Generators",
		"Wind Shrine",
		"Nectar Condenser",
		"Sticker Stack",
		"Sticker Printer",
		"Beequip Storage",
		"Moon Amulet Generator"
	},
	CurrentOption = {"Blender"},
	MultipleOptions = false,
	Flag = "ToyTPDropdown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(ToyTPOption)
		selectedTeleportName = ToyTPOption[1]
		selectedTeleport = ToyLocations[selectedTeleportName]
		print("Selected: " .. selectedTeleportName)
	end,
})

local Button = TeleportTab:CreateButton({
	Name = "Teleport!",
	Callback = function()
		teleportTo(selectedTeleport)
	end,
})

-- Inventory Export Tab

local InventoryExportTab = Window:CreateTab("InventoryExport", 4483362458) -- Title, Image
local InventoryExportSection = InventoryExportTab:CreateSection("Inventory Export to Discord Webhook")

-- Inventory Export Scripts

local function getInventoryVars()
	local gui = player.PlayerGui:FindFirstChild("ScreenGui")
	
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

local function sendToWebhook(discordWebhook, inventoryData, selectedExportFormat)
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
	if selectedExportFormat == "TEXT" then
		local textContent = createPlainTextContent(inventoryData)
		messages = truncateContent(textContent, maxLength)
		print("Debug: Plain text format selected.")
		print("Debug: Plain text content: " .. textContent)
	else
		local jsonData = createJsonContent(inventoryData)
		messages = truncateContent(jsonData, maxLength)
		print("Debug: JSON format selected.")
		print("Debug: JSON data: " .. jsonData)
	end
	
	-- Send each chunk of the message
	for i, messagePart in ipairs(messages) do
		local postPayload = HttpService:JSONEncode({ content = messagePart })

		print("Debug: Sending message part " .. i .. ": " .. postPayload)
		local response = request({
			Url = discordWebhook,
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

-- End Inventory Functions

-- back to Inventory Export Tab

local DiscordWebhookInput = InventoryExportTab:CreateInput({
	Name = "Discord Webhook",
	PlaceholderText = "Input discord webhook...",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		local discordWebhook = Text
	end,
})

local ExportFormatDropdown = InventoryExportTab:CreateDropdown({
	Name = "Inventory Export Format",
	Options = {
		"JSON",
		"TEXT"
	},
	CurrentOption = {"JSON"},
	MultipleOptions = false,
	Flag = "ExportFormat", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		print("Inventory Export Format Selected: " .. Option[1])
		selectedExportFormat = Option[1]
	end,
})

local ExportInventoryButton = InventoryExportTab:CreateButton({
	Name = "Send Inventory to Webhook",
	Callback = function()
		local inventoryData = getInventory()
		local filteredData = filterZeroQuantity(inventoryData)
		sendToWebhook(discordWebhook, filteredData, selectedExportFormat)
	end,
})

-- Blender Tab {

-- Blender Functions {

local AutoBlenderEnabled = false
local formattedBlenderID = "RedExtract"
local QuantityRequested = 1
local BlenderQueue = {}
local maxDisplaySlots = 12
local craftTimePerItem = 300 -- time in seconds for crafting one item
local craftingCoroutine = nil
local isCrafting = false


-- Blender Functions }

-- Function to update the queue display
local function UpdateBlenderQueueDisplay()
	for i = 1, maxDisplaySlots do
		local label = _G["BlenderQueueSlot" .. i .. "Label"]
		if label then  -- Check if the label exists
			if BlenderQueue[i] then
				local timeRemaining = BlenderQueue[i].TimeRemaining
				local hours = math.floor(timeRemaining / 3600)
				local minutes = math.floor((timeRemaining % 3600) / 60)
				local seconds = timeRemaining % 60
				label:Set(string.format("Slot %d: %s x%d | Time remaining: %02d:%02d:%02d", 
					i, BlenderQueue[i].Recipe, BlenderQueue[i].Count, hours, minutes, seconds))
			else
				label:Set("Slot " .. i .. ": *empty*")
			end
		else
			print("Label for Slot " .. i .. " is not initialized.")  -- Debug message for missing label
		end
	end

	-- Update the current crafting slot display
	if #BlenderQueue > 0 then
		local currentOrder = BlenderQueue[1]
		local timeRemaining = currentOrder.TimeRemaining
		local hours = math.floor(timeRemaining / 3600)
		local minutes = math.floor((timeRemaining % 3600) / 60)
		local seconds = timeRemaining % 60
		_G.BlenderQueueCurrentSlot:Set(string.format("Currently crafting: %s x%d | Time remaining: %02d:%02d:%02d", 
			currentOrder.Recipe, currentOrder.Count, hours, minutes, seconds))
	else
		_G.BlenderQueueCurrentSlot:Set("Currently crafting: *empty*")
	end
end

-- Function to add an item to the queue
local function AddToBlenderQueue(recipe, quantity)
	-- Add the order to the queue
	local craftTime = craftTimePerItem * quantity
	table.insert(BlenderQueue, {Recipe = recipe, Count = quantity, TimeRemaining = craftTime})

	-- Update the queue display
	UpdateBlenderQueueDisplay()
end


local function ProcessBlenderQueue()
	if AutoBlenderEnabled and #BlenderQueue > 0 then
		if not isCrafting then
			isCrafting = true
			craftingCoroutine = coroutine.create(function()
				while #BlenderQueue > 0 do  -- Continue processing while there are items in the queue
					local currentOrder = table.remove(BlenderQueue, 1)
					UpdateBlenderQueueDisplay()  -- Update the display before starting the next order

					-- Display the currently crafting item
					_G.BlenderQueueCurrentSlot:Set(string.format("Currently crafting: %s x%d", currentOrder.Recipe, currentOrder.Count))

					-- Teleport to the Blender location
					teleportTo(ToyLocations["Blender"])
					wait(3)  -- Wait for teleportation to complete

					-- Place the crafting order
					game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("PlaceOrder", {
						["Recipe"] = currentOrder.Recipe,
						["Count"] = currentOrder.Count
					})
					wait(1)

					-- Calculate total crafting time
					local craftTime = craftTimePerItem * currentOrder.Count
					local startTime = tick()  -- Get the current server time

					-- Countdown timer for crafting
					while true do
						local elapsedTime = tick() - startTime
						local timeRemaining = craftTime - elapsedTime

						if timeRemaining <= 0 then
							break  -- Stop if time is up
						end

						UpdateBlenderQueueDisplay()  -- Update display each second

						-- Update the currently crafting display with the time remaining
						_G.BlenderQueueCurrentSlot:Set(string.format("Currently crafting: %s x%d | Time remaining: %02d:%02d:%02d",
							currentOrder.Recipe, currentOrder.Count, 
							math.floor(timeRemaining / 3600),
							math.floor((timeRemaining % 3600) / 60),
							timeRemaining % 60))

						wait(1)  -- Wait for 1 second before recalculating
					end

					-- After countdown, claim the crafted items
					game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("StopOrder")
					wait(3)  -- Wait for items to be claimed

					-- Clear the currently crafting display
					_G.BlenderQueueCurrentSlot:Set("Currently crafting: *empty*")

					-- Wait before processing the next order
					wait(5)  -- Adding a 5-second delay before the next operation
				end

				-- Reset crafting state after finishing the queue
				isCrafting = false
				craftingCoroutine = nil  -- Clear the coroutine reference
			end)
			coroutine.resume(craftingCoroutine)  -- Start the coroutine
		end
	end
end






-- Blender Tab }

local BlenderTab = Window:CreateTab("Blender", 4483362458) -- Title, Image b
local BlenderQueueNoticeLabel = BlenderTab:CreateLabel("🚨 MAKE SURE THE BLENDER IS EMPTY BEFORE ACTIVATING AUTO BLENDER")

local AutoBlenderToggle = BlenderTab:CreateToggle({
	Name = "Auto Blender",
	CurrentValue = false,
	Flag = "AutoBlenderToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		AutoBlenderEnabled = Value
		if AutoBlenderEnabled then
			ProcessBlenderQueue()  -- Start processing the queue when enabled
		end
	end,
})

local BlenderSettingsSection = BlenderTab:CreateSection("Blender Queue Settings")
local BlenderQueueItemSelectDropdown = BlenderTab:CreateDropdown({
	Name = "Blender Recipe Selection",
	Options = { 
		"Red Extract", 
		"Blue Extract", 
		"Enzymes", 
		"Oil", 
		"Glue", 
		"Tropical Drink", 
		"Gumdrops", 
		"Moon Charm", 
		"Glitter", 
		"Star Jelly", 
		"Purple Potion", 
		"Soft Wax", 
		"Hard Wax", 
		"Swirled Wax", 
		"Caustic Wax", 
		"Field Dice", 
		"Smooth Dice", 
		"Loaded Dice", 
		"Super Smoothie", 
		"Turpentine" 
	},
	CurrentOption = {"Red Extract"},
	MultipleOptions = false,
	Flag = "BlenderRecipe4Queue", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		formattedBlenderID = string.gsub(Option[1], "%s", "")
	end,
})

local BlenderQueueQuantityInput = BlenderTab:CreateInput({
	Name = "Quantity Requested",
	PlaceholderText = "Input amount...",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		-- The function that takes place when the input is changed
		-- The variable (Text) is a string for the value in the text box
		
		-- Validate the input as a number
		local quantity = tonumber(Text)
		if quantity and quantity > 0 then
			QuantityRequested = quantity
			Rayfield:Notify({
				Title = "Blender Queue Notice",
				Content = "Valid quantity accepted.",
				Duration = 1.5,
				Image = 4483362458,
				Actions = {},
			})
		else
			Rayfield:Notify({
				Title = "Blender Queue Notice",
				Content = "Invalid quantity. Please enter a number greater than 0.",
				Duration = 1.5,
				Image = 4483362458,
				Actions = {},
			})
		end
	end,
})

local BlenderQueueSubmitButton = BlenderTab:CreateButton({
	Name = "Submit to Blender Queue",
	Callback = function()
		-- The function that takes place when the button is pressed

		AddToBlenderQueue(formattedBlenderID, QuantityRequested)
	end,
})

local BlenderQueueClearButton = BlenderTab:CreateButton({
	Name = "Clear Blender Queue",
	Callback = function()
		-- Clear the queue and stop any ongoing crafting
		BlenderQueue = {}
		isCrafting = false  -- Stop the crafting process
		if craftingCoroutine then
			coroutine.close(craftingCoroutine)  -- Stop the coroutine if it's running
			craftingCoroutine = nil
		end
		teleportTo(ToyLocations["Blender"])
		wait(3)
		game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("StopOrder")
		UpdateBlenderQueueDisplay()
		_G.BlenderQueueCurrentSlot:Set("Currently crafting: *empty*")  -- Clear the current crafting display
	end,
})


local BlenderQueueSection = BlenderTab:CreateSection("Blender Queue")
_G.BlenderQueueCurrentSlot = BlenderTab:CreateLabel("Currently crafting: *empty*")
_G.BlenderQueueSlot1Label = BlenderTab:CreateLabel("Slot 1: *empty*")
_G.BlenderQueueSlot2Label = BlenderTab:CreateLabel("Slot 2: *empty*")
_G.BlenderQueueSlot3Label = BlenderTab:CreateLabel("Slot 3: *empty*")
_G.BlenderQueueSlot4Label = BlenderTab:CreateLabel("Slot 4: *empty*")
_G.BlenderQueueSlot5Label = BlenderTab:CreateLabel("Slot 5: *empty*")
_G.BlenderQueueSlot6Label = BlenderTab:CreateLabel("Slot 6: *empty*")
_G.BlenderQueueSlot7Label = BlenderTab:CreateLabel("Slot 7: *empty*")
_G.BlenderQueueSlot8Label = BlenderTab:CreateLabel("Slot 8: *empty*")
_G.BlenderQueueSlot9Label = BlenderTab:CreateLabel("Slot 9: *empty*")
_G.BlenderQueueSlot10Label = BlenderTab:CreateLabel("Slot 10: *empty*")
_G.BlenderQueueSlot11Label = BlenderTab:CreateLabel("Slot 11: *empty*")
_G.BlenderQueueSlot12Label = BlenderTab:CreateLabel("Slot 12: *empty*")