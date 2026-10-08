-- ═══════════════════════════════════════════════════════════════
-- ANTI-LEAK PROTECTION
-- ═══════════════════════════════════════════════════════════════
local function __isExecutor()
    local c = 0
    if type(getgenv) == "function" then c = c + 1 end
    if type(identifyexecutor) == "function" then c = c + 1 end
    if type(hookfunction) == "function" then c = c + 1 end
    if type(getrawmetatable) == "function" then c = c + 1 end
    if type(setclipboard) == "function" then c = c + 1 end
    if type(request) == "function" or type(http_request) == "function" then c = c + 1 end
    return c >= 4
end
local function __isRoblox()
    return (type(game) == "userdata" or type(game) == "table")
        and type(game.GetService) == "function"
        and type(workspace) ~= "nil"
        and type(Players) ~= "nil"
end
if not __isExecutor() or not __isRoblox() then
    return "no"
end
-- ═══════════════════════════════════════════════════════════════
-- END OF PROTECTION
-- ═══════════════════════════════════════════════════════════════

--[[
    ═══════════════════════════════════════════════════════════════
    MALEK HUB  |  Delta Executor
    ═══════════════════════════════════════════════════════════════
    Theme : Black / White / Gray
    Author: Malek
    ═══════════════════════════════════════════════════════════════
]]

-- ═══════════════════════════════════════════════════════════════
-- INTRO (Glitch Style)
-- ═══════════════════════════════════════════════════════════════
local _introDone = false

