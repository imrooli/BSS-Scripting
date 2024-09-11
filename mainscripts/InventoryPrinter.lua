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
G2L["3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

-- Define variables for easier access
local player = game:GetService("Players").LocalPlayer
local gui = player.PlayerGui:FindFirstChild("ScreenGui")
local HttpService = game:GetService("HttpService")

-- Check GUI elements
local menus = gui and gui:FindFirstChild("Menus")
local children = menus and menus:FindFirstChild("Children")
local eggs = children and children:FindFirstChild("Eggs")
local content = eggs and eggs:FindFirstChild("Content")

if not gui then
    warn("Error: InventoryExporterGUI not found. Please ensure the GUI is correctly loaded.")
    return
end
if not menus then
    warn("Error: Menus not found.")
    return
end
if not children then
    warn("Error: Children not found.")
    return
end
if not eggs then
    warn("Error: Eggs menu not found.")
    return
end
if not content then
    warn("Error: Content frame not found.")
    return
end

-- Determine inventory items
local inventoryItems = content:FindFirstChild("EggRows") and content.EggRows:GetChildren() or content:GetChildren()

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
    G2L["3"].Text = HttpService:JSONEncode(inventoryData)
end

getInventory()

-- Connect button click events
G2L["4"].MouseButton1Click:Connect(function()
    getInventory()
end)

G2L["7"].MouseButton1Click:Connect(function()
    G2L["2"].Visible = not G2L["2"].Visible
end)
