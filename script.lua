-- ==========================================================
-- ATRAS | AUTO LOW SERVER — NEON RGB UI
-- ==========================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- ==========================================================
-- CONFIG
-- ==========================================================

local inviteLink = "https://discord.gg/uqhEpzXy9q"

-- Xóa UI cũ
pcall(function()
    local old = CoreGui:FindFirstChild("AtrasServerHopGui")
    if old then
        old:Destroy()
    end
end)

-- ==========================================================
-- AUTO COPY DISCORD
-- ==========================================================

pcall(function()
    if setclipboard then
        setclipboard(inviteLink)
    end
end)

-- ==========================================================
-- SCREEN GUI
-- ==========================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AtrasServerHopGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- ==========================================================
-- MAIN FRAME
-- ==========================================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 25)
MainFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 270, 0, 190)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- ==========================================================
-- RGB GLOW BORDER
-- ==========================================================

local Glow = Instance.new("UIStroke")
Glow.Parent = MainFrame
Glow.Thickness = 2
Glow.Transparency = 0.05

task.spawn(function()
    local hue = 0

    while MainFrame.Parent do
        hue = (hue + 0.004) % 1

        Glow.Color = Color3.fromHSV(hue, 0.85, 1)

        task.wait()
    end
end)

-- ==========================================================
-- TOP BAR
-- ==========================================================

local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundTransparency = 1
TopBar.Position = UDim2.new(0, 10, 0, 8)
TopBar.Size = UDim2.new(1, -20, 0, 32)

-- ==========================================================
-- AVATAR
-- ==========================================================

local Avatar = Instance.new("ImageLabel")
Avatar.Parent = TopBar
Avatar.BackgroundTransparency = 1
Avatar.Position = UDim2.new(0, 0, 0, 2)
Avatar.Size = UDim2.new(0, 28, 0, 28)

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = Avatar

pcall(function()
    local image = Players:GetUserThumbnailAsync(
        LocalPlayer.UserId,
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size420x420
    )

    Avatar.Image = image
end)

-- ==========================================================
-- TITLE
-- ==========================================================

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 38, 0, 0)
Title.Size = UDim2.new(1, -90, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "ATRAS"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = TopBar
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 38, 0, 16)
SubTitle.Size = UDim2.new(1, -90, 0, 15)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "SERVER HOPPER"
SubTitle.TextColor3 = Color3.fromRGB(145, 150, 165)
SubTitle.TextSize = 8
SubTitle.TextXAlignment = Enum.TextXAlignment.Left

-- ==========================================================
-- DISCORD BUTTON
-- ==========================================================

local DiscordButton = Instance.new("TextButton")
DiscordButton.Parent = TopBar
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.Position = UDim2.new(1, -38, 0, 2)
DiscordButton.Size = UDim2.new(0, 34, 0, 28)
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.Text = "DC"
DiscordButton.TextColor3 = Color3.fromRGB(255,255,255)
DiscordButton.TextSize = 10
DiscordButton.AutoButtonColor = false

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 9)
DiscordCorner.Parent = DiscordButton

-- ==========================================================
-- DIVIDER
-- ==========================================================

local Divider = Instance.new("Frame")
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(45, 48, 60)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 12, 0, 46)
Divider.Size = UDim2.new(1, -24, 0, 1)

-- ==========================================================
-- INPUT TITLE
-- ==========================================================

local InputTitle = Instance.new("TextLabel")
InputTitle.Parent = MainFrame
InputTitle.BackgroundTransparency = 1
InputTitle.Position = UDim2.new(0, 14, 0, 55)
InputTitle.Size = UDim2.new(1, -28, 0, 16)
InputTitle.Font = Enum.Font.GothamMedium
InputTitle.Text = "TARGET PLAYERS"
InputTitle.TextColor3 = Color3.fromRGB(150, 155, 170)
InputTitle.TextSize = 9
InputTitle.TextXAlignment = Enum.TextXAlignment.Left

-- ==========================================================
-- INPUT BOX
-- ==========================================================

local InputBox = Instance.new("TextBox")
InputBox.Name = "InputBox"
InputBox.Parent = MainFrame
InputBox.BackgroundColor3 = Color3.fromRGB(24, 27, 38)
InputBox.Position = UDim2.new(0, 12, 0, 73)
InputBox.Size = UDim2.new(1, -24, 0, 35)
InputBox.Font = Enum.Font.GothamBold
InputBox.PlaceholderText = "Number of players..."
InputBox.Text = "1"
InputBox.TextColor3 = Color3.fromRGB(255,255,255)
InputBox.PlaceholderColor3 = Color3.fromRGB(100,105,120)
InputBox.TextSize = 13
InputBox.ClearTextOnFocus = false

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 9)
InputCorner.Parent = InputBox

local InputStroke = Instance.new("UIStroke")
InputStroke.Parent = InputBox
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromRGB(55,60,75)

-- ==========================================================
-- STATUS
-- ==========================================================

local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = MainFrame
StatusFrame.BackgroundColor3 = Color3.fromRGB(20,23,32)
StatusFrame.Position = UDim2.new(0, 12, 0, 115)
StatusFrame.Size = UDim2.new(1, -24, 0, 25)

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 7)
StatusCorner.Parent = StatusFrame

