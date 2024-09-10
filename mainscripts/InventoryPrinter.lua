-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")
local content = gui and gui:FindFirstChild("Menus") and gui.Menus.Children:FindFirstChild("Eggs") and gui.Menus.Children.Eggs:FindFirstChild("Content")
local HttpService = game:GetService("HttpService")

if content then
    local eggRows = content:FindFirstChild("EggRows") or content:GetChildren()
    
    -- Create a GUI to display the inventory
    local inventoryGui = Instance.new("ScreenGui", player.PlayerGui)
    local inventoryFrame = Instance.new("Frame", inventoryGui)
    local inventoryBox = Instance.new("TextBox", inventoryFrame)
    
    -- Customize the Frame and GUI appearance
    inventoryFrame.Size = UDim2.new(0, 620, 0, 600)
    inventoryFrame.Position = UDim2.new(0.5, -310, 0.5, -300)
    inventoryFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    inventoryFrame.BorderSizePixel = 0
    inventoryFrame.BackgroundTransparency = 0.2

    -- Customize the inventory box appearance
    inventoryBox.Size = UDim2.new(0, 600, 0, 500)
    inventoryBox.Position = UDim2.new(0, 10, 0, 50)
    inventoryBox.TextScaled = true
    inventoryBox.TextWrapped = true
    inventoryBox.TextXAlignment = Enum.TextXAlignment.Left
    inventoryBox.TextYAlignment = Enum.TextYAlignment.Top
    inventoryBox.MultiLine = true
    inventoryBox.ClearTextOnFocus = false
    inventoryBox.BackgroundColor3 = Color3.new(1, 1, 1)
    inventoryBox.TextColor3 = Color3.new(0, 0, 0)

    -- Hide/show button outside of inventoryFrame (so it stays visible)
    local toggleButton = Instance.new("TextButton", inventoryGui)  -- Add directly to inventoryGui, not inventoryFrame
    toggleButton.Text = "Hide Inventory"
    toggleButton.Size = UDim2.new(0, 120, 0, 40)
    toggleButton.Position = UDim2.new(0, 10, 0.5, -20)  -- Positioned to the side, stays visible
    toggleButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.TextSize = 16

    -- Refresh button inside the inventoryFrame
    local refreshButton = Instance.new("TextButton", inventoryFrame)
    refreshButton.Text = "Refresh Inventory"
    refreshButton.Size = UDim2.new(0, 150, 0, 30)
    refreshButton.Position = UDim2.new(0, 120, 0, 10)
    refreshButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
    refreshButton.TextColor3 = Color3.new(1, 1, 1)
    refreshButton.Font = Enum.Font.SourceSansBold
    refreshButton.TextSize = 16

    -- Function to parse quantities and refresh inventory
    local function parseQuantity(quantityText)
        quantityText = string.gsub(quantityText, "x", "")
        local numerator, denominator = string.match(quantityText, "(%d+)/(%d+)")
        return numerator and tonumber(numerator) or tonumber(quantityText) or 0
    end

    local function refreshInventory()
        local inventoryData = {}

        for _, eggRow in pairs(eggRows) do
            if eggRow:FindFirstChild("TypeName") and eggRow:FindFirstChild("EggSlot") then
                local itemName = eggRow.TypeName.Text
                local itemQuantity = parseQuantity(eggRow.EggSlot.Count.Text)
                inventoryData[itemName] = itemQuantity
            end
        end
        
        -- Add honey to the inventory
        inventoryData["Honey"] = player.CoreStats.Honey.Value

        -- Display the inventory as JSON
        inventoryBox.Text = HttpService:JSONEncode(inventoryData)
    end

    refreshButton.MouseButton1Click:Connect(refreshInventory)

    -- Initial load of inventory
    refreshInventory()

    -- Toggle visibility of the inventory frame
    toggleButton.MouseButton1Click:Connect(function()
        inventoryFrame.Visible = not inventoryFrame.Visible
        toggleButton.Text = inventoryFrame.Visible and "Hide Inventory" or "Show Inventory"
    end)
else
    print("Error: Unable to locate inventory content.")
end