do
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local Lighting = game:GetService("Lighting")
    local UIS = game:GetService("UserInputService")
    local LP = Players.LocalPlayer
    local PGui = LP:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MalekHubIntro"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 9999
    screenGui.Parent = PGui

    local introSkipped = false

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.fromScale(1, 1)
    overlay.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    overlay.BackgroundTransparency = 0.15
    overlay.BorderSizePixel = 0
    overlay.ZIndex = 1
    overlay.Parent = screenGui

    local dark = Instance.new("Frame")
    dark.Size = UDim2.fromScale(1, 1)
    dark.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    dark.BackgroundTransparency = 0.35
    dark.BorderSizePixel = 0
    dark.ZIndex = 1
    dark.Parent = screenGui

    local vignette = Instance.new("ImageLabel")
    vignette.Size = UDim2.fromScale(1, 1)
    vignette.BackgroundTransparency = 1
    vignette.Image = "rbxassetid://195611797"
    vignette.ImageColor3 = Color3.fromRGB(60, 60, 60)
    vignette.ImageTransparency = 0.25
    vignette.ZIndex = 2
    vignette.Parent = screenGui

    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 900, 0, 160)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.BackgroundTransparency = 1
    container.ZIndex = 5
    container.Parent = screenGui

    local mainLabel = Instance.new("TextLabel")
    mainLabel.Size = UDim2.new(1, 0, 1, 0)
    mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    mainLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainLabel.BackgroundTransparency = 1
    mainLabel.Text = "MALEK HUB"
    mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    mainLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    mainLabel.TextStrokeTransparency = 0
    mainLabel.Font = Enum.Font.GothamBlack
    mainLabel.TextSize = 90
    mainLabel.TextTransparency = 1
    mainLabel.ZIndex = 5
    mainLabel.Parent = container

    local leftLabel = Instance.new("TextLabel")
    leftLabel.Size = UDim2.new(0, 500, 1, 0)
    leftLabel.AnchorPoint = Vector2.new(1, 0.5)
    leftLabel.Position = UDim2.new(0.5, -10, 0.5, 0)
    leftLabel.BackgroundTransparency = 1
    leftLabel.Text = "MALEK"
    leftLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    leftLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    leftLabel.TextStrokeTransparency = 0
    leftLabel.Font = Enum.Font.GothamBlack
    leftLabel.TextSize = 90
    leftLabel.TextXAlignment = Enum.TextXAlignment.Right
    leftLabel.TextTransparency = 1
    leftLabel.ZIndex = 5
    leftLabel.Parent = container

    local rightLabel = Instance.new("TextLabel")
    rightLabel.Size = UDim2.new(0, 300, 1, 0)
    rightLabel.AnchorPoint = Vector2.new(0, 0.5)
    rightLabel.Position = UDim2.new(0.5, -10, 0.5, 0)
    rightLabel.BackgroundTransparency = 1
    rightLabel.Text = "HUB"
    rightLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    rightLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    rightLabel.TextStrokeTransparency = 0
    rightLabel.Font = Enum.Font.GothamBlack
    rightLabel.TextSize = 90
    rightLabel.TextXAlignment = Enum.TextXAlignment.Left
    rightLabel.TextTransparency = 1
    rightLabel.ZIndex = 5
    rightLabel.Parent = container

    local beam = Instance.new("Frame")
    beam.Size = UDim2.new(0, 0, 1.1, 0)
    beam.AnchorPoint = Vector2.new(0, 0.5)
    beam.Position = UDim2.new(0, -20, 0.5, 0)
    beam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    beam.BackgroundTransparency = 0.4
    beam.BorderSizePixel = 0
    beam.ZIndex = 6
    beam.Parent = container

    local beamGlow = Instance.new("Frame")
    beamGlow.Size = UDim2.new(0, 0, 1.3, 0)
    beamGlow.AnchorPoint = Vector2.new(0, 0.5)
    beamGlow.Position = UDim2.new(0, -20, 0.5, 0)
    beamGlow.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    beamGlow.BackgroundTransparency = 0.7
    beamGlow.BorderSizePixel = 0
    beamGlow.ZIndex = 5
    beamGlow.Parent = container

    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(1, 0, 0, 30)
    subLabel.AnchorPoint = Vector2.new(0.5, 0)
    subLabel.Position = UDim2.new(0.5, 0, 0.5, 85)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = "★ THE POWER ★"
    subLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    subLabel.Font = Enum.Font.GothamBold
    subLabel.TextSize = 16
    subLabel.TextTransparency = 1
    subLabel.ZIndex = 5
    subLabel.Parent = screenGui

    local subLabel2 = Instance.new("TextLabel")
    subLabel2.Size = UDim2.new(1, 0, 0, 20)
    subLabel2.AnchorPoint = Vector2.new(0.5, 0)
    subLabel2.Position = UDim2.new(0.5, 0, 0.5, 118)
    subLabel2.BackgroundTransparency = 1
    subLabel2.Text = "TAP TO SKIP"
    subLabel2.TextColor3 = Color3.fromRGB(160, 160, 160)
    subLabel2.Font = Enum.Font.Gotham
    subLabel2.TextSize = 11
    subLabel2.TextTransparency = 1
    subLabel2.ZIndex = 5
    subLabel2.Parent = screenGui

    local accentBar = Instance.new("Frame")
    accentBar.Size = UDim2.new(0, 0, 0, 2)
    accentBar.AnchorPoint = Vector2.new(0.5, 0)
    accentBar.Position = UDim2.new(0.5, 0, 0.5, 70)
    accentBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    accentBar.BorderSizePixel = 0
    accentBar.ZIndex = 5
    accentBar.Parent = screenGui

    local flash = Instance.new("Frame")
    flash.Size = UDim2.fromScale(1, 1)
    flash.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    flash.BackgroundTransparency = 1
    flash.BorderSizePixel = 0
    flash.ZIndex = 10
    flash.Parent = screenGui

    local function doFlash(color, alpha, dur)
        flash.BackgroundColor3 = color or Color3.new(1, 1, 1)
        flash.BackgroundTransparency = 1 - (alpha or 0.85)
        task.delay(dur or 0.06, function()
            if not introSkipped then
                TweenService:Create(flash, TweenInfo.new(0.1), {BackgroundTransparency = 1}):Play()
            else
                flash.BackgroundTransparency = 1
            end
        end)
    end

    local glitchChars = {"!", "#", "%", "/", "[", "]", "░", "▒", "▓", "—", "=", "*", "^", "~", "¦", "¤", "§", "@"}

    local function glitchText(lbl, original)
        if introSkipped then return end
        for i = 1, 5 do
            if introSkipped then break end
            local s = ""
            for c in original:gmatch(".") do
                s = s .. (math.random() < 0.35 and glitchChars[math.random(#glitchChars)] or c)
            end
            lbl.Text = s
            task.wait(0.03)
        end
        if not introSkipped then lbl.Text = original end
    end

    local function skipIntro()
        if introSkipped then return end
        introSkipped = true
        doFlash(Color3.fromRGB(255, 255, 255), 0.8, 0.08)
        local fade = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        TweenService:Create(mainLabel, fade, {TextTransparency = 1}):Play()
        TweenService:Create(leftLabel, fade, {TextTransparency = 1}):Play()
        TweenService:Create(rightLabel, fade, {TextTransparency = 1}):Play()
        TweenService:Create(subLabel, fade, {TextTransparency = 1}):Play()
        TweenService:Create(subLabel2, fade, {TextTransparency = 1}):Play()
        TweenService:Create(accentBar, fade, {BackgroundTransparency = 1}):Play()
        TweenService:Create(overlay, fade, {BackgroundTransparency = 1}):Play()
        TweenService:Create(dark, fade, {BackgroundTransparency = 1}):Play()
        TweenService:Create(vignette, fade, {ImageTransparency = 1}):Play()
        TweenService:Create(blur, TweenInfo.new(0.35), {Size = 0}):Play()
        task.wait(0.4)
        pcall(function() screenGui:Destroy() end)
        pcall(function() blur:Destroy() end)
        _introDone = true
    end

    local skipConn
    skipConn = UIS.InputBegan:Connect(function(inp, gp)
        if gp then return end
        if inp.UserInputType == Enum.UserInputType.Touch
           or inp.UserInputType == Enum.UserInputType.MouseButton1 then
            skipIntro()
        end
    end)

    leftLabel.Position = UDim2.new(-0.9, 0, -0.6, 0)
    rightLabel.Position = UDim2.new(1.9, 0, 1.6, 0)
    leftLabel.Rotation = -30
    rightLabel.Rotation = 30

    TweenService:Create(blur, TweenInfo.new(0.7), {Size = 20}):Play()
    TweenService:Create(overlay, TweenInfo.new(0.7), {BackgroundTransparency = 0.15}):Play()
    task.wait(0.35)

    if introSkipped then return end

    TweenService:Create(leftLabel, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
    TweenService:Create(rightLabel, TweenInfo.new(0.45), {TextTransparency = 0}):Play()

    TweenService:Create(leftLabel, TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -230, 0.5, -80), Rotation = -15
    }):Play()
    TweenService:Create(rightLabel, TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 130, 0.5, 80), Rotation = 15
    }):Play()
    task.wait(0.5)

    if introSkipped then return end

    local smooth = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(leftLabel, smooth, {Position = UDim2.new(0.5, -180, 0.5, -40), Rotation = -8}):Play()
    TweenService:Create(rightLabel, smooth, {Position = UDim2.new(0.5, 90, 0.5, 40), Rotation = 8}):Play()
    task.wait(0.3)

    if introSkipped then return end

    TweenService:Create(leftLabel, smooth, {Position = UDim2.new(0.5, -120, 0.5, -15), Rotation = -3}):Play()
    TweenService:Create(rightLabel, smooth, {Position = UDim2.new(0.5, 40, 0.5, 15), Rotation = 3}):Play()
    task.wait(0.25)

    if introSkipped then return end

    TweenService:Create(leftLabel, smooth, {Position = UDim2.new(0.5, -70, 0.5, -5), Rotation = -1}):Play()
    TweenService:Create(rightLabel, smooth, {Position = UDim2.new(0.5, -10, 0.5, 5), Rotation = 1}):Play()
    task.wait(0.25)

    if introSkipped then return end

    local glitchEnd = tick() + 0.9
    while tick() < glitchEnd and not introSkipped do
        local ox = math.random(-20, 20)
        local oy = math.random(-10, 10)
        leftLabel.Position = UDim2.new(0.5, -70 + ox, 0.5, -5 + oy)
        rightLabel.Position = UDim2.new(0.5, -10 + ox, 0.5, 5 + oy)

        if math.random() < 0.3 then task.spawn(glitchText, leftLabel, "MALEK") end
        if math.random() < 0.3 then task.spawn(glitchText, rightLabel, "HUB") end
        if math.random() < 0.08 then doFlash(Color3.fromRGB(255, 255, 255), 0.2, 0.03) end

        task.wait(0.05)
    end

    if introSkipped then return end

    leftLabel.Visible = false
    rightLabel.Visible = false
    mainLabel.TextTransparency = 0
    mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    doFlash(Color3.fromRGB(255, 255, 255), 0.5, 0.05)
    task.wait(0.08)

    if introSkipped then return end

    TweenService:Create(mainLabel, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        TextSize = 95
    }):Play()
    task.wait(0.15)

    if introSkipped then return end

    TweenService:Create(mainLabel, TweenInfo.new(0.1), {TextSize = 90}):Play()

    doFlash(Color3.fromRGB(255, 255, 255), 0.9, 0.05)
    task.wait(0.02)
    doFlash(Color3.fromRGB(255, 255, 255), 0.6, 0.08)

    beam.Size = UDim2.new(0, 50, 1.1, 0)
    beamGlow.Size = UDim2.new(0, 70, 1.3, 0)

    TweenService:Create(beam, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        Position = UDim2.new(1, 20, 0.5, 0)
    }):Play()
    TweenService:Create(beamGlow, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        Position = UDim2.new(1, 20, 0.5, 0)
    }):Play()

    task.wait(0.2)
    TweenService:Create(mainLabel, TweenInfo.new(0.4), {
        TextColor3 = Color3.fromRGB(230, 230, 230)
    }):Play()

    TweenService:Create(accentBar, TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 450, 0, 2)
    }):Play()

    task.wait(0.2)
    if introSkipped then return end

    TweenService:Create(subLabel, TweenInfo.new(0.4), {TextTransparency = 0.05}):Play()
    TweenService:Create(subLabel2, TweenInfo.new(0.4), {TextTransparency = 0.2}):Play()

    task.wait(0.3)
    TweenService:Create(subLabel, TweenInfo.new(0.2), {TextSize = 17}):Play()
    task.wait(0.2)
    TweenService:Create(subLabel, TweenInfo.new(0.2), {TextSize = 16}):Play()

    task.wait(1.2)

    if introSkipped then return end

    local fadeOut = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(mainLabel, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(subLabel, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(subLabel2, fadeOut, {TextTransparency = 1}):Play()
    TweenService:Create(accentBar, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(overlay, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(dark, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(vignette, fadeOut, {ImageTransparency = 1}):Play()
    TweenService:Create(blur, TweenInfo.new(0.7), {Size = 0}):Play()
    TweenService:Create(beam, fadeOut, {BackgroundTransparency = 1}):Play()
    TweenService:Create(beamGlow, fadeOut, {BackgroundTransparency = 1}):Play()

    task.wait(0.8)

    skipConn:Disconnect()
    pcall(function() screenGui:Destroy() end)
    pcall(function() blur:Destroy() end)

    _introDone = true
end

-- ═══════════════════════════════════════════════════════════════
-- SERVICES & CONSTANTS
-- ═══════════════════════════════════════════════════════════════
repeat task.wait() until game:IsLoaded()

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UIS              = game:GetService("UserInputService")
local TS               = game:GetService("TweenService")
local Lighting         = game:GetService("Lighting")
local HS               = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace        = game:GetService("Workspace")

local LP = Players.LocalPlayer
local camera = workspace.CurrentCamera
local PGui = LP:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════════
-- CLEAN OLD GUIS
-- ═══════════════════════════════════════════════════════════════
do
    local EXACT = {
        ["MalekHub"] = true,
        ["MalekHubIntro"] = true,
        ["MalekHubHUD"] = true,
        ["MalekHubButtons"] = true,
        ["MalekHubWatermark"] = true,
    }
    for _, container in ipairs({PGui, game:GetService("CoreGui")}) do
        for _, child in ipairs(container:GetChildren()) do
            local n = child.Name
            if EXACT[n] or n:sub(1, 5):lower() == "malek" then
                pcall(function() child:Destroy() end)
            end
        end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- THEME
-- ═══════════════════════════════════════════════════════════════
local C = {
    BG          = Color3.fromRGB(12, 12, 12),
    PANEL       = Color3.fromRGB(16, 16, 16),
    PANEL2      = Color3.fromRGB(26, 26, 26),
    ROW         = Color3.fromRGB(22, 22, 22),
    ROW_HOVER   = Color3.fromRGB(32, 32, 32),
    STROKE      = Color3.fromRGB(60, 60, 60),
    STROKE_ON   = Color3.fromRGB(255, 255, 255),
    TEXT        = Color3.fromRGB(255, 255, 255),
    TEXT_DIM    = Color3.fromRGB(180, 180, 180),
    TEXT_MUTED  = Color3.fromRGB(110, 110, 110),
    WHITE       = Color3.fromRGB(255, 255, 255),
    BLACK       = Color3.fromRGB(0, 0, 0),
    INP         = Color3.fromRGB(14, 14, 14),
    ON          = Color3.fromRGB(255, 255, 255),
    OFF         = Color3.fromRGB(45, 45, 45),
    GREEN       = Color3.fromRGB(100, 220, 120),
    RED         = Color3.fromRGB(220, 90, 90),
}

-- ═══════════════════════════════════════════════════════════════
-- STATE
-- ═══════════════════════════════════════════════════════════════
local State = {
    normalSpeed    = 60,
    carrySpeed     = 35,
    laggerSpeed    = 40,
    laggerCarry    = 40,
    speedMode      = false,
    laggerToggled  = false,
    laggerCarryToggled = false,

    autoBatEnabled = false,
    autoBatMode    = "normal",
    autoBatSpeed   = 58,
    aimbotConn     = nil,
    prevAutoRotate = nil,

    autoLeftEnabled  = false,
    autoRightEnabled = false,
    alConn = nil,
    arConn = nil,
    alPhase = 1,
    arPhase = 1,

    tpBatEnabled = false,
    tpBatConn    = nil,
    tpBatHitCD   = false,

    dropMode   = "v1",
    dropActive = false,

    antiRagEnabled = false,
    antiRagConn    = nil,
    antiRagCD      = 0,

    antiLagEnabled = false,
    antiLagConn    = nil,

    unwalkEnabled = false,
    unwalkAnimate = nil,

    infJumpEnabled = false,
    infJumpMode    = "hold",
    holdJumpActive = false,

    bodyLockEnabled = false,
    bodyLockRange   = 20,
    bodyLockConn    = nil,

    batCounterEnabled = false,
    batCounterConn    = nil,
    batCounterCD      = false,

    espEnabled = false,
    espConn    = nil,
    espHighlights = {},
    espTracers    = {},

    fovEnabled = false,
    fovValue   = 120,
    fovOrig    = nil,
    fovConn    = nil,

    autoStealEnabled = false,
    stealRadius      = 60,
    stealDuration    = 1.3,
    autoStealConn    = nil,
    isStealing       = false,
    stealData        = {},

    autoTPEnabled = false,
    autoTPHeight  = 20,
    autoTPConn    = nil,

    autoCarryEnabled = false,
    autoCarryCD      = 0,

    watermarkEnabled = true,
    watermarkGui     = nil,
    watermarkLabel   = nil,
    watermarkLastUpdate = 0,

    progressFill = nil,
    progressPct  = nil,

    minimized = false,
    
    lockEnabled = false,
    antiKickEnabled = false,
    antiLagbackEnabled = true,
}
_G.MalekHub = State

-- ═══════════════════════════════════════════════════════════════
-- CONSTANTS
-- ═══════════════════════════════════════════════════════════════
local AP = {
    L1 = Vector3.new(-476.48, -6.28, 92.73),
    L2 = Vector3.new(-483.12, -4.95, 94.80),
    L_FACE = Vector3.new(-482.25, -4.96, 92.09),
    R1 = Vector3.new(-476.16, -6.52, 25.62),
    R2 = Vector3.new(-483.06, -5.03, 25.48),
    R_FACE = Vector3.new(-482.06, -6.93, 35.47),
}

local BAT_LIST = {
    "Bat", "Slap", "Iron Slap", "Gold Slap", "Diamond Slap",
    "Emerald Slap", "Ruby Slap", "Dark Matter Slap", "Flame Slap",
    "Nuclear Slap", "Galaxy Slap", "Glitched Slap"
}

-- ═══════════════════════════════════════════════════════════════
-- HELPERS
-- ═══════════════════════════════════════════════════════════════
local function corner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 10)
    c.Parent = parent
    return c
end

local function stroke(parent, col, thick, trans)
    local s = Instance.new("UIStroke")
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Color = col or C.STROKE
    s.Thickness = thick or 1
    s.Transparency = trans or 0
    s.Parent = parent
    return s
end

local function tween(obj, props, t, style, dir)
    TS:Create(obj, TweenInfo.new(t or 0.15, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props):Play()
end

local function isRagdolled(hum)
    if not hum then return true end
    local st = hum:GetState()
    return hum.PlatformStand
        or st == Enum.HumanoidStateType.Physics
        or st == Enum.HumanoidStateType.Ragdoll
        or st == Enum.HumanoidStateType.FallingDown
end

local function getActiveSpeed()
    if State.laggerCarryToggled then return State.laggerCarry end
    if State.laggerToggled then return State.laggerSpeed end
    if State.speedMode then return State.carrySpeed end
    return State.normalSpeed
end

-- ═══════════════════════════════════════════════════════════════
-- ANTI LAG SYSTEM
-- ═══════════════════════════════════════════════════════════════
local function startAntiLag()
    State.antiLagEnabled = true
    if State.antiLagConn then return end
    State.antiLagConn = RunService.Heartbeat:Connect(function()
        if not State.antiLagEnabled then return end
        pcall(function()
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") then
                    v.Enabled = false
                end
            end
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") then
                    obj.Enabled = false
                elseif obj:IsA("Trail") then
                    obj.Enabled = false
                elseif obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                    obj.Enabled = false
                end
            end
        end)
    end)
end

local function stopAntiLag()
    State.antiLagEnabled = false
    if State.antiLagConn then State.antiLagConn:Disconnect(); State.antiLagConn = nil end
end

local function toggleAntiLag()
    State.antiLagEnabled = not State.antiLagEnabled
    if State.antiLagEnabled then startAntiLag() else stopAntiLag() end
end

-- ═══════════════════════════════════════════════════════════════
-- ANTI KICK
-- ═══════════════════════════════════════════════════════════════
local antiKickConn = nil
local function startAntiKick()
    State.antiKickEnabled = true
    if antiKickConn then return end
    antiKickConn = RunService.Heartbeat:Connect(function()
        if not State.antiKickEnabled then return end
        pcall(function()
            local char = LP.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            if hum.WalkSpeed > 500 then hum.WalkSpeed = 500 end
            if hum.JumpPower > 500 then hum.JumpPower = 500 end
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                local vel = root.AssemblyLinearVelocity
                if vel.Magnitude > 1500 then
                    root.AssemblyLinearVelocity = vel.Unit * 1500
                end
            end
        end)
    end)
end

local function stopAntiKick()
    State.antiKickEnabled = false
    if antiKickConn then antiKickConn:Disconnect(); antiKickConn = nil end
end

local function toggleAntiKick()
    State.antiKickEnabled = not State.antiKickEnabled
    if State.antiKickEnabled then startAntiKick() else stopAntiKick() end
end

-- ═══════════════════════════════════════════════════════════════
-- WATERMARK
-- ═══════════════════════════════════════════════════════════════
local function createWatermark()
    if State.watermarkGui and State.watermarkGui.Parent then return end
    local char = LP.Character
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end

    local bb = Instance.new("BillboardGui")
    bb.Name = "MalekHubWatermark"
    bb.Size = UDim2.new(0, 200, 0, 60)
    bb.StudsOffset = Vector3.new(0, 3.5, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.Adornee = head
    bb.Parent = head

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = bb

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 20)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "MALEK HUB"
    title.TextColor3 = C.WHITE
    title.TextStrokeColor3 = C.BLACK
    title.TextStrokeTransparency = 0
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 14
    title.Parent = frame

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, 0, 0, 20)
    info.Position = UDim2.new(0, 0, 0, 20)
    info.BackgroundTransparency = 1
    info.Text = "Speed: 0 | Ping: 0"
    info.TextColor3 = C.TEXT_DIM
    info.TextStrokeColor3 = C.BLACK
    info.TextStrokeTransparency = 0
    info.Font = Enum.Font.GothamBold
    info.TextSize = 11
    info.Parent = frame

    State.watermarkGui = bb
    State.watermarkLabel = info
end

local function destroyWatermark()
    if State.watermarkGui then
        pcall(function() State.watermarkGui:Destroy() end)
        State.watermarkGui = nil
        State.watermarkLabel = nil
    end
end

RunService.Heartbeat:Connect(function()
    if not State.watermarkEnabled then
        if State.watermarkGui then destroyWatermark() end
        return
    end
    if not State.watermarkGui or not State.watermarkGui.Parent then
        createWatermark()
    end
    if State.watermarkLabel then
        local char = LP.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local speed = 0
        if hrp then
            local v = hrp.AssemblyLinearVelocity
            speed = math.floor(math.sqrt(v.X*v.X + v.Z*v.Z) + 0.5)
        end
        local ping = 0
        pcall(function() ping = math.floor(LP:GetNetworkPing() * 1000 + 0.5) end)
        local mode = "Normal"
        if State.laggerCarryToggled then mode = "Carry Lagger"
        elseif State.laggerToggled then mode = "Lagger"
        elseif State.speedMode then mode = "Carry" end
        State.watermarkLabel.Text = string.format("%s | Speed: %d | Ping: %d", mode, speed, ping)
    end
end)

LP.CharacterAdded:Connect(function()
    destroyWatermark()
    task.wait(1)
    if State.watermarkEnabled then createWatermark() end
end)

-- ═══════════════════════════════════════════════════════════════
-- AUTO CARRY
-- ═══════════════════════════════════════════════════════════════
local function triggerAutoCarry()
    if not State.autoCarryEnabled then return end
    local now = tick()
    if now - State.autoCarryCD < 1 then return end
    State.autoCarryCD = now
    State.speedMode = true
    State.laggerToggled = false
    State.laggerCarryToggled = false
    if MB then
        if MB.setCarry then MB.setCarry(true) end
        if MB.setLagger then MB.setLagger(false) end
        if MB.setLaggerCarry then MB.setLaggerCarry(false) end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- SPEED SYSTEM
-- ═══════════════════════════════════════════════════════════════
RunService.RenderStepped:Connect(function()
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end

    if isRagdolled(hum) then return end
    if State.autoBatEnabled or State.autoLeftEnabled or State.autoRightEnabled or State.tpBatEnabled then return end

    local md = hum.MoveDirection
    if md.Magnitude > 0.1 then
        local flat = Vector3.new(md.X, 0, md.Z).Unit
        local spd = getActiveSpeed()
        pcall(function() hrp:SetNetworkOwner(LP) end)
        hrp.AssemblyLinearVelocity = Vector3.new(flat.X * spd, hrp.AssemblyLinearVelocity.Y, flat.Z * spd)
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- ANTI LAGBACK (يمنع الرجوع للأرض أثناء الطيران)
-- ═══════════════════════════════════════════════════════════════
RunService.Heartbeat:Connect(function()
    if not State.antiLagbackEnabled then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end
    if hum.FloorMaterial == Enum.Material.Air and root.Position.Y > 5 then
        local vel = root.AssemblyLinearVelocity
        if vel.Y < -50 then
            root.AssemblyLinearVelocity = Vector3.new(vel.X, -50, vel.Z)
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- FIND BAT
-- ═══════════════════════════════════════════════════════════════
local function findBat()
    local char = LP.Character
    if not char then return nil end
    for _, name in ipairs(BAT_LIST) do
        local t = char:FindFirstChild(name)
        if t and t:IsA("Tool") then return t end
    end
    local bp = LP:FindFirstChildOfClass("Backpack")
    if bp then
        for _, name in ipairs(BAT_LIST) do
            local t = bp:FindFirstChild(name)
            if t and t:IsA("Tool") then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then pcall(function() hum:EquipTool(t) end) end
                return t
            end
        end
    end
    for _, ch in ipairs(char:GetChildren()) do
        if ch:IsA("Tool") and (ch.Name:lower():find("bat") or ch.Name:lower():find("slap")) then
            return ch
        end
    end
    return nil
end

-- ═══════════════════════════════════════════════════════════════
-- GET CLOSEST TARGET
-- ═══════════════════════════════════════════════════════════════
local function getClosestTarget()
    local char = LP.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local closest, minDist = nil, math.huge
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character then
            local tRoot = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if tRoot and hum and hum.Health > 0 then
                local d = (tRoot.Position - root.Position).Magnitude
                if d < minDist then minDist = d; closest = tRoot end
            end
        end
    end
    return closest
end

-- ═══════════════════════════════════════════════════════════════
-- SWING
-- ═══════════════════════════════════════════════════════════════
local _swingCD = false
local function trySwing()
    if _swingCD then return end
    _swingCD = true
    task.spawn(function()
        local char = LP.Character
        if char then
            local bat = findBat()
            if bat then
                if bat.Parent ~= char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then pcall(function() hum:EquipTool(bat) end) end
                end
                pcall(function() bat:Activate() end)
            end
        end
        task.wait(0.08)
        _swingCD = false
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- AIMBOT
-- ═══════════════════════════════════════════════════════════════
local function startAimbot()
    if State.aimbotConn then return end
    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        if State.prevAutoRotate == nil then State.prevAutoRotate = hum.AutoRotate end
        hum.AutoRotate = false
    end
    State.aimbotConn = RunService.RenderStepped:Connect(function()
        if not State.autoBatEnabled then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        if not char:FindFirstChildOfClass("Tool") then
            local bat = findBat()
            if bat then pcall(function() hum:EquipTool(bat) end) end
        end
        local target = getClosestTarget()
        if not target then return end
        local speed = State.autoBatMode == "bypass" and (State.autoBatSpeed + 2) or State.autoBatSpeed
        local targetVel = target.AssemblyLinearVelocity
        local myPos = root.Position
        local targetPos = target.Position
        local predictPos = targetPos + targetVel * 0.14 + target.CFrame.LookVector * 0.3
        local dir = predictPos - myPos
        local flatDir = Vector3.new(dir.X, 0, dir.Z)
        if flatDir.Magnitude > 0 then flatDir = flatDir.Unit else flatDir = Vector3.zero end
        local desiredH = targetPos.Y + 3.7
        local yVel = (desiredH - myPos.Y) * 19.5 + targetVel.Y * 0.8
        if hum.FloorMaterial ~= Enum.Material.Air then yVel = math.max(yVel, 13) end
        yVel = math.clamp(yVel, -70, 110)
        local desired = Vector3.new(flatDir.X * speed, yVel, flatDir.Z * speed)
        root.AssemblyLinearVelocity = root.AssemblyLinearVelocity:Lerp(desired, 0.8)
        local pTime = math.clamp(targetVel.Magnitude / 150, 0.05, 0.2)
        local pPos = targetPos + targetVel * pTime
        local toP = pPos - myPos
        if toP.Magnitude > 0.1 then
            local goalCF = CFrame.lookAt(myPos, pPos)
            local diff = root.CFrame:Inverse() * goalCF
            local rx, ry, rz = diff:ToEulerAnglesXYZ()
            rx, ry, rz = math.clamp(rx, -2.5, 2.5), math.clamp(ry, -2.5, 2.5), math.clamp(rz, -2.5, 2.5)
            root.AssemblyAngularVelocity = root.CFrame:VectorToWorldSpace(Vector3.new(rx * 42, ry * 42, rz * 42))
        end
        if (root.Position - target.Position).Magnitude <= 8 then trySwing() end
    end)
end

local function stopAimbot()
    if State.aimbotConn then State.aimbotConn:Disconnect(); State.aimbotConn = nil end
    local char = LP.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if hum then hum.AutoRotate = (State.prevAutoRotate == nil) or State.prevAutoRotate end
    if root then root.AssemblyAngularVelocity = Vector3.zero end
    State.prevAutoRotate = nil
end

local function enableAutoBat()
    if State.autoLeftEnabled then State.autoLeftEnabled = false; stopAutoLeft() end
    if State.autoRightEnabled then State.autoRightEnabled = false; stopAutoRight() end
    if State.tpBatEnabled then State.tpBatEnabled = false; stopTpBat() end
    State.autoBatEnabled = true
    startAimbot()
    if MB then MB.setAutoBat(true) end
end

local function disableAutoBat()
    State.autoBatEnabled = false
    stopAimbot()
    if MB then MB.setAutoBat(false) end
end

-- ═══════════════════════════════════════════════════════════════
-- AUTO LEFT
-- ═══════════════════════════════════════════════════════════════
function stopAutoLeft()
    if State.alConn then State.alConn:Disconnect(); State.alConn = nil end
    State.alPhase = 1
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:Move(Vector3.zero, false) end
    end
    if MB then MB.setAutoLeft(false) end
end

function startAutoLeft()
    if State.autoRightEnabled then State.autoRightEnabled = false; stopAutoRight() end
    disableAutoBat()
    if State.alConn then State.alConn:Disconnect() end
    State.alPhase = 1
    State.alConn = RunService.Heartbeat:Connect(function()
        if not State.autoLeftEnabled then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        local spd = 40
        if State.alPhase == 1 then
            local tgt = Vector3.new(AP.L1.X, root.Position.Y, AP.L1.Z)
            if (tgt - root.Position).Magnitude < 1 then State.alPhase = 2 end
            local d = AP.L1 - root.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        elseif State.alPhase == 2 then
            local tgt = Vector3.new(AP.L2.X, root.Position.Y, AP.L2.Z)
            if (tgt - root.Position).Magnitude < 1 then
                hum:Move(Vector3.zero, false)
                root.AssemblyLinearVelocity = Vector3.zero
                State.autoLeftEnabled = false
                if State.alConn then State.alConn:Disconnect(); State.alConn = nil end
                State.alPhase = 1
                if MB then MB.setAutoLeft(false) end
                local face = Vector3.new(AP.L_FACE.X - root.Position.X, 0, AP.L_FACE.Z - root.Position.Z)
                if face.Magnitude > 0.01 then root.CFrame = CFrame.new(root.Position, root.Position + face) end
                return
            end
            local d = AP.L2 - root.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- AUTO RIGHT
-- ═══════════════════════════════════════════════════════════════
function stopAutoRight()
    if State.arConn then State.arConn:Disconnect(); State.arConn = nil end
    State.arPhase = 1
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:Move(Vector3.zero, false) end
    end
    if MB then MB.setAutoRight(false) end
end

function startAutoRight()
    if State.autoLeftEnabled then State.autoLeftEnabled = false; stopAutoLeft() end
    disableAutoBat()
    if State.arConn then State.arConn:Disconnect() end
    State.arPhase = 1
    State.arConn = RunService.Heartbeat:Connect(function()
        if not State.autoRightEnabled then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        local spd = 40
        if State.arPhase == 1 then
            local tgt = Vector3.new(AP.R1.X, root.Position.Y, AP.R1.Z)
            if (tgt - root.Position).Magnitude < 1 then State.arPhase = 2 end
            local d = AP.R1 - root.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        elseif State.arPhase == 2 then
            local tgt = Vector3.new(AP.R2.X, root.Position.Y, AP.R2.Z)
            if (tgt - root.Position).Magnitude < 1 then
                hum:Move(Vector3.zero, false)
                root.AssemblyLinearVelocity = Vector3.zero
                State.autoRightEnabled = false
                if State.arConn then State.arConn:Disconnect(); State.arConn = nil end
                State.arPhase = 1
                if MB then MB.setAutoRight(false) end
                local face = Vector3.new(AP.R_FACE.X - root.Position.X, 0, AP.R_FACE.Z - root.Position.Z)
                if face.Magnitude > 0.01 then root.CFrame = CFrame.new(root.Position, root.Position + face) end
                return
            end
            local d = AP.R2 - root.Position
            local mv = Vector3.new(d.X, 0, d.Z).Unit
            hum:Move(mv, false)
            root.AssemblyLinearVelocity = Vector3.new(mv.X * spd, root.AssemblyLinearVelocity.Y, mv.Z * spd)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- TP BAT
-- ═══════════════════════════════════════════════════════════════
function stopTpBat()
    if State.tpBatConn then State.tpBatConn:Disconnect(); State.tpBatConn = nil end
    State.tpBatHitCD = false
    if MB then MB.setTpBat(false) end
end

function startTpBat()
    if State.autoBatEnabled then disableAutoBat() end
    if State.autoLeftEnabled then State.autoLeftEnabled = false; stopAutoLeft() end
    if State.autoRightEnabled then State.autoRightEnabled = false; stopAutoRight() end
    State.tpBatConn = RunService.Heartbeat:Connect(function()
        if not State.tpBatEnabled then return end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local closest, minDist = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character then
                local tr = plr.Character:FindFirstChild("HumanoidRootPart")
                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                if tr and hum and hum.Health > 0 then
                    local d = (hrp.Position - tr.Position).Magnitude
                    if d < minDist then minDist = d; closest = tr end
                end
            end
        end
        if not closest then return end
        if sethiddenproperty then
            pcall(function() sethiddenproperty(hrp, "PhysicsRepRootPart", closest) end)
        end
        local targetPos = closest.Position + Vector3.new(0, 0.9, 0)
        if (hrp.Position - targetPos).Magnitude > 8 then hrp.CFrame = CFrame.new(targetPos) end
        local cam = workspace.CurrentCamera
        if cam then cam.CFrame = CFrame.new(cam.CFrame.Position, closest.Position) end
        if not State.tpBatHitCD then
            State.tpBatHitCD = true
            local bat = findBat()
            if bat then
                bat:Activate()
                local ev = bat:FindFirstChildWhichIsA("RemoteEvent")
                if ev then ev:FireServer() end
            end
            task.delay(0.08, function() State.tpBatHitCD = false end)
        end
    end)
end

function toggleTpBat()
    State.tpBatEnabled = not State.tpBatEnabled
    if State.tpBatEnabled then
        startTpBat()
        if MB then MB.setTpBat(true) end
    else
        stopTpBat()
    end
end

-- ═══════════════════════════════════════════════════════════════
-- DROP
-- ═══════════════════════════════════════════════════════════════
function runDrop()
    if State.dropActive then return end
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    State.dropActive = true
    if State.dropMode == "v1" then
        local t0 = tick()
        local conn
        conn = RunService.Heartbeat:Connect(function()
            local r = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not r then conn:Disconnect(); State.dropActive = false; return end
            if tick() - t0 >= 0.2 then
                conn:Disconnect()
                local rp = RaycastParams.new()
                rp.FilterDescendantsInstances = {char}
                rp.FilterType = Enum.RaycastFilterType.Exclude
                local rr = workspace:Raycast(r.Position, Vector3.new(0, -2000, 0), rp)
                if rr then
                    local hum2 = char:FindFirstChildOfClass("Humanoid")
                    local off = ((hum2 and hum2.HipHeight) or 2) + (r.Size.Y / 2)
                    r.CFrame = CFrame.new(r.Position.X, rr.Position.Y + off, r.Position.Z)
                    r.AssemblyLinearVelocity = Vector3.zero
                end
                State.dropActive = false
                return
            end
            r.AssemblyLinearVelocity = Vector3.new(r.AssemblyLinearVelocity.X, 150, r.AssemblyLinearVelocity.Z)
        end)
    else
        local t0 = tick()
        local conn
        conn = RunService.Heartbeat:Connect(function()
            local r = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not r then conn:Disconnect(); State.dropActive = false; return end
            if tick() - t0 >= 0.5 then
                conn:Disconnect()
                local rp = RaycastParams.new()
                rp.FilterDescendantsInstances = {char}
                rp.FilterType = Enum.RaycastFilterType.Exclude
                local rr = workspace:Raycast(r.Position, Vector3.new(0, -2000, 0), rp)
                if rr then
                    local hum2 = char:FindFirstChildOfClass("Humanoid")
                    local off = ((hum2 and hum2.HipHeight) or 2) + (r.Size.Y / 2)
                    r.CFrame = CFrame.new(r.Position.X, rr.Position.Y + off, r.Position.Z)
                    r.AssemblyLinearVelocity = Vector3.zero
                end
                State.dropActive = false
                return
            end
            local vel = r.AssemblyLinearVelocity
            r.AssemblyLinearVelocity = Vector3.new(0, vel.Y, 0) * 10000 + Vector3.new(0, 10000, 0)
        end)
    end
end

-- ═══════════════════════════════════════════════════════════════
-- ANTI RAGDOLL
-- ═══════════════════════════════════════════════════════════════
function stopAntiRag()
    State.antiRagEnabled = false
    if State.antiRagConn then State.antiRagConn:Disconnect(); State.antiRagConn = nil end
end

function startAntiRag()
    State.antiRagEnabled = true
    if State.antiRagConn then return end
    State.antiRagConn = RunService.Heartbeat:Connect(function()
        if not State.antiRagEnabled then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root or hum.Health <= 0 then return end
        local st = hum:GetState()
        if st == Enum.HumanoidStateType.Physics
            or st == Enum.HumanoidStateType.Ragdoll
            or st == Enum.HumanoidStateType.FallingDown then
            local now = tick()
            if now - State.antiRagCD > 0.15 then
                State.antiRagCD = now
                pcall(function()
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                    root.Velocity = Vector3.zero
                    root.RotVelocity = Vector3.zero
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero
                    for _, obj in ipairs(char:GetDescendants()) do
                        if obj:IsA("Motor6D") then obj.Enabled = true end
                        if obj:IsA("Constraint") then obj.Enabled = true end
                    end
                    workspace.CurrentCamera.CameraSubject = hum
                    local PM = LP.PlayerScripts:FindFirstChild("PlayerModule")
                    if PM then
                        local CM = require(PM:FindFirstChild("ControlModule"))
                        if CM then CM:Enable() end
                    end
                    hum.AutoRotate = true
                    hum.PlatformStand = false
                    hum.Sit = false
                end)
            end
        end
    end)
end

function toggleAntiRag()
    State.antiRagEnabled = not State.antiRagEnabled
    if State.antiRagEnabled then startAntiRag() else stopAntiRag() end
end

-- ═══════════════════════════════════════════════════════════════
-- UNWALK
-- ═══════════════════════════════════════════════════════════════
function startUnwalk()
    local c = LP.Character
    if not c then return end
    local hum = c:FindFirstChildOfClass("Humanoid")
    if hum then
        for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
            pcall(function() t:Stop() end)
        end
    end
    local anim = c:FindFirstChild("Animate")
    if anim then
        State.unwalkAnimate = anim:Clone()
        anim:Destroy()
    end
end

function stopUnwalk()
    local c = LP.Character
    if c and State.unwalkAnimate then
        local existing = c:FindFirstChild("Animate")
        if not existing then State.unwalkAnimate:Clone().Parent = c end
        State.unwalkAnimate = nil
    end
end

function toggleUnwalk()
    State.unwalkEnabled = not State.unwalkEnabled
    if State.unwalkEnabled then startUnwalk() else stopUnwalk() end
end

-- ═══════════════════════════════════════════════════════════════
-- INFINITE JUMP
-- ═══════════════════════════════════════════════════════════════
UIS.JumpRequest:Connect(function()
    if not State.infJumpEnabled or State.infJumpMode ~= "manual" then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then root.Velocity = Vector3.new(root.Velocity.X, 55, root.Velocity.Z) end
end)

RunService.Heartbeat:Connect(function()
    if not State.infJumpEnabled or State.infJumpMode ~= "hold" then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local held = State.holdJumpActive or (hum and hum.Jump == true)
    if held and root.Velocity.Y < 30 then
        root.Velocity = Vector3.new(root.Velocity.X, 55, root.Velocity.Z)
    end
end)

-- ═══════════════════════════════════════════════════════════════
-- BODY LOCK
-- ═══════════════════════════════════════════════════════════════
function stopBodyLock()
    if State.bodyLockConn then State.bodyLockConn:Disconnect(); State.bodyLockConn = nil end
    local c = LP.Character
    local hum = c and c:FindFirstChildOfClass("Humanoid")
    if hum then hum.AutoRotate = true end
end

function startBodyLock()
    State.bodyLockEnabled = true
    if State.bodyLockConn then return end
    State.bodyLockConn = RunService.Heartbeat:Connect(function()
        if not State.bodyLockEnabled then return end
        local char = LP.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not root or not hum then return end
        local closest, minDist = nil, State.bodyLockRange
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character then
                local tr = plr.Character:FindFirstChild("HumanoidRootPart")
                local ph = plr.Character:FindFirstChildOfClass("Humanoid")
                if tr and ph and ph.Health > 0 then
                    local d = (tr.Position - root.Position).Magnitude
                    if d < minDist then minDist = d; closest = tr end
                end
            end
        end
        if closest then
            hum.AutoRotate = false
            local targetPos = closest.Position
            local myPos = root.Position
            local lookDir = Vector3.new(targetPos.X - myPos.X, 0, targetPos.Z - myPos.Z)
            if lookDir.Magnitude > 0.1 then
                local cross = root.CFrame.LookVector:Cross(lookDir.Unit)
                root.AssemblyAngularVelocity = Vector3.new(0, cross.Y * 40, 0)
            end
        else
            hum.AutoRotate = true
        end
    end)
end

function toggleBodyLock()
    State.bodyLockEnabled = not State.bodyLockEnabled
    if State.bodyLockEnabled then startBodyLock() else stopBodyLock() end
end

-- ═══════════════════════════════════════════════════════════════
-- BAT COUNTER
-- ═══════════════════════════════════════════════════════════════
function stopBatCounter()
    State.batCounterEnabled = false
    if State.batCounterConn then State.batCounterConn:Disconnect(); State.batCounterConn = nil end
    State.batCounterCD = false
end

function startBatCounter()
    State.batCounterEnabled = true
    if State.batCounterConn then return end
    State.batCounterConn = RunService.Heartbeat:Connect(function()
        if not State.batCounterEnabled then return end
        if State.batCounterCD then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local st = hum:GetState()
        if st == Enum.HumanoidStateType.Physics
            or st == Enum.HumanoidStateType.Ragdoll
            or st == Enum.HumanoidStateType.FallingDown then
            State.batCounterCD = true
            task.spawn(function()
                local bat = findBat()
                if bat then
                    if bat.Parent ~= char then pcall(function() hum:EquipTool(bat) end) end
                    local remote = bat:FindFirstChildOfClass("RemoteEvent")
                    if remote then
                        pcall(function() remote:FireServer() end)
                        task.wait(0.1)
                        pcall(function() remote:FireServer() end)
                    else
                        pcall(function() bat:Activate() end)
                        task.wait(0.1)
                        pcall(function() bat:Activate() end)
                    end
                end
                task.wait(0.3)
                State.batCounterCD = false
            end)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- ESP
-- ═══════════════════════════════════════════════════════════════
local function clearESP()
    for plr, hl in pairs(State.espHighlights) do pcall(function() hl:Destroy() end) end
    for plr, lines in pairs(State.espTracers) do
        for _, ln in ipairs(lines) do pcall(function() ln.Visible = false; ln:Remove() end) end
    end
    State.espHighlights = {}
    State.espTracers = {}
end

local function updateESP()
    if not State.espEnabled then clearESP(); return end
    local myChar = LP.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local myScreen, myOnScreen = camera:WorldToViewportPoint(myRoot.Position)
    local myVec = Vector2.new(myScreen.X, myScreen.Y)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and plr.Character then
            local tRoot = plr.Character:FindFirstChild("HumanoidRootPart")
            local tHum = plr.Character:FindFirstChildOfClass("Humanoid")
            if tRoot and tHum and tHum.Health > 0 then
                local hl = State.espHighlights[plr]
                if not hl or not hl.Parent then
                    hl = Instance.new("Highlight")
                    hl.Name = "MalekESP"
                    hl.FillColor = C.WHITE
                    hl.FillTransparency = 0.75
                    hl.OutlineColor = C.WHITE
                    hl.OutlineTransparency = 0.1
                    hl.Adornee = plr.Character
                    hl.Parent = plr.Character
                    State.espHighlights[plr] = hl
                end
                if Drawing then
                    local lines = State.espTracers[plr]
                    if not lines then
                        local outer = Drawing.new("Line")
                        outer.Color = C.WHITE
                        outer.Thickness = 2
                        outer.Transparency = 0.9
                        outer.Visible = false
                        lines = {outer}
                        State.espTracers[plr] = lines
                    end
                    local pos, onScreen = camera:WorldToViewportPoint(tRoot.Position)
                    if onScreen and pos.Z > 0 and myOnScreen then
                        for _, ln in ipairs(lines) do
                            ln.From = myVec
                            ln.To = Vector2.new(pos.X, pos.Y)
                            ln.Visible = true
                        end
                    else
                        for _, ln in ipairs(lines) do ln.Visible = false end
                    end
                end
            else
                if State.espHighlights[plr] then pcall(function() State.espHighlights[plr]:Destroy() end); State.espHighlights[plr] = nil end
                if State.espTracers[plr] then for _, ln in ipairs(State.espTracers[plr]) do pcall(function() ln.Visible = false end) end end
            end
        end
    end
end

function toggleESP()
    State.espEnabled = not State.espEnabled
    if State.espEnabled then
        State.espConn = RunService.RenderStepped:Connect(updateESP)
    else
        if State.espConn then State.espConn:Disconnect(); State.espConn = nil end
        clearESP()
    end
end

-- ═══════════════════════════════════════════════════════════════
-- FOV
-- ═══════════════════════════════════════════════════════════════
function toggleFOV()
    State.fovEnabled = not State.fovEnabled
    local cam = workspace.CurrentCamera
    if State.fovEnabled then
        if not State.fovOrig then State.fovOrig = cam.FieldOfView end
        TS:Create(cam, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {FieldOfView = 120}):Play()
        if State.fovConn then State.fovConn:Disconnect() end
        State.fovConn = RunService.RenderStepped:Connect(function()
            if State.fovEnabled then cam.FieldOfView = 120
            else if State.fovConn then State.fovConn:Disconnect(); State.fovConn = nil end end
        end)
    else
        if State.fovConn then State.fovConn:Disconnect(); State.fovConn = nil end
        TS:Create(cam, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {FieldOfView = State.fovOrig or 70}):Play()
    end
end

-- ═══════════════════════════════════════════════════════════════
-- AUTO STEAL
-- ═══════════════════════════════════════════════════════════════
local function isMyPlot(plotName)
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return false end
    local plot = plots:FindFirstChild(plotName)
    if not plot then return false end
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yb = sign:FindFirstChild("YourBase")
        if yb and yb:IsA("BillboardGui") then return yb.Enabled == true end
    end
    return false
end

local function findNearestPrompt()
    local char = LP.Character
    if not char then return nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    local nearest, minDist = nil, math.huge
    for _, plot in ipairs(plots:GetChildren()) do
        if not isMyPlot(plot.Name) then
            local pods = plot:FindFirstChild("AnimalPodiums")
            if pods then
                for _, pod in ipairs(pods:GetChildren()) do
                    local base = pod:FindFirstChild("Base")
                    local spawn = base and base:FindFirstChild("Spawn")
                    if spawn then
                        local d = (spawn.Position - root.Position).Magnitude
                        if d <= State.stealRadius and d < minDist then
                            local att = spawn:FindFirstChild("PromptAttachment")
                            if att then
                                for _, p in ipairs(att:GetChildren()) do
                                    if p:IsA("ProximityPrompt") and p.ActionText and p.ActionText:find("Steal") then
                                        nearest = p
                                        minDist = d
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return nearest
end

local function executeSteal(prompt)
    if State.isStealing or not prompt or not prompt.Parent then return end
    triggerAutoCarry()
    pcall(function()
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = 35
            task.delay(2, function()
                if hum and hum.Parent then hum.WalkSpeed = 16 end
            end)
        end
    end)
    if not State.stealData[prompt] then
        State.stealData[prompt] = {hold = {}, trigger = {}}
        pcall(function()
            if getconnections then
                for _, c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do
                    if c.Function then table.insert(State.stealData[prompt].hold, c.Function) end
                end
                for _, c in ipairs(getconnections(prompt.Triggered)) do
                    if c.Function then table.insert(State.stealData[prompt].trigger, c.Function) end
                end
            end
        end)
    end
    local data = State.stealData[prompt]
    State.isStealing = true
    task.spawn(function()
        for _, f in ipairs(data.hold) do task.spawn(f) end
        local t0 = tick()
        while State.autoStealEnabled and State.isStealing do
            local elapsed = tick() - t0
            if not prompt.Parent or not prompt.Parent.Parent then break end
            if elapsed >= State.stealDuration then
                for _, f in ipairs(data.trigger) do task.spawn(f) end
                break
            end
            task.wait()
        end
        State.isStealing = false
    end)
end

function stopAutoSteal()
    State.autoStealEnabled = false
    if State.autoStealConn then State.autoStealConn:Disconnect(); State.autoStealConn = nil end
    State.isStealing = false
end

function startAutoSteal()
    State.autoStealEnabled = true
    if State.autoStealConn then return end
    State.autoStealConn = RunService.Heartbeat:Connect(function()
        if not State.autoStealEnabled or State.isStealing then return end
        local p = findNearestPrompt()
        if p then executeSteal(p) end
    end)
end

function toggleAutoSteal()
    if State.autoStealEnabled then stopAutoSteal() else startAutoSteal() end
end

-- ═══════════════════════════════════════════════════════════════
-- AUTO TP DOWN
-- ═══════════════════════════════════════════════════════════════
function stopAutoTP()
    State.autoTPEnabled = false
    if State.autoTPConn then task.cancel(State.autoTPConn); State.autoTPConn = nil end
end

function startAutoTP()
    State.autoTPEnabled = true
    State.autoTPConn = task.spawn(function()
        while State.autoTPEnabled do
            task.wait(0.1)
            pcall(function()
                local char = LP.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hrp or not hum then return end
                if hum.FloorMaterial == Enum.Material.Air and hrp.Position.Y >= State.autoTPHeight then
                    hrp.CFrame = CFrame.new(hrp.Position.X, -7, hrp.Position.Z)
                    hrp.AssemblyLinearVelocity = Vector3.zero
                end
            end)
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- TP FLOOR
-- ═══════════════════════════════════════════════════════════════
function tpFloor()
    pcall(function()
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        hrp.CFrame = CFrame.new(hrp.Position.X, -7, hrp.Position.Z)
        hrp.AssemblyLinearVelocity = Vector3.zero
    end)
end

-- ═══════════════════════════════════════════════════════════════
-- SAVE SYSTEM
-- ═══════════════════════════════════════════════════════════════
local CONFIG_FILE = "MalekHub.json"

local function saveConfig()
    local data = {
        normalSpeed = State.normalSpeed,
        carrySpeed = State.carrySpeed,
        laggerSpeed = State.laggerSpeed,
        laggerCarry = State.laggerCarry,
        autoBatSpeed = State.autoBatSpeed,
        autoBatMode = State.autoBatMode,
        dropMode = State.dropMode,
        stealRadius = State.stealRadius,
        autoTPHeight = State.autoTPHeight,
        bodyLockRange = State.bodyLockRange,
        infJumpMode = State.infJumpMode,
        speedMode = State.speedMode,
        laggerToggled = State.laggerToggled,
        laggerCarryToggled = State.laggerCarryToggled,
        autoBatEnabled = State.autoBatEnabled,
        autoLeftEnabled = State.autoLeftEnabled,
        autoRightEnabled = State.autoRightEnabled,
        tpBatEnabled = State.tpBatEnabled,
        antiRagEnabled = State.antiRagEnabled,
        antiLagEnabled = State.antiLagEnabled,
        unwalkEnabled = State.unwalkEnabled,
        bodyLockEnabled = State.bodyLockEnabled,
        batCounterEnabled = State.batCounterEnabled,
        espEnabled = State.espEnabled,
        fovEnabled = State.fovEnabled,
        autoStealEnabled = State.autoStealEnabled,
        autoTPEnabled = State.autoTPEnabled,
        infJumpEnabled = State.infJumpEnabled,
        autoCarryEnabled = State.autoCarryEnabled,
        watermarkEnabled = State.watermarkEnabled,
        lockEnabled = State.lockEnabled,
        antiKickEnabled = State.antiKickEnabled,
    }
    local ok, encoded = pcall(function() return HS:JSONEncode(data) end)
    if ok and encoded then pcall(writefile, CONFIG_FILE, encoded) end
end

local function loadConfig()
    local exists = pcall(isfile, CONFIG_FILE)
    if not exists then return end
    local ok, raw = pcall(readfile, CONFIG_FILE)
    if not ok or not raw then return end
    local ok2, data = pcall(function() return HS:JSONDecode(raw) end)
    if not ok2 or type(data) ~= "table" then return end
    for k, v in pairs(data) do
        if State[k] ~= nil then State[k] = v end
    end
end

-- ═══════════════════════════════════════════════════════════════
-- BUILD UI
-- ═══════════════════════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MalekHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.IgnoreGuiInset = true
pcall(function() if syn and syn.protect_gui then syn.protect_gui(ScreenGui) end end)
local okGui = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not okGui then ScreenGui.Parent = PGui end

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 340, 0, 480)
Main.Position = UDim2.new(0, 20, 0.5, -240)
Main.BackgroundColor3 = C.BG
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.ZIndex = 2
Main.Parent = ScreenGui
corner(Main, 16)
local mainStroke = stroke(Main, C.STROKE, 1.5, 0)

local bgGrad = Instance.new("UIGradient")
bgGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 18, 18)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 10, 10)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15)),
})
bgGrad.Rotation = 135
bgGrad.Parent = Main

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 70)
Header.BackgroundTransparency = 1
Header.ZIndex = 5
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 0, 34)
Title.Position = UDim2.new(0, 20, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "MALEK HUB"
Title.TextColor3 = C.WHITE
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 24
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 6
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -40, 0, 14)
Subtitle.Position = UDim2.new(0, 20, 0, 44)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "MALEK"
Subtitle.TextColor3 = C.TEXT_MUTED
Subtitle.Font = Enum.Font.GothamBold
Subtitle.TextSize = 10
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 6
Subtitle.Parent = Header

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -40, 0, 1)
Divider.Position = UDim2.new(0, 20, 0, 68)
Divider.BackgroundColor3 = C.STROKE
Divider.BorderSizePixel = 0
Divider.ZIndex = 6
Divider.Parent = Header

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 26, 0, 26)
MinBtn.Position = UDim2.new(1, -36, 0, 22)
MinBtn.BackgroundColor3 = C.PANEL2
MinBtn.BorderSizePixel = 0
MinBtn.Text = "−"
MinBtn.TextColor3 = C.TEXT_DIM
MinBtn.Font = Enum.Font.GothamBlack
MinBtn.TextSize = 18
MinBtn.AutoButtonColor = false
MinBtn.ZIndex = 8
MinBtn.Parent = Header
corner(MinBtn, 6)
stroke(MinBtn, C.STROKE, 1)