local StatusDot = Instance.new("Frame")
StatusDot.Parent = StatusFrame
StatusDot.BackgroundColor3 = Color3.fromRGB(46,204,113)
StatusDot.Position = UDim2.new(0, 8, 0.5, -4)
StatusDot.Size = UDim2.new(0, 8, 0, 8)

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1,0)
DotCorner.Parent = StatusDot

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 23, 0, 0)
StatusLabel.Size = UDim2.new(1, -28, 1, 0)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "Discord link copied!"
StatusLabel.TextColor3 = Color3.fromRGB(170,175,190)
StatusLabel.TextSize = 9
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- ==========================================================
-- TOGGLE BUTTON
-- ==========================================================

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = MainFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(235,69,95)
ToggleButton.Position = UDim2.new(0, 12, 0, 148)
ToggleButton.Size = UDim2.new(1, -24, 0, 32)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "✦  START SERVER HOP"
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.TextSize = 11
ToggleButton.AutoButtonColor = false

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 9)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Parent = ToggleButton
ToggleStroke.Thickness = 1
ToggleStroke.Transparency = 0.5

-- ==========================================================
-- BUTTON HOVER ANIMATION
-- ==========================================================

local function ButtonHover(button)
    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {Size = UDim2.new(
                button.Size.X.Scale,
                button.Size.X.Offset,
                button.Size.Y.Scale,
                button.Size.Y.Offset + 2
            )}
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {Size = UDim2.new(
                button.Size.X.Scale,
                button.Size.X.Offset,
                button.Size.Y.Scale,
                button.Size.Y.Offset - 2
            )}
        ):Play()
    end)
end

ButtonHover(ToggleButton)
ButtonHover(DiscordButton)

-- ==========================================================
-- DISCORD BUTTON
-- ==========================================================

DiscordButton.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then
            setclipboard(inviteLink)
            StatusLabel.Text = "Discord link copied!"
            StatusDot.BackgroundColor3 = Color3.fromRGB(46,204,113)
        else
            StatusLabel.Text = "Executor doesn't support clipboard!"
            StatusDot.BackgroundColor3 = Color3.fromRGB(235,69,95)
        end
    end)
end)

-- ==========================================================
-- SERVER HOP LOGIC
-- ==========================================================

local running = false

local function hopServer()

    local servers = {}
    local targetPlayers = tonumber(InputBox.Text)

    StatusLabel.Text = "Scanning public servers..."
    StatusDot.BackgroundColor3 = Color3.fromRGB(241,196,15)

    local success = pcall(function()

        local url =
            "https://games.roblox.com/v1/games/"
            .. game.PlaceId
            .. "/servers/Public?sortOrder=Asc&limit=100"

        local response = game:HttpGet(url)

        local decoded = HttpService:JSONDecode(response)

        servers = decoded.data

    end)

    if not success or #servers == 0 then

        StatusLabel.Text = "No servers found."
        StatusDot.BackgroundColor3 = Color3.fromRGB(235,69,95)

        return
    end

    -- Sắp xếp server gần số người mục tiêu nhất
    if targetPlayers then

        table.sort(servers, function(a,b)

            return math.abs(a.playing - targetPlayers)
                < math.abs(b.playing - targetPlayers)

        end)

    else

        table.sort(servers, function(a,b)

            return a.playing < b.playing

        end)

    end

    for _, server in ipairs(servers) do

        if not running then
            break
        end

        if server.id ~= game.JobId
            and server.playing < server.maxPlayers then

            StatusLabel.Text =
                "Joining server • "
                .. tostring(server.playing)
                .. " players"

            StatusDot.BackgroundColor3 =
                Color3.fromRGB(52,152,219)

            pcall(function()

                TeleportService:TeleportToPlaceInstance(
                    game.PlaceId,
                    server.id,
                    LocalPlayer
                )

            end)

            task.wait(3)

        end

    end

end

-- ==========================================================
-- TOGGLE
-- ==========================================================

ToggleButton.MouseButton1Click:Connect(function()

    running = not running

    if running then

        ToggleButton.BackgroundColor3 =
            Color3.fromRGB(46,204,113)

        ToggleButton.Text =
            "✓  SERVER HOPPING..."

        StatusLabel.Text =
            "Searching low-player servers..."

        StatusDot.BackgroundColor3 =
            Color3.fromRGB(46,204,113)

        task.spawn(function()

            while running do

                hopServer()

                task.wait(5)

            end

        end)

    else

        ToggleButton.BackgroundColor3 =
            Color3.fromRGB(235,69,95)

        ToggleButton.Text =
            "✦  START SERVER HOP"

        StatusLabel.Text =
            "Server hopping stopped."

        StatusDot.BackgroundColor3 =
            Color3.fromRGB(235,69,95)

    end

end)

-- ==========================================================
-- RGB TITLE EFFECT
-- ==========================================================

task.spawn(function()

    local hue = 0

    while MainFrame.Parent do

        hue = (hue + 0.003) % 1

        Title.TextColor3 =
            Color3.fromHSV(hue, 0.75, 1)

        task.wait()

    end

end)

-- ==========================================================
-- OPEN ANIMATION
-- ==========================================================

MainFrame.Size = UDim2.new(0, 0, 0, 0)

TweenService:Create(
    MainFrame,
    TweenInfo.new(
        0.45,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = UDim2.new(0, 270, 0, 190)
    }
):Play()

-- ==========================================================
-- DONE
-- ==========================================================

print("Atras Server Hopper UI loaded.")
