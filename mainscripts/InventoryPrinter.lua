-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")

-- Check if the GUI is found
if gui then
    print("ScreenGui found")
else
    print("Error: ScreenGui not found")
end

local menus = gui:FindFirstChild("Menus")
if menus then
    print("Menus found")
else
    print("Error: Menus not found")
end

local eggs = menus.Children:FindFirstChild("Eggs")
if eggs then
    print("Eggs menu found")
else
    print("Error: Eggs menu not found")
end

local content = eggs:FindFirstChild("Content")
if content then
    print("Content frame found")

    -- Try to find EggRows or use Content children directly
    local eggRows = content:FindFirstChild("EggRows")
    local inventoryItems = eggRows and eggRows:GetChildren() or content:GetChildren()  -- Either EggRows' children or Content's children

    print("Found " .. #inventoryItems .. " inventory items or rows")

    -- Create a GUI to display the inventory
    local inventoryGui = Instance.new("ScreenGui", player.PlayerGui)
    inventoryGui.Name = "InventoryGui"

    -- Create and customize the TextBox for displaying inventory
    local inventoryBox = Instance.new("TextBox", inventoryGui)
    inventoryBox.Size = UDim2.new(0, 400, 0, 300)
    inventoryBox.Position = UDim2.new(0.5, -200, 0.5, -150)
    inventoryBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    inventoryBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inventoryBox.TextScaled = true
    inventoryBox.TextWrapped = true
    inventoryBox.TextXAlignment = Enum.TextXAlignment.Left
    inventoryBox.TextYAlignment = Enum.TextYAlignment.Top
    inventoryBox.MultiLine = true
    inventoryBox.ClearTextOnFocus = false  -- To allow selecting and copying the text

    -- Create and customize the Refresh Button
    local refreshButton = Instance.new("TextButton", inventoryGui)
    refreshButton.Size = UDim2.new(0, 100, 0, 50)
    refreshButton.Position = UDim2.new(0.5, -50, 0.5, 160)
    refreshButton.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    refreshButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    refreshButton.Text = "Refresh"
    refreshButton.TextScaled = true

    -- Function to retrieve and format inventory as JSON
    local function getInventory()
        local HttpService = game:GetService("HttpService")
        local inventoryData = {}

        -- Function to parse quantities
        local function parseQuantity(quantityText)
            if not quantityText or quantityText == "" then
                return 0
            end

            -- Remove the 'x' prefix if present
            quantityText = string.gsub(quantityText, "x", "")
            
            -- If the quantity is a fraction, use the numerator
            local numerator, denominator = string.match(quantityText, "(%d+)/(%d+)")
            if numerator then
                return tonumber(numerator) or 0
            end
            
            return tonumber(quantityText) or 0
        end

        -- Loop through each EggRow or Content child
        for _, eggRow in pairs(inventoryItems) do
            print("Processing EggRow: ", eggRow.Name)  -- Debug message for each EggRow

            -- Check if it's a valid EggRow (TypeName and EggSlot exist)
            if eggRow:FindFirstChild("TypeName") and eggRow:FindFirstChild("EggSlot") then
                print("Valid EggRow found")  -- Debug message for a valid EggRow

                -- Get item name and quantity
                local itemName = eggRow.TypeName.Text
                local itemQuantity = eggRow.EggSlot.Count.Text

                -- Parse the item quantity
                itemQuantity = parseQuantity(itemQuantity)

                -- Add the item name and quantity to the inventory data
                inventoryData[itemName] = itemQuantity
            else
                print("Invalid EggRow or missing TypeName/EggSlot")  -- Debug message for invalid EggRow
            end
        end

        -- Get honey value
        local honey = game:GetService("Players").LocalPlayer.CoreStats.Honey.Value
        inventoryData["Honey"] = honey

        -- Convert inventory data to JSON
        local jsonData = HttpService:JSONEncode(inventoryData)

        -- Update the TextBox with the JSON data
        inventoryBox.Text = jsonData
    end

    -- Call the function to retrieve and format the inventory
    getInventory()
	
    refreshButton.TextButton.MouseButton1Click:Connect(function()
        getInventory()
    end)	

    -- Show the GUI
    inventoryGui.Enabled = true

else
    print("Error: Content frame not found")
end