local RestoreBtn = Instance.new("TextButton")
RestoreBtn.Name = "RestoreBtn"
RestoreBtn.Size = UDim2.new(0, 120, 0, 34)
RestoreBtn.Position = UDim2.new(0, 20, 0, 20)
RestoreBtn.BackgroundColor3 = C.PANEL
RestoreBtn.BorderSizePixel = 0
RestoreBtn.Text = "MALEK HUB"
RestoreBtn.TextColor3 = C.WHITE
RestoreBtn.Font = Enum.Font.GothamBlack
RestoreBtn.TextSize = 13
RestoreBtn.AutoButtonColor = false
RestoreBtn.Visible = false
RestoreBtn.ZIndex = 100
RestoreBtn.Parent = ScreenGui
corner(RestoreBtn, 10)
stroke(RestoreBtn, C.STROKE, 1.5)

local function minimize()
    if State.minimized then return end
    State.minimized = true
    tween(Main, {Size = UDim2.new(0, 340, 0, 0), BackgroundTransparency = 1}, 0.3)
    tween(mainStroke, {Transparency = 1}, 0.3)
    task.delay(0.3, function()
        Main.Visible = false
        RestoreBtn.Visible = true
        RestoreBtn.Position = UDim2.new(0, 20, 0, 20)
        RestoreBtn.BackgroundTransparency = 1
        TS:Create(RestoreBtn, TweenInfo.new(0.25), {BackgroundTransparency = 0}):Play()
    end)
