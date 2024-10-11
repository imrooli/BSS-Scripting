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



-- Blender Functions {

local AutoCraftingEnabled = false
local AutoCraftTarget = "Candy Planter"
local craftingCoroutine = nil
local craftingQueue = {}
local craftingTimePerItem = 300  -- 5 minutes in seconds

-- Recipes {

local recipes = {
	-- Planters
	["Hydroponic Planter"] = {
		Honey = 750000000,
		Turpentine = 1,
		["Blue Extract"] = 750,
		["Magic Bean"] = 75,
		["Soft Wax"] = 500,
		["Caustic Wax"] = 25
	},
	["Petal Planter"] = {
		["Magic Bean"] = 100,
		Glitter = 100,
		["Soft Wax"] = 250,
		["Swirled Wax"] = 50,
		["Super Smoothie"] = 25
	},
	["Heat-Treated Planter"] = {
		Honey = 750000000,
		["Red Extract"] = 750,
		["Magic Bean"] = 75,
		["Hard Wax"] = 150,
		["Swirled Wax"] = 25,
		Turpentine = 1
	},
	["Red Clay Planter"] = {
		Honey = 10000000,
		["Magic Bean"] = 5,
		["Red Extract"] = 15,
		["Soft Wax"] = 20
	},
	["Blue Clay Planter"] = {
		Honey = 10000000,
		["Magic Bean"] = 5,
		["Blue Extract"] = 15,
		["Soft Wax"] = 20
	},
	["Candy Planter"] = {
		Honey = 5000000,
		["Magic Bean"] = 5,
		Gumdrops = 30,
		["Soft Wax"] = 5
	},
	["Tacky Planter"] = {
		Honey = 50000000,
		["Magic Bean"] = 10,
		["Purple Potion"] = 1,
		["Hard Wax"] = 5,
		["Soft Wax"] = 20
	},
	["Pesticide Planter"] = {
		Honey = 750000000,
		["Magic Bean"] = 25,
		Neonberry = 25,
		Glue = 15,
		["Caustic Wax"] = 3,
		["Hard Wax"] = 10
	},
	["The Planter of Plenty"] = {
		Honey = 100000000000000,
		["Magic Bean"] = 500,
		["Super Smoothie"] = 100,
		["Swirled Wax"] = 100,
		["Caustic Wax"] = 100,
		Turpentine = 25
	},

	-- Gear
	-- Boots
	["Gummy Boots"] = {
		Honey = 100000000,
		Glue = 500,
		Glitter = 250,
		["Red Extract"] = 250,
		["Blue Extract"] = 250,
		["Satisfying Vial"] = 1,
		["Motivating Vial"] = 1
	},
	["Coconut Clogs"] = {
		Honey = 10000000000,
		Coconut = 150,
		["Tropical Drink"] = 50,
		Glue = 100,
		Oil = 100,
		["Refreshing Vial"] = 1
	},
	-- Guards
	["Cobalt Guard"] = {
		Honey = 200000000,
		Enzymes = 50,
		Glitter = 25,
		Stinger = 100,
		["Blue Extract"] = 100
	},
	["Crimson Guard"] = {
		Honey = 200000000,
		Oil = 50,
		Glitter = 25,
		Stinger = 100,
		["Red Extract"] = 100
	},
	-- Belts
	["Honeycomb Belt"] = {
		Honey = 75000000,
		Enzymes = 50,
		Glue = 50,
		Oil = 25
	},
	["Petal Belt"] = {
		Honey = 15000000000,
		["Spirit Petal"] = 1,
		["Star Jelly"] = 25,
		Glitter = 50,
		Glue = 100
	},
	["Coconut Belt"] = {
		Honey = 7500000000000,
		Coconut = 500,
		["Tropical Drink"] = 1500,
		["Purple Potion"] = 200,
		["Hard Wax"] = 200,
		Turpentine = 3,
		["Refreshing Vial"] = 3
	},
	-- Bags
	["Coconut Canister"] = {
		["Tropical Drink"] = 150,
		Coconut = 250,
		["Red Extract"] = 150,
		["Blue Extract"] = 150,
		["Refreshing Vial"] = 2,
		Honey = 25000000000
	},

	-- Masks
	["Bubble Mask"] = {
		Honey = 100000000,
		Blueberry = 500,
		Glitter = 15,
		Oil = 25,
		["Blue Extract"] = 50
	},
	["Demon Mask"] = {
		Honey = 5000000000,
		Enzymes = 150,
		Glue = 100,
		Stinger = 500,
		["Invigorating Vial"] = 1,
		["Red Extract"] = 250
	},
	["Diamond Mask"] = {
		Honey = 5000000000,
		Oil = 150,
		Glitter = 100,
		["Diamond Egg"] = 5,
		["Comforting Vial"] = 1,
		["Blue Extract"] = 250
	},
	["Gummy Mask"] = {
		Honey = 5000000000,
		Glue = 250,
		Enzymes = 100,
		Oil = 100,
		Glitter = 100,
		["Satisfying Vial"] = 1
	},

	-- Tools
	["Tide Popper"] = {
		Honey = 2500000000000,
		["Blue Extract"] = 1500,
		Stinger = 150,
		["Tropical Drink"] = 150,
		["Swirled Wax"] = 75,
		["Super Smoothie"] = 50,
		["Comforting Vial"] = 3
	},
	["Dark Scythe"] = {
		["Red Extract"] = 1500,
		Stinger = 150,
		["Hard Wax"] = 100,
		["Caustic Wax"] = 50,
		["Super Smoothie"] = 50,
		["Invigorating Vial"] = 3,
		Honey = 2500000000000
	},
	["Gummyballer"] = {
		Glue = 1500,
		Gumdrops = 2000,
		["Caustic Wax"] = 50,
		["Super Smoothie"] = 50,
		["Satisfying Vial"] = 3,
		Turpentine = 5,
		Honey = 10000000000000
	},
	["Petal Wand"] = {
		["Spirit Petal"] = 1,
		["Star Jelly"] = 10,
		Glitter = 25,
		Enzymes = 75,
		Honey = 1500000000
	}
}

-- Blender recipes
local blender_recipes = {
	["Blue Extract"] = {Blueberry = 50, ["Royal Jelly"] = 10},
	["Red Extract"] = {Strawberry = 50, ["Royal Jelly"] = 10},
	["Enzymes"] = {Pineapple = 50, ["Royal Jelly"] = 10},
	["Oil"] = {["Sunflower Seed"] = 50, ["Royal Jelly"] = 10},
	["Glue"] = {Gumdrops = 50, ["Royal Jelly"] = 10},
	["Tropical Drink"] = {Coconut = 10, Enzymes = 2, Oil = 2},
	["Gumdrops"] = {Pineapple = 3, Strawberry = 3, Blueberry = 3},
	["Moon Charm"] = {["Royal Jelly"] = 1, Pineapple = 5, Gumdrops = 5},
	["Glitter"] = {["Moon Charm"] = 25, ["Magic Bean"] = 1},
	["Star Jelly"] = {["Royal Jelly"] = 100, Glitter = 3},
	["Purple Potion"] = {Neonberry = 3, ["Red Extract"] = 3, ["Blue Extract"] = 3, Glue = 3},
	["Soft Wax"] = {Honeysuckle = 5, Oil = 1, Enzymes = 1, ["Royal Jelly"] = 10},
	["Hard Wax"] = {["Soft Wax"] = 3, Enzymes = 3, Bitterberry = 33, ["Royal Jelly"] = 33},
	["Swirled Wax"] = {["Hard Wax"] = 3, ["Soft Wax"] = 9, ["Purple Potion"] = 6, ["Royal Jelly"] = 3333},
	["Caustic Wax"] = {["Hard Wax"] = 5, Enzymes = 5, Neonberry = 25, ["Royal Jelly"] = 5252},
	["Field Dice"] = {["Soft Wax"] = 1, Whirligig = 1, ["Red Extract"] = 1, ["Blue Extract"] = 1},
	["Smooth Dice"] = {["Field Dice"] = 3, ["Soft Wax"] = 3, Whirligig = 3, Oil = 3},
	["Loaded Dice"] = {["Smooth Dice"] = 3, ["Hard Wax"] = 3, Oil = 3, Glue = 1},
	["Super Smoothie"] = {Neonberry = 3, ["Star Jelly"] = 3, ["Purple Potion"] = 3, ["Tropical Drink"] = 6},
	["Turpentine"] = {["Super Smoothie"] = 10, ["Caustic Wax"] = 10, ["Star Jelly"] = 100, Honeysuckle = 1000}
}

local craftingStartTime = 0
local craftingEndTime = 0

-- Recipes }

-- Helper function to format the time in DD:HH:MM:SS format
local function formatTime(seconds)
	local days = math.floor(seconds / 86400)  -- 86400 seconds in a day
	seconds = seconds % 86400
	local hours = math.floor(seconds / 3600)  -- 3600 seconds in an hour
	seconds = seconds % 3600
	local minutes = math.floor(seconds / 60)  -- 60 seconds in a minute
	seconds = seconds % 60
	return string.format("%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
end

-- Function to calculate the remaining time for the current crafting operation
local function getRemainingTime()
	local currentTime = tick()
	local remainingTime = math.max(0, craftingEndTime - currentTime)
	return remainingTime
end

-- Function to update the GUI labels to reflect the current Blender queue status and time remaining
local function updateBlenderQueueLabels()
	-- Set the currently crafting label with time remaining
	if #craftingQueue > 0 then
		local currentCrafting = craftingQueue[1]
		local remainingTime = getRemainingTime()
		_G.BlenderQueueCurrentSlot:Set("Currently crafting: " .. currentCrafting.recipeName .. " x" .. currentCrafting.count .. " | Time left: " .. formatTime(remainingTime))
	else
		_G.BlenderQueueCurrentSlot:Set("Currently crafting: *empty*")
	end

	-- Update the rest of the queue slots
	for i = 1, 12 do
		local queueLabel = _G["BlenderQueueSlot" .. i .. "Label"]
		if craftingQueue[i] then
			queueLabel:Set("Slot " .. i .. ": " .. craftingQueue[i].recipeName .. " x" .. craftingQueue[i].count)
		else
			queueLabel:Set("Slot " .. i .. ": *empty*")
		end
	end
end

-- Function to check if all required materials are available for a recipe
local function checkMaterialsAvailable(recipeName, inventory)
	print("[BlenderDebug] Checking materials for recipe: " .. recipeName)

	local recipe = recipes[recipeName] or blender_recipes[recipeName]

	if not recipe then
		warn("[BlenderDebug] Recipe not found for: " .. recipeName)
		return false
	end

	for materialName, requiredAmount in pairs(recipe) do
		local availableAmount = inventory[materialName] or 0
		print("[BlenderDebug] Material: " .. materialName .. ", Required: " .. requiredAmount .. ", Available: " .. availableAmount)

		if availableAmount < requiredAmount then
			print("[BlenderDebug] Insufficient " .. materialName .. " for " .. recipeName .. ". Needed: " .. requiredAmount .. ", Available: " .. availableAmount)
			return false
		end
	end

	print("[BlenderDebug] All required materials are available for: " .. recipeName)
	return true
end

-- Function to queue crafting order with partial crafting logic
local function queueCraftingOrder(recipeName, count)
	print("[BlenderDebug] Initiating crafting process for: " .. recipeName .. " with quantity: " .. count)

	-- Teleport to the Blender
	print("[BlenderDebug] Teleporting to the Blender...")
	teleportTo(ToyLocations["Blender"])
	wait(3)

	-- Stop any current Blender orders
	print("[BlenderDebug] Stopping any ongoing blender orders.")
	game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("StopOrder")
	wait(1)

	-- Retrieve the recipe data (with spaces intact for table lookup)
	local recipe = recipes[recipeName] or blender_recipes[recipeName]
	if not recipe then
		warn("[BlenderDebug] Recipe not found for: " .. recipeName)
		return false
	end

	-- Fetch inventory and calculate maximum craftable count
	local currentInventory = getInventory()
	print("[BlenderDebug] Current Inventory: ", currentInventory)

	local maxCraftableCount = count

	print("[BlenderDebug] Calculating maximum craftable count based on current inventory...")
	for materialName, requiredAmount in pairs(recipe) do
		local availableAmount = currentInventory[materialName] or 0
		local craftableWithThisMaterial = math.floor(availableAmount / requiredAmount)
		maxCraftableCount = math.min(maxCraftableCount, craftableWithThisMaterial)
		print("[BlenderDebug] Material: " .. materialName .. ", Craftable Count: " .. craftableWithThisMaterial)
	end

	print("[BlenderDebug] Maximum craftable count for " .. recipeName .. ": " .. maxCraftableCount)

	if maxCraftableCount > 0 then
		-- Convert the recipe name (remove spaces) only when sending the command to BlenderCommand
		local blenderRecipeName = recipeName:gsub("%s+", "")
		print("[BlenderDebug] Modified recipe name for Blender command: " .. blenderRecipeName)

		-- Place the crafting order
		local success, response = pcall(function()
			return game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("PlaceOrder", {
				Recipe = blenderRecipeName,
				Count = maxCraftableCount
			})
		end)

		if success then
			print("[BlenderDebug] Successfully queued crafting of " .. maxCraftableCount .. " " .. recipeName)
			count = count - maxCraftableCount

			-- Reinsert remaining items into the crafting queue if there are more to craft
			if count > 0 then
				table.insert(craftingQueue, { recipeName = recipeName, count = count })
				print("[BlenderDebug] Re-inserting remaining " .. count .. " of " .. recipeName .. " into the crafting queue.")
			end
		else
			warn("[BlenderDebug] Failed to queue crafting for " .. recipeName .. ". Error: " .. tostring(response))
		end
	else
		print("[BlenderDebug] Not enough materials to craft any of " .. recipeName .. ". Skipping...")
	end
end

-- Coroutine to process crafting queue with inventory refresh and proper delay
local function processCraftingQueueCoroutine()
	print("[BlenderDebug] Starting the crafting queue processor...")

	while AutoCraftingEnabled do
		if #craftingQueue > 0 then
			-- Set the currently crafting label BEFORE starting the craft
			local nextOrder = craftingQueue[1]  -- Don't remove it yet!
			local recipeName = nextOrder.recipeName
			local count = nextOrder.count

			print("[BlenderDebug] Current crafting order: " .. recipeName .. ", Count: " .. count)

			-- Update the currently crafting label with time remaining
			local remainingTime = getRemainingTime()
			_G.BlenderQueueCurrentSlot:Set("Currently crafting: " .. recipeName .. " x" .. count .. " | Time left: " .. formatTime(remainingTime))

			-- Refresh inventory before crafting
			local currentInventory = getInventory()
			local maxCraftableCount = count

			-- Check recipe and calculate craftable items
			local recipe = recipes[recipeName] or blender_recipes[recipeName]
			if recipe then
				print("[BlenderDebug] Calculating craftable count for " .. recipeName)
				for materialName, requiredAmount in pairs(recipe) do
					local availableAmount = currentInventory[materialName] or 0
					local craftableWithThisMaterial = math.floor(availableAmount / requiredAmount)
					maxCraftableCount = math.min(maxCraftableCount, craftableWithThisMaterial)
					print("[BlenderDebug] Material: " .. materialName .. ", Craftable Count: " .. craftableWithThisMaterial)
				end

				if maxCraftableCount > 0 then
					print("[BlenderDebug] Queueing crafting order for: " .. recipeName .. " with count: " .. maxCraftableCount)

					-- Attempt to queue crafting operation
					local success, response = pcall(function()
						return queueCraftingOrder(recipeName, maxCraftableCount)
					end)

					if success then
						print("[BlenderDebug] Successfully queued " .. maxCraftableCount .. " of " .. recipeName)
						count = count - maxCraftableCount

						-- Calculate crafting time based on number of items
						craftingStartTime = tick()
						craftingEndTime = craftingStartTime + (craftingTimePerItem * maxCraftableCount)
						print("[BlenderDebug] Waiting for crafting to finish. Time required: " .. (craftingEndTime - craftingStartTime) .. " seconds")

						-- Continuously update the remaining time on the GUI
						while tick() < craftingEndTime do
							updateBlenderQueueLabels()
							wait(1)
						end

						-- Retrieve the crafted item from the Blender
						print("[BlenderDebug] Retrieving crafted item from the Blender.")
						game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("StopOrder")

						-- Now, remove the item from the queue since it's finished
						table.remove(craftingQueue, 1)
						print("[BlenderDebug] Removed item from crafting queue: " .. recipeName)

						-- Reinsert remaining items into the queue if there are more to craft
						if count > 0 then
							table.insert(craftingQueue, { recipeName = recipeName, count = count })
							print("[BlenderDebug] Re-inserting remaining " .. count .. " of " .. recipeName .. " into the crafting queue.")
						end
					else
						warn("[BlenderDebug] Failed to queue crafting for " .. recipeName .. ". Error: " .. tostring(response))
					end
				else
					print("[BlenderDebug] Not enough materials to craft even one of " .. recipeName .. ". Skipping...")
				end
			else
				warn("[BlenderDebug] Recipe not found for " .. recipeName)
			end
		else
			wait(1) -- Wait before checking the queue again
		end
	end

	print("[BlenderDebug] Crafting queue processor stopped.")
end





-- Function to start the coroutine
local function startQueueProcessingCoroutine()
	print("[BlenderDebug] Starting the crafting coroutine...")
	craftingCoroutine = coroutine.create(processCraftingQueueCoroutine)
	coroutine.resume(craftingCoroutine)
end

-- Add a call to update the GUI after adding or removing from the queue
local function addToCraftingQueue(recipeName, count)
	print("[BlenderDebug] Adding " .. count .. " of " .. recipeName .. " to the crafting queue.")
	if count > 0 then
		table.insert(craftingQueue, { recipeName = recipeName, count = count })
		updateBlenderQueueLabels()  -- Update GUI labels after adding
	else
		print("[BlenderDebug] No need to add " .. recipeName .. " to the queue, sufficient inventory.")
	end
end

-- Function to calculate missing items
local function calculateMissingItems(goalItem, inventory)
	local missingItems = {}

	-- Helper function for calculating missing amounts for Blender items
	local function calculateForBlenderRecipe(itemName, requiredAmount)
		print("[BlenderDebug] Calculating missing items for " .. itemName .. " with required amount: " .. requiredAmount)

		local recipe = blender_recipes[itemName]

		if recipe then
			for subItem, subAmount in pairs(recipe) do
				local totalSubAmount = subAmount * requiredAmount
				print("[BlenderDebug] Sub-item: " .. subItem .. " | Total required: " .. totalSubAmount)
				calculateForBlenderRecipe(subItem, totalSubAmount)
			end
		else
			local availableAmount = inventory[itemName] or 0
			local missingAmount = math.max(0, requiredAmount - availableAmount)
			print("[BlenderDebug] Available: " .. availableAmount .. ", Missing: " .. missingAmount .. " of " .. itemName)

			if missingAmount > 0 then
				missingItems[itemName] = (missingItems[itemName] or 0) + missingAmount
			end
		end
	end

	print("[BlenderDebug] Calculating missing items for goal: " .. goalItem)
	local goalRecipe = blender_recipes[goalItem]

	if goalRecipe then
		for itemName, requiredAmount in pairs(goalRecipe) do
			print("[BlenderDebug] Calculating missing items for ingredient: " .. itemName)
			calculateForBlenderRecipe(itemName, requiredAmount)
		end
	else
		print("[BlenderDebug] No Blender recipe found for goal item: " .. goalItem)
	end

	return missingItems
end


-- Function to start auto-crafting for the target item (goal item)
local function startAutoCrafting(targetItem)
	local currentInventory = getInventory()
	print("[BlenderDebug] Starting auto-crafting for target: " .. targetItem)

	if currentInventory then
		print("[BlenderDebug] Inventory data fetched successfully.")

		-- Get the recipe for the goal item (from recipes table)
		local goalRecipe = recipes[targetItem]
		if goalRecipe then
			print("[BlenderDebug] Found goal recipe for: " .. targetItem)

			-- Loop through each ingredient required for the goal item
			for ingredient, requiredAmount in pairs(goalRecipe) do
				print("[BlenderDebug] Checking ingredient: " .. ingredient .. " for " .. targetItem)

				-- Check if the ingredient can be crafted in the Blender
				if blender_recipes[ingredient] then
					print("[BlenderDebug] Ingredient " .. ingredient .. " can be crafted in Blender.")

					-- Get the current amount of the ingredient in the inventory
					local currentAmount = currentInventory[ingredient] or 0
					print("[BlenderDebug] Current amount of " .. ingredient .. ": " .. currentAmount)

					-- Calculate how much is still needed (only queue the missing amount)
					local missingAmount = math.max(0, requiredAmount - currentAmount)
					print("[BlenderDebug] Missing amount of " .. ingredient .. ": " .. missingAmount)

					if missingAmount > 0 then
						addToCraftingQueue(ingredient, missingAmount)
						print("[BlenderDebug] Queued " .. missingAmount .. " of " .. ingredient .. " for crafting.")
					else
						print("[BlenderDebug] No need to craft more " .. ingredient .. ", sufficient inventory.")
					end
				else
					print("[BlenderDebug] Ingredient " .. ingredient .. " is not a Blender recipe.")
				end
			end
		else
			warn("[BlenderDebug] No recipe found for goal item: " .. targetItem)
		end

		-- Start processing the crafting queue if there are items to craft
		if #craftingQueue > 0 then
			print("[BlenderDebug] Starting crafting queue processing...")
			startQueueProcessingCoroutine()
		else
			print("[BlenderDebug] Crafting queue is empty; nothing to craft.")
		end
	else
		warn("[BlenderDebug] Error: Unable to retrieve inventory data.")
	end
end


-- Function to stop auto-crafting
local function stopAutoCrafting()
	print("[BlenderDebug] Auto-Crafting Stopped.")
	AutoCraftingEnabled = false
	craftingQueue = {}
	updateBlenderQueueLabels()
	game:GetService("ReplicatedStorage").Events.BlenderCommand:InvokeServer("StopOrder")
	if craftingCoroutine and coroutine.status(craftingCoroutine) ~= "dead" then
		coroutine.close(craftingCoroutine)
		print("[BlenderDebug] Auto-Crafting Coroutine has been stopped.")
	end
end

-- Blender Functions }

-- Blender Tab {
local BlenderTab = Window:CreateTab("Blender", 4483362458) -- Title, Image b
local BlenderSection = BlenderTab:CreateSection("Auto-Craft Item")

local AutoCraftToggle = BlenderTab:CreateToggle({
	Name = "Enable auto-crafting",
	CurrentValue = false,
	Flag = "AutoCraftToggle",
	Callback = function(Value)
		AutoCraftingEnabled = Value  -- Enable or disable auto-crafting

		if AutoCraftingEnabled then
			-- Start auto-crafting if enabled
			print("Auto-Crafting Enabled for: " .. AutoCraftTarget)
			startAutoCrafting(AutoCraftTarget)  -- Call the crafting function
		else
			-- Stop auto-crafting if disabled
			print("Auto-Crafting Disabled.")
			stopAutoCrafting()  -- Optionally define a stop function
		end
	end,
})

local AutoCraftDropdown = BlenderTab:CreateDropdown({
	Name = "Auto-Crafting Item Selection",
	Options = {
		"Candy Planter", "Red Clay Planter", "Blue Clay Planter", "Tacky Planter",
		"Pesticide Planter", "Hydroponic Planter", "Heat-Treated Planter", "Petal Planter", 
		"The Planter of Plenty", "Coconut Clogs", "Gummy Boots", "Cobalt Guard", 
		"Crimson Guard", "Honeycomb Belt", "Petal Belt", "Coconut Belt", "Coconut Canister", 
		"Bubble Mask", "Demon Mask", "Diamond Mask", "Gummy Mask", "Petal Wand", 
		"Tide Popper", "Dark Scythe", "Gummyballer"
	},
	CurrentOption = {"Candy Planter"},
	MultipleOptions = false,
	Flag = "AutoCraftDropdown",
	Callback = function(Option)
		AutoCraftTarget = Option[1]  -- Set the new crafting target
		print("Selected Auto-Craft Target: " .. AutoCraftTarget)
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

-- Blender Tab }



-- Rayfield load config line
Rayfield:LoadConfiguration()