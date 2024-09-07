local stickersFolder = game:GetService("Workspace"):WaitForChild("HiddenStickers")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Get the local player and their PlayerGui
local player = Players.LocalPlayer

-- Function to notify the player via chat
local function notifyPlayer(message)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = message;
        Color = Color3.new(1, 1, 0); -- Yellow color
    })
end

-- Function to create the ESP bounding box for a hidden sticker
local function createBoundingBox(sticker)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(4, 0, 4, 0) -- Adjust size of the box
    billboardGui.AlwaysOnTop = true
    billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Offset to place it slightly above the sticker part
    billboardGui.Parent = sticker

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0) -- Full size inside the BillboardGui
    frame.BackgroundColor3 = Color3.new(1, 0, 0) -- Red color
    frame.BackgroundTransparency = 0.5 -- Semi-transparent
    frame.BorderSizePixel = 2 -- Add a border for clarity
    frame.Parent = billboardGui

    notifyPlayer("ESP bounding box applied to " .. sticker.Name)
end

-- Function to handle stickers found initially and dynamically
local function processStickers()
    local stickerCount = 0

    -- Iterate through existing stickers
    for _, sticker in pairs(stickersFolder:GetChildren()) do
        if sticker:IsA("BasePart") then
            createBoundingBox(sticker)
            stickerCount = stickerCount + 1
        end
    end

    -- Notify the player about the number of stickers found
    notifyPlayer(stickerCount > 0 and "Found " .. stickerCount .. " hidden stickers." or "No hidden stickers found (yet).")
end

-- Function to handle sticker removal
local function handleStickerRemoved()
    local stickerCount = #stickersFolder:GetChildren()

    -- Notify player about remaining stickers
    if stickerCount > 0 then
        notifyPlayer("Sticker obtained! " .. stickerCount .. " stickers remain.")
    else
        notifyPlayer("All hidden stickers have been found!")
    end
end

-- Connect the function to the ChildAdded event for dynamic updates
stickersFolder.ChildAdded:Connect(function(child)
    if child:IsA("BasePart") then
        createBoundingBox(child)
        notifyPlayer("New hidden sticker added: " .. child.Name)
    end
end)

-- Connect the function to the ChildRemoved event to track when stickers are removed
stickersFolder.ChildRemoved:Connect(function(child)
    if child:IsA("BasePart") then
        handleStickerRemoved()
    end
end)

-- Process existing stickers when the script starts
processStickers()