end

local function restore()
    if not State.minimized then return end
    State.minimized = false
    RestoreBtn.Visible = false
    Main.Visible = true
    Main.Size = UDim2.new(0, 340, 0, 0)
    Main.BackgroundTransparency = 0
    mainStroke.Transparency = 0
    tween(Main, {Size = UDim2.new(0, 340, 0, 480)}, 0.3)
end

MinBtn.MouseButton1Click:Connect(minimize)
RestoreBtn.MouseButton1Click:Connect(restore)

-- DRAG MAIN (from anywhere)
do
    local drag, ds, sp, moved
    
    local function startDrag(i)
        if State.minimized then return end
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true
            moved = false
            ds = i.Position
            sp = Main.Position
        end
    end
    
    Header.InputBegan:Connect(function(i) startDrag(i) end)
    Main.InputBegan:Connect(function(i) startDrag(i) end)
    
    UIS.InputChanged:Connect(function(i)
        if not drag then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local d = i.Position - ds
            if d.Magnitude > 4 then
                moved = true
                Main.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
            end
        end
    end)
    
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)
end

do
    local drag, ds, sp
    RestoreBtn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true; ds = i.Position; sp = RestoreBtn.Position
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if not drag then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local d = i.Position - ds
            RestoreBtn.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)
end

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 36)
TabBar.Position = UDim2.new(0, 10, 0, 74)
TabBar.BackgroundColor3 = C.PANEL
TabBar.BorderSizePixel = 0
TabBar.ZIndex = 5
TabBar.Parent = Main
corner(TabBar, 10)
stroke(TabBar, C.STROKE, 1)

