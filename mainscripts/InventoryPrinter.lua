-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")
local HttpService = game:GetService("HttpService")

-- Check GUI elements
local menus = gui and gui:FindFirstChild("Menus")
local menuschildren = menus and menus:FindFirstChild("Children")
local eggs = menuschildren and menuschildren:FindFirstChild("Eggs")
local content = eggs and eggs:FindFirstChild("Content")

if not gui then print("Error: ScreenGui not found") return end
if not menus then print("Error: Menus not found") return end
if not menuschildren then print("Error: Children not found") return end
if not eggs then print("Error: Eggs menu not found") return end
if not content then print("Error: Content frame not found") return end

-- Determine inventory items
local inventoryItems = content:FindFirstChild("EggRows") and content.EggRows:GetChildren() or content:GetChildren()

-- Create and customize GUI to display the inventory
local inventoryGui = Instance.new("ScreenGui", player.PlayerGui)
local inventoryBox = Instance.new("TextBox", inventoryGui)

inventoryGui.Name = "InventoryGui"
inventoryBox.Size = UDim2.new(0, 600, 0, 500)
inventoryBox.Position = UDim2.new(0.5, -300, 0.5, -250)
inventoryBox.TextScaled = true
inventoryBox.TextWrapped = true
inventoryBox.TextXAlignment = Enum.TextXAlignment.Left
inventoryBox.TextYAlignment = Enum.TextYAlignment.Top
inventoryBox.MultiLine = true
inventoryBox.ClearTextOnFocus = false  -- Allows selecting and copying the text

-- Function to parse quantities
local function parseQuantity(quantityText)
    if not quantityText or quantityText == "" then return 0 end
    quantityText = string.gsub(quantityText, "x", "")
    local numerator = string.match(quantityText, "(%d+)/")
    return tonumber(numerator) or tonumber(quantityText) or 0
end

-- Retrieve and format inventory data
local function getInventory()
    local inventoryData = {}
    
    for _, eggRow in pairs(inventoryItems) do
        if eggRow:FindFirstChild("TypeName") and eggRow:FindFirstChild("EggSlot") then
            local itemName = eggRow.TypeName.Text
            local itemQuantity = parseQuantity(eggRow.EggSlot.Count.Text)
            inventoryData[itemName] = itemQuantity
        end
    end

    -- Add honey value
    inventoryData["Honey"] = player.CoreStats.Honey.Value

    -- Convert to JSON and update the TextBox
    inventoryBox.Text = HttpService:JSONEncode(inventoryData)
end

-- Call function and show GUI
getInventory()
inventoryGui.Enabled = true
