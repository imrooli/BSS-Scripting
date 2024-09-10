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
    local inventoryBox = Instance.new("TextBox", inventoryGui)

    -- Customize the GUI appearance
    inventoryGui.Name = "InventoryGui"
    inventoryBox.Size = UDim2.new(0, 600, 0, 500)
    inventoryBox.Position = UDim2.new(0.5, -300, 0.5, -250)
    inventoryBox.TextScaled = true
    inventoryBox.TextWrapped = true
    inventoryBox.TextXAlignment = Enum.TextXAlignment.Left
    inventoryBox.TextYAlignment = Enum.TextYAlignment.Top
    inventoryBox.MultiLine = true
    inventoryBox.ClearTextOnFocus = false  -- To allow selecting and copying the text

    -- Add a button to hide/show the inventory GUI
    local toggleButton = Instance.new("TextButton", inventoryGui)
    toggleButton.Text = "Hide Inventory"
    toggleButton.Size = UDim2.new(0, 100, 0, 50)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.MouseButton1Click:Connect(function()
        inventoryBox.Visible = not inventoryBox.Visible
        toggleButton.Text = inventoryBox.Visible and "Hide Inventory" or "Show Inventory"
    end)

    -- Add a button to refresh the inventory
    local refreshButton = Instance.new("TextButton", inventoryGui)
    refreshButton.Text = "Refresh Inventory"
    refreshButton.Size = UDim2.new(0, 150, 0, 50)
    refreshButton.Position = UDim2.new(0, 120, 0, 10)
    refreshButton.MouseButton1Click:Connect(function()
        getInventory()  -- Call the function to refresh the inventory
    end)

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

    -- Show the GUI
    inventoryGui.Enabled = true

else
    print("Error: Content frame not found")
end