local TabList = Instance.new("UIListLayout")
TabList.FillDirection = Enum.FillDirection.Horizontal
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabList.VerticalAlignment = Enum.VerticalAlignment.Center
TabList.Padding = UDim.new(0, 4)
TabList.Parent = TabBar

local TABS = {"SPEED", "COMBAT", "VISUAL", "CONFIG"}
local tabButtons = {}
local tabPages = {}

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -162)
Content.Position = UDim2.new(0, 10, 0, 116)
Content.BackgroundTransparency = 1
Content.ZIndex = 5
Content.Parent = Main

for i, name in ipairs(TABS) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 76, 0, 26)
    btn.BackgroundColor3 = C.PANEL2
    btn.BackgroundTransparency = 0.5
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = C.TEXT_DIM
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.AutoButtonColor = false
    btn.ZIndex = 6
    btn.Parent = TabBar
    corner(btn, 6)
    stroke(btn, C.STROKE, 1, 0.5)
    btn.MouseEnter:Connect(function()
        if tabButtons[name] ~= "active" then
            tween(btn, {BackgroundColor3 = C.ROW_HOVER, BackgroundTransparency = 0.3})
        end
    end)
    btn.MouseLeave:Connect(function()
        if tabButtons[name] ~= "active" then
            tween(btn, {BackgroundColor3 = C.PANEL2, BackgroundTransparency = 0.5})
        end
    end)
    tabButtons[name] = btn

    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = C.STROKE
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.ZIndex = 5
    page.Visible = (i == 1)
    page.Parent = Content

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 4)
    layout.Parent = page

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 4)
    pad.PaddingBottom = UDim.new(0, 8)
    pad.PaddingLeft = UDim.new(0, 2)
    pad.PaddingRight = UDim.new(0, 2)
    pad.Parent = page

    tabPages[name] = page

    btn.MouseButton1Click:Connect(function()
        for n, p in pairs(tabPages) do p.Visible = false end
        for n, b in pairs(tabButtons) do
            b.TextColor3 = C.TEXT_DIM
            b.BackgroundColor3 = C.PANEL2
            b.BackgroundTransparency = 0.5
        end
        page.Visible = true
        btn.TextColor3 = C.WHITE
        btn.BackgroundColor3 = C.WHITE
        btn.BackgroundTransparency = 0.85
    end)
