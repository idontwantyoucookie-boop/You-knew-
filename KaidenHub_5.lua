--// KAIDEN HUB v1.0 - WindUI (black + blue) - full script in one piece
--// Main feature: AUTO PERFECT (stops the throw bar at +20, the very top / super green)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------------------------
-- LOGO (embedded in the script, no link needed)
--------------------------------------------------------------------
local LogoAsset = nil
do
local LOGO_B64 = "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"

local function b64decode(data)
    local ok, res = pcall(function()
        if crypt and crypt.base64decode then return crypt.base64decode(data) end
        if crypt and crypt.base64 and crypt.base64.decode then return crypt.base64.decode(data) end
        if base64_decode then return base64_decode(data) end
        if base64 and base64.decode then return base64.decode(data) end
    end)
    if ok and res then return res end
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    data = data:gsub("[^" .. chars .. "=]", "")
    return (data:gsub(".", function(x)
        if x == "=" then return "" end
        local r, f = "", (chars:find(x, 1, true) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and "1" or "0") end
        return r
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
        if #x ~= 8 then return "" end
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i, i) == "1" and 2 ^ (8 - i) or 0) end
        return string.char(c)
    end))
end

pcall(function()
    if writefile and getcustomasset then
        if makefolder and not isfolder("KaidenHub") then makefolder("KaidenHub") end
        writefile("KaidenHub/logo.png", b64decode(LOGO_B64))
        LogoAsset = getcustomasset("KaidenHub/logo.png")
    end
end)
end -- logo

--------------------------------------------------------------------
-- WINDUI
--------------------------------------------------------------------
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

--------------------------------------------------------------------
-- STATE
--------------------------------------------------------------------
local State = {
    AutoPerfect = false, PerfectValue = 20, ClickCooldown = 0.3, SkipCutscene = false, AutoFarm = false, FarmDelay = 0.2, LineOffset = 5, ThrowFor = 0,
    Auto2xPress = false, AutoTrain = false,
    AutoEquipBest = false,
    AutoUpgradeBars = false, AutoUpgradePlot = false, AutoUpgradeFood = false,
    Mutation = "Any", Rarity = "Not Set", Animal = "Not Set",
    Theme = "KaidenBlue", Transparency = 0.15,
    ShowUser = true, ShowFPS = false, ShowPing = false,
    AntiAFK = false, InfiniteJump = false, QuickInteract = false,
    HidePlayers = false, ReduceCPU = false, FPSCap = 240,
    ToggleKey = "J", AutoLoad = false,
    AutoStand = false, AutoBuyFood = false, NextFood = 1, Fullbright = false, FOVOn = false, FOV = 70, Debug = false,
    AutoFence = false, AutoRejoin = true, AntiLagAuto = false, AutoBoost = true,
}

--------------------------------------------------------------------
-- SESSION + ACTIVITY LOG (shown on the black screen and in the Debug tab)
-- 🟢 worked   🟡 bug (the script is fixing it)   🔴 stopped / failed
--------------------------------------------------------------------
local Session = { start = tick(), catches = 0, throws = 0, bought = 0, best = nil, farmStatus = "Idle", lastAction = "starting" }
local LogBuf = {}
local LogCount = { ok = 0, bug = 0, stop = 0 }
local LOG_ICON = { ok = "🟢", bug = "🟡", stop = "🔴" }
local LOG_WORD = { ok = "work", bug = "bug", stop = "stop" }

local function fmtClock(sec)
    sec = math.max(0, math.floor(sec))
    local h, m, s = math.floor(sec / 3600), math.floor(sec % 3600 / 60), sec % 60
    if h > 0 then return string.format("%02d:%02d:%02d", h, m, s) end
    return string.format("%02d:%02d", m, s)
end