end

tabButtons["SPEED"].TextColor3 = C.WHITE
tabButtons["SPEED"].BackgroundColor3 = C.WHITE
tabButtons["SPEED"].BackgroundTransparency = 0.85

local orderCounter = {}
local function nextOrder(page)
    orderCounter[page] = (orderCounter[page] or 0) + 1
    return orderCounter[page]
end

local function sectionLabel(page, text)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 22)
    f.BackgroundTransparency = 1
    f.LayoutOrder = nextOrder(page)
    f.Parent = page
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -10, 1, 0)
    l.Position = UDim2.new(0, 6, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = C.TEXT_DIM
    l.Font = Enum.Font.GothamBold
    l.TextSize = 10
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.ZIndex = 6
    l.Parent = f
end

local function toggleRow(page, label, default, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 36)
    row.BackgroundColor3 = C.ROW
    row.BorderSizePixel = 0
    row.LayoutOrder = nextOrder(page)
    row.Parent = page
    corner(row, 8)
    local rs = stroke(row, C.STROKE, 1)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.65, 0, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = C.TEXT
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6
    lbl.Parent = row
    local track = Instance.new("Frame")
    track.Size = UDim2.new(0, 34, 0, 18)
    track.Position = UDim2.new(1, -46, 0.5, -9)
    track.BackgroundColor3 = default and C.ON or C.OFF
    track.BorderSizePixel = 0
    track.ZIndex = 6
    track.Parent = row
    corner(track, 9)
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 13, 0, 13)
    knob.Position = default and UDim2.new(1, -15, 0.5, -6.5) or UDim2.new(0, 2, 0.5, -6.5)
    knob.BackgroundColor3 = default and C.BLACK or C.WHITE
    knob.BorderSizePixel = 0
    knob.ZIndex = 7
    knob.Parent = track
    corner(knob, 6)
    local state = default
    local function update(on)
        state = on
        tween(track, {BackgroundColor3 = on and C.ON or C.OFF})
        tween(knob, {
            Position = on and UDim2.new(1, -15, 0.5, -6.5) or UDim2.new(0, 2, 0.5, -6.5),
            BackgroundColor3 = on and C.BLACK or C.WHITE,
        })
        tween(rs, {Color = on and C.STROKE_ON or C.STROKE})
    end
    local clk = Instance.new("TextButton")
    clk.Size = UDim2.new(1, 0, 1, 0)
    clk.BackgroundTransparency = 1
    clk.Text = ""
    clk.ZIndex = 8
    clk.Parent = row
    clk.MouseButton1Click:Connect(function()
        update(not state)
        if callback then callback(state) end
        saveConfig()
    end)
    row.MouseEnter:Connect(function() tween(row, {BackgroundColor3 = C.ROW_HOVER}) end)
    row.MouseLeave:Connect(function() tween(row, {BackgroundColor3 = C.ROW}) end)
    return update
end

local function inputRow(page, label, default, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 36)
    row.BackgroundColor3 = C.ROW
    row.BorderSizePixel = 0
    row.LayoutOrder = nextOrder(page)
    row.Parent = page
    corner(row, 8)
    stroke(row, C.STROKE, 1)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.6, 0, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = C.TEXT
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6
    lbl.Parent = row
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 60, 0, 24)
    box.Position = UDim2.new(1, -72, 0.5, -12)
    box.BackgroundColor3 = C.INP
    box.BorderSizePixel = 0
    box.Text = tostring(default)
    box.TextColor3 = C.WHITE
    box.Font = Enum.Font.GothamBold
    box.TextSize = 11
    box.ClearTextOnFocus = false
    box.ZIndex = 6
    box.Parent = row
    corner(box, 6)
    stroke(box, C.STROKE, 1)
    box.Focused:Connect(function() tween(box, {BackgroundColor3 = C.PANEL2}) end)
    box.FocusLost:Connect(function()
        tween(box, {BackgroundColor3 = C.INP})
        local n = tonumber(box.Text)
        if n and callback then callback(n) end
        saveConfig()
    end)
    return box
end

local function actionRow(page, label, callback, color)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 36)
    row.BackgroundColor3 = C.ROW
    row.BorderSizePixel = 0
    row.LayoutOrder = nextOrder(page)
    row.Parent = page
    corner(row, 8)
    local rs = stroke(row, C.STROKE, 1)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.8, 0, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = color or C.TEXT
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6
    lbl.Parent = row
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -28, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = ">"
    arrow.TextColor3 = C.TEXT_MUTED
    arrow.Font = Enum.Font.GothamBold
    arrow.TextSize = 14
    arrow.ZIndex = 6
    arrow.Parent = row
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 8
    btn.Parent = row
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    row.MouseEnter:Connect(function()
        tween(row, {BackgroundColor3 = C.ROW_HOVER})
        tween(arrow, {TextColor3 = C.WHITE})
        tween(rs, {Color = C.STROKE_ON})
    end)
    row.MouseLeave:Connect(function()
        tween(row, {BackgroundColor3 = C.ROW})
        tween(arrow, {TextColor3 = C.TEXT_MUTED})
        tween(rs, {Color = C.STROKE})
    end)
end

-- SPEED TAB
do
    local p = tabPages["SPEED"]
    sectionLabel(p, "SPEED VALUES")
    inputRow(p, "Normal Speed", State.normalSpeed, function(v) if v > 0 and v <= 500 then State.normalSpeed = v end end)
    inputRow(p, "Carry Speed", State.carrySpeed, function(v) if v > 0 and v <= 500 then State.carrySpeed = v end end)
    inputRow(p, "Lagger Speed", State.laggerSpeed, function(v) if v > 0 and v <= 500 then State.laggerSpeed = v end end)
    inputRow(p, "Lagger Carry Speed", State.laggerCarry, function(v) if v > 0 and v <= 500 then State.laggerCarry = v end end)

    sectionLabel(p, "SPEED MODE")
    toggleRow(p, "Carry Mode", false, function(on)
        State.speedMode = on
        if on then State.laggerToggled = false; State.laggerCarryToggled = false end
    end)
    toggleRow(p, "Lagger Mode", false, function(on)
        State.laggerToggled = on
        if on then State.speedMode = false; State.laggerCarryToggled = false end
    end)
    toggleRow(p, "Lagger Carry Mode", false, function(on)
        State.laggerCarryToggled = on
        if on then State.speedMode = false; State.laggerToggled = false end
    end)

    sectionLabel(p, "MOVEMENT")
    toggleRow(p, "Auto Left", false, function(on)
        State.autoLeftEnabled = on
        if on then startAutoLeft() else stopAutoLeft() end
    end)
    toggleRow(p, "Auto Right", false, function(on)
        State.autoRightEnabled = on
        if on then startAutoRight() else stopAutoRight() end
    end)

    sectionLabel(p, "TELEPORT")
    actionRow(p, "TP Down", function() tpFloor() end)
    toggleRow(p, "Auto TP Down", false, function(on)
        if on then startAutoTP() else stopAutoTP() end
    end)
end

-- COMBAT TAB
do
    local p = tabPages["COMBAT"]
    sectionLabel(p, "AIMBOT")
    toggleRow(p, "Auto Bat", false, function(on)
        if on then enableAutoBat() else disableAutoBat() end
    end)
    inputRow(p, "Bat Speed", State.autoBatSpeed, function(v) if v > 0 and v <= 200 then State.autoBatSpeed = v end end)

    sectionLabel(p, "TP BAT")
    toggleRow(p, "TP Bat (Desync)", false, function(on)
        State.tpBatEnabled = on
        if on then startTpBat() else stopTpBat() end
    end)

    sectionLabel(p, "DROP")
    toggleRow(p, "Drop", false, function(on) if on then runDrop() end end)

    sectionLabel(p, "COUNTERS")
    toggleRow(p, "Bat Counter", false, function(on) if on then startBatCounter() else stopBatCounter() end end)

    sectionLabel(p, "DEFENSE")
    toggleRow(p, "Anti Ragdoll", false, function(on) if on then startAntiRag() else stopAntiRag() end end)
    toggleRow(p, "Body Lock", false, function(on) if on then startBodyLock() else stopBodyLock() end end)
    toggleRow(p, "Unwalk", false, function(on) if on then startUnwalk() else stopUnwalk() end end)
end

-- VISUAL TAB
do
    local p = tabPages["VISUAL"]
    sectionLabel(p, "VISUAL")
    toggleRow(p, "Player ESP", false, function(on)
        if on then if not State.espEnabled then toggleESP() end
        else if State.espEnabled then toggleESP() end end
    end)
    toggleRow(p, "FOV 120", false, function(on)
        if on then if not State.fovEnabled then toggleFOV() end
        else if State.fovEnabled then toggleFOV() end end
    end)

    sectionLabel(p, "LIGHTING")
    toggleRow(p, "Dark Mode", false, function(on)
        if on then
            Lighting.Brightness = 0
            Lighting.ClockTime = 0
            Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        else
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
        end
    end)
end

-- CONFIG TAB
do
    local p = tabPages["CONFIG"]
    sectionLabel(p, "AUTO STEAL")
    toggleRow(p, "Auto Steal", false, function(on)
        if on then startAutoSteal() else stopAutoSteal() end
    end)
    inputRow(p, "Steal Radius", State.stealRadius, function(v)
        if v > 0 and v <= 300 then State.stealRadius = v end
    end)

    sectionLabel(p, "AUTO CARRY")
    toggleRow(p, "Auto Carry", false, function(on)
        State.autoCarryEnabled = on
    end)

    sectionLabel(p, "SECURITY")
    toggleRow(p, "Anti Kick", false, function(on)
        toggleAntiKick()
    end)
    toggleRow(p, "Lock Buttons", false, function(on)
        State.lockEnabled = on
    end)

    sectionLabel(p, "PERFORMANCE")
    toggleRow(p, "Anti Lag", false, function(on)
        toggleAntiLag()
    end)

    sectionLabel(p, "WATERMARK")
    toggleRow(p, "Show Watermark", true, function(on)
        State.watermarkEnabled = on
        if on then createWatermark() else destroyWatermark() end
    end)

    sectionLabel(p, "INFINITE JUMP")
    toggleRow(p, "Infinite Jump", false, function(on)
        State.infJumpEnabled = on
    end)

    sectionLabel(p, "SAVE / LOAD")
    actionRow(p, "💾 Save Config", function() saveConfig() end, C.GREEN)
    actionRow(p, "📂 Load Config", function() loadConfig() end, C.WHITE)
    actionRow(p, "🗑 Reset Config", function()
        pcall(delfile, CONFIG_FILE)
    end, C.RED)

    sectionLabel(p, "UI")
    actionRow(p, "Reset UI Position", function()
        Main.Position = UDim2.new(0, 20, 0.5, -240)
        Main.Size = UDim2.new(0, 340, 0, 480)
    end)
end

-- SIDE BUTTONS (3x3 grid on right - top)
local ButtonsGui = Instance.new("ScreenGui")
ButtonsGui.Name = "MalekHubButtons"
ButtonsGui.ResetOnSpawn = false
ButtonsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ButtonsGui.DisplayOrder = 1000
ButtonsGui.IgnoreGuiInset = true
pcall(function() if syn and syn.protect_gui then syn.protect_gui(ButtonsGui) end end)
local okBtn = pcall(function() ButtonsGui.Parent = game:GetService("CoreGui") end)
if not okBtn then ButtonsGui.Parent = PGui end