local function logEvent(level, text)
    LogBuf[#LogBuf + 1] = { t = tick() - Session.start, level = level, text = text }
    LogCount[level] = (LogCount[level] or 0) + 1
    if #LogBuf > 300 then table.remove(LogBuf, 1) end
    if State.Debug then print("[KaidenHub]", LOG_ICON[level], text) end
end

--------------------------------------------------------------------
-- WINDOW (black + blue)
--------------------------------------------------------------------
pcall(function()
    WindUI:AddTheme({
        Name = "KaidenBlue",
        Accent = Color3.fromHex("#2F7BFF"),
        Dialog = Color3.fromHex("#05070D"),
        Outline = Color3.fromHex("#2F7BFF"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#7C8AA5"),
        Background = Color3.fromHex("#02040A"),
        Button = Color3.fromHex("#0B1426"),
        Icon = Color3.fromHex("#3D8BFF"),
    })
end)

local _vp = (workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize) or Vector2.new(1280, 720)
local WIN_W = math.min(math.clamp(math.floor(_vp.X * 0.6), 460, 920), _vp.X - 16)
local WIN_H = math.min(math.clamp(math.floor(_vp.Y * 0.84), 290, 620), _vp.Y - 24)

local Window = WindUI:CreateWindow({
    Title = "Kaiden Hub - [🎃] Throw Food For Animals",
    Icon = LogoAsset or "swords",
    Author = "by MOON4STARS",
    Folder = "KaidenHub",
    Size = UDim2.fromOffset(WIN_W, WIN_H),
    Theme = "KaidenBlue",
    Transparent = true,
    SideBarWidth = 200,
    Resizable = true,
    MinSize = Vector2.new(380, 240),
    MaxSize = Vector2.new(math.max(_vp.X - 10, 400), math.max(_vp.Y - 10, 260)),
    HasOutline = false,
    User = { Enabled = true, Anonymous = false },
})

pcall(function() Window:Tag({ Title = "v1.0", Color = Color3.fromHex("#2F7BFF") }) end)
pcall(function() Window:SetToggleKey(Enum.KeyCode.J) end)
pcall(function() WindUI.TransparencyValue = State.Transparency end)

-- the little bar at the top of the screen (logo + name), black and blue
pcall(function()
    Window:EditOpenButton({
        Title = "Kaiden Hub - [🎃] Throw Food For Animals",
        Icon = LogoAsset or "swords",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromHex("#000000"), Color3.fromHex("#2F7BFF")),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    })
end)

local function notify(title, content)
    pcall(function() WindUI:Notify({ Title = title, Content = content, Duration = 3 }) end)
end

--------------------------------------------------------------------
-- HELPERS + TOUCH TAP (automatic touch, no mouse)
--------------------------------------------------------------------
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local function isShown(obj)
    local cur = obj
    while cur and cur ~= PlayerGui do
        if cur:IsA("GuiObject") and not cur.Visible then return false end
        if cur:IsA("ScreenGui") and not cur.Enabled then return false end
        cur = cur.Parent
    end
    return true
end

-- is the hub window open? (taps must never land on it)
local function hubIsOpen()
    local ok, res = pcall(function()
        local main = Window.UIElements and Window.UIElements.Main
        if main and typeof(main) == "Instance" and main:IsA("GuiObject") then
            if Window.Closed == true then return false end
            return main.Visible and main.AbsoluteSize.X > 50 and main.AbsoluteSize.Y > 50
        end
        return Window.Closed == false
    end)
    return ok and res == true
end

local function closeHub()
    if hubIsOpen() then pcall(function() Window:Close() end) end
end

-- is a touch point on top of the hub window? (the hub can stay open while things run)
local function onHub(x, y)
    if not hubIsOpen() then return false end
    local hit = false
    pcall(function()
        local main = Window.UIElements.Main
        local p, sz = main.AbsolutePosition, main.AbsoluteSize
        local iy = game:GetService("GuiService"):GetGuiInset().Y
        local m = 24
        for _, off in ipairs({ 0, iy }) do
            if x >= p.X - m and x <= p.X + sz.X + m and y >= p.Y + off - m and y <= p.Y + sz.Y + off + m then hit = true end
        end
    end)
    return hit
end

local touchId = 100
local function touchTap()
    local cam = workspace.CurrentCamera
    local s = cam and cam.ViewportSize or Vector2.new(800, 400)
    -- tap on empty screen, never on the hub window or the throw bar in the middle
    local x, y
    for _, f in ipairs({ { 0.3, 0.55 }, { 0.08, 0.55 }, { 0.92, 0.55 }, { 0.5, 0.92 }, { 0.08, 0.2 }, { 0.92, 0.2 }, { 0.5, 0.08 } }) do
        local tx, ty = s.X * f[1], s.Y * f[2]
        if not onHub(tx, ty) then x, y = tx, ty break end
    end
    if not x then
        for _, fy in ipairs({ 0.55, 0.3, 0.8, 0.12, 0.95 }) do
            for _, fx in ipairs({ 0.02, 0.98, 0.15, 0.85, 0.5, 0.3, 0.7 }) do
                local tx, ty = s.X * fx, s.Y * fy
                if not onHub(tx, ty) then x, y = tx, ty break end
            end
            if x then break end
        end
    end
    if not x then x, y = s.X * 0.02, s.Y * 0.97 end      -- last resort: the very corner
    touchId += 1
    local id = touchId
    pcall(function()
        VirtualInputManager:SendTouchEvent(id, 0, x, y)
        task.defer(function()
            pcall(function() VirtualInputManager:SendTouchEvent(id, 2, x, y) end)
        end)
    end)
end

local farmAway = false
local refreshHooks
local lastClick, lastActivity = 0, tick()
local GuiService = game:GetService("GuiService")

local function getHRP()
    local c = LocalPlayer.Character
    return c and c:FindFirstChild("HumanoidRootPart")
end

-- press a button like a finger (touch in the middle of it) and fire its click handlers
local function pressButton(b)
    pcall(function()
        local inset = GuiService:GetGuiInset()
        local p, s = b.AbsolutePosition, b.AbsoluteSize
        local x, y = p.X + s.X / 2, p.Y + s.Y / 2 + inset.Y
        if onHub(x, y) then return end          -- the hub is in the way: use the click handler only
        touchId += 1
        local id = touchId
        VirtualInputManager:SendTouchEvent(id, 0, x, y)
        task.defer(function()
            pcall(function() VirtualInputManager:SendTouchEvent(id, 2, x, y) end)
        end)
    end)
    pcall(function()
        if getconnections and b:IsA("GuiButton") then
            for _, sig in ipairs({ b.Activated, b.MouseButton1Click, b.MouseButton1Down, b.MouseButton1Up }) do
                pcall(function()
                    for _, c in ipairs(getconnections(sig)) do c:Fire() end
                end)
            end
        end
    end)
end

local function findSkipButton()
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if d:IsA("GuiButton") and isShown(d) then
            local hit = d.Name:lower():find("skip")
            if not hit and d:IsA("TextButton") then hit = d.Text:lower():find("skip") end
            if not hit then
                for _, c in ipairs(d:GetChildren()) do
                    if c:IsA("TextLabel") and c.Text:lower():find("skip") then hit = true break end
                end
            end
            if hit then return d end
        end
    end
end

--------------------------------------------------------------------
-- INSTANT THROW (camera stays exactly where it was when you threw food,
-- and the cut scene is tapped through). Needs no game remotes.
--------------------------------------------------------------------
local camHist, camLocked, camSaved = {}, false, nil
local camLastTouch, camLockStart, baseCustom = 0, 0, true
local throwWindowUntil, throwMomentT = 0, 0
local camHoldAlways, camHoldSaved = false, nil

-- called the moment a throw happens (auto click or the bar stopping)
local function markThrow()
    Session.throws += 1
    logEvent("ok", "Threw food #" .. Session.throws)
    local now = tick()
    throwMomentT = now
    throwWindowUntil = now + 6
end

local function camAbnormal(cam, hum, hrp, char)
    if baseCustom and cam.CameraType ~= Enum.CameraType.Custom then return true end
    local sub = cam.CameraSubject
    if sub and char and not (sub == hum or sub == hrp or sub:IsDescendantOf(char)) then return true end
    if hrp and (cam.CFrame.Position - hrp.Position).Magnitude > 200 then return true end
    return false
end

local function camUnlock(restoreSaved)
    camLocked = false
    local cam = workspace.CurrentCamera
    if cam and restoreSaved and camSaved then
        pcall(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if camSaved.ct == Enum.CameraType.Scriptable then
                cam.CameraType = Enum.CameraType.Scriptable
                cam.CFrame = camSaved.cf
            else
                cam.CameraType = camSaved.ct
            end
            if hum then cam.CameraSubject = hum end
        end)
    end
end

local function onCamStep()
    local cam = workspace.CurrentCamera
    if not cam then return end

    -- Auto Farm: the screen never moves, whatever the game does
    if camHoldAlways and camHoldSaved then
        cam.CameraType = Enum.CameraType.Scriptable
        local cf = camHoldSaved.cf
        if camHoldSaved.follow then
            local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if h then cf = camHoldSaved.follow(h.Position) end
        end
        cam.CFrame = cf
        cam.FieldOfView = camHoldSaved.fov
        return
    end

    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local now = tick()
    local abn = camAbnormal(cam, hum, hrp, char)
    local inWindow = now < throwWindowUntil

    if not camLocked then
        if not abn and not inWindow then
            camHist[#camHist + 1] = { t = now, cf = cam.CFrame, fov = cam.FieldOfView, ct = cam.CameraType }
            while #camHist > 0 and now - camHist[1].t > 1.5 do table.remove(camHist, 1) end
            return
        end
        -- use the camera from just BEFORE the throw
        local cutoff = inWindow and (throwMomentT - 0.1) or (now - 0.15)
        local saved
        for i = #camHist, 1, -1 do
            if camHist[i].t <= cutoff then saved = camHist[i] break end
        end
        saved = saved or camHist[1]
        if not saved then return end
        camSaved, camLocked = saved, true
        camLastTouch, camLockStart = now, now
    end

    local saved = camSaved
    local touched = cam.CameraType ~= Enum.CameraType.Scriptable or cam.CFrame ~= saved.cf
    if touched then camLastTouch = now end

    if now >= throwWindowUntil then
        -- the game gave the camera back by itself
        if cam.CameraType ~= Enum.CameraType.Scriptable and not abn then
            camUnlock(false)
            camHist = {}
            return
        end
        -- nothing is moving the camera any more
        if not touched and now - camLastTouch > 0.6 then
            camUnlock(true)
            camHist = {}
            return
        end
    end
    if now - camLockStart > 10 then
        camUnlock(true)
        camHist = {}
        return
    end

    cam.CameraType = Enum.CameraType.Scriptable
    cam.CFrame = saved.cf
    cam.FieldOfView = saved.fov
end

-- Auto Farm uses this: freeze the screen at the current view the whole time
local function setCamHold(on, viewCF)
    camHoldAlways = on
    local cam = workspace.CurrentCamera
    if on then
        if camLocked then camUnlock(false) end
        if cam then
            local fn = type(viewCF) == "function" and viewCF or nil
            camHoldSaved = { cf = (not fn and viewCF) or cam.CFrame, follow = fn, fov = viewCF and 70 or cam.FieldOfView }
        end
    else
        camHoldSaved = nil
        pcall(function()
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if cam then
                cam.CameraType = Enum.CameraType.Custom
                if hum then cam.CameraSubject = hum end
            end
        end)
    end
end

local skipToken = 0
local lastSkipScan, skipBtn = 0, nil

local function setSkipCutscene(on)
    State.SkipCutscene = on
    skipToken += 1
    local my = skipToken
    pcall(function() RunService:UnbindFromRenderStep("KaidenInsta") end)
    if camLocked then camUnlock(true) end
    camHist = {}
    refreshHooks()
    if not on then return end
    local cam = workspace.CurrentCamera
    baseCustom = (cam == nil) or cam.CameraType == Enum.CameraType.Custom
    -- very late priority so nothing in the game can move the camera after us
    RunService:BindToRenderStep("KaidenInsta", 5000, function()
        pcall(onCamStep)
    end)
    -- tap through the cut scene (never while the throw bar is running)
    task.spawn(function()
        while State.SkipCutscene and skipToken == my do
            task.wait(0.07)
            pcall(function()
                local now = tick()
                local inScene = camLocked or farmAway or (now - lastClick < 12)
                if not inScene then return end
                if now - lastActivity < 0.6 then return end
                if now - lastSkipScan > 0.3 then
                    lastSkipScan = now
                    skipBtn = findSkipButton()
                end
                if skipBtn and skipBtn.Parent and isShown(skipBtn) then
                    pressButton(skipBtn)
                else
                    touchTap()
                end
            end)
        end
    end)
end

--------------------------------------------------------------------
-- AUTO PERFECT (always +20)
-- Predicts the bar and taps a little EARLY so lag can't make it land on 19,
-- and tunes its own timing from where the bar actually stopped.
--------------------------------------------------------------------
local PerfectConns = setmetatable({}, { __mode = "k" })
local Activity = setmetatable({}, { __mode = "k" })
local LastVal = setmetatable({}, { __mode = "k" })
local LastT = setmetatable({}, { __mode = "k" })
local LastPrev = setmetatable({}, { __mode = "k" })
local PerfectAdded
local Lead = 0.03            -- seconds a tap needs to reach the game (auto tuned)
local pendingAt, pendingLabel = nil, nil
local calib = nil
local barLabel = nil
local stopFlagged = false

local function fireThrowTap(label)
    lastClick = tick()
    pendingAt = nil
    markThrow()
    calib = { t = lastClick, label = label }
    touchTap()
end

local function onText(label)
    local n = tonumber((label.Text or ""):match("^%s*%+(%d+)%s*$"))
    if not n then return end
    local now = tick()
    lastActivity = now
    stopFlagged = false
    local a = Activity[label]
    if not a then a = {} Activity[label] = a end
    a[#a + 1] = now
    while #a > 0 and now - a[1] > 1.2 do table.remove(a, 1) end
    local prev, prevT = LastVal[label], LastT[label]
    LastPrev[label] = prev
    LastVal[label], LastT[label] = n, now
    barLabel = label

    if not State.AutoPerfect then return end
    if now - lastClick < State.ClickCooldown then return end
    if not label:IsDescendantOf(PlayerGui) then return end

    if n >= State.PerfectValue then
        fireThrowTap(label)               -- at the very top: tap now
        return
    end
    if prev and prevT and n > prev and n >= State.PerfectValue - 6 then
        local unit = (now - prevT) / (n - prev)      -- seconds per step of the bar
        if unit > 0 and unit < 0.5 then
            -- tap so it lands in the middle of the +20 step
            local at = now + (State.PerfectValue - n + 0.5) * unit - Lead
            pendingAt = math.max(at, now)
            pendingLabel = label
        end
    end
end

RunService.Heartbeat:Connect(function()
    local now = tick()

    -- predicted tap
    if pendingAt and now >= pendingAt then
        local label = pendingLabel
        pendingAt = nil
        if State.AutoPerfect and now - lastClick > State.ClickCooldown and now - lastActivity < 0.6 then
            fireThrowTap(label)
        end
    end

    -- fallback: read the bar every frame in case a text change was missed
    if State.AutoPerfect and barLabel and now - lastClick > State.ClickCooldown and now - lastActivity < 0.6 then
        local n = tonumber((barLabel.Text or ""):match("^%s*%+(%d+)%s*$"))
        if n and n >= State.PerfectValue and barLabel:IsDescendantOf(PlayerGui) then
            fireThrowTap(barLabel)
        end
    end

    -- self tuning: where did the bar stop after our tap?
    if calib and now - calib.t > 0.45 then
        local c = calib
        calib = nil
        local l = c.label
        local f, pv, ft = LastVal[l], LastPrev[l], LastT[l]
        if f and ft and ft < c.t + 0.35 and f < State.PerfectValue then
            if pv and pv > f then
                Lead = math.min(Lead + 0.012, 0.15)      -- stopped on the way down: too late
            elseif pv and pv < f then
                Lead = math.max(Lead - 0.012, 0)         -- stopped on the way up: too early
            end
        end
    end

    -- the bar stopped by itself (you tapped by hand): that is a throw too
    if barLabel and not stopFlagged then
        local a = Activity[barLabel]
        if a and #a >= 3 and now - lastActivity > 0.35 and now - lastActivity < 1.5 then
            stopFlagged = true
            if now - lastClick > 1 then markThrow() end
        end
    end
end)

local function hookLabel(d)
    if d:IsA("TextLabel") and not PerfectConns[d] then
        PerfectConns[d] = d:GetPropertyChangedSignal("Text"):Connect(function() onText(d) end)
    end
end

-- watch the "+N" labels while Auto Perfect or Instant Throw needs them
refreshHooks = function()
    local need = State.AutoPerfect or State.SkipCutscene
    if not need then
        if PerfectAdded then PerfectAdded:Disconnect() PerfectAdded = nil end
        for _, c in pairs(PerfectConns) do pcall(function() c:Disconnect() end) end
        table.clear(PerfectConns)
        return
    end
    if PerfectAdded then return end
    PerfectAdded = PlayerGui.DescendantAdded:Connect(hookLabel)
    task.spawn(function()
        local count = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            if not (State.AutoPerfect or State.SkipCutscene) then return end
            hookLabel(d)
            count += 1
            if count % 300 == 0 then task.wait() end
        end
    end)
    task.spawn(function()      -- keep looking: catches bars the game builds later
        while PerfectAdded and (State.AutoPerfect or State.SkipCutscene) do
            task.wait(4)
            local count = 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                hookLabel(d)
                count += 1
                if count % 300 == 0 then task.wait() end
            end
        end
    end)
end

local function setAutoPerfect(on)
    State.AutoPerfect = on
    pendingAt = nil
    refreshHooks()
end

--------------------------------------------------------------------
-- AUTO FARM (like the other script in your video):
-- stand just BEHIND the white line, then step FORWARD across it so the game
-- starts the throw. Auto Perfect throws at +20, Skip Cut Scene taps through the
-- cut scene, and when the game sends you back to base it does it all again.
-- Has a watchdog: if the throw bar does not show up it recovers by itself.
--------------------------------------------------------------------
-- Auto Throw: point A -> wait -> point B -> wait -> a little to the left (all teleports, no walking)
local FARM_A = Vector3.new(-42.216461181640625, 5.498024940490723, -37.521575927734375)
local FARM_B = Vector3.new(-4.8307905197143555, 5.498024940490723, -38.05541229248047)
local FARM_OLD = Vector3.new(11.631648063659668, 5.49774694442749, -40.09320068359375)
local FARM_DIR = Vector3.new(FARM_B.X - FARM_A.X, 0, FARM_B.Z - FARM_A.Z).Unit
-- after B, jump a little to the LEFT (as seen from the way you face) instead of walking
local FARM_LEFT = 5
local FARM_C = FARM_B + (-CFrame.lookAt(Vector3.zero, FARM_DIR).RightVector) * FARM_LEFT
local FarmPos = FARM_B
local farmRot
local farmToken = 0
local farmOwnsPerfect, farmOwnsSkip = false, false
local PerfectToggle, SkipToggle, FarmToggle
local farmStartHook, boostHook

-- make sure nothing is still holding the player or the camera
local function freeControl()
    if camLocked then camUnlock(true) end
    local c = LocalPlayer.Character
    local hrp = c and c:FindFirstChild("HumanoidRootPart")
    local hum = c and c:FindFirstChildOfClass("Humanoid")
    pcall(function()
        if hrp then hrp.Anchored = false end
        if hum then
            hum.PlatformStand = false
            hum.Sit = false
        end
        local cam = workspace.CurrentCamera
        if cam and hum and baseCustom and not camHoldAlways then
            cam.CameraType = Enum.CameraType.Custom
            cam.CameraSubject = hum
        end
    end)
end

local function tpTo(pos, dir)
    freeControl()
    local hrp = getHRP()
    if not hrp then return false end
    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        if dir then
            hrp.CFrame = CFrame.lookAt(pos, pos + dir)
        else
            hrp.CFrame = CFrame.new(pos) * (farmRot or CFrame.new())
        end
    end)
    return true
end

-- distance to the throw area (point A, point B, or the old spot - the game may push you a bit)
local function farmDistance(pos)
    local best = math.huge
    for _, p in ipairs({ FARM_A, FARM_B, FARM_C, FARM_OLD }) do
        local d = (pos - p).Magnitude
        if d < best then best = d end
    end
    return best
end

-- point A -> point B -> a little to the left: no delay (one frame between each so the game sees every position)
local function approachFarm(delay)
    Session.lastAction = "going to point A"
    if not tpTo(FARM_A, FARM_DIR) then return false end
    if delay then task.wait(delay) else task.wait() end
    Session.lastAction = "going to point B"
    if not tpTo(FARM_B, FARM_DIR) then return false end
    task.wait()
    Session.lastAction = "going a little left"
    local ok = tpTo(FARM_C, FARM_DIR)
    Session.lastAction = "at the throw spot"
    return ok
end

local function tpToFarm() return approachFarm() end

-- where the game leaves the player after a throw (used by the stuck-recovery)
local basePos = nil

-- last resort that NEVER kills you: back to base for a moment, then the whole route again
local function softReset()
    Session.lastAction = "going back to base"
    if basePos then tpTo(basePos) end
    task.wait(2)
    approachFarm(0.4)
end

-- escalating self-repair when the throw bar does not show up
local function recover(stage)
    if stage == 1 then
        approachFarm()                       -- A -> B again
    elseif stage == 2 then
        approachFarm(0.9)                    -- A -> B again, with a longer pause at A
    else
        softReset()                          -- back to base for a moment so the game resets itself
    end
end

--------------------------------------------------------------------
-- VISUAL LOCK (while farming): lighting, post effects and the camera
-- can NOT be changed by the game. New blur / color / bloom effects the
-- game adds when you throw are switched off the moment they appear.
--------------------------------------------------------------------
local visLock, visUnlock
do
local VIS_PROPS = {
    "Ambient", "OutdoorAmbient", "Brightness", "ClockTime", "ColorShift_Top", "ColorShift_Bottom",
    "FogColor", "FogEnd", "FogStart", "ExposureCompensation", "GlobalShadows",
    "EnvironmentDiffuseScale", "EnvironmentSpecularScale", "ShadowSoftness",
}
local FX_PROPS = {
    BlurEffect = { "Enabled", "Size" },
    ColorCorrectionEffect = { "Enabled", "Brightness", "Contrast", "Saturation", "TintColor" },
    BloomEffect = { "Enabled", "Intensity", "Size", "Threshold" },
    SunRaysEffect = { "Enabled", "Intensity", "Spread" },
    DepthOfFieldEffect = { "Enabled", "FarIntensity", "FocusDistance", "InFocusRadius", "NearIntensity" },
    Atmosphere = { "Density", "Offset", "Color", "Decay", "Glare", "Haze" },
}
local Vis = {
    on = false, props = {}, conns = {},
    fx = setmetatable({}, { __mode = "k" }),
    extra = setmetatable({}, { __mode = "k" }),
}

local function visWatch(inst, isNew)
    local list = FX_PROPS[inst.ClassName]
    if not list or Vis.fx[inst] or Vis.extra[inst] then return end
    if isNew then
        if inst:IsA("PostEffect") then
            Vis.extra[inst] = true
            pcall(function() inst.Enabled = false end)
        end
    else
        local snap = {}
        for _, p in ipairs(list) do pcall(function() snap[p] = inst[p] end) end
        Vis.fx[inst] = snap
    end
end

local function visEnforce()
    for p, v in pairs(Vis.props) do
        local ok, cur = pcall(function() return Lighting[p] end)
        if ok and cur ~= v then pcall(function() Lighting[p] = v end) end
    end
    for inst, snap in pairs(Vis.fx) do
        if inst.Parent then
            for p, v in pairs(snap) do
                local ok, cur = pcall(function() return inst[p] end)
                if ok and cur ~= v then pcall(function() inst[p] = v end) end
            end
        end
    end
    for inst in pairs(Vis.extra) do
        if inst.Parent and inst.Enabled then pcall(function() inst.Enabled = false end) end
    end
end

local function visHookCamera(cam)
    if not cam then return end
    for _, d in ipairs(cam:GetDescendants()) do visWatch(d, false) end
    Vis.conns[#Vis.conns + 1] = cam.DescendantAdded:Connect(function(d)
        if Vis.on then visWatch(d, true) end
    end)
end

visUnlock = function()
    if not Vis.on then return end
    Vis.on = false
    pcall(function() RunService:UnbindFromRenderStep("KaidenVisLock") end)
    for _, c in ipairs(Vis.conns) do pcall(function() c:Disconnect() end) end
    table.clear(Vis.conns)
    table.clear(Vis.props)
    table.clear(Vis.fx)
    table.clear(Vis.extra)
end

visLock = function()
    if Vis.on then return end
    Vis.on = true
    for _, p in ipairs(VIS_PROPS) do pcall(function() Vis.props[p] = Lighting[p] end) end
    for _, d in ipairs(Lighting:GetDescendants()) do visWatch(d, false) end
    Vis.conns[#Vis.conns + 1] = Lighting.DescendantAdded:Connect(function(d)
        if Vis.on then visWatch(d, true) end
    end)
    visHookCamera(workspace.CurrentCamera)
    Vis.conns[#Vis.conns + 1] = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        if Vis.on then visHookCamera(workspace.CurrentCamera) end
    end)
    -- runs after everything else every frame, so the player never sees a change
    RunService:BindToRenderStep("KaidenVisLock", 5001, function() pcall(visEnforce) end)
end
end -- vis lock

local function setAutoFarm(on)
    State.AutoFarm = on
    farmToken += 1
    local my = farmToken
    if not on then
        farmAway = false
        Session.farmStatus = "Stopped"
        logEvent("stop", "Auto Throw stopped")
        setCamHold(false)
        visUnlock()
        if farmOwnsPerfect then
            farmOwnsPerfect = false
            setAutoPerfect(false)
            pcall(function() PerfectToggle:Set(false) end)
        end
        if farmOwnsSkip then
            farmOwnsSkip = false
            setSkipCutscene(false)
            pcall(function() SkipToggle:Set(false) end)
        end
        return
    end

    -- farm needs Perfect Meter (Auto Perfect, 20x) and Skip Cut Scene
    if not State.AutoPerfect then
        farmOwnsPerfect = true
        setAutoPerfect(true)
        pcall(function() PerfectToggle:Set(true) end)
    end
    if not State.SkipCutscene then
        farmOwnsSkip = true
        setSkipCutscene(true)
        pcall(function() SkipToggle:Set(true) end)
    end

    if farmStartHook then pcall(farmStartHook) end
    closeHub()
    -- camera: straight above your head, as far up as it goes (max zoom), following you
    local CAM_UP, CAM_BACK = 90, 14
    setCamHold(true, function(pos)
        return CFrame.lookAt(pos + Vector3.new(0, CAM_UP, 0) - FARM_DIR * CAM_BACK, pos)
    end)
    visLock()
    Session.farmStatus = "Starting"
    logEvent("ok", "Auto Throw started")
    task.spawn(function()
        table.clear(Activity)
        table.clear(LastVal)
        pcall(tpToFarm)
        local arrive = tick()
        lastActivity = arrive
        local lastProgress = arrive          -- last time a throw happened
        local stage = 0
        local awaySince, stillSince = nil, nil
        local wasDead, resets = false, 0
        local lastPos, lastHp, lastDmgLog = Vector3.zero, 100, 0
        local FIX_TEXT = {
            "going to A, B and a little left again", "same again with a longer pause at A",
            "going back to base and trying again", "going back to base again (never respawns you)",
        }
        -- how long to wait at each stage before trying the next fix (seconds)
        local STAGE_WAIT = { [0] = 3, 4, 6, 15, 30 }

        while State.AutoFarm and farmToken == my do
            task.wait(0.07)
            -- every pass is protected: an error can never stop the farm
            local ok, err = pcall(function()
                local now = tick()
                if lastClick > lastProgress then lastProgress = lastClick end

                -- watchdog: no throw for 90s whatever happened -> respawn and start over
                if now - lastProgress > 90 then
                    lastProgress = now
                    stage = 0
                    awaySince, stillSince = nil, nil
                    Session.farmStatus = "Fixing a problem (no throw for 90s)"
                    logEvent("bug", "No throw for 90 seconds - starting over from base")
                    softReset()
                    arrive = tick()
                    lastActivity = arrive
                    return
                end

                local hrp = getHRP()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if not hrp or (hum and hum.Health <= 0) then
                    -- respawning
                    farmAway = true
                    awaySince, stillSince = nil, nil
                    if not wasDead then
                        wasDead = true
                        Session.farmStatus = "Respawning"
                        logEvent("bug", string.format("You died at (%.0f, %.0f, %.0f) while %s - waiting for respawn",
                            lastPos.X, lastPos.Y, lastPos.Z, tostring(Session.lastAction)))
                    end
                    return
                end
                lastPos = hrp.Position
                if hum then
                    if lastHp - hum.Health > 0.5 and now - lastDmgLog > 2 then
                        lastDmgLog = now
                        logEvent("bug", string.format("Took damage (%.0f -> %.0f) at (%.0f, %.0f, %.0f) while %s",
                            lastHp, hum.Health, lastPos.X, lastPos.Y, lastPos.Z, tostring(Session.lastAction)))
                    end
                    lastHp = hum.Health
                end
                if wasDead then
                    wasDead = false
                    logEvent("ok", "Respawned - heading back to the throw spot")
                end
                if hrp.Position.Y < -80 then
                    -- fell out of the map: put the player back on the spot
                    logEvent("bug", "Fell out of the map - teleporting back")
                    approachFarm()
                    arrive = tick()
                    lastActivity = arrive
                    return
                end

                local dist = farmDistance(hrp.Position)
                if dist <= 14 then
                    -- at the throw spot (we put you here, or the game put you back here)
                    farmAway = false
                    awaySince, stillSince = nil, nil
                    if lastActivity > arrive then              -- the bar showed up: all good
                        if stage > 0 then logEvent("ok", "Fixed - the throw bar is back") end
                        stage, resets = 0, 0
                    end
                    Session.farmStatus = "Throwing"
                    local threw = lastClick > arrive
                    local idle = now - math.max(arrive, lastActivity, lastClick)
                    -- no throw yet: fix it fast. Already threw: give the cut scene time
                    local limit = (threw and stage == 0) and 10 or STAGE_WAIT[stage]
                    if idle > limit then
                        stage = math.min(stage + 1, 4)
                        Session.farmStatus = "Fixing a problem (" .. stage .. "/4)"
                        logEvent("bug", "Stuck at the throw spot - " .. FIX_TEXT[stage])
                        if stage == 4 then
                            resets += 1
                            if resets >= 3 then
                                logEvent("stop", "Still stuck after " .. resets .. " tries - keeps trying")
                            end
                        end
                        recover(stage)
                        arrive = tick()
                    end
                else
                    -- sent back to base: wait until the game is completely done with you
                    -- (cut scene over, walking to eat finished), then go back
                    farmAway = true
                    Session.farmStatus = "Back at base - waiting"
                    awaySince = awaySince or now
                    local waited = now - awaySince
                    local v = hrp.AssemblyLinearVelocity
                    local speed = Vector3.new(v.X, 0, v.Z).Magnitude
                    local moving = speed > 1.5 or (hum and hum.MoveDirection.Magnitude > 0.1)
                    if moving then
                        stillSince = nil
                    else
                        stillSince = stillSince or now
                        basePos = hrp.Position
                    end
                    local still = stillSince and now - stillSince >= 0.3
                    local settled = (not camLocked) and waited >= State.FarmDelay and still and now - lastActivity > 0.5
                    if settled or waited >= 10 then
                        if not settled then logEvent("bug", "Waited 10s at base - going back anyway") end
                        table.clear(Activity)
                        table.clear(LastVal)
                        tpToFarm()
                        logEvent("ok", "Back at the throw spot")
                        arrive = tick()
                        lastActivity = arrive
                        awaySince, stillSince = nil, nil
                        farmAway = false
                    end
                end
            end)
            if not ok then
                warn("[KaidenHub] auto farm error (ignored): " .. tostring(err))
                logEvent("bug", "Farm error (ignored): " .. tostring(err):sub(1, 80))
            end
        end
        farmAway = false
    end)
end

--------------------------------------------------------------------
-- FEATURES (everything below is automatic - no sliders to tune)
--------------------------------------------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

local function dbg(...)
    if State.Debug then print("[KaidenHub]", ...) end
end

-- small file helpers (saved next to the hub's other files)
local function saveFile(name, text)
    pcall(function()
        if makefolder and not isfolder("KaidenHub") then makefolder("KaidenHub") end
        writefile("KaidenHub/" .. name, text)
    end)
end
local function loadFile(name)
    local ok, res = pcall(function() return readfile("KaidenHub/" .. name) end)
    if ok then return res end
end

-- remotes (exactly the calls you gave me)
local remoteCache = {}
local function getRemote(name)
    local r = remoteCache[name]
    if r and r.Parent then return r end
    local folder = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:WaitForChild("Remotes", 5)
    r = folder and (folder:FindFirstChild(name) or folder:WaitForChild(name, 5))
    remoteCache[name] = r
    return r
end

local missingWarned = {}
local function invoke(name, ...)
    local r = getRemote(name)
    if not r then
        if not missingWarned[name] then
            missingWarned[name] = true
            logEvent("stop", "Remote " .. name .. " not found")
        end
        return false, nil
    end
    local args = table.pack(...)
    return pcall(function()
        if r:IsA("RemoteFunction") then
            return r:InvokeServer(table.unpack(args, 1, args.n))
        end
        r:FireServer(table.unpack(args, 1, args.n))
        return true
    end)
end

--------------------------------------------------------------------
-- MONEY / HUD READER ($843Td, $2.53Td/s, Level 1571 ...)
--------------------------------------------------------------------
local parseAmount, fmtAmount, readCash, readIncome, readLevel
local function cleanText(t)
    return ((t or ""):gsub("<[^>]+>", ""))
end
do
local SUFFIX = {
    K = 1e3, M = 1e6, B = 1e9, T = 1e12, Qa = 1e15, Qi = 1e18, Sx = 1e21, Sp = 1e24,
    Oc = 1e27, No = 1e30, Dc = 1e33, Ud = 1e36, Dd = 1e39, Td = 1e42, Qad = 1e45,
    Qid = 1e48, Sxd = 1e51, Spd = 1e54, Ocd = 1e57, Nod = 1e60, Vg = 1e63,
}
local SUFFIX_LIST = {}
for k, v in pairs(SUFFIX) do SUFFIX_LIST[#SUFFIX_LIST + 1] = { k, v } end
table.sort(SUFFIX_LIST, function(a, b) return a[2] < b[2] end)


parseAmount = function(txt)
    txt = cleanText(txt):gsub(",", "")
    local num, suf = txt:match("^%s*%$?%s*([%d%.]+)%s*(%a*)")
    num = tonumber(num)
    if not num then return nil end
    if suf == "" then return num end
    local m = SUFFIX[suf]
    return m and num * m or nil
end

fmtAmount = function(n)
    if type(n) ~= "number" then return tostring(n or "?") end
    if n < 1000 then return string.format("%.0f", n) end
    local best
    for _, e in ipairs(SUFFIX_LIST) do
        if n >= e[2] then best = e end
    end
    if not best then return tostring(n) end
    return string.format("%.2f%s", n / best[2], best[1])
end

local hud = { cash = nil, income = nil, level = nil, scanned = 0 }

local function scanHud()
    hud.scanned = tick()
    local cam = workspace.CurrentCamera
    local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
    local incY = math.huge
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if d:IsA("TextLabel") and d.Text ~= "" and isShown(d) then
            local t = cleanText(d.Text)
            local p = d.AbsolutePosition
            if t:find("^%s*%$[%d%.,]+%s*%a*%s*/%s*[sS]%s*$") then
                -- income per second sits at the top of the screen (the bottom ones are animal prices)
                if p.Y < vp.Y * 0.25 and p.Y < incY then
                    incY = p.Y
                    hud.income = d
                end
            elseif t:find("^%s*%$[%d%.,]+%s*%a*%s*$") then
                -- the cash counter sits in the bottom left of the screen
                if p.X < vp.X * 0.4 and p.Y > vp.Y * 0.55 then hud.cash = hud.cash or d end
            elseif t:find("^%s*[Ll]evel%s*%d+") then
                hud.level = hud.level or d
            end
        end
    end
end

local function hudLabel(key)
    local l = hud[key]
    if (not l or not l.Parent) and tick() - hud.scanned > 15 then
        hud[key] = nil
        scanHud()
        l = hud[key]
    end
    if l and l.Parent then return l end
end

readCash = function()
    -- leaderstats first, then the number on screen
    local ls = LocalPlayer:FindFirstChild("leaderstats")
    if ls then
        for _, v in ipairs(ls:GetChildren()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                local n = v.Name:lower()
                if n:find("cash") or n:find("money") or n:find("coin") then return v.Value end
            end
        end
    end
    local l = hudLabel("cash")
    return l and parseAmount(l.Text) or nil
end

readIncome = function()
    local l = hudLabel("income")
    return l and parseAmount(l.Text) or nil
end

readLevel = function()
    local l = hudLabel("level")
    return l and tonumber(cleanText(l.Text):match("[Ll]evel%s*(%d+)")) or nil
end
end -- hud

--------------------------------------------------------------------
-- LOOPS
--------------------------------------------------------------------
local loopTok = {}
local function loopWhile(flag, delay, fn)
    loopTok[flag] = (loopTok[flag] or 0) + 1
    local my = loopTok[flag]
    task.spawn(function()
        while State[flag] and loopTok[flag] == my do
            pcall(fn)
            task.wait(delay)
        end
    end)
end

local Features = {}
local function bindFeature(flag, delay)
    return function(v)
        State[flag] = v
        if v then
            loopWhile(flag, type(delay) == "function" and delay() or delay or 0.2, Features[flag])
        end
    end
end

--------------------------------------------------------------------
-- AUTO 2x PRESS: presses the round "2x" button with the same touch
-- method Auto Perfect uses (touch in the middle + the button's click)
--------------------------------------------------------------------
local Press2x = { count = 0, btn = nil, scanned = 0 }

local function find2x()
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if (d:IsA("TextLabel") or d:IsA("TextButton")) and d.Text ~= "" and isShown(d) then
            local t = cleanText(d.Text):gsub("%s+", ""):lower()
            if t == "x2" or t == "2x" or t == "×2" or t == "2×" then
                local target
                local cur = d
                while cur and cur ~= PlayerGui do
                    if cur:IsA("GuiButton") then target = cur break end
                    cur = cur.Parent
                end
                target = target or (d.Parent and d.Parent:IsA("GuiObject") and d.Parent) or d
                local s = target.AbsoluteSize
                -- the real one is a small round button (not a shop banner)
                if s.X >= 40 and s.X <= 240 and s.Y > 0 and math.abs(s.X / s.Y - 1) < 0.4 then
                    return target
                end
            end
        end
    end
end

Features.Auto2xPress = function()
    local b = Press2x.btn
    if not (b and b.Parent and isShown(b)) then
        Press2x.btn = nil
        if tick() - Press2x.scanned < 1 then return end
        Press2x.scanned = tick()
        b = find2x()
        Press2x.btn = b
    end
    if b then
        pressButton(b)
        Press2x.count += 1
    end
end

--------------------------------------------------------------------
-- AUTO TRAIN: stand inside the white circle at the bar and keep training
--------------------------------------------------------------------
local TrainSpot = nil
do
    local saved = loadFile("trainspot2.json")
    if saved then
        local ok, t = pcall(function() return HttpService:JSONDecode(saved) end)
        if ok and type(t) == "table" and t.x then TrainSpot = Vector3.new(t.x, t.y, t.z) end
    end
end

local function saveTrainSpot(pos)
    TrainSpot = pos
    saveFile("trainspot2.json", HttpService:JSONEncode({ x = pos.X, y = pos.Y, z = pos.Z }))
end

local TRAIN_WORDS = { "circle", "train", "pullup", "pull_up", "workout", "gym", "zone" }
local BAD_WORDS = { "shop", "store", "buy", "sell", "stand", "upgrade", "fence", "merchant", "npc", "vendor", "price", "spawn", "plot", "base" }
local function hasWord(str, list)
    str = str:lower()
    for _, w in ipairs(list) do
        if str:find(w, 1, true) then return true end
    end
    return false
end
-- only a flat, white disc named like a training circle counts (never the shop)
local function findTrainCircle()
    local hrp = getHRP()
    if not hrp then return nil end
    local best, bd = nil, 1500
    for _, d in ipairs(workspace:GetDescendants()) do
        if d:IsA("BasePart") and hasWord(d.Name, TRAIN_WORDS) then
            local full = d:GetFullName()
            local m = d:FindFirstAncestorOfClass("Model")
            local isChar = m and m:FindFirstChildOfClass("Humanoid")
            local sz = d.Size
            local flat = math.min(sz.X, sz.Y, sz.Z) <= 3 and math.max(sz.X, sz.Y, sz.Z) >= 5
            local c = d.Color
            local white = (c.R + c.G + c.B) / 3 > 0.82
            if not isChar and flat and white and not hasWord(full, BAD_WORDS) then
                local dist = (d.Position - hrp.Position).Magnitude
                if dist < bd then best, bd = d, dist end
            end
        end
    end
    if best then return best.Position + Vector3.new(0, best.Size.Y / 2 + 3, 0) end
end

local stopBtn, stopScan = nil, 0
local function isTraining()
    if stopBtn and stopBtn.Parent and isShown(stopBtn) then return true end
    stopBtn = nil
    if tick() - stopScan < 2.5 then return false end
    stopScan = tick()
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if (d:IsA("TextButton") or d:IsA("TextLabel")) and cleanText(d.Text):lower():gsub("%s+", "") == "stop" and isShown(d) then
            stopBtn = d
            return true
        end
    end
    return false
end

local TrainToggle
local trainToken = 0
local function setAutoTrain(on)
    on = false                       -- Auto Train is not available for now
    State.AutoTrain = on
    trainToken += 1
    local my = trainToken
    if not on then return end

    if State.AutoFarm then
        pcall(function() FarmToggle:Set(false) end)
        if State.AutoFarm then setAutoFarm(false) end
    end
    closeHub()

    task.spawn(function()
        local spot = TrainSpot or findTrainCircle()
        if not spot then
            notify("Auto Train", "Stand inside the white circle and press 'Save Train Spot' first (one time).")
            State.AutoTrain = false
            pcall(function() TrainToggle:Set(false) end)
            return
        end
        local lastGood = tick()
        local failed = 0
        while State.AutoTrain and trainToken == my do
            task.wait(0.25)
            pcall(function()
                local hrp = getHRP()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if not hrp or (hum and hum.Health <= 0) then return end
                local flat = Vector3.new(hrp.Position.X - spot.X, 0, hrp.Position.Z - spot.Z).Magnitude
                if flat > 6 or math.abs(hrp.Position.Y - spot.Y) > 12 then
                    tpTo(spot)
                    lastGood = tick()
                    return
                end
                if isTraining() then
                    lastGood = tick()
                    failed = 0
                elseif tick() - lastGood > 4 then
                    -- not training: step out of the circle and back in
                    failed += 1
                    logEvent("bug", "Auto Train: not training - stepping out and back in the circle")
                    tpTo(spot + Vector3.new(0, 0, 9))
                    task.wait(0.35)
                    tpTo(spot)
                    lastGood = tick()
                    if failed >= 6 then
                        logEvent("bug", "Auto Train: could not start training - still trying")
                        failed = 0
                    end
                end
            end)
        end
    end)
end

--------------------------------------------------------------------
-- EQUIP BEST / STAND UPGRADE / BUY NEXT FOOD  (your remotes)
--------------------------------------------------------------------
Features.AutoEquipBest = function()
    invoke("Plot_EquipBest")
end
-- fixed: every 12 seconds
local EQUIP_DELAY = 12

Features.AutoStand = function()
    invoke("Stand_Upgrade")
end

Features.AutoFence = function()
    invoke("Plot_UpgradeFence")
end

local BuyFoodToggle
local FOOD_MAX = 42
do
    local n = tonumber(loadFile("nextfood.txt") or "")
    if n and n >= 1 and n <= FOOD_MAX + 1 then State.NextFood = math.floor(n) end
end

local FoodState = { fails = 0, failCash = nil, nextAt = 0, logged = 0 }
local function foodAdvance(why)
    State.NextFood += 1
    FoodState.fails, FoodState.failCash = 0, nil
    saveFile("nextfood.txt", tostring(State.NextFood))
    dbg("food ->", State.NextFood, why or "")
end

Features.AutoBuyFood = function()
    if tick() < FoodState.nextAt then return end
    local i = State.NextFood
    if i > FOOD_MAX then
        State.AutoBuyFood = false
        pcall(function() BuyFoodToggle:Set(false) end)
        notify("Auto Buy Food", "All " .. FOOD_MAX .. " foods bought")
        return
    end
    local before = readCash()
    local ok, res = invoke("Shop_Buy", i)
    if State.Debug and FoodState.logged < 12 then
        FoodState.logged += 1
        dbg("Shop_Buy(" .. i .. ") ->", ok, typeof(res), tostring(res))
    end
    task.wait(0.2)
    local after = readCash()

    local explicit = res == true or (type(res) == "table" and (res.success == true or res.Success == true))
    local text = type(res) == "string" and res:lower() or ""
    local owned = text:find("own") or text:find("already")
    local denied = res == false or text:find("not enough") or text:find("cannot") or text:find("fail") or text:find("afford")
    local dropped = before and after and after < before * 0.999

    if ok and (explicit or (dropped and not denied)) then
        Session.bought += 1
        notify("Auto Buy Food", "Bought food #" .. i)
        foodAdvance("bought")
        FoodState.nextAt = tick() + 0.3
    elseif ok and owned then
        foodAdvance("already owned")
        FoodState.nextAt = tick() + 0.1
    else
        -- not enough money yet: look again soon
        FoodState.fails += 1
        FoodState.failCash = FoodState.failCash or before
        -- failing for a long time while the money grew a lot = this one is already owned
        if FoodState.fails >= 8 and before and FoodState.failCash and before >= FoodState.failCash * 20 then
            foodAdvance("skipped (probably owned)")
        end
        FoodState.nextAt = tick() + 1.5
    end
end

--------------------------------------------------------------------
-- CATCHES (automatic): animal + rarity + income -> panel + Discord
--------------------------------------------------------------------
local Catches = {}            -- newest first

local CatchesPara, StatusPara
local function refreshPanels()
    pcall(function()
        local lines = {}
        for i = 1, math.min(#Catches, 8) do
            local c = Catches[i]
            local nm = c.animal
            if c.mutation and not nm:lower():find(c.mutation:lower(), 1, true) then nm = c.mutation .. " " .. nm end
            lines[#lines + 1] = string.format("%s  •  %s  •  %s", nm, c.rarity, c.income or "-")
        end
        if #lines == 0 then lines[1] = "nothing yet" end
        lines[#lines + 1] = ""
        lines[#lines + 1] = #Catches .. " rows"
        if CatchesPara then CatchesPara:SetDesc(table.concat(lines, "\n")) end
    end)
    pcall(function()
        local cash, inc, lvl = readCash(), readIncome(), readLevel()
        local t = {
            "Cash: " .. (cash and ("$" .. fmtAmount(cash)) or "?"),
            "Income: " .. (inc and ("$" .. fmtAmount(inc) .. "/s") or "?"),
            "Level: " .. (lvl or "?"),
            "2x presses: " .. Press2x.count,
            "Throws: " .. Session.throws,
            "Catches: " .. Session.catches,
            "Grinding: " .. fmtClock(tick() - Session.start),
            "Next food: #" .. math.min(State.NextFood, FOOD_MAX) .. (State.NextFood > FOOD_MAX and " (done)" or ""),
        }
        if StatusPara then StatusPara:SetDesc(table.concat(t, "\n")) end
    end)
end


do
local RARITY = {
    common = true, uncommon = true, rare = true, epic = true, legendary = true, mythic = true,
    mythical = true, divine = true, secret = true, godly = true, exotic = true, celestial = true,
    cosmic = true, exclusive = true, transcendent = true, supreme = true,
}

local RARITY_RANK = {
    Common = 1, Uncommon = 2, Rare = 3, Epic = 4, Legendary = 5, Mythic = 6, Mythical = 6,
    Godly = 7, Exotic = 7, Exclusive = 7, Divine = 7, Secret = 8, Celestial = 8, Cosmic = 8,
    Transcendent = 9, Supreme = 9,
}
local MUTATIONS = {
    gold = true, golden = true, diamond = true, rainbow = true, shiny = true, void = true, lava = true,
    galaxy = true, neon = true, glitch = true, emerald = true, ruby = true, candy = true, frozen = true,
    ice = true, radioactive = true, toxic = true, cursed = true, blessed = true, shadow = true,
    crystal = true, silver = true, plasma = true, celestial = true,
}

local function rarityOf(s)
    if type(s) ~= "string" then return nil end
    local l = cleanText(s):lower():gsub("[%s%[%]%(%)]", "")
    if RARITY[l] then return (l:gsub("^%l", string.upper)) end
end

local function mutationOf(s)
    if type(s) ~= "string" then return nil end
    local l = cleanText(s):lower():gsub("[%s%[%]%(%)]", "")
    if MUTATIONS[l] then return (l:gsub("^%l", string.upper)) end
end

local function betterCatch(a, b)
    if not b then return true end
    if a.incomeN and b.incomeN and a.incomeN ~= b.incomeN then return a.incomeN > b.incomeN end
    local ra, rb = RARITY_RANK[a.rarity] or 0, RARITY_RANK[b.rarity] or 0
    if ra ~= rb then return ra > rb end
    return (a.incomeN or 0) > (b.incomeN or 0)
end

local recentKey = {}
local function recordCatch(animal, rarity, income, mutation)
    if not animal or not rarity then return end
    if not mutation then
        local first = animal:match("^(%a+)%s")
        mutation = mutationOf(first)
    end
    local now = tick()
    local key = animal .. "|" .. rarity .. "|" .. tostring(mutation)
    if recentKey[key] and now - recentKey[key] < 4 then return end
    recentKey[key] = now
    -- a catch only happens right after a throw
    if now - math.max(lastClick, throwMomentT) > 25 then return end

    local incText = income
    if type(income) == "number" then incText = "$" .. fmtAmount(income) .. "/s" end
    local incomeN = type(income) == "number" and income or (type(income) == "string" and parseAmount(income)) or nil
    local entry = { animal = animal, rarity = rarity, income = incText, incomeN = incomeN, mutation = mutation }
    table.insert(Catches, 1, entry)
    while #Catches > 30 do table.remove(Catches) end
    Session.catches += 1
    if betterCatch(entry, Session.best) then Session.best = entry end
    logEvent("ok", "Caught " .. (mutation and (mutation .. " ") or "") .. animal .. " (" .. rarity .. ")")
    refreshPanels()

end

-- (a) from the game's remote events
local function collect(v, out, depth, key)
    if depth > 3 then return end
    local t = typeof(v)
    if t == "string" then
        out.strings[#out.strings + 1] = { v, key }
    elseif t == "number" then
        out.numbers[#out.numbers + 1] = { v, key }
    elseif t == "Instance" then
        out.strings[#out.strings + 1] = { v.Name, key or "name" }
    elseif t == "table" then
        for k, x in pairs(v) do
            collect(x, out, depth + 1, type(k) == "string" and k or key)
        end
    end
end

local function looksLikeName(s)
    return #s >= 2 and #s <= 32 and s:find("%a") and not s:find("[%$/]") and not rarityOf(s) and not mutationOf(s)
end

local function analyzeArgs(...)
    local out = { strings = {}, numbers = {} }
    for i = 1, select("#", ...) do collect((select(i, ...)), out, 0, nil) end
    local rarity
    for _, e in ipairs(out.strings) do
        rarity = rarity or rarityOf(e[1])
    end
    if not rarity then return end
    local name
    for _, e in ipairs(out.strings) do
        local k = e[2] and tostring(e[2]):lower() or ""
        if (k:find("name") or k:find("animal") or k:find("pet")) and looksLikeName(e[1]) then name = e[1] break end
    end
    if not name then
        for _, e in ipairs(out.strings) do
            if looksLikeName(e[1]) then name = e[1] break end
        end
    end
    local mutation
    for _, e in ipairs(out.strings) do
        local k = e[2] and tostring(e[2]):lower() or ""
        local m = mutationOf(e[1])
        if m then mutation = m break end
        if k:find("mutat") and #e[1] > 1 then
            local l = e[1]:lower()
            if l ~= "none" and l ~= "normal" and l ~= "no" then mutation = e[1] break end
        end
    end
    local income
    for _, e in ipairs(out.numbers) do
        local k = e[2] and tostring(e[2]):lower() or ""
        if k:find("income") or k:find("cps") or k:find("earn") or k:find("money") or k:find("cash") or k:find("rate") then
            income = e[1] break
        end
    end
    if not income then
        for _, e in ipairs(out.strings) do
            if e[1]:find("^%s*%$") then income = cleanText(e[1]) break end
        end
    end
    return name, rarity, income, mutation
end

local hookedRemotes = setmetatable({}, { __mode = "k" })
local function hookRemote(r)
    if hookedRemotes[r] or not r:IsA("RemoteEvent") then return end
    hookedRemotes[r] = true
    r.OnClientEvent:Connect(function(...)
        if tick() - math.max(lastClick, throwMomentT) > 25 then return end   -- only right after a throw
        local ok, name, rarity, income, mutation = pcall(analyzeArgs, ...)
        if ok and name and rarity then
            dbg("remote", r.Name, "->", name, rarity, income, mutation)
            recordCatch(name, rarity, income, mutation)
        end
    end)
end
for _, d in ipairs(ReplicatedStorage:GetDescendants()) do hookRemote(d) end
ReplicatedStorage.DescendantAdded:Connect(hookRemote)

-- (b) read the screen: any visible text with a rarity word is a catch pop-up
local RARITY_WORDS = {}
for k in pairs(RARITY) do RARITY_WORDS[k] = true end
local function rarityIn(t)
    t = cleanText(t or ""):lower()
    if #t == 0 or #t > 28 then return nil end
    for w in t:gmatch("%a+") do
        if RARITY_WORDS[w] then return (w:gsub("^%l", string.upper)) end
    end
end

local Watch = setmetatable({}, { __mode = "k" })     -- labels that show a rarity
local ScreenSeen = setmetatable({}, { __mode = "k" })
local ScreenHooked = setmetatable({}, { __mode = "k" })
local function watchLabel(d)
    if not d:IsA("TextLabel") or ScreenHooked[d] then return end
    ScreenHooked[d] = true
    if rarityIn(d.Text) then Watch[d] = true end
    d:GetPropertyChangedSignal("Text"):Connect(function()
        if rarityIn(d.Text) then Watch[d] = true end
    end)
end
task.spawn(function()
    local n = 0
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        watchLabel(d)
        n += 1
        if n % 300 == 0 then task.wait() end
    end
    -- what is on the screen right now is not a new catch
    for l in pairs(Watch) do ScreenSeen[l] = l.Text end
end)
PlayerGui.DescendantAdded:Connect(watchLabel)

local function readPopup(d)
    local box = d.Parent
    for _ = 1, 3 do
        if box and box.Parent and box.Parent ~= PlayerGui and box.Parent:IsA("GuiObject") then
            local cnt = 0
            for _, x in ipairs(box.Parent:GetDescendants()) do if x:IsA("TextLabel") then cnt += 1 end end
            if cnt > 14 then break end
            box = box.Parent
        end
    end
    local name, income, mutation
    for _, l in ipairs(box:GetDescendants()) do
        if l:IsA("TextLabel") and l ~= d and l.Text ~= "" and isShown(l) then
            local t = cleanText(l.Text)
            t = t:gsub("^[Yy]ou [Gg]ot:?%s*", ""):gsub("^[Cc]aught:?%s*", ""):gsub("^[Nn]ew:?%s*", "")
            if t:find("%$") or t:find("/%s*[sS]%s*$") then
                income = income or t
            elseif mutationOf(t) then
                mutation = mutation or mutationOf(t)
            elseif looksLikeName(t) and not rarityIn(t) then
                name = name or t
            end
        end
    end
    -- name may sit in the same label as the rarity, e.g. "Legendary Cat"
    if not name then
        local t = cleanText(d.Text):gsub("^[Yy]ou [Gg]ot:?%s*", "")
        local w = t:gsub("%a+", function(x) if RARITY_WORDS[x:lower()] then return "" end end):gsub("[%[%]%(%)]", ""):gsub("^%s+", ""):gsub("%s+$", "")
        if looksLikeName(w) then name = w end
    end
    return name, income, mutation
end

task.spawn(function()
    while true do
        task.wait(0.3)
        pcall(function()
            local gate = tick() - math.max(lastClick, throwMomentT) <= 40
            for d in pairs(Watch) do
                if not d.Parent or not d:IsDescendantOf(PlayerGui) then
                    Watch[d] = nil
                elseif not isShown(d) then
                    ScreenSeen[d] = nil                  -- hidden: the next time it shows is a new catch
                else
                    local rarity = rarityIn(d.Text)
                    if not rarity then
                        Watch[d] = nil
                    elseif ScreenSeen[d] ~= d.Text and gate then
                        ScreenSeen[d] = d.Text
                        task.delay(0.2, function()
                            pcall(function()
                                if not d.Parent then return end
                                local name, income, mutation = readPopup(d)
                                dbg("screen", d.Text, "->", name, rarity, income, mutation)
                                if name then recordCatch(name, rarity, income, mutation) end
                            end)
                        end)
                    elseif ScreenSeen[d] == nil then
                        ScreenSeen[d] = d.Text            -- first time seen: baseline only
                    end
                end
            end
        end)
    end
end)

-- Debug helper: every visible text on screen
function _G.__KaidenScreenText()
    local out = {}
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if d:IsA("TextLabel") and d.Text ~= "" and isShown(d) then
            out[#out + 1] = d:GetFullName():gsub("^.-PlayerGui%.", "") .. " = " .. cleanText(d.Text)
        end
    end
    return table.concat(out, "\n")
end

end -- catches


--------------------------------------------------------------------
-- AUTO REJOIN (kicked / disconnected while farming)
--------------------------------------------------------------------
local rejoining = false
GuiService.ErrorMessageChanged:Connect(function(msg)
    msg = tostring(msg or "")
    if msg == "" then return end
    logEvent("stop", "Disconnected: " .. msg:sub(1, 70))
    if not State.AutoRejoin or rejoining or not (State.AutoFarm or State.AutoTrain) then return end
    task.delay(5, function()
        if rejoining then return end
        local still = ""
        pcall(function() still = GuiService:GetErrorMessage() end)
        if still ~= "" then
            rejoining = true
            logEvent("bug", "Auto rejoining the game...")
            pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
        end
    end)
end)

-- keep the panels fresh
task.spawn(function()
    while true do
        task.wait(3)
        if hubIsOpen() then refreshPanels() end
    end
end)

--------------------------------------------------------------------
-- EXTRAS: free cam, full bright, field of view, rejoin, server hop
--------------------------------------------------------------------
local Free = { on = false, yaw = 0, pitch = 0, pos = Vector3.zero, up = false, down = false, conns = {} }
local FreeToggle
local setFreeCam, setFullbright, applyFOV, serverHop
do
local FreeGui

local function freeMakeGui()
    local g = Instance.new("ScreenGui")
    g.Name = "KaidenFreeCam"
    g.ResetOnSpawn = false
    pcall(function() g.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
    if not g.Parent then g.Parent = PlayerGui end
    local function mk(text, y, flag)
        local b = Instance.new("TextButton")
        b.AnchorPoint = Vector2.new(1, 1)
        b.Position = UDim2.new(1, -90, 1, y)
        b.Size = UDim2.fromOffset(60, 60)
        b.BackgroundColor3 = Color3.fromRGB(11, 20, 38)
        b.BackgroundTransparency = 0.2
        b.TextColor3 = Color3.fromRGB(47, 123, 255)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 26
        b.Text = text
        b.Parent = g
        Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
        b.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then Free[flag] = true end
        end)
        b.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then Free[flag] = false end
        end)
    end
    mk("▲", -170, "up")
    mk("▼", -100, "down")
    return g
end

local function freeStep(dt)
    local cam = workspace.CurrentCamera
    if not cam then return end
    local cf = CFrame.new(Free.pos) * CFrame.fromOrientation(Free.pitch, Free.yaw, 0)
    local k = UserInputService
    local mx, mz, vy = 0, 0, 0
    if k:IsKeyDown(Enum.KeyCode.D) then mx += 1 end
    if k:IsKeyDown(Enum.KeyCode.A) then mx -= 1 end
    if k:IsKeyDown(Enum.KeyCode.S) then mz += 1 end
    if k:IsKeyDown(Enum.KeyCode.W) then mz -= 1 end
    if k:IsKeyDown(Enum.KeyCode.E) or k:IsKeyDown(Enum.KeyCode.Space) then vy += 1 end
    if k:IsKeyDown(Enum.KeyCode.Q) or k:IsKeyDown(Enum.KeyCode.LeftControl) then vy -= 1 end
    if Free.up then vy += 1 end
    if Free.down then vy -= 1 end
    -- phone thumbstick
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum and hum.MoveDirection.Magnitude > 0.05 then
        local lv = cf:VectorToObjectSpace(hum.MoveDirection)
        local m = Vector3.new(lv.X, 0, lv.Z)
        if m.Magnitude > 0.01 then
            m = m.Unit * hum.MoveDirection.Magnitude
            mx += m.X
            mz += m.Z
        end
    end
    local speed = (k:IsKeyDown(Enum.KeyCode.LeftShift) and 120 or 45) * dt
    Free.pos += (cf.RightVector * mx + cf.LookVector * (-mz) + Vector3.new(0, vy, 0)) * speed
    cam.CameraType = Enum.CameraType.Scriptable
    cam.CFrame = CFrame.new(Free.pos) * CFrame.fromOrientation(Free.pitch, Free.yaw, 0)
end

setFreeCam = function(on)
    if on == Free.on then return end
    local cam = workspace.CurrentCamera
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if on then
        if State.AutoFarm then
            notify("Free Cam", "Turn Auto Throw off first")
            pcall(function() FreeToggle:Set(false) end)
            return
        end
        if not cam then return end
        Free.on = true
        local px, py = cam.CFrame:ToOrientation()
        Free.pitch, Free.yaw, Free.pos = px, py, cam.CFrame.Position
        Free.saved = { fov = cam.FieldOfView }
        if hum then
            Free.saved.ws, Free.saved.jp, Free.saved.jh = hum.WalkSpeed, hum.JumpPower, hum.JumpHeight
            hum.WalkSpeed = 0
            hum.JumpPower = 0
            hum.JumpHeight = 0
        end
        FreeGui = freeMakeGui()
        Free.conns[1] = UserInputService.InputChanged:Connect(function(i, gp)
            if i.UserInputType == Enum.UserInputType.MouseMovement
                and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                Free.yaw -= i.Delta.X * 0.004
                Free.pitch = math.clamp(Free.pitch - i.Delta.Y * 0.004, -1.5, 1.5)
            elseif i.UserInputType == Enum.UserInputType.Touch and not gp then
                Free.yaw -= i.Delta.X * 0.006
                Free.pitch = math.clamp(Free.pitch - i.Delta.Y * 0.006, -1.5, 1.5)
            end
        end)
        RunService:BindToRenderStep("KaidenFreeCam", Enum.RenderPriority.Camera.Value + 1, function(dt)
            pcall(freeStep, dt)
        end)
    else
        Free.on = false
        pcall(function() RunService:UnbindFromRenderStep("KaidenFreeCam") end)
        for _, c in ipairs(Free.conns) do pcall(function() c:Disconnect() end) end
        table.clear(Free.conns)
        if FreeGui then FreeGui:Destroy() FreeGui = nil end
        Free.up, Free.down = false, false
        pcall(function()
            local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if h and Free.saved then
                h.WalkSpeed = Free.saved.ws or 16
                h.JumpPower = Free.saved.jp or 50
                h.JumpHeight = Free.saved.jh or 7.2
            end
            local c = workspace.CurrentCamera
            if c then
                c.CameraType = Enum.CameraType.Custom
                if h then c.CameraSubject = h end
            end
        end)
    end
end

local FB = { saved = nil }
setFullbright = function(on)
    State.Fullbright = on
    pcall(function() RunService:UnbindFromRenderStep("KaidenFullbright") end)
    if on then
        FB.saved = FB.saved or {
            Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime, FogEnd = Lighting.FogEnd,
            GlobalShadows = Lighting.GlobalShadows, Ambient = Lighting.Ambient, OutdoorAmbient = Lighting.OutdoorAmbient,
        }
        RunService:BindToRenderStep("KaidenFullbright", 4000, function()
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 1e9
            Lighting.GlobalShadows = false
            Lighting.Ambient = Color3.fromRGB(190, 190, 190)
            Lighting.OutdoorAmbient = Color3.fromRGB(190, 190, 190)
        end)
    elseif FB.saved then
        for k, v in pairs(FB.saved) do pcall(function() Lighting[k] = v end) end
        FB.saved = nil
    end
end

applyFOV = function(on)
    State.FOVOn = on
    pcall(function() RunService:UnbindFromRenderStep("KaidenFOV") end)
    if on then
        RunService:BindToRenderStep("KaidenFOV", 4001, function()
            local cam = workspace.CurrentCamera
            if cam and not Free.on and not camHoldAlways then cam.FieldOfView = State.FOV end
        end)
    end
end

serverHop = function()
    notify("Server Hop", "Looking for another server...")
    task.spawn(function()
        local ok, data = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(
                "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        end)
        if ok and data and data.data then
            local list = {}
            for _, s in ipairs(data.data) do
                if s.id ~= game.JobId and s.playing and s.maxPlayers and s.playing < s.maxPlayers - 1 then
                    list[#list + 1] = s.id
                end
            end
            if #list > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, list[math.random(1, #list)], LocalPlayer)
                return
            end
        end
        notify("Server Hop", "No other server found")
    end)
end
end -- extras

-- Auto Throw turns these off first (they use the same camera / spot)
farmStartHook = function()
    if State.AutoTrain then
        State.AutoTrain = false
        trainToken += 1
        pcall(function() TrainToggle:Set(false) end)
    end
    if Free.on then
        pcall(function() FreeToggle:Set(false) end)
        setFreeCam(false)
    end
    if State.AutoBoost and boostHook then pcall(boostHook) end
end

--------------------------------------------------------------------
-- RESIZE: hold the right edge, the left edge, the bottom edge or the bottom
-- corners of the window and drag (mouse or finger)
--------------------------------------------------------------------
task.defer(function()
    pcall(function()
        local main = Window.UIElements and Window.UIElements.Main
        if not (main and typeof(main) == "Instance" and main:IsA("GuiObject")) then return end
        local T = 14                                   -- edge thickness
        local active, mode, startPt, startSize, startPos
        local function clampSize(w, h)
            local cam = workspace.CurrentCamera
            local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
            return math.clamp(w, 380, math.max(380, vp.X - 10)), math.clamp(h, 240, math.max(240, vp.Y - 10))
        end
        local function mk(name, dx, dy, anchor, pos, size)
            local h = Instance.new("TextButton")
            h.Name = "KaidenResize_" .. name
            h.AutoButtonColor = false
            h.Text = ""
            h.BackgroundTransparency = 1
            h.BorderSizePixel = 0
            h.AnchorPoint = anchor
            h.Position = pos
            h.Size = size
            h.ZIndex = 1000
            h.Parent = main
            h.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                    active, mode = i, { dx, dy }
                    startPt = i.Position
                    startSize = main.AbsoluteSize
                    startPos = main.Position
                end
            end)
        end
        mk("right", 1, 0, Vector2.new(1, 0), UDim2.new(1, 0, 0, 48), UDim2.new(0, T, 1, -48 - T))
        mk("left", -1, 0, Vector2.new(0, 0), UDim2.new(0, 0, 0, 48), UDim2.new(0, T, 1, -48 - T))
        mk("bottom", 0, 1, Vector2.new(0, 1), UDim2.new(0, T, 1, 0), UDim2.new(1, -2 * T, 0, T))
        mk("bottomright", 1, 1, Vector2.new(1, 1), UDim2.new(1, 0, 1, 0), UDim2.new(0, T * 2, 0, T * 2))
        mk("bottomleft", -1, 1, Vector2.new(0, 1), UDim2.new(0, 0, 1, 0), UDim2.new(0, T * 2, 0, T * 2))

        UserInputService.InputChanged:Connect(function(i)
            if not active then return end
            if i ~= active and i.UserInputType ~= Enum.UserInputType.MouseMovement then return end
            local d = (active.UserInputType == Enum.UserInputType.MouseButton1 and i.Position or active.Position) - startPt
            local w, h = startSize.X, startSize.Y
            if mode[1] ~= 0 then w = startSize.X + mode[1] * d.X end
            if mode[2] ~= 0 then h = startSize.Y + mode[2] * d.Y end
            w, h = clampSize(w, h)
            local a = main.AnchorPoint
            local sx = (w - startSize.X) * (mode[1] == -1 and -(1 - a.X) or a.X)
            local sy = (h - startSize.Y) * (mode[2] == -1 and -(1 - a.Y) or a.Y)
            main.Size = UDim2.fromOffset(w, h)
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + sx, startPos.Y.Scale, startPos.Y.Offset + sy)
        end)
        UserInputService.InputEnded:Connect(function(i)
            if active and (i == active or i.UserInputType == Enum.UserInputType.MouseButton1) then active = nil end
        end)
    end)
end)

--------------------------------------------------------------------
-- HOME
--------------------------------------------------------------------
do
local Home = Window:Tab({ Title = "Home", Icon = "house" })
local DISCORD_LINK = "https://discord.gg/yb6vhVpKc2"
local DISCORD_CODE = "yb6vhVpKc2"
-- shown on the Home tab (change these two words here if they ever change)
local SCRIPT_STATUS = "Working"
local DETECTION_STATUS = "Safe"

Home:Section({ Title = "Discord" })
local DiscordPara = Home:Paragraph({
    Title = "Kaiden Hub",
    Desc = "Members: -\nOnline: -",
    Image = LogoAsset,
    ImageSize = 56,
})
Home:Button({
    Title = "Copy Invite", Icon = "link",
    Desc = DISCORD_LINK,
    Callback = function()
        pcall(function() setclipboard(DISCORD_LINK) end)
        notify("Discord", "Invite copied!")
    end,
})
-- live member / online numbers from Discord
task.spawn(function()
    while true do
        pcall(function()
            local raw = game:HttpGet("https://discord.com/api/v9/invites/" .. DISCORD_CODE .. "?with_counts=true")
            local d = HttpService:JSONDecode(raw)
            DiscordPara:SetDesc("Members: " .. tostring(d.approximate_member_count or "-")
                .. "\nOnline: " .. tostring(d.approximate_presence_count or "-"))
        end)
        task.wait(300)
    end
end)

Home:Section({ Title = "Script Info" })
Home:Paragraph({
    Title = "Status",
    Desc = "Script: " .. SCRIPT_STATUS .. " 🟢\nDetection: " .. DETECTION_STATUS .. " 🟢\nVersion: v1.0\nUse at your own risk",
})
local exec = "Unknown"
pcall(function() exec = identifyexecutor() end)
local gameName = "Throw Food For Animals"
pcall(function() gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)
Home:Paragraph({
    Title = "You",
    Desc = "Player: " .. LocalPlayer.Name .. "\nGame: " .. gameName .. "\nExecutor: " .. tostring(exec),
})

Home:Section({ Title = "Recent Catches" })
CatchesPara = Home:Paragraph({
    Title = "Animal  •  Rarity  •  Income",
    Desc = "nothing yet\n\n0 rows",
})
end -- home

--------------------------------------------------------------------
-- MAIN
--------------------------------------------------------------------
local Main = Window:Tab({ Title = "Main", Icon = "monitor" })

Main:Section({ Title = "Throw" })
PerfectToggle = Main:Toggle({
    Title = "Auto Perfect", Value = false,
    Desc = "Stops the throw bar at the very top (+20) by itself.",
    Callback = function(v) setAutoPerfect(v) end,
})
SkipToggle = Main:Toggle({
    Title = "Instant Throw", Value = false,
    Desc = "Taps through the cut scene and keeps your camera where it was.",
    Callback = function(v) setSkipCutscene(v) end,
})

Main:Section({ Title = "Training" })
Main:Toggle({
    Title = "Auto 2x Press", Value = false,
    Desc = "Presses the round 2x button every time it shows up. Keeps working while this menu is open.",
    Callback = function(v)
        bindFeature("Auto2xPress", 0.15)(v)
    end,
})
TrainToggle = Main:Toggle({
    Title = "Auto Train  (not available for now)", Value = false,
    Desc = "Not available for now.",
    Callback = function(v)
        if v then
            State.AutoTrain = false
            notify("Auto Train", "Not available for now")
            task.defer(function() pcall(function() TrainToggle:Set(false) end) end)
        end
    end,
})
pcall(function() TrainToggle:Lock() end)

Main:Section({ Title = "Animals" })
Main:Toggle({
    Title = "Auto Equip Best", Value = false,
    Desc = "Equips your best animals automatically every few seconds.",
    Callback = bindFeature("AutoEquipBest", EQUIP_DELAY),
})

--------------------------------------------------------------------
-- FARM
--------------------------------------------------------------------
local Farm = Window:Tab({ Title = "Farm", Icon = "sprout" })
Farm:Section({ Title = "Throwing" })
FarmToggle = Farm:Toggle({
    Title = "Auto Throw", Value = false,
    Desc = "Fully automatic: goes to the throw line, throws a perfect +20, skips the cut scene, returns and repeats. Fixes itself if it gets stuck.",
    Callback = function(v) setAutoFarm(v) end,
})
Farm:Button({
    Title = "Teleport To Farm Spot", Icon = "map-pin",
    Desc = "Puts you at the throw line.",
    Callback = function() task.spawn(tpToFarm) end,
})

--------------------------------------------------------------------
-- UPGRADES
--------------------------------------------------------------------
local Upgrades = Window:Tab({ Title = "Upgrades", Icon = "trending-up" })
Upgrades:Section({ Title = "Buy" })
Upgrades:Toggle({
    Title = "Auto Stand Upgrade", Value = false,
    Desc = "Keeps upgrading your stand.",
    Callback = bindFeature("AutoStand", 0.5),
})
Upgrades:Toggle({
    Title = "Auto Upgrade Fence", Value = false,
    Desc = "Keeps upgrading your plot fence.",
    Callback = bindFeature("AutoFence", 0.5),
})
BuyFoodToggle = Upgrades:Toggle({
    Title = "Auto Buy Next Food (1-42)", Value = false,
    Desc = "Buys food 1 to 42 in order. It only moves to the next one after the current one is bought, and keeps checking until you have enough money.",
    Callback = function(v)
        if v and State.NextFood > FOOD_MAX then State.NextFood = 1 saveFile("nextfood.txt", "1") end
        bindFeature("AutoBuyFood", 0.3)(v)
    end,
})
Upgrades:Button({
    Title = "Restart Food List From #1", Icon = "rotate-ccw",
    Desc = "Use this if the food list got out of sync with what you really own.",
    Callback = function()
        State.NextFood = 1
        FoodState.fails, FoodState.failCash = 0, nil
        saveFile("nextfood.txt", "1")
        notify("Auto Buy Food", "Starting again from #1")
    end,
})

--------------------------------------------------------------------
-- EXTRAS
--------------------------------------------------------------------

--------------------------------------------------------------------
-- SETTINGS helpers
--------------------------------------------------------------------
local FPS, Ping = 60, 0
local StatsGui = Instance.new("ScreenGui")
StatsGui.Name = "KaidenStats"
StatsGui.ResetOnSpawn = false
pcall(function() StatsGui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
if not StatsGui.Parent then StatsGui.Parent = PlayerGui end

local StatsLabel = Instance.new("TextLabel")
StatsLabel.BackgroundTransparency = 1
StatsLabel.Position = UDim2.new(1, -170, 0, 6)
StatsLabel.Size = UDim2.fromOffset(160, 40)
StatsLabel.TextXAlignment = Enum.TextXAlignment.Right
StatsLabel.TextYAlignment = Enum.TextYAlignment.Top
StatsLabel.Font = Enum.Font.GothamBold
StatsLabel.TextSize = 14
StatsLabel.TextColor3 = Color3.fromRGB(47, 123, 255)
StatsLabel.Text = ""
StatsLabel.Parent = StatsGui

local frames, last = 0, tick()
RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - last >= 1 then
        FPS = frames; frames = 0; last = tick()
        pcall(function() Ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) end)
        local t = {}
        if State.ShowFPS then table.insert(t, "FPS: " .. FPS) end
        if State.ShowPing then table.insert(t, "Ping: " .. Ping .. " ms") end
        StatsLabel.Text = table.concat(t, "\n")
    end
end)

LocalPlayer.Idled:Connect(function()
    if State.AntiAFK or State.AutoFarm then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

UserInputService.JumpRequest:Connect(function()
    if State.InfiniteJump then
        local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

local function quickPrompt(p)
    if p:IsA("ProximityPrompt") and State.QuickInteract then p.HoldDuration = 0 end
end
for _, d in ipairs(workspace:GetDescendants()) do quickPrompt(d) end
workspace.DescendantAdded:Connect(quickPrompt)

local hideT = 0
RunService.Heartbeat:Connect(function()
    if not State.HidePlayers then return end
    if tick() - hideT < 1 then return end
    hideT = tick()
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character then
            for _, p in ipairs(pl.Character:GetDescendants()) do
                if p:IsA("BasePart") or p:IsA("Decal") then
                    pcall(function() p.LocalTransparencyModifier = 1 end)
                end
            end
        end
    end
end)

local function applyFPSCap()
    pcall(function() setfpscap(State.ReduceCPU and 30 or State.FPSCap) end)
end

local function lagFix(v)
    if v:IsA("BasePart") then
        v.CastShadow = false
        v.Reflectance = 0
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("MeshPart") then v.RenderFidelity = Enum.RenderFidelity.Performance end
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke")
        or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("PostEffect") or v:IsA("Highlight") then
        v.Enabled = false
    elseif v:IsA("Atmosphere") then
        v.Density = 0
        v.Haze = 0
    elseif v:IsA("Explosion") then
        v.Visible = false
    end
end

local antiLagBusy = false
local function antiLag()
    if antiLagBusy then return end
    antiLagBusy = true
    task.spawn(function()
        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.ShadowSoftness = 0
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
        pcall(function() sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility) end)
        pcall(function()
            UserSettings():GetService("UserGameSettings").SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
        end)
        pcall(function()
            local t = workspace:FindFirstChildOfClass("Terrain")
            if t then sethiddenproperty(t, "Decoration", false) end
        end)
        pcall(function()
            local t = workspace:FindFirstChildOfClass("Terrain")
            if t then
                t.WaterWaveSize = 0
                t.WaterWaveSpeed = 0
                t.WaterReflectance = 0
            end
        end)
        -- done in small chunks so the game never freezes while it runs
        local n = 0
        for _, v in ipairs(workspace:GetDescendants()) do
            pcall(lagFix, v)
            n += 1
            if n % 400 == 0 then task.wait() end
        end
        for _, v in ipairs(Lighting:GetDescendants()) do pcall(lagFix, v) end
        antiLagBusy = false
        notify("Anti Lag", "Applied to " .. n .. " objects")
    end)
end

-- Max FPS boost: runs by itself every time Auto Throw starts
boostHook = function()
    State.HidePlayers = true
    State.AntiLagAuto = true
    antiLag()
end

-- keeps new objects light too (particles, effects the game adds later)
workspace.DescendantAdded:Connect(function(v)
    if State.AntiLagAuto then pcall(lagFix, v) end
end)
Lighting.DescendantAdded:Connect(function(v)
    if State.AntiLagAuto then pcall(lagFix, v) end
end)

--------------------------------------------------------------------
-- DEBUG TAB (created from Settings): what the script did and how it went
--  🟢 work    🟡 bug (the script is fixing it)    🔴 stop
--------------------------------------------------------------------
local DebugTab, DebugLogPara, DebugStatPara
local function debugLines(n)
    local lines = {}
    for i = #LogBuf, math.max(1, #LogBuf - n + 1), -1 do
        local e = LogBuf[i]
        lines[#lines + 1] = string.format("%s (%s) %s %s", e.text, fmtClock(e.t), LOG_WORD[e.level], LOG_ICON[e.level])
    end
    if #lines == 0 then lines[1] = "nothing yet" end
    return lines
end

local function refreshDebug()
    if not DebugTab then return end
    pcall(function()
        if DebugStatPara then
            DebugStatPara:SetDesc(table.concat({
                "Auto Throw: " .. (State.AutoFarm and Session.farmStatus or "off"),
                string.format("🟢 %d   🟡 %d   🔴 %d", LogCount.ok, LogCount.bug, LogCount.stop),
                "Throws: " .. Session.throws .. "   Catches: " .. Session.catches,
                "Time: " .. fmtClock(tick() - Session.start),
            }, "\n"))
        end
        if DebugLogPara then DebugLogPara:SetDesc(table.concat(debugLines(18), "\n")) end
    end)
end

local function createDebugTab()
    if DebugTab then return end
    DebugTab = Window:Tab({ Title = "Debug", Icon = "bug" })
    DebugTab:Section({ Title = "Legend" })
    DebugTab:Paragraph({ Title = "What the colors mean", Desc = "🟢 work  -  it did its job\n🟡 bug  -  something went wrong, the script is fixing it\n🔴 stop  -  auto farm stopped or could not be fixed" })
    DebugTab:Section({ Title = "Status" })
    DebugStatPara = DebugTab:Paragraph({ Title = "Right now", Desc = "..." })
    DebugTab:Section({ Title = "Activity (newest first)" })
    DebugLogPara = DebugTab:Paragraph({ Title = "Log", Desc = "..." })
    DebugTab:Button({
        Title = "Copy Log", Icon = "copy",
        Desc = "Copies the whole log so you can send it in a bug report.",
        Callback = function()
            local out = {}
            for _, l in ipairs(debugLines(300)) do out[#out + 1] = l end
            pcall(function() setclipboard(table.concat(out, "\n")) end)
            notify("Debug", "Log copied")
        end,
    })
    DebugTab:Button({
        Title = "Copy Screen Text", Icon = "scan",
        Desc = "Copies every text on your screen (use right after a catch, send it to me).",
        Callback = function()
            pcall(function() setclipboard(_G.__KaidenScreenText()) end)
            notify("Debug", "Screen text copied")
        end,
    })
    DebugTab:Button({
        Title = "Clear Log", Icon = "trash",
        Callback = function()
            table.clear(LogBuf)
            LogCount.ok, LogCount.bug, LogCount.stop = 0, 0, 0
            refreshDebug()
        end,
    })
    refreshDebug()
    task.spawn(function()
        while DebugTab do
            task.wait(1.5)
            if hubIsOpen() then refreshDebug() end
        end
    end)
    pcall(function() DebugTab:Select() end)
end

local function removeDebugTab()
    if not DebugTab then return end
    local ok = pcall(function() DebugTab:Destroy() end)
    if ok then DebugTab, DebugLogPara, DebugStatPara = nil, nil, nil end
end

--------------------------------------------------------------------
-- CONFIG
--------------------------------------------------------------------
local ConfigName = "KaidenHub"
local SelectedConfig = nil
local DIR = "KaidenHub/configs"
pcall(function() if makefolder and not isfolder("KaidenHub") then makefolder("KaidenHub") end end)
pcall(function() if makefolder and not isfolder(DIR) then makefolder(DIR) end end)

local function listConfigs()
    local out = {}
    pcall(function()
        for _, f in ipairs(listfiles(DIR)) do
            local n = f:match("([^/\\]+)%.json$")
            if n then table.insert(out, n) end
        end
    end)
    if #out == 0 then out = { "No configs..." } end
    return out
end

local function saveConfig(name)
    local ok = pcall(function()
        writefile(DIR .. "/" .. name .. ".json", HttpService:JSONEncode(State))
        writefile("KaidenHub/last.txt", name)
    end)
    notify("Config", ok and ("Saved: " .. name) or "Save failed")
end

local function decodeConfig(str)
    local ok, data = pcall(function() return HttpService:JSONDecode(str) end)
    if ok and type(data) == "table" then
        for k, v in pairs(data) do if k ~= "NextFood" then State[k] = v end end
        notify("Config", "Loaded (rejoin UI to refresh toggles)")
        applyFPSCap()
        return true
    end
    notify("Config", "Invalid config")
    return false
end

local function loadConfig(name)
    local ok, str = pcall(readfile, DIR .. "/" .. tostring(name) .. ".json")
    if ok then decodeConfig(str) else notify("Config", "Config not found") end
end

--------------------------------------------------------------------
-- SETTINGS TAB
--------------------------------------------------------------------
local Settings = Window:Tab({ Title = "Settings", Icon = "settings" })

Settings:Section({ Title = "Appearance" })
Settings:Dropdown({
    Title = "Theme", Values = { "KaidenBlue", "Dark", "Light", "Rose", "Plant", "Indigo", "Sky", "Violet", "Amber", "Emerald" },
    Value = "KaidenBlue",
    Callback = function(v) State.Theme = v pcall(function() WindUI:SetTheme(v) end) end,
})
Settings:Slider({
    Title = "Transparency", Value = { Min = 0, Max = 1, Default = 0.15 },
    Callback = function(v)
        State.Transparency = v
        pcall(function() WindUI.TransparencyValue = v; Window:ToggleTransparency(true) end)
    end,
})
Settings:Toggle({
    Title = "Show User", Value = true,
    Callback = function(v)
        State.ShowUser = v
        pcall(function() Window:SetUserEnabled(v) end)
    end,
})
Settings:Toggle({ Title = "Show FPS", Value = false, Callback = function(v) State.ShowFPS = v end })
Settings:Toggle({ Title = "Show Ping", Value = false, Callback = function(v) State.ShowPing = v end })

Settings:Section({ Title = "Keybinds" })
Settings:Keybind({
    Title = "Toggle UI", Value = "J",
    Callback = function(key)
        State.ToggleKey = key
        pcall(function() Window:SetToggleKey(Enum.KeyCode[key]) end)
    end,
})

Settings:Section({ Title = "Misc" })
Settings:Toggle({ Title = "Anti AFK", Value = false, Desc = "Stops the game from kicking you for being idle (always on while Auto Throw runs).", Callback = function(v) State.AntiAFK = v end })
Settings:Toggle({
    Title = "Debug", Value = false,
    Desc = "Adds a Debug tab that shows what the script did (throws, fixes, problems) with 🟢 work / 🟡 bug / 🔴 stop. Also prints to the console.",
    Callback = function(v)
        State.Debug = v
        if v then createDebugTab() else removeDebugTab() end
    end,
})
Settings:Toggle({
    Title = "Auto Rejoin", Value = true,
    Desc = "If you get kicked or disconnected while Auto Throw / Auto Train runs, it joins the game again by itself.",
    Callback = function(v) State.AutoRejoin = v end,
})
Settings:Toggle({ Title = "Infinite Jump", Value = false, Callback = function(v) State.InfiniteJump = v end })
Settings:Toggle({
    Title = "Quick Interact", Value = false,
    Callback = function(v)
        State.QuickInteract = v
        if v then for _, d in ipairs(workspace:GetDescendants()) do quickPrompt(d) end end
    end,
})

Settings:Section({ Title = "Extras" })
Settings:Divider()
FreeToggle = Settings:Toggle({
    Title = "Free Cam", Value = false,
    Desc = "Fly the camera around. PC: WASD, Q/E, Shift = fast, hold right mouse to look. Phone: thumbstick to move, drag the screen to look, ▲ ▼ buttons for up and down.",
    Callback = function(v) setFreeCam(v) end,
})
Settings:Toggle({
    Title = "Custom Field Of View", Value = false,
    Desc = "Uses the field of view from the slider below.",
    Callback = function(v) applyFOV(v) end,
})
Settings:Slider({
    Title = "Field Of View", Value = { Min = 40, Max = 120, Default = 70 },
    Callback = function(v) State.FOV = v end,
})
Settings:Divider()
Settings:Toggle({
    Title = "Full Bright", Value = false,
    Desc = "Removes darkness and fog so everything is bright.",
    Callback = function(v) setFullbright(v) end,
})
Settings:Divider()
Settings:Button({
    Title = "Rejoin", Icon = "refresh-cw",
    Desc = "Leaves and joins the same server again.",
    Callback = function()
        pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
    end,
})
Settings:Button({
    Title = "Server Hop", Icon = "shuffle",
    Desc = "Jumps to a different public server.",
    Callback = serverHop,
})



Settings:Section({ Title = "Performance" })
Settings:Toggle({ Title = "Hide Players", Value = false, Callback = function(v) State.HidePlayers = v end })
Settings:Toggle({ Title = "Reduce CPU Usage", Value = false, Callback = function(v) State.ReduceCPU = v applyFPSCap() end })
Settings:Slider({
    Title = "FPS Cap", Value = { Min = 15, Max = 240, Default = 240 },
    Callback = function(v) State.FPSCap = v applyFPSCap() end,
})
Settings:Toggle({
    Title = "Max FPS Boost With Auto Throw", Value = true,
    Desc = "When Auto Throw starts it automatically turns on Anti Lag, keeps it on for new objects and hides other players, so the game runs as light as possible.",
    Callback = function(v) State.AutoBoost = v end,
})
Settings:Button({
    Title = "Anti Lag", Icon = "zap",
    Desc = "Boosts FPS: lowest graphics, no shadows, no particles / effects, simple materials. Runs in small steps so the game does not freeze.",
    Callback = antiLag,
})
Settings:Toggle({
    Title = "Keep Anti Lag On", Value = false,
    Desc = "Also applies it to new objects and effects the game adds later.",
    Callback = function(v)
        State.AntiLagAuto = v
        if v then antiLag() end
    end,
})

Settings:Section({ Title = "Config" })
Settings:Input({
    Title = "Config Name", Placeholder = "KaidenHub", Value = "KaidenHub",
    Callback = function(v) if v ~= "" then ConfigName = v end end,
})
Settings:Button({ Title = "Save Config", Icon = "save", Callback = function() saveConfig(ConfigName) end })

local ConfigDropdown = Settings:Dropdown({
    Title = "Select Config", Values = listConfigs(), Value = "No configs...",
    Callback = function(v) SelectedConfig = v end,
})
Settings:Button({
    Title = "Refresh Config List", Icon = "refresh-cw",
    Callback = function() pcall(function() ConfigDropdown:Refresh(listConfigs()) end) end,
})
Settings:Button({
    Title = "Load Selected Config", Icon = "folder-open",
    Callback = function() if SelectedConfig then loadConfig(SelectedConfig) end end,
})
Settings:Button({
    Title = "Delete Selected Config", Icon = "trash",
    Callback = function()
        if SelectedConfig then
            pcall(function() delfile(DIR .. "/" .. SelectedConfig .. ".json") end)
            pcall(function() ConfigDropdown:Refresh(listConfigs()) end)
            notify("Config", "Deleted")
        end
    end,
})
Settings:Divider()
Settings:Toggle({
    Title = "Enable Auto Load", Value = false,
    Callback = function(v)
        State.AutoLoad = v
        pcall(function()
            if v then writefile("KaidenHub/autoload.txt", "1")
            elseif isfile("KaidenHub/autoload.txt") then delfile("KaidenHub/autoload.txt") end
        end)
    end,
})
Settings:Button({
    Title = "Load Last Config", Icon = "folder-open",
    Callback = function()
        local ok, name = pcall(readfile, "KaidenHub/last.txt")
        if ok then loadConfig(name) else notify("Config", "No last config") end
    end,
})
Settings:Divider()
Settings:Button({
    Title = "Export Config", Icon = "upload",
    Callback = function()
        pcall(function() setclipboard(HttpService:JSONEncode(State)) end)
        notify("Config", "Copied to clipboard")
    end,
})
local importText = ""
Settings:Input({
    Title = "Import Config", Placeholder = "Paste exported config",
    Callback = function(v) importText = v end,
})
Settings:Button({
    Title = "Import Config", Icon = "download",
    Callback = function() if importText ~= "" then decodeConfig(importText) end end,
})

task.defer(function()
    pcall(function()
        if isfile("KaidenHub/autoload.txt") and isfile("KaidenHub/last.txt") then
            loadConfig(readfile("KaidenHub/last.txt"))
        end
    end)
end)

Main:Select()
notify("Kaiden Hub v1.0", "Loaded! Press J to hide/show")