local BUTTON_SIZE = 50
local BUTTON_GAP = 5
local COL_1_X = -172
local COL_2_X = -117
local COL_3_X = -62
local START_Y = 20

local function makeFloatButton(label, colX, yOffset, callback, isToggle)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, BUTTON_SIZE, 0, BUTTON_SIZE)
    btn.Position = UDim2.new(1, colX, 0, yOffset)
    btn.BackgroundColor3 = C.PANEL
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.ZIndex = 5
    btn.Parent = ButtonsGui
    corner(btn, 14)
    local s = stroke(btn, C.STROKE, 1.5)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = C.TEXT
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextSize = 9
    lbl.TextWrapped = true
    lbl.ZIndex = 6
    lbl.Parent = btn

    local state = false

    local function setActive(on)
        state = on
        if on then
            tween(btn, {BackgroundColor3 = C.WHITE})
            tween(lbl, {TextColor3 = C.BLACK})
            tween(s, {Color = C.WHITE, Thickness = 2})
        else
            tween(btn, {BackgroundColor3 = C.PANEL})
            tween(lbl, {TextColor3 = C.TEXT})
            tween(s, {Color = C.STROKE, Thickness = 1.5})
        end
    end

    local drag, ds, sp, moved
    btn.InputBegan:Connect(function(i)
        if State.lockEnabled then return end
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true; moved = false; ds = i.Position; sp = btn.Position
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if not drag then return end
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local d = i.Position - ds
            if d.Magnitude > 5 then
                moved = true
                btn.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
            end
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)

    btn.MouseButton1Click:Connect(function()
        if moved then return end
        if isToggle then
            setActive(not state)
            if callback then callback(state) end
        else
            if callback then callback() end
        end
    end)

    return btn, setActive
end

MB = {}

local rowHeight = BUTTON_SIZE + BUTTON_GAP

-- الصف الأول
local _, setAutoBat = makeFloatButton("AUTO\nBAT", COL_1_X, START_Y + rowHeight * 0, function(on)
    if on then enableAutoBat() else disableAutoBat() end
end, true)

local _, setAutoLeft = makeFloatButton("AUTO\nLEFT", COL_2_X, START_Y + rowHeight * 0, function(on)
    State.autoLeftEnabled = on
    if on then startAutoLeft() else stopAutoLeft() end
end, true)

local _, setAutoRight = makeFloatButton("AUTO\nRIGHT", COL_3_X, START_Y + rowHeight * 0, function(on)
    State.autoRightEnabled = on
    if on then startAutoRight() else stopAutoRight() end
end, true)

-- الصف الثاني
local _, setDrop = makeFloatButton("DROP", COL_1_X, START_Y + rowHeight * 1, function()
    runDrop()
    setDrop(true)
    task.delay(0.3, function() setDrop(false) end)
end, false)

local _, setTpBat = makeFloatButton("TP\nBAT", COL_2_X, START_Y + rowHeight * 1, function(on)
    State.tpBatEnabled = on
    if on then startTpBat() else stopTpBat() end
end, true)

local _, setTpDown = makeFloatButton("TP\nDOWN", COL_3_X, START_Y + rowHeight * 1, function()
    tpFloor()
    setTpDown(true)
    task.delay(0.2, function() setTpDown(false) end)
end, false)

-- الصف الثالث
local _, setCarry = makeFloatButton("CARRY", COL_1_X, START_Y + rowHeight * 2, function(on)
    State.speedMode = on
    if on then State.laggerToggled = false; State.laggerCarryToggled = false; setLagger(false); setLaggerCarry(false) end
end, true)

local _, setLagger = makeFloatButton("LAGGER", COL_2_X, START_Y + rowHeight * 2, function(on)
    State.laggerToggled = on
    if on then State.speedMode = false; State.laggerCarryToggled = false; setCarry(false); setLaggerCarry(false) end
end, true)

local _, setLaggerCarry = makeFloatButton("CARRY\nLAGGER", COL_3_X, START_Y + rowHeight * 2, function(on)
    State.laggerCarryToggled = on
    if on then State.speedMode = false; State.laggerToggled = false; setCarry(false); setLagger(false) end
end, true)

MB.setAutoBat   = setAutoBat
MB.setAutoLeft  = setAutoLeft
MB.setAutoRight = setAutoRight
MB.setTpBat     = setTpBat
MB.setTpDown    = setTpDown
MB.setCarry     = setCarry
MB.setLagger    = setLagger
MB.setLaggerCarry = setLaggerCarry

-- PROGRESS BAR (DISABLED)
do
    local bar = Instance.new("Frame")
    bar.Name = "ProgressBar"
    bar.Size = UDim2.new(0, 300, 0, 40)
    bar.Position = UDim2.new(0.5, -150, 1, -50)
    bar.BackgroundColor3 = C.PANEL
    bar.BorderSizePixel = 0
    bar.Visible = false
    bar.ZIndex = 5
    bar.Parent = ButtonsGui
    corner(bar, 10)
    stroke(bar, C.STROKE, 1.5)

    State.progressPct = Instance.new("TextLabel")
    State.progressPct.Size = UDim2.new(0, 60, 1, 0)
    State.progressPct.Position = UDim2.new(0, 12, 0, 0)
    State.progressPct.BackgroundTransparency = 1
    State.progressPct.Text = "0%"
    State.progressPct.TextColor3 = C.WHITE
    State.progressPct.Font = Enum.Font.GothamBlack
    State.progressPct.TextSize = 14
    State.progressPct.TextXAlignment = Enum.TextXAlignment.Left
    State.progressPct.ZIndex = 6
    State.progressPct.Parent = bar

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -90, 0, 8)
    track.Position = UDim2.new(0, 74, 0.5, -4)
    track.BackgroundColor3 = C.INP
    track.BorderSizePixel = 0
    track.ZIndex = 6
    track.Parent = bar
    corner(track, 4)

    State.progressFill = Instance.new("Frame")
    State.progressFill.Size = UDim2.new(0, 0, 1, 0)
    State.progressFill.BackgroundColor3 = C.WHITE
    State.progressFill.BorderSizePixel = 0
    State.progressFill.ZIndex = 7
    State.progressFill.Parent = track
    corner(State.progressFill, 4)

    RunService.Heartbeat:Connect(function()
        bar.Visible = false
    end)
end

-- KEYBINDS
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if UIS:GetFocusedTextBox() then return end
    if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
    local kc = input.KeyCode
    if kc == Enum.KeyCode.Q then
        State.speedMode = not State.speedMode
        if State.speedMode then State.laggerToggled = false; State.laggerCarryToggled = false end
    elseif kc == Enum.KeyCode.R then
        State.laggerToggled = not State.laggerToggled
        if State.laggerToggled then State.speedMode = false; State.laggerCarryToggled = false end
    elseif kc == Enum.KeyCode.Z then
        State.autoLeftEnabled = not State.autoLeftEnabled
        if State.autoLeftEnabled then startAutoLeft() else stopAutoLeft() end
    elseif kc == Enum.KeyCode.C then
        State.autoRightEnabled = not State.autoRightEnabled
        if State.autoRightEnabled then startAutoRight() else stopAutoRight() end
    elseif kc == Enum.KeyCode.E then
        if State.autoBatEnabled then disableAutoBat() else enableAutoBat() end
    elseif kc == Enum.KeyCode.V then
        toggleTpBat()
    elseif kc == Enum.KeyCode.F then
        tpFloor()
    elseif kc == Enum.KeyCode.X then
        runDrop()
    elseif kc == Enum.KeyCode.G then
        toggleAutoSteal()
    elseif kc == Enum.KeyCode.LeftControl then
        if State.minimized then restore() else minimize() end
    end
end)

-- FPS / PING
do
    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Size = UDim2.new(0, 140, 0, 20)
    fpsLabel.Position = UDim2.new(0, 10, 1, -26)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.Text = "-- FPS | -- ms"
    fpsLabel.TextColor3 = C.TEXT_DIM
    fpsLabel.Font = Enum.Font.GothamBold
    fpsLabel.TextSize = 11
    fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
    fpsLabel.ZIndex = 10
    fpsLabel.Parent = ButtonsGui

    local frames, timeAcc = 0, 0
    RunService.Heartbeat:Connect(function(dt)
        frames = frames + 1
        timeAcc = timeAcc + dt
        if timeAcc >= 0.5 then
            local fps = math.floor(frames / timeAcc + 0.5)
            local ping = 0
            pcall(function() ping = math.floor(LP:GetNetworkPing() * 1000 + 0.5) end)
            fpsLabel.Text = string.format("%d FPS | %d ms", fps, ping)
            frames = 0
            timeAcc = 0
        end
    end)
end

-- RESPAWN
LP.CharacterAdded:Connect(function(char)
    State.isStealing = false
    State.alPhase = 1
    State.arPhase = 1
    State.stealData = {}
    task.wait(1)
    if State.unwalkEnabled then startUnwalk() end
    destroyWatermark()
    task.wait(0.5)
    if State.watermarkEnabled then createWatermark() end
end)

-- NOTIFY
local function notify(text, duration)
    duration = duration or 2
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 260, 0, 32)
    notif.Position = UDim2.new(0.5, -130, 0, 30)
    notif.BackgroundColor3 = C.PANEL
    notif.BorderSizePixel = 0
    notif.Text = text
    notif.TextColor3 = C.WHITE
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 12
    notif.ZIndex = 20
    notif.Parent = ButtonsGui
    corner(notif, 8)
    stroke(notif, C.STROKE, 1)
    task.delay(duration, function()
        tween(notif, {BackgroundTransparency = 1, TextTransparency = 1}, 0.3)
        task.wait(0.3)
        notif:Destroy()
    end)
end

-- LOAD SAVED CONFIG
pcall(loadConfig)

-- INIT WATERMARK
task.wait(0.5)
if State.watermarkEnabled then createWatermark() end

-- RESTART ACTIVE FEATURES AFTER LOAD
task.spawn(function()
    task.wait(1)
    if State.antiLagEnabled then startAntiLag() end
    if State.antiKickEnabled then startAntiKick() end
    if State.antiRagEnabled then startAntiRag() end
    if State.bodyLockEnabled then startBodyLock() end
    if State.batCounterEnabled then startBatCounter() end
    if State.autoStealEnabled then startAutoSteal() end
    if State.autoTPEnabled then startAutoTP() end
    if State.espEnabled then toggleESP() end
end)

notify("Malek Hub Loaded ✓", 3)

print("[MALEK HUB] Loaded successfully.")
print("[MALEK HUB] Anti Lag: CONFIG tab")
print("[MALEK HUB] Watermark: Above head (Speed + Ping)")
print("[MALEK HUB] Auto Carry: Switches to Carry on steal")
print("[MALEK HUB] Keybinds: Q R Z C E V F X G CTRL")
