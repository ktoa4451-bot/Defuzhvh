--==================================================
-- LUNAR HVH v2.0
-- PART 1/4
-- CORE / UI / PAGE SYSTEM
--==================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- CONFIG
--==================================================

local Config = {

    Combat = {
        AimAssist = false,
        AimFOV = 120,
        AimSmooth = 0.15,
        TargetPart = "Head",
        TeamCheck = true,
        VisibilityCheck = true,
        Triggerbot = false,
        AutoShoot = false,
        RecoilControl = false
    },

    Visuals = {
        ESP = false,
        Box = false,
        Skeleton = false,
        Tracers = false,
        Health = false,
        Name = true,
        Distance = false,
        Weapon = false,
        Chams = false,
        FOVCircle = false,
        Crosshair = true
    },

    Movement = {
        BunnyHop = false,
        AutoStrafe = false,
        Speed = false,
        AirControl = false,
        InfiniteJump = false,
        SpeedValue = 22
    },

    Misc = {
        FOV = false,
        FOVValue = 70,
        ThirdPerson = false,
        HitMarker = false,
        DamageIndicator = false,
        FPS = false,
        Ping = false,
        Watermark = true,
        Keybinds = true
    }
}

--==================================================
-- COLORS
--==================================================

local Colors = {

    Background = Color3.fromRGB(12, 12, 16),
    Surface = Color3.fromRGB(19, 19, 25),
    Surface2 = Color3.fromRGB(26, 26, 34),
    Surface3 = Color3.fromRGB(32, 32, 42),

    Purple = Color3.fromRGB(125, 82, 220),
    PurpleLight = Color3.fromRGB(157, 113, 245),

    Text = Color3.fromRGB(238, 238, 245),
    SubText = Color3.fromRGB(145, 145, 160),

    Green = Color3.fromRGB(85, 210, 125),
    Red = Color3.fromRGB(220, 75, 85)
}

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")

Gui.Name = "LunarHVH_v2"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Gui.Parent = PlayerGui

--==================================================
-- MAIN WINDOW
--==================================================

local Main = Instance.new("Frame")

Main.Name = "Main"
Main.Size = UDim2.fromOffset(650, 440)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)

Main.BackgroundColor3 = Colors.Background
Main.BorderSizePixel = 0

Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Colors.Purple
MainStroke.Thickness = 1
MainStroke.Transparency = 0.45
MainStroke.Parent = Main

--==================================================
-- TOP BAR
--==================================================

local TopBar = Instance.new("Frame")

TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 70)

TopBar.BackgroundTransparency = 1
TopBar.BorderSizePixel = 0

TopBar.Parent = Main

--==================================================
-- MOON LOGO
--==================================================

local Logo = Instance.new("Frame")

Logo.Size = UDim2.fromOffset(34, 34)
Logo.Position = UDim2.fromOffset(18, 18)

Logo.BackgroundColor3 = Colors.Purple
Logo.BorderSizePixel = 0

Logo.Parent = TopBar

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(1, 0)
LogoCorner.Parent = Logo

local LogoCut = Instance.new("Frame")

LogoCut.Size = UDim2.fromOffset(28, 28)
LogoCut.Position = UDim2.fromOffset(13, -5)

LogoCut.BackgroundColor3 = Colors.Background
LogoCut.BorderSizePixel = 0

LogoCut.Parent = Logo

local LogoCutCorner = Instance.new("UICorner")
LogoCutCorner.CornerRadius = UDim.new(1, 0)
LogoCutCorner.Parent = LogoCut

--==================================================
-- TITLE
--==================================================

local Title = Instance.new("TextLabel")

Title.Size = UDim2.fromOffset(330, 27)
Title.Position = UDim2.fromOffset(65, 13)

Title.BackgroundTransparency = 1
Title.Text = "Lunar HVH"

Title.TextColor3 = Colors.Text
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold

Title.TextXAlignment = Enum.TextXAlignment.Left

Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")

Subtitle.Size = UDim2.fromOffset(330, 20)
Subtitle.Position = UDim2.fromOffset(66, 39)

Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Combat / Visuals / Movement / Misc"

Subtitle.TextColor3 = Colors.SubText
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham

Subtitle.TextXAlignment = Enum.TextXAlignment.Left

Subtitle.Parent = TopBar

--==================================================
-- VERSION
--==================================================

local Version = Instance.new("TextLabel")

Version.Size = UDim2.fromOffset(60, 20)
Version.Position = UDim2.new(1, -150, 0, 24)

Version.BackgroundTransparency = 1
Version.Text = "v2.0"

Version.TextColor3 = Colors.PurpleLight
Version.TextSize = 11
Version.Font = Enum.Font.GothamBold

Version.TextXAlignment = Enum.TextXAlignment.Right

Version.Parent = TopBar

--==================================================
-- CLOSE BUTTON
--==================================================

local Close = Instance.new("TextButton")

Close.Name = "Close"
Close.Size = UDim2.fromOffset(36, 36)
Close.Position = UDim2.new(1, -48, 0, 17)

Close.BackgroundTransparency = 1
Close.Text = ""
Close.AutoButtonColor = false

Close.Parent = TopBar

local CloseLine1 = Instance.new("Frame")

CloseLine1.Size = UDim2.fromOffset(16, 2)
CloseLine1.Position = UDim2.fromOffset(10, 17)
CloseLine1.Rotation = 45

CloseLine1.BackgroundColor3 = Colors.SubText
CloseLine1.BorderSizePixel = 0

CloseLine1.Parent = Close

local CloseLine2 = CloseLine1:Clone()

CloseLine2.Rotation = -45
CloseLine2.Parent = Close

--==================================================
-- MINIMIZE BUTTON
--==================================================

local Minimize = Instance.new("TextButton")

Minimize.Name = "Minimize"
Minimize.Size = UDim2.fromOffset(36, 36)
Minimize.Position = UDim2.new(1, -88, 0, 17)

Minimize.BackgroundTransparency = 1
Minimize.Text = ""
Minimize.AutoButtonColor = false

Minimize.Parent = TopBar

local Minus = Instance.new("Frame")

Minus.Size = UDim2.fromOffset(16, 2)
Minus.Position = UDim2.fromOffset(10, 17)

Minus.BackgroundColor3 = Colors.SubText
Minus.BorderSizePixel = 0

Minus.Parent = Minimize

--==================================================
-- DIVIDER
--==================================================

local Divider = Instance.new("Frame")

Divider.Size = UDim2.new(1, -36, 0, 1)
Divider.Position = UDim2.fromOffset(18, 70)

Divider.BackgroundColor3 = Colors.Surface2
Divider.BorderSizePixel = 0

Divider.Parent = Main

--==================================================
-- SIDEBAR
--==================================================

local Sidebar = Instance.new("Frame")

Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.fromOffset(155, 345)
Sidebar.Position = UDim2.fromOffset(16, 86)

Sidebar.BackgroundColor3 = Colors.Surface
Sidebar.BorderSizePixel = 0

Sidebar.Parent = Main

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 10)
SidebarCorner.Parent = Sidebar

--==================================================
-- CONTENT HOLDER
--==================================================

local ContentHolder = Instance.new("Frame")

ContentHolder.Name = "ContentHolder"
ContentHolder.Size = UDim2.new(1, -187, 0, 345)
ContentHolder.Position = UDim2.fromOffset(171, 86)

ContentHolder.BackgroundTransparency = 1

ContentHolder.Parent = Main

--==================================================
-- PAGE HEADER
--==================================================

local PageTitle = Instance.new("TextLabel")

PageTitle.Size = UDim2.new(1, -20, 0, 28)
PageTitle.Position = UDim2.fromOffset(10, 3)

PageTitle.BackgroundTransparency = 1
PageTitle.Text = "Combat"

PageTitle.TextColor3 = Colors.Text
PageTitle.TextSize = 20
PageTitle.Font = Enum.Font.GothamBold

PageTitle.TextXAlignment = Enum.TextXAlignment.Left

PageTitle.Parent = ContentHolder

local PageDescription = Instance.new("TextLabel")

PageDescription.Size = UDim2.new(1, -20, 0, 20)
PageDescription.Position = UDim2.fromOffset(10, 30)

PageDescription.BackgroundTransparency = 1
PageDescription.Text = "Aim and targeting"

PageDescription.TextColor3 = Colors.SubText
PageDescription.TextSize = 11
PageDescription.Font = Enum.Font.Gotham

PageDescription.TextXAlignment = Enum.TextXAlignment.Left

PageDescription.Parent = ContentHolder

--==================================================
-- SCROLLING PAGES
--==================================================

local Pages = {}

local function CreatePage(Name)

    local Page = Instance.new("ScrollingFrame")

    Page.Name = Name
    Page.Size = UDim2.new(1, -10, 1, -58)
    Page.Position = UDim2.fromOffset(5, 53)

    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0

    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = Colors.Purple

    Page.CanvasSize = UDim2.new(0, 0, 0, 0)

    Page.AutomaticCanvasSize =
        Enum.AutomaticSize.Y

    Page.ScrollingDirection =
        Enum.ScrollingDirection.Y

    Page.Visible = false

    Page.Parent = ContentHolder

    Pages[Name] = Page

    return Page
end

local CombatPage = CreatePage("CombatPage")
local VisualsPage = CreatePage("VisualsPage")
local MovementPage = CreatePage("MovementPage")
local MiscPage = CreatePage("MiscPage")

CombatPage.Visible = true

--==================================================
-- UI HELPERS
--==================================================

local function CreatePanel(
    Parent,
    Name,
    Y,
    Height
)

    local Panel = Instance.new("Frame")

    Panel.Name = Name

    Panel.Size =
        UDim2.new(1, -10, 0, Height)

    Panel.Position =
        UDim2.fromOffset(5, Y)

    Panel.BackgroundColor3 =
        Colors.Surface

    Panel.BorderSizePixel = 0

    Panel.Parent = Parent

    local Corner = Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(0, 9)

    Corner.Parent = Panel

    return Panel
end

local function CreateText(
    Parent,
    Text,
    X,
    Y,
    Width,
    Height,
    Size,
    Color
)

    local Label = Instance.new("TextLabel")

    Label.Size =
        UDim2.fromOffset(
            Width,
            Height
        )

    Label.Position =
        UDim2.fromOffset(
            X,
            Y
        )

    Label.BackgroundTransparency = 1

    Label.Text = Text

    Label.TextColor3 =
        Color or Colors.Text

    Label.TextSize = Size or 13

    Label.Font =
        Enum.Font.GothamMedium

    Label.TextXAlignment =
        Enum.TextXAlignment.Left

    Label.Parent = Parent

    return Label
end

--==================================================
-- TOGGLE CREATOR
--==================================================

local function CreateToggle(
    Parent,
    Name,
    Text,
    Y,
    Callback
)

    local Panel =
        CreatePanel(
            Parent,
            Name,
            Y,
            48
        )

    local Label =
        CreateText(
            Panel,
            Text,
            15,
            0,
            220,
            48,
            13,
            Colors.Text
        )

    local Switch = Instance.new("Frame")

    Switch.Size =
        UDim2.fromOffset(36, 19)

    Switch.Position =
        UDim2.new(
            1,
            -52,
            0.5,
            -9
        )

    Switch.BackgroundColor3 =
        Colors.Surface3

    Switch.BorderSizePixel = 0

    Switch.Parent = Panel

    local SwitchCorner =
        Instance.new("UICorner")

    SwitchCorner.CornerRadius =
        UDim.new(1, 0)

    SwitchCorner.Parent = Switch

    local Knob = Instance.new("Frame")

    Knob.Size =
        UDim2.fromOffset(15, 15)

    Knob.Position =
        UDim2.fromOffset(2, 2)

    Knob.BackgroundColor3 =
        Colors.SubText

    Knob.BorderSizePixel = 0

    Knob.Parent = Switch

    local KnobCorner =
        Instance.new("UICorner")

    KnobCorner.CornerRadius =
        UDim.new(1, 0)

    KnobCorner.Parent = Knob

    local Enabled = false

    Panel.InputBegan:Connect(function(Input)

        if Input.UserInputType
            ~= Enum.UserInputType.MouseButton1 then
            return
        end

        Enabled = not Enabled

        TweenService:Create(
            Switch,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 =
                    Enabled
                    and Colors.Purple
                    or Colors.Surface3
            }
        ):Play()

        TweenService:Create(
            Knob,
            TweenInfo.new(
                0.15,
                Enum.EasingStyle.Quad,
                Enum.EasingDirection.Out
            ),
            {
                Position =
                    Enabled
                    and UDim2.fromOffset(19, 2)
                    or UDim2.fromOffset(2, 2)
            }
        ):Play()

        if Callback then
            Callback(Enabled)
        end

    end)

    return Panel
end

--==================================================
-- SIDEBAR BUTTON
--==================================================

local CategoryButtons = {}

local function CreateCategory(
    Name,
    Text,
    Y
)

    local Button = Instance.new("TextButton")

    Button.Name = Name

    Button.Size =
        UDim2.new(1, -20, 0, 44)

    Button.Position =
        UDim2.fromOffset(10, Y)

    Button.BackgroundColor3 =
        Colors.Surface2

    Button.BorderSizePixel = 0

    Button.Text = Text

    Button.TextColor3 =
        Colors.SubText

    Button.TextSize = 13
    Button.Font = Enum.Font.GothamMedium

    Button.AutoButtonColor = false

    Button.Parent = Sidebar

    local Corner =
        Instance.new("UICorner")

    Corner.CornerRadius =
        UDim.new(0, 8)

    Corner.Parent = Button

    CategoryButtons[Name] = Button

    return Button
end

local CombatButton =
    CreateCategory(
        "CombatButton",
        "Combat",
        12
    )

local VisualsButton =
    CreateCategory(
        "VisualsButton",
        "Visuals",
        62
    )

local MovementButton =
    CreateCategory(
        "MovementButton",
        "Movement",
        112
    )

local MiscButton =
    CreateCategory(
        "MiscButton",
        "Misc",
        162
    )

--==================================================
-- PAGE SWITCH
--==================================================

local function SelectPage(
    Page,
    Button,
    TitleText,
    Description
)

    for _, CurrentPage in pairs(Pages) do
        CurrentPage.Visible = false
    end

    Page.Visible = true

    for _, CurrentButton in pairs(
        CategoryButtons
    ) do

        TweenService:Create(
            CurrentButton,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 =
                    Colors.Surface2,

                TextColor3 =
                    Colors.SubText
            }
        ):Play()

    end

    TweenService:Create(
        Button,
        TweenInfo.new(0.15),
        {
            BackgroundColor3 =
                Colors.Purple,

            TextColor3 =
                Colors.Text
        }
    ):Play()

    PageTitle.Text =
        TitleText

    PageDescription.Text =
        Description

end

CombatButton.MouseButton1Click:Connect(function()

    SelectPage(
        CombatPage,
        CombatButton,
        "Combat",
        "Aim and targeting"
    )

end)

VisualsButton.MouseButton1Click:Connect(function()

    SelectPage(
        VisualsPage,
        VisualsButton,
        "Visuals",
        "ESP and screen visuals"
    )

end)

MovementButton.MouseButton1Click:Connect(function()

    SelectPage(
        MovementPage,
        MovementButton,
        "Movement",
        "Movement assistance"
    )

end)

MiscButton.MouseButton1Click:Connect(function()

    SelectPage(
        MiscPage,
        MiscButton,
        "Misc",
        "Other client settings"
    )

end)

SelectPage(
    CombatPage,
    CombatButton,
    "Combat",
    "Aim and targeting"
)

--==================================================
-- DRAG SYSTEM
--==================================================

local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(function(Input)

    if Input.UserInputType
        == Enum.UserInputType.MouseButton1 then

        Dragging = true

        DragStart =
            Input.Position

        StartPosition =
            Main.Position

    end

end)

UserInputService.InputChanged:Connect(function(Input)

    if not Dragging then
        return
    end

    if Input.UserInputType
        ~= Enum.UserInputType.MouseMovement then
        return
    end

    local Delta =
        Input.Position - DragStart

    Main.Position = UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,

        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )

end)

UserInputService.InputEnded:Connect(function(Input)

    if Input.UserInputType
        == Enum.UserInputType.MouseButton1 then

        Dragging = false

    end

end)

--==================================================
-- MINIMIZED BUTTON
--==================================================

local Mini = Instance.new("TextButton")

Mini.Name = "Mini"
Mini.Size = UDim2.fromOffset(54, 54)

Mini.Position = Main.Position
Mini.AnchorPoint = Vector2.new(0.5, 0.5)

Mini.BackgroundColor3 = Colors.Surface
Mini.BorderSizePixel = 0

Mini.Text = ""
Mini.Visible = false
Mini.AutoButtonColor = false

Mini.Parent = Gui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = Mini

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Colors.Purple
MiniStroke.Thickness = 1.5
MiniStroke.Transparency = 0.25
MiniStroke.Parent = Mini

--==================================================
-- MINI MOON
--==================================================

local MiniMoon = Instance.new("Frame")

MiniMoon.Size = UDim2.fromOffset(26, 26)
MiniMoon.Position = UDim2.fromOffset(14, 14)

MiniMoon.BackgroundColor3 = Colors.PurpleLight
MiniMoon.BorderSizePixel = 0

MiniMoon.Parent = Mini

local MiniMoonCorner = Instance.new("UICorner")
MiniMoonCorner.CornerRadius = UDim.new(1, 0)
MiniMoonCorner.Parent = MiniMoon

local MiniCut = Instance.new("Frame")

MiniCut.Size = UDim2.fromOffset(22, 22)
MiniCut.Position = UDim2.fromOffset(10, -5)

MiniCut.BackgroundColor3 = Colors.Surface
MiniCut.BorderSizePixel = 0

MiniCut.Parent = MiniMoon

local MiniCutCorner = Instance.new("UICorner")
MiniCutCorner.CornerRadius = UDim.new(1, 0)
MiniCutCorner.Parent = MiniCut

--==================================================
-- MINIMIZE
--==================================================

local Minimized = false

Minimize.MouseButton1Click:Connect(function()

    if Minimized then
        return
    end

    Minimized = true

    local CurrentPosition = Main.Position

    Mini.Position = CurrentPosition

    local HideTween = TweenService:Create(
        Main,
        TweenInfo.new(
            0.22,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(0, 0)
        }
    )

    HideTween:Play()

    HideTween.Completed:Once(function()

        Main.Visible = false

        Mini.Visible = true
        Mini.Size = UDim2.fromOffset(0, 0)

        TweenService:Create(
            Mini,
            TweenInfo.new(
                0.3,
                Enum.EasingStyle.Back,
                Enum.EasingDirection.Out
            ),
            {
                Size = UDim2.fromOffset(54, 54)
            }
        ):Play()

    end)

end)

--==================================================
-- RESTORE FROM MINIMIZED
--==================================================

Mini.MouseButton1Click:Connect(function()

    if not Minimized then
        return
    end

    Minimized = false

    local CurrentPosition = Mini.Position

    Main.Position = CurrentPosition

    Mini.Visible = false

    Main.Visible = true

    Main.Size = UDim2.fromOffset(0, 0)

    TweenService:Create(
        Main,
        TweenInfo.new(
            0.35,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.Out
        ),
        {
            Size = UDim2.fromOffset(650, 440)
        }
    ):Play()

end)

--==================================================
-- CLOSE
--==================================================

Close.MouseButton1Click:Connect(function()

    local CloseTween = TweenService:Create(
        Main,
        TweenInfo.new(
            0.25,
            Enum.EasingStyle.Back,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(0, 0)
        }
    )

    CloseTween:Play()

    CloseTween.Completed:Once(function()

        Gui:Destroy()

    end)

end)

--==================================================
-- OPEN ANIMATION
--==================================================

local OriginalSize = UDim2.fromOffset(650, 440)

Main.Size = UDim2.fromOffset(0, 0)

Main.Visible = true

TweenService:Create(
    Main,
    TweenInfo.new(
        0.45,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = OriginalSize
    }
):Play()

--==================================================
-- HOVER EFFECTS
--==================================================

Close.MouseEnter:Connect(function()

    TweenService:Create(
        CloseLine1,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 = Colors.Red
        }
    ):Play()

    TweenService:Create(
        CloseLine2,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 = Colors.Red
        }
    ):Play()

end)

Close.MouseLeave:Connect(function()

    TweenService:Create(
        CloseLine1,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 = Colors.SubText
        }
    ):Play()

    TweenService:Create(
        CloseLine2,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 = Colors.SubText
        }
    ):Play()

end)

Minimize.MouseEnter:Connect(function()

    TweenService:Create(
        Minus,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 = Colors.PurpleLight
        }
    ):Play()

end)

Minimize.MouseLeave:Connect(function()

    TweenService:Create(
        Minus,
        TweenInfo.new(0.12),
        {
            BackgroundColor3 = Colors.SubText
        }
    ):Play()

end)

Mini.MouseEnter:Connect(function()

    TweenService:Create(
        MiniStroke,
        TweenInfo.new(0.15),
        {
            Transparency = 0
        }
    ):Play()

end)

Mini.MouseLeave:Connect(function()

    TweenService:Create(
        MiniStroke,
        TweenInfo.new(0.15),
        {
            Transparency = 0.25
        }
    ):Play()

end)

--==================================================
-- FINAL
--==================================================

print("Lunar HVH v2.0 - Part 1 loaded")

--==================================================
-- LUNAR HVH v2.0
-- PART 2/4
-- COMBAT
--==================================================

--==================================================
-- COMBAT HELPERS
--==================================================

local function GetCharacter(Player)

    if not Player then
        return nil
    end

    local Character = Player.Character

    if not Character then
        return nil
    end

    local Humanoid =
        Character:FindFirstChildOfClass("Humanoid")

    if not Humanoid or Humanoid.Health <= 0 then
        return nil
    end

    return Character
end

local function IsEnemy(Player)

    if Player == LocalPlayer then
        return false
    end

    if Config.Combat.TeamCheck then

        if LocalPlayer.Team ~= nil
            and Player.Team ~= nil
            and LocalPlayer.Team == Player.Team then

            return false
        end

    end

    return GetCharacter(Player) ~= nil
end

local function GetTargetPart(Character)

    if not Character then
        return nil
    end

    local PartName =
        Config.Combat.TargetPart

    local Part =
        Character:FindFirstChild(PartName)

    if Part then
        return Part
    end

    return Character:FindFirstChild(
        "HumanoidRootPart"
    )
end

--==================================================
-- VISIBILITY CHECK
--==================================================

local function IsVisible(TargetPart)

    if not Config.Combat.VisibilityCheck then
        return true
    end

    if not TargetPart then
        return false
    end

    local Camera =
        workspace.CurrentCamera

    if not Camera then
        return false
    end

    local Character =
        LocalPlayer.Character

    if not Character then
        return false
    end

    local Origin =
        Camera.CFrame.Position

    local Direction =
        TargetPart.Position - Origin

    local Params =
        RaycastParams.new()

    Params.FilterType =
        Enum.RaycastFilterType.Exclude

    Params.FilterDescendantsInstances = {
        Character
    }

    local Result =
        workspace:Raycast(
            Origin,
            Direction,
            Params
        )

    if not Result then
        return true
    end

    return Result.Instance:IsDescendantOf(
        TargetPart.Parent
    )
end

--==================================================
-- SCREEN DISTANCE
--==================================================

local function GetScreenDistance(TargetPart)

    local Camera =
        workspace.CurrentCamera

    if not Camera or not TargetPart then
        return math.huge
    end

    local ScreenPosition, OnScreen =
        Camera:WorldToViewportPoint(
            TargetPart.Position
        )

    if not OnScreen then
        return math.huge
    end

    local Viewport =
        Camera.ViewportSize

    local Center =
        Vector2.new(
            Viewport.X / 2,
            Viewport.Y / 2
        )

    return (
        Vector2.new(
            ScreenPosition.X,
            ScreenPosition.Y
        ) - Center
    ).Magnitude
end

--==================================================
-- BEST TARGET
--==================================================

local function GetBestTarget()

    local BestPlayer = nil
    local BestPart = nil
    local BestDistance = Config.Combat.AimFOV

    for _, Player in ipairs(
        Players:GetPlayers()
    ) do

        if IsEnemy(Player) then

            local Character =
                GetCharacter(Player)

            local TargetPart =
                GetTargetPart(Character)

            if TargetPart
                and IsVisible(TargetPart) then

                local Distance =
                    GetScreenDistance(
                        TargetPart
                    )

                if Distance < BestDistance then

                    BestDistance = Distance
                    BestPlayer = Player
                    BestPart = TargetPart

                end

            end

        end

    end

    return BestPlayer, BestPart
end

--==================================================
-- COMBAT PAGE
--==================================================

local CombatY = 0

CreateToggle(
    CombatPage,
    "AimAssist",
    "Aim Assist",
    CombatY,
    function(Value)

        Config.Combat.AimAssist = Value

    end
)

CombatY = CombatY + 55

--==================================================
-- AIM FOV
--==================================================

local AimFOVPanel =
    CreatePanel(
        CombatPage,
        "AimFOV",
        CombatY,
        70
    )

CreateText(
    AimFOVPanel,
    "Aim FOV",
    15,
    8,
    150,
    22,
    13,
    Colors.Text
)

local AimFOVValue =
    CreateText(
        AimFOVPanel,
        tostring(Config.Combat.AimFOV),
        15,
        34,
        80,
        20,
        11,
        Colors.PurpleLight
    )

local AimFOVBar =
    Instance.new("Frame")

AimFOVBar.Size =
    UDim2.new(1, -125, 0, 5)

AimFOVBar.Position =
    UDim2.fromOffset(
        100,
        40
    )

AimFOVBar.BackgroundColor3 =
    Colors.Surface3

AimFOVBar.BorderSizePixel = 0

AimFOVBar.Parent =
    AimFOVPanel

local AimFOVBarCorner =
    Instance.new("UICorner")

AimFOVBarCorner.CornerRadius =
    UDim.new(1, 0)

AimFOVBarCorner.Parent =
    AimFOVBar

local AimFOVFill =
    Instance.new("Frame")

AimFOVFill.Size =
    UDim2.new(
        Config.Combat.AimFOV / 360,
        0,
        1,
        0
    )

AimFOVFill.BackgroundColor3 =
    Colors.Purple

AimFOVFill.BorderSizePixel = 0

AimFOVFill.Parent =
    AimFOVBar

local AimFOVFillCorner =
    Instance.new("UICorner")

AimFOVFillCorner.CornerRadius =
    UDim.new(1, 0)

AimFOVFillCorner.Parent =
    AimFOVFill

local AimFOVButton =
    Instance.new("TextButton")

AimFOVButton.Size =
    UDim2.new(1, 0, 1, 0)

AimFOVButton.BackgroundTransparency = 1
AimFOVButton.Text = ""

AimFOVButton.Parent =
    AimFOVBar

local function SetAimFOVFromX(X)

    local Relative =
        math.clamp(
            X - AimFOVBar.AbsolutePosition.X,
            0,
            AimFOVBar.AbsoluteSize.X
        )

    local Percent =
        Relative /
        AimFOVBar.AbsoluteSize.X

    local Value =
        math.floor(
            30 +
            Percent * 330
        )

    Config.Combat.AimFOV =
        Value

    AimFOVValue.Text =
        tostring(Value)

    AimFOVFill.Size =
        UDim2.new(
            Percent,
            0,
            1,
            0
        )

end

AimFOVButton.MouseButton1Down:Connect(function()

    SetAimFOVFromX(
        UserInputService:GetMouseLocation().X
    )

end)

UserInputService.InputChanged:Connect(function(Input)

    if Input.UserInputType
        == Enum.UserInputType.MouseMovement then

        if UserInputService:IsMouseButtonPressed(
            Enum.UserInputType.MouseButton1
        ) then

            local MousePosition =
                UserInputService:GetMouseLocation()

            local BarPosition =
                AimFOVBar.AbsolutePosition

            local BarSize =
                AimFOVBar.AbsoluteSize

            if MousePosition.X >= BarPosition.X
                and MousePosition.X <=
                    BarPosition.X + BarSize.X then

                SetAimFOVFromX(
                    MousePosition.X
                )

            end

        end

    end

end)

CombatY = CombatY + 77

--==================================================
-- AIM SMOOTH
--==================================================

local SmoothPanel =
    CreatePanel(
        CombatPage,
        "AimSmooth",
        CombatY,
        70
    )

CreateText(
    SmoothPanel,
    "Aim Smooth",
    15,
    8,
    150,
    22,
    13,
    Colors.Text
)

local SmoothValue =
    CreateText(
        SmoothPanel,
        "15%",
        15,
        34,
        80,
        20,
        11,
        Colors.PurpleLight
    )

local SmoothBar =
    Instance.new("Frame")

SmoothBar.Size =
    UDim2.new(1, -125, 0, 5)

SmoothBar.Position =
    UDim2.fromOffset(100, 40)

SmoothBar.BackgroundColor3 =
    Colors.Surface3

SmoothBar.BorderSizePixel = 0

SmoothBar.Parent =
    SmoothPanel

local SmoothCorner =
    Instance.new("UICorner")

SmoothCorner.CornerRadius =
    UDim.new(1, 0)

SmoothCorner.Parent =
    SmoothBar

local SmoothFill =
    Instance.new("Frame")

SmoothFill.Size =
    UDim2.new(
        Config.Combat.AimSmooth,
        0,
        1,
        0
    )

SmoothFill.BackgroundColor3 =
    Colors.Purple

SmoothFill.BorderSizePixel = 0

SmoothFill.Parent =
    SmoothBar

local SmoothFillCorner =
    Instance.new("UICorner")

SmoothFillCorner.CornerRadius =
    UDim.new(1, 0)

SmoothFillCorner.Parent =
    SmoothFill

local SmoothButton =
    Instance.new("TextButton")

SmoothButton.Size =
    UDim2.fromScale(1, 1)

SmoothButton.BackgroundTransparency = 1
SmoothButton.Text = ""

SmoothButton.Parent =
    SmoothBar

SmoothButton.MouseButton1Down:Connect(function()

    local MouseX =
        UserInputService:GetMouseLocation().X

    local Relative =
        math.clamp(
            MouseX -
            SmoothBar.AbsolutePosition.X,
            0,
            SmoothBar.AbsoluteSize.X
        )

    local Percent =
        Relative /
        SmoothBar.AbsoluteSize.X

    Percent =
        math.clamp(
            Percent,
            0.01,
            1
        )

    Config.Combat.AimSmooth =
        Percent

    SmoothValue.Text =
        tostring(
            math.floor(
                Percent * 100
            )
        ) .. "%"

    SmoothFill.Size =
        UDim2.new(
            Percent,
            0,
            1,
            0
        )

end)

CombatY = CombatY + 77

--==================================================
-- TARGET PART
--==================================================

local TargetPanel =
    CreatePanel(
        CombatPage,
        "TargetPart",
        CombatY,
        48
    )

CreateText(
    TargetPanel,
    "Target Part",
    15,
    0,
    150,
    48,
    13,
    Colors.Text
)

local TargetButton =
    Instance.new("TextButton")

TargetButton.Size =
    UDim2.fromOffset(105, 30)

TargetButton.Position =
    UDim2.new(
        1,
        -120,
        0.5,
        -15
    )

TargetButton.BackgroundColor3 =
    Colors.Surface3

TargetButton.BorderSizePixel = 0

TargetButton.Text =
    Config.Combat.TargetPart

TargetButton.TextColor3 =
    Colors.PurpleLight

TargetButton.TextSize = 11
TargetButton.Font =
    Enum.Font.GothamMedium

TargetButton.AutoButtonColor = false

TargetButton.Parent =
    TargetPanel

local TargetCorner =
    Instance.new("UICorner")

TargetCorner.CornerRadius =
    UDim.new(0, 7)

TargetCorner.Parent =
    TargetButton

local TargetParts = {
    "Head",
    "UpperTorso",
    "HumanoidRootPart"
}

local TargetIndex = 1

TargetButton.MouseButton1Click:Connect(function()

    TargetIndex =
        TargetIndex + 1

    if TargetIndex >
        #TargetParts then

        TargetIndex = 1

    end

    Config.Combat.TargetPart =
        TargetParts[TargetIndex]

    TargetButton.Text =
        Config.Combat.TargetPart

end)

CombatY = CombatY + 55

--==================================================
-- TEAM CHECK
--==================================================

CreateToggle(
    CombatPage,
    "TeamCheck",
    "Team Check",
    CombatY,
    function(Value)

        Config.Combat.TeamCheck =
            Value

    end
)

CombatY = CombatY + 55

--==================================================
-- VISIBILITY CHECK
--==================================================

CreateToggle(
    CombatPage,
    "VisibilityCheck",
    "Visibility Check",
    CombatY,
    function(Value)

        Config.Combat.VisibilityCheck =
            Value

    end
)

CombatY = CombatY + 55

--==================================================
-- TRIGGERBOT
--==================================================

CreateToggle(
    CombatPage,
    "Triggerbot",
    "Triggerbot",
    CombatY,
    function(Value)

        Config.Combat.Triggerbot =
            Value

    end
)

CombatY = CombatY + 55

--==================================================
-- AUTO SHOOT
--==================================================

CreateToggle(
    CombatPage,
    "AutoShoot",
    "Auto Shoot",
    CombatY,
    function(Value)

        Config.Combat.AutoShoot =
            Value

    end
)

CombatY = CombatY + 55

--==================================================
-- RECOIL CONTROL
--==================================================

CreateToggle(
    CombatPage,
    "RecoilControl",
    "Recoil Control",
    CombatY,
    function(Value)

        Config.Combat.RecoilControl =
            Value

    end
)

--==================================================
-- AIM ASSIST LOOP
--==================================================

RunService.RenderStepped:Connect(function()

    if not Config.Combat.AimAssist then
        return
    end

    local Camera =
        workspace.CurrentCamera

    if not Camera then
        return
    end

    local TargetPlayer, TargetPart =
        GetBestTarget()

    if not TargetPlayer
        or not TargetPart then

        return
    end

    local CameraPosition =
        Camera.CFrame.Position

    local TargetPosition =
        TargetPart.Position

    local Desired =
        CFrame.lookAt(
            CameraPosition,
            TargetPosition
        )

    local Smooth =
        math.clamp(
            Config.Combat.AimSmooth,
            0.01,
            1
        )

    Camera.CFrame =
        Camera.CFrame:Lerp(
            Desired,
            Smooth
        )

end)

--==================================================
-- FOV CIRCLE
--==================================================

local FOVCircle =
    Instance.new("Frame")

FOVCircle.Name =
    "FOVCircle"

FOVCircle.Size =
    UDim2.fromOffset(
        Config.Combat.AimFOV * 2,
        Config.Combat.AimFOV * 2
    )

FOVCircle.AnchorPoint =
    Vector2.new(0.5, 0.5)

FOVCircle.Position =
    UDim2.fromScale(
        0.5,
        0.5
    )

FOVCircle.BackgroundTransparency = 1
FOVCircle.Visible = false

FOVCircle.Parent = Gui

local FOVStroke =
    Instance.new("UIStroke")

FOVStroke.Color =
    Colors.Purple

FOVStroke.Thickness = 1
FOVStroke.Transparency = 0.25

FOVStroke.Parent =
    FOVCircle

local FOVCorner =
    Instance.new("UICorner")

FOVCorner.CornerRadius =
    UDim.new(1, 0)

FOVCorner.Parent =
    FOVCircle

--==================================================
-- FOV UPDATE
--==================================================

RunService.RenderStepped:Connect(function()

    FOVCircle.Size =
        UDim2.fromOffset(
            Config.Combat.AimFOV * 2,
            Config.Combat.AimFOV * 2
        )

    FOVCircle.Visible =
        Config.Visuals.FOVCircle
        and Config.Combat.AimAssist

end)

print("Lunar HVH v2.0 - Part 2 loaded")

--==================================================
-- LUNAR HVH v2.0
-- PART 3/4
-- VISUALS
--==================================================

--==================================================
-- VISUALS PAGE
--==================================================

local VisualsY = 0

--==================================================
-- ESP STORAGE
--==================================================

local ESPObjects = {}

--==================================================
-- VISUAL HELPERS
--==================================================

local function GetRoot(Character)

    if not Character then
        return nil
    end

    return Character:FindFirstChild(
        "HumanoidRootPart"
    )
end

local function GetHumanoid(Character)

    if not Character then
        return nil
    end

    return Character:FindFirstChildOfClass(
        "Humanoid"
    )
end

local function IsAlive(Player)

    local Character =
        Player.Character

    local Humanoid =
        GetHumanoid(Character)

    return Character
        and Humanoid
        and Humanoid.Health > 0
end

--==================================================
-- ESP CONTAINER
--==================================================

local function CreateESP(Player)

    if Player == LocalPlayer then
        return
    end

    if ESPObjects[Player] then
        return
    end

    local Data = {}

    Data.Player = Player

    --==================================================
    -- HIGHLIGHT
    --==================================================

    local Highlight =
        Instance.new("Highlight")

    Highlight.Name =
        "LunarESP_Highlight"

    Highlight.FillColor =
        Colors.Purple

    Highlight.OutlineColor =
        Colors.PurpleLight

    Highlight.FillTransparency =
        0.78

    Highlight.OutlineTransparency =
        0.15

    Highlight.DepthMode =
        Enum.HighlightDepthMode.AlwaysOnTop

    Highlight.Enabled = false

    Highlight.Parent = Gui

    Data.Highlight = Highlight

    --==================================================
    -- BILLBOARD
    --==================================================

    local Billboard =
        Instance.new("BillboardGui")

    Billboard.Name =
        "LunarESP"

    Billboard.Size =
        UDim2.fromOffset(
            180,
            75
        )

    Billboard.StudsOffset =
        Vector3.new(
            0,
            3.2,
            0
        )

    Billboard.AlwaysOnTop = true

    Billboard.Enabled = false

    Billboard.Parent = Gui

    Data.Billboard =
        Billboard

    --==================================================
    -- NAME
    --==================================================

    local NameLabel =
        Instance.new("TextLabel")

    NameLabel.Size =
        UDim2.new(
            1,
            0,
            0,
            18
        )

    NameLabel.Position =
        UDim2.fromOffset(
            0,
            0
        )

    NameLabel.BackgroundTransparency = 1

    NameLabel.TextColor3 =
        Colors.Text

    NameLabel.TextStrokeTransparency =
        0.4

    NameLabel.TextSize = 12

    NameLabel.Font =
        Enum.Font.GothamBold

    NameLabel.Text = ""

    NameLabel.Parent =
        Billboard

    Data.NameLabel =
        NameLabel

    --==================================================
    -- DISTANCE
    --==================================================

    local DistanceLabel =
        Instance.new("TextLabel")

    DistanceLabel.Size =
        UDim2.new(
            1,
            0,
            0,
            17
        )

    DistanceLabel.Position =
        UDim2.fromOffset(
            0,
            18
        )

    DistanceLabel.BackgroundTransparency = 1

    DistanceLabel.TextColor3 =
        Colors.SubText

    DistanceLabel.TextStrokeTransparency =
        0.5

    DistanceLabel.TextSize = 10

    DistanceLabel.Font =
        Enum.Font.Gotham

    DistanceLabel.Text = ""

    DistanceLabel.Parent =
        Billboard

    Data.DistanceLabel =
        DistanceLabel

    --==================================================
    -- HEALTH
    --==================================================

    local HealthBackground =
        Instance.new("Frame")

    HealthBackground.Size =
        UDim2.fromOffset(
            120,
            5
        )

    HealthBackground.Position =
        UDim2.fromOffset(
            30,
            39
        )

    HealthBackground.BackgroundColor3 =
        Colors.Surface3

    HealthBackground.BorderSizePixel = 0

    HealthBackground.Parent =
        Billboard

    local HealthCorner =
        Instance.new("UICorner")

    HealthCorner.CornerRadius =
        UDim.new(1, 0)

    HealthCorner.Parent =
        HealthBackground

    local HealthFill =
        Instance.new("Frame")

    HealthFill.Size =
        UDim2.fromScale(
            1,
            1
        )

    HealthFill.BackgroundColor3 =
        Colors.Green

    HealthFill.BorderSizePixel = 0

    HealthFill.Parent =
        HealthBackground

    local HealthFillCorner =
        Instance.new("UICorner")

    HealthFillCorner.CornerRadius =
        UDim.new(1, 0)

    HealthFillCorner.Parent =
        HealthFill

    Data.HealthBackground =
        HealthBackground

    Data.HealthFill =
        HealthFill

    --==================================================
    -- WEAPON
    --==================================================

    local WeaponLabel =
        Instance.new("TextLabel")

    WeaponLabel.Size =
        UDim2.new(
            1,
            0,
            0,
            17
        )

    WeaponLabel.Position =
        UDim2.fromOffset(
            0,
            46
        )

    WeaponLabel.BackgroundTransparency = 1

    WeaponLabel.TextColor3 =
        Colors.PurpleLight

    WeaponLabel.TextStrokeTransparency =
        0.5

    WeaponLabel.TextSize = 10

    WeaponLabel.Font =
        Enum.Font.Gotham

    WeaponLabel.Text = ""

    WeaponLabel.Parent =
        Billboard

    Data.WeaponLabel =
        WeaponLabel

    --==================================================
    -- BOX GUI
    --==================================================

    local Box =
        Instance.new("BillboardGui")

    Box.Name =
        "LunarBox"

    Box.Size =
        UDim2.fromOffset(
            70,
            110
        )

    Box.StudsOffset =
        Vector3.new(
            0,
            0.5,
            0
        )

    Box.AlwaysOnTop = true

    Box.Enabled = false

    Box.Parent = Gui

    Data.Box = Box

    local BoxFrame =
        Instance.new("Frame")

    BoxFrame.Size =
        UDim2.fromScale(
            1,
            1
        )

    BoxFrame.BackgroundTransparency = 1

    BoxFrame.Parent =
        Box

    local BoxStroke =
        Instance.new("UIStroke")

    BoxStroke.Color =
        Colors.PurpleLight

    BoxStroke.Thickness = 1

    BoxStroke.Transparency = 0.1

    BoxStroke.Parent =
        BoxFrame

    Data.BoxFrame =
        BoxFrame

    --==================================================
    -- SKELETON
    --==================================================

    Data.SkeletonParts = {}

    local SkeletonConnections = {

        {"Head", "UpperTorso"},

        {"UpperTorso", "LowerTorso"},

        {"UpperTorso", "LeftUpperArm"},
        {"LeftUpperArm", "LeftLowerArm"},
        {"LeftLowerArm", "LeftHand"},

        {"UpperTorso", "RightUpperArm"},
        {"RightUpperArm", "RightLowerArm"},
        {"RightLowerArm", "RightHand"},

        {"LowerTorso", "LeftUpperLeg"},
        {"LeftUpperLeg", "LeftLowerLeg"},
        {"LeftLowerLeg", "LeftFoot"},

        {"LowerTorso", "RightUpperLeg"},
        {"RightUpperLeg", "RightLowerLeg"},
        {"RightLowerLeg", "RightFoot"}
    }

    for Index, Connection in ipairs(
        SkeletonConnections
    ) do

        local A =
            Instance.new("Attachment")

        local B =
            Instance.new("Attachment")

        local Beam =
            Instance.new("Beam")

        A.Name =
            "LunarSkeletonA_" .. Index

        B.Name =
            "LunarSkeletonB_" .. Index

        A.Parent =
            Gui

        B.Parent =
            Gui

        Beam.Attachment0 =
            A

        Beam.Attachment1 =
            B

        Beam.Width0 =
            0.035

        Beam.Width1 =
            0.035

        Beam.Color =
            ColorSequence.new(
                Colors.PurpleLight
            )

        Beam.Transparency =
            NumberSequence.new(0.05)

        Beam.FaceCamera = true

        Beam.Enabled = false

        Beam.Parent =
            Gui

        table.insert(
            Data.SkeletonParts,
            {
                Beam = Beam,
                A = A,
                B = B,
                Connection = Connection
            }
        )

    end

    --==================================================
    -- TRACER
    --==================================================

    local TracerStart =
        Instance.new("Attachment")

    local TracerEnd =
        Instance.new("Attachment")

    local Tracer =
        Instance.new("Beam")

    TracerStart.Parent =
        Gui

    TracerEnd.Parent =
        Gui

    Tracer.Attachment0 =
        TracerStart

    Tracer.Attachment1 =
        TracerEnd

    Tracer.Width0 =
        0.025

    Tracer.Width1 =
        0.025

    Tracer.Color =
        ColorSequence.new(
            Colors.Purple
        )

    Tracer.Transparency =
        NumberSequence.new(0.15)

    Tracer.FaceCamera = true

    Tracer.Enabled = false

    Tracer.Parent =
        Gui

    Data.TracerStart =
        TracerStart

    Data.TracerEnd =
        TracerEnd

    Data.Tracer =
        Tracer

    ESPObjects[Player] =
        Data

end

--==================================================
-- REMOVE ESP
--==================================================

local function RemoveESP(Player)

    local Data =
        ESPObjects[Player]

    if not Data then
        return
    end

    if Data.Highlight then
        Data.Highlight:Destroy()
    end

    if Data.Billboard then
        Data.Billboard:Destroy()
    end

    if Data.Box then
        Data.Box:Destroy()
    end

    if Data.Tracer then
        Data.Tracer:Destroy()
    end

    if Data.TracerStart then
        Data.TracerStart:Destroy()
    end

    if Data.TracerEnd then
        Data.TracerEnd:Destroy()
    end

    if Data.SkeletonParts then

        for _, Item in ipairs(
            Data.SkeletonParts
        ) do

            if Item.Beam then
                Item.Beam:Destroy()
            end

            if Item.A then
                Item.A:Destroy()
            end

            if Item.B then
                Item.B:Destroy()
            end

        end

    end

    ESPObjects[Player] = nil

end

--==================================================
-- CREATE CURRENT PLAYERS
--==================================================

for _, Player in ipairs(
    Players:GetPlayers()
) do

    CreateESP(Player)

end

--==================================================
-- PLAYER ADDED
--==================================================

Players.PlayerAdded:Connect(function(Player)

    CreateESP(Player)

end)

--==================================================
-- PLAYER REMOVING
--==================================================

Players.PlayerRemoving:Connect(function(Player)

    RemoveESP(Player)

end)

--==================================================
-- ESP UPDATE
--==================================================

local function UpdateESP()

    local Camera =
        workspace.CurrentCamera

    local LocalCharacter =
        LocalPlayer.Character

    local LocalRoot =
        GetRoot(LocalCharacter)

    for Player, Data in pairs(
        ESPObjects
    ) do

        local Character =
            Player.Character

        local Root =
            GetRoot(Character)

        local Humanoid =
            GetHumanoid(Character)

        local Alive =
            Character
            and Root
            and Humanoid
            and Humanoid.Health > 0

        if not Alive then

            Data.Billboard.Enabled = false
            Data.Box.Enabled = false
            Data.Highlight.Enabled = false
            Data.Tracer.Enabled = false

            for _, Item in ipairs(
                Data.SkeletonParts
            ) do

                Item.Beam.Enabled = false

            end

            continue

        end

        --==================================================
        -- ESP ENABLE
        --==================================================

        local Enabled =
            Config.Visuals.ESP

        Data.Billboard.Enabled =
            Enabled

        --==================================================
        -- HIGHLIGHT / CHAMS
        --==================================================

        Data.Highlight.Adornee =
            Character

        Data.Highlight.Enabled =
            Enabled
            and Config.Visuals.Chams

        --==================================================
        -- NAME
        --==================================================

        Data.NameLabel.Visible =
            Config.Visuals.Name

        Data.NameLabel.Text =
            Player.DisplayName
            .. " ["
            .. Player.Name
            .. "]"

        --==================================================
        -- DISTANCE
        --==================================================

        if LocalRoot then

            local Distance =
                (
                    Root.Position
                    -
                    LocalRoot.Position
                ).Magnitude

            Data.DistanceLabel.Text =
                tostring(
                    math.floor(Distance)
                )
                .. " studs"

        else

            Data.DistanceLabel.Text = ""

        end

        Data.DistanceLabel.Visible =
            Config.Visuals.Distance

        --==================================================
        -- HEALTH
        --==================================================

        local Health =
            math.max(
                Humanoid.Health,
                0
            )

        local MaxHealth =
            math.max(
                Humanoid.MaxHealth,
                1
            )

        local HealthPercent =
            math.clamp(
                Health / MaxHealth,
                0,
                1
            )

        Data.HealthBackground.Visible =
            Config.Visuals.Health

        Data.HealthFill.Size =
            UDim2.new(
                HealthPercent,
                0,
                1,
                0
            )

        --==================================================
        -- WEAPON
        --==================================================

        local Tool =
            Character:FindFirstChildOfClass(
                "Tool"
            )

        if Tool then
            Data.WeaponLabel.Text =
                Tool.Name
        else
            Data.WeaponLabel.Text =
                "No weapon"
        end

        Data.WeaponLabel.Visible =
            Config.Visuals.Weapon

        --==================================================
        -- BOX
        --==================================================

        Data.Box.Adornee =
            Root

        Data.Box.Enabled =
            Enabled
            and Config.Visuals.Box

        --==================================================
        -- TRACER
        --==================================================

        if Config.Visuals.Tracers
            and Camera then

            Data.TracerStart.WorldPosition =
                Camera.CFrame.Position

            Data.TracerEnd.WorldPosition =
                Root.Position

            Data.Tracer.Enabled =
                Enabled

        else

            Data.Tracer.Enabled = false

        end

        --==================================================
        -- SKELETON
        --==================================================

        for _, Item in ipairs(
            Data.SkeletonParts
        ) do

            local PartA =
                Character:FindFirstChild(
                    Item.Connection[1]
                )

            local PartB =
                Character:FindFirstChild(
                    Item.Connection[2]
                )

            if PartA and PartB then

                Item.A.WorldPosition =
                    PartA.Position

                Item.B.WorldPosition =
                    PartB.Position

                Item.Beam.Enabled =
                    Enabled
                    and Config.Visuals.Skeleton

            else

                Item.Beam.Enabled = false

            end

        end

    end

end

RunService.RenderStepped:Connect(
    UpdateESP
)

--==================================================
-- VISUAL TOGGLE HELPER
--==================================================

local function CreateVisualToggle(
    Text,
    Y,
    Callback
)

    return CreateToggle(
        VisualsPage,
        Text,
        Text,
        Y,
        Callback
    )

end

--==================================================
-- VISUAL SETTINGS
--==================================================

CreateVisualToggle(
    "ESP",
    VisualsY,
    function(Value)

        Config.Visuals.ESP =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Box ESP",
    VisualsY,
    function(Value)

        Config.Visuals.Box =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Skeleton ESP",
    VisualsY,
    function(Value)

        Config.Visuals.Skeleton =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Tracers",
    VisualsY,
    function(Value)

        Config.Visuals.Tracers =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Health Bar",
    VisualsY,
    function(Value)

        Config.Visuals.Health =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Name ESP",
    VisualsY,
    function(Value)

        Config.Visuals.Name =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Distance",
    VisualsY,
    function(Value)

        Config.Visuals.Distance =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Weapon ESP",
    VisualsY,
    function(Value)

        Config.Visuals.Weapon =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Chams",
    VisualsY,
    function(Value)

        Config.Visuals.Chams =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "FOV Circle",
    VisualsY,
    function(Value)

        Config.Visuals.FOVCircle =
            Value

    end
)

VisualsY = VisualsY + 55

CreateVisualToggle(
    "Crosshair",
    VisualsY,
    function(Value)

        Config.Visuals.Crosshair =
            Value

    end
)

--==================================================
-- CROSSHAIR
--==================================================

local Crosshair =
    Instance.new("Frame")

Crosshair.Name =
    "LunarCrosshair"

Crosshair.Size =
    UDim2.fromOffset(
        2,
        18
    )

Crosshair.Position =
    UDim2.fromScale(
        0.5,
        0.5
    )

Crosshair.AnchorPoint =
    Vector2.new(
        0.5,
        0.5
    )

Crosshair.BackgroundColor3 =
    Colors.PurpleLight

Crosshair.BorderSizePixel = 0

Crosshair.Parent =
    Gui

local Crosshair2 =
    Instance.new("Frame")

Crosshair2.Name =
    "LunarCrosshairHorizontal"

Crosshair2.Size =
    UDim2.fromOffset(
        18,
        2
    )

Crosshair2.Position =
    UDim2.fromScale(
        0.5,
        0.5
    )

Crosshair2.AnchorPoint =
    Vector2.new(
        0.5,
        0.5
    )

Crosshair2.BackgroundColor3 =
    Colors.PurpleLight

Crosshair2.BorderSizePixel = 0

Crosshair2.Parent =
    Gui

--==================================================
-- CROSSHAIR CENTER
--==================================================

local CrosshairCenter =
    Instance.new("Frame")

CrosshairCenter.Name =
    "LunarCrosshairCenter"

CrosshairCenter.Size =
    UDim2.fromOffset(
        4,
        4
    )

CrosshairCenter.Position =
    UDim2.fromScale(
        0.5,
        0.5
    )

CrosshairCenter.AnchorPoint =
    Vector2.new(
        0.5,
        0.5
    )

CrosshairCenter.BackgroundColor3 =
    Colors.PurpleLight

CrosshairCenter.BorderSizePixel = 0

CrosshairCenter.Parent =
    Gui

local CenterCorner =
    Instance.new("UICorner")

CenterCorner.CornerRadius =
    UDim.new(1, 0)

CenterCorner.Parent =
    CrosshairCenter

--==================================================
-- CROSSHAIR UPDATE
--==================================================

RunService.RenderStepped:Connect(function()

    local Enabled =
        Config.Visuals.Crosshair

    Crosshair.Visible =
        Enabled

    Crosshair2.Visible =
        Enabled

    CrosshairCenter.Visible =
        Enabled

end)

--==================================================
-- CROSSHAIR ANIMATION
--==================================================

local CrosshairPulse = 0

RunService.RenderStepped:Connect(function(Delta)

    if not Config.Visuals.Crosshair then
        return
    end

    CrosshairPulse =
        CrosshairPulse + Delta * 3

    local Pulse =
        math.sin(CrosshairPulse) * 1.5

    Crosshair.Size =
        UDim2.fromOffset(
            2,
            18 + Pulse
        )

    Crosshair2.Size =
        UDim2.fromOffset(
            18 + Pulse,
            2
        )

end)

--==================================================
-- VISUALS READY
--==================================================

print("Lunar HVH v2.0 - Visuals loaded")

--==================================================
-- END OF PART 3/4
--==================================================

--// =========================================
--// PART 4/4 — MOVEMENT + MISC + FINAL
--// =========================================

--// MOVEMENT PAGE

local MovementPanel = CreatePanel(MovementPage, 10, 10, 610, 0)
MovementPanel.AutomaticSize = Enum.AutomaticSize.Y

CreateText(MovementPanel, "MOVEMENT", 18, 14, 170, 22)

CreateToggle(
	MovementPanel,
	"Bunny Hop",
	"Automatic jumping while moving",
	function(Value)
		Config.Movement.BunnyHop = Value
	end,
	Config.Movement.BunnyHop
)

CreateToggle(
	MovementPanel,
	"Auto Strafe",
	"Automatic air movement",
	function(Value)
		Config.Movement.AutoStrafe = Value
	end,
	Config.Movement.AutoStrafe
)

CreateToggle(
	MovementPanel,
	"Speed",
	"Custom movement speed",
	function(Value)
		Config.Movement.Speed = Value
	end,
	Config.Movement.Speed
)

CreateToggle(
	MovementPanel,
	"Air Control",
	"Improved control while airborne",
	function(Value)
		Config.Movement.AirControl = Value
	end,
	Config.Movement.AirControl
)

CreateToggle(
	MovementPanel,
	"Infinite Jump",
	"Jump whenever the jump key is pressed",
	function(Value)
		Config.Movement.InfiniteJump = Value
	end,
	Config.Movement.InfiniteJump
)

--// SPEED VALUE

local SpeedLabel = CreateText(
	MovementPanel,
	"Speed Value: " .. tostring(Config.Movement.SpeedValue),
	15,
	14,
	260,
	22
)

local SpeedMinus = Instance.new("TextButton")
SpeedMinus.Parent = MovementPanel
SpeedMinus.Size = UDim2.fromOffset(32, 28)
SpeedMinus.Position = UDim2.new(1, -78, 0, 14)
SpeedMinus.BackgroundColor3 = Colors.Panel2
SpeedMinus.BorderSizePixel = 0
SpeedMinus.Text = "-"
SpeedMinus.TextColor3 = Colors.Text
SpeedMinus.TextSize = 18
SpeedMinus.Font = Enum.Font.GothamBold

local SpeedMinusCorner = Instance.new("UICorner")
SpeedMinusCorner.CornerRadius = UDim.new(0, 7)
SpeedMinusCorner.Parent = SpeedMinus

local SpeedPlus = Instance.new("TextButton")
SpeedPlus.Parent = MovementPanel
SpeedPlus.Size = UDim2.fromOffset(32, 28)
SpeedPlus.Position = UDim2.new(1, -40, 0, 14)
SpeedPlus.BackgroundColor3 = Colors.Panel2
SpeedPlus.BorderSizePixel = 0
SpeedPlus.Text = "+"
SpeedPlus.TextColor3 = Colors.Text
SpeedPlus.TextSize = 18
SpeedPlus.Font = Enum.Font.GothamBold

local SpeedPlusCorner = Instance.new("UICorner")
SpeedPlusCorner.CornerRadius = UDim.new(0, 7)
SpeedPlusCorner.Parent = SpeedPlus

local function UpdateSpeed()
	SpeedLabel.Text = "Speed Value: " .. tostring(Config.Movement.SpeedValue)
end

SpeedMinus.MouseButton1Click:Connect(function()
	Config.Movement.SpeedValue = math.max(8, Config.Movement.SpeedValue - 2)
	UpdateSpeed()
end)

SpeedPlus.MouseButton1Click:Connect(function()
	Config.Movement.SpeedValue = math.min(60, Config.Movement.SpeedValue + 2)
	UpdateSpeed()
end)

--// MOVEMENT LOGIC

local JumpConnection

JumpConnection = UserInputService.JumpRequest:Connect(function()

	if Config.Movement.InfiniteJump then

		local Character = LocalPlayer.Character
		if not Character then return end

		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end

	end

end)

RunService.RenderStepped:Connect(function()

	local Character = LocalPlayer.Character
	if not Character then return end

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then return end

	-- SPEED

	if Config.Movement.Speed then
		Humanoid.WalkSpeed = Config.Movement.SpeedValue
	else
		if Humanoid.WalkSpeed ~= 16 then
			Humanoid.WalkSpeed = 16
		end
	end

	-- BUNNY HOP

	if Config.Movement.BunnyHop then

		local State = Humanoid:GetState()

		if State == Enum.HumanoidStateType.Running
			or State == Enum.HumanoidStateType.Landed then

			if Humanoid.MoveDirection.Magnitude > 0 then
				Humanoid.Jump = true
			end

		end

	end

	-- AUTO STRAFE

	if Config.Movement.AutoStrafe then

		local Root = Character:FindFirstChild("HumanoidRootPart")

		if Root and Humanoid.MoveDirection.Magnitude > 0 then

			local Move = Humanoid.MoveDirection

			Humanoid:Move(
				Vector3.new(Move.X, 0, Move.Z),
				false
			)

		end

	end

	-- AIR CONTROL

	if Config.Movement.AirControl then

		local State = Humanoid:GetState()

		if State == Enum.HumanoidStateType.Freefall
			or State == Enum.HumanoidStateType.Jumping then

			if Humanoid.MoveDirection.Magnitude > 0 then
				Humanoid:Move(Humanoid.MoveDirection, false)
			end

		end

	end

end)


--// =========================================
--// MISC PAGE
--// =========================================

local MiscPanel = CreatePanel(MiscPage, 10, 10, 610, 0)
MiscPanel.AutomaticSize = Enum.AutomaticSize.Y

CreateText(MiscPanel, "MISC", 18, 14, 170, 22)

CreateToggle(
	MiscPanel,
	"FOV Changer",
	"Change camera field of view",
	function(Value)
		Config.Misc.FOV = Value
	end,
	Config.Misc.FOV
)

CreateToggle(
	MiscPanel,
	"Third Person",
	"Third person camera",
	function(Value)
		Config.Misc.ThirdPerson = Value
	end,
	Config.Misc.ThirdPerson
)

CreateToggle(
	MiscPanel,
	"Hit Marker",
	"Show hit confirmation",
	function(Value)
		Config.Misc.HitMarker = Value
	end,
	Config.Misc.HitMarker
)

CreateToggle(
	MiscPanel,
	"Damage Indicator",
	"Show damage information",
	function(Value)
		Config.Misc.DamageIndicator = Value
	end,
	Config.Misc.DamageIndicator
)

CreateToggle(
	MiscPanel,
	"FPS",
	"Display FPS counter",
	function(Value)
		Config.Misc.FPS = Value
	end,
	Config.Misc.FPS
)

CreateToggle(
	MiscPanel,
	"Ping",
	"Display network ping",
	function(Value)
		Config.Misc.Ping = Value
	end,
	Config.Misc.Ping
)

CreateToggle(
	MiscPanel,
	"Watermark",
	"Display Lunar HVH watermark",
	function(Value)
		Config.Misc.Watermark = Value
	end,
	Config.Misc.Watermark
)

CreateToggle(
	MiscPanel,
	"Keybind List",
	"Display active keybinds",
	function(Value)
		Config.Misc.Keybinds = Value
	end,
	Config.Misc.Keybinds
)


--// =========================================
--// CAMERA FOV
--// =========================================

local Camera = workspace.CurrentCamera
local OriginalFOV = Camera.FieldOfView

RunService.RenderStepped:Connect(function()

	Camera = workspace.CurrentCamera

	if not Camera then return end

	if Config.Misc.FOV then
		Camera.FieldOfView = Config.Misc.FOVValue
	else
		Camera.FieldOfView = OriginalFOV
	end

end)


--// =========================================
--// THIRD PERSON
--// =========================================

local OriginalMinZoom = LocalPlayer.CameraMinZoomDistance
local OriginalMaxZoom = LocalPlayer.CameraMaxZoomDistance

RunService.RenderStepped:Connect(function()

	if Config.Misc.ThirdPerson then

		LocalPlayer.CameraMode = Enum.CameraMode.Classic
		LocalPlayer.CameraMinZoomDistance = 7
		LocalPlayer.CameraMaxZoomDistance = 18

	else

		LocalPlayer.CameraMinZoomDistance = OriginalMinZoom
		LocalPlayer.CameraMaxZoomDistance = OriginalMaxZoom

	end

end)


--// =========================================
--// WATERMARK
--// =========================================

local Watermark = Instance.new("Frame")
Watermark.Parent = Gui
Watermark.Size = UDim2.fromOffset(190, 42)
Watermark.Position = UDim2.fromOffset(15, 15)
Watermark.BackgroundColor3 = Colors.Panel
Watermark.BackgroundTransparency = 0.08
Watermark.BorderSizePixel = 0
Watermark.Visible = Config.Misc.Watermark
Watermark.ZIndex = 20

local WatermarkCorner = Instance.new("UICorner")
WatermarkCorner.CornerRadius = UDim.new(0, 10)
WatermarkCorner.Parent = Watermark

local WatermarkStroke = Instance.new("UIStroke")
WatermarkStroke.Color = Colors.Purple
WatermarkStroke.Transparency = 0.45
WatermarkStroke.Thickness = 1
WatermarkStroke.Parent = Watermark

local WatermarkText = Instance.new("TextLabel")
WatermarkText.Parent = Watermark
WatermarkText.BackgroundTransparency = 1
WatermarkText.Size = UDim2.new(1, -16, 1, 0)
WatermarkText.Position = UDim2.fromOffset(8, 0)
WatermarkText.Text = "LUNAR HVH  |  v2.0"
WatermarkText.TextColor3 = Colors.Text
WatermarkText.TextSize = 13
WatermarkText.Font = Enum.Font.GothamBold
WatermarkText.TextXAlignment = Enum.TextXAlignment.Left


--// =========================================
--// FPS / PING
--// =========================================

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Parent = Gui
StatsLabel.BackgroundTransparency = 1
StatsLabel.Size = UDim2.fromOffset(220, 25)
StatsLabel.Position = UDim2.new(0, 15, 1, -40)
StatsLabel.Text = ""
StatsLabel.TextColor3 = Colors.Text
StatsLabel.TextSize = 12
StatsLabel.Font = Enum.Font.GothamMedium
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.Visible = false
StatsLabel.ZIndex = 20

local Frames = 0
local LastTime = tick()
local CurrentFPS = 0

RunService.RenderStepped:Connect(function()

	Frames += 1

	local Now = tick()

	if Now - LastTime >= 1 then

		CurrentFPS = Frames
		Frames = 0
		LastTime = Now

	end

	local PingText = "N/A"

	pcall(function()

		local Network = Stats.Network
		local ServerStats = Network.ServerStatsItem

		if ServerStats then

			local DataPing = ServerStats:FindFirstChild("Data Ping")

			if DataPing then
				PingText = DataPing:GetValueString()
			end

		end

	end)

	local ShowFPS = Config.Misc.FPS
	local ShowPing = Config.Misc.Ping

	StatsLabel.Visible = ShowFPS or ShowPing

	if not StatsLabel.Visible then
		return
	end

	local Parts = {}

	if ShowFPS then
		table.insert(Parts, "FPS: " .. tostring(CurrentFPS))
	end

	if ShowPing then
		table.insert(Parts, "PING: " .. tostring(PingText))
	end

	StatsLabel.Text = table.concat(Parts, "  |  ")

end)


--// =========================================
--// KEYBIND LIST
--// =========================================

local KeybindFrame = Instance.new("Frame")
KeybindFrame.Parent = Gui
KeybindFrame.Size = UDim2.fromOffset(180, 120)
KeybindFrame.Position = UDim2.new(1, -195, 0, 15)
KeybindFrame.BackgroundColor3 = Colors.Panel
KeybindFrame.BackgroundTransparency = 0.08
KeybindFrame.BorderSizePixel = 0
KeybindFrame.Visible = Config.Misc.Keybinds
KeybindFrame.ZIndex = 20

local KeybindCorner = Instance.new("UICorner")
KeybindCorner.CornerRadius = UDim.new(0, 10)
KeybindCorner.Parent = KeybindFrame

local KeybindStroke = Instance.new("UIStroke")
KeybindStroke.Color = Colors.Purple
KeybindStroke.Transparency = 0.45
KeybindStroke.Thickness = 1
KeybindStroke.Parent = KeybindFrame

local KeybindTitle = Instance.new("TextLabel")
KeybindTitle.Parent = KeybindFrame
KeybindTitle.BackgroundTransparency = 1
KeybindTitle.Size = UDim2.new(1, -16, 0, 28)
KeybindTitle.Position = UDim2.fromOffset(8, 5)
KeybindTitle.Text = "KEYBINDS"
KeybindTitle.TextColor3 = Colors.Text
KeybindTitle.TextSize = 13
KeybindTitle.Font = Enum.Font.GothamBold
KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeybindText = Instance.new("TextLabel")
KeybindText.Parent = KeybindFrame
KeybindText.BackgroundTransparency = 1
KeybindText.Size = UDim2.new(1, -16, 1, -38)
KeybindText.Position = UDim2.fromOffset(8, 34)
KeybindText.Text = "LMB   AIM\nSPACE   BHOP\nV   THIRD PERSON"
KeybindText.TextColor3 = Colors.SubText
KeybindText.TextSize = 11
KeybindText.Font = Enum.Font.GothamMedium
KeybindText.TextXAlignment = Enum.TextXAlignment.Left
KeybindText.TextYAlignment = Enum.TextYAlignment.Top


--// =========================================
--// UI STATE UPDATE
--// =========================================

RunService.RenderStepped:Connect(function()

	Watermark.Visible = Config.Misc.Watermark
	KeybindFrame.Visible = Config.Misc.Keybinds

end)


--// =========================================
--// HIT MARKER
--// =========================================

local HitMarker = Instance.new("Frame")
HitMarker.Parent = Gui
HitMarker.BackgroundTransparency = 1
HitMarker.Size = UDim2.fromOffset(42, 42)
HitMarker.AnchorPoint = Vector2.new(0.5, 0.5)
HitMarker.Position = UDim2.fromScale(0.5, 0.5)
HitMarker.Visible = false
HitMarker.ZIndex = 30

local HitLine1 = Instance.new("Frame")
HitLine1.Parent = HitMarker
HitLine1.Size = UDim2.fromOffset(2, 18)
HitLine1.Position = UDim2.new(0.5, -1, 0, 3)
HitLine1.Rotation = 45
HitLine1.BorderSizePixel = 0
HitLine1.BackgroundColor3 = Colors.Text

local HitLine2 = Instance.new("Frame")
HitLine2.Parent = HitMarker
HitLine2.Size = UDim2.fromOffset(2, 18)
HitLine2.Position = UDim2.new(0.5, -1, 0, 3)
HitLine2.Rotation = -45
HitLine2.BorderSizePixel = 0
HitLine2.BackgroundColor3 = Colors.Text

local HitLine3 = Instance.new("Frame")
HitLine3.Parent = HitMarker
HitLine3.Size = UDim2.fromOffset(2, 18)
HitLine3.Position = UDim2.new(0.5, -1, 0, 21)
HitLine3.Rotation = 45
HitLine3.BorderSizePixel = 0
HitLine3.BackgroundColor3 = Colors.Text

local HitLine4 = Instance.new("Frame")
HitLine4.Parent = HitMarker
HitLine4.Size = UDim2.fromOffset(2, 18)
HitLine4.Position = UDim2.new(0.5, -1, 0, 21)
HitLine4.Rotation = -45
HitLine4.BorderSizePixel = 0
HitLine4.BackgroundColor3 = Colors.Text

-- Public function for your own weapon/damage system
_G.LunarShowHitMarker = function()

	if not Config.Misc.HitMarker then
		return
	end

	HitMarker.Visible = true

	task.delay(0.12, function()

		if HitMarker then
			HitMarker.Visible = false
		end

	end)

end


--// =========================================
--// DAMAGE INDICATOR API
--// =========================================

_G.LunarShowDamage = function(Damage)

	if not Config.Misc.DamageIndicator then
		return
	end

	local DamageText = Instance.new("TextLabel")
	DamageText.Parent = Gui
	DamageText.BackgroundTransparency = 1
	DamageText.Size = UDim2.fromOffset(100, 30)
	DamageText.AnchorPoint = Vector2.new(0.5, 0.5)
	DamageText.Position = UDim2.fromScale(
		0.5 + math.random(-10, 10) / 100,
		0.5 + math.random(-10, 10) / 100
	)
	DamageText.Text = "-" .. tostring(Damage)
	DamageText.TextColor3 = Colors.Text
	DamageText.TextSize = 18
	DamageText.Font = Enum.Font.GothamBold
	DamageText.ZIndex = 30

	local StartPosition = DamageText.Position

	local Tween = TweenService:Create(
		DamageText,
		TweenInfo.new(
			0.55,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		),
		{
			Position = StartPosition - UDim2.fromOffset(0, 45),
			TextTransparency = 1
		}
	)

	Tween:Play()

	Tween.Completed:Connect(function()
		DamageText:Destroy()
	end)

end


--// =========================================
--// CLEANUP
--// =========================================

local function Cleanup()

	-- Restore camera FOV
	if Camera then
		Camera.FieldOfView = OriginalFOV
	end

	-- Restore camera distance
	LocalPlayer.CameraMinZoomDistance = OriginalMinZoom
	LocalPlayer.CameraMaxZoomDistance = OriginalMaxZoom

	-- Restore movement
	local Character = LocalPlayer.Character

	if Character then

		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid.WalkSpeed = 16
		end

	end

	-- Remove ESP
	for Player, _ in pairs(ESPObjects) do
		RemoveESP(Player)
	end

end


--// =========================================
--// CLOSE CONNECTION
--// =========================================

Close.MouseButton1Click:Connect(function()

	Cleanup()

	local CloseTween = TweenService:Create(
		Main,
		TweenInfo.new(
			0.28,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.In
		),
		{
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1
		}
	)

	CloseTween:Play()

	task.wait(0.3)

	Gui:Destroy()

end)


--// =========================================
--// OPEN / START ANIMATION
--// =========================================

Main.Size = UDim2.fromOffset(0, 0)
Main.BackgroundTransparency = 1

task.spawn(function()

	task.wait(0.05)

	TweenService:Create(
		Main,
		TweenInfo.new(
			0.55,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			Size = UDim2.fromOffset(650, 440),
			BackgroundTransparency = 0
		}
	):Play()

end)


--// =========================================
--// FINAL HOVER EFFECTS
--// =========================================

local function AddButtonHover(Button)

	local Original = Button.BackgroundColor3

	Button.MouseEnter:Connect(function()

		TweenService:Create(
			Button,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = Colors.Panel2
			}
		):Play()

	end)

	Button.MouseLeave:Connect(function()

		TweenService:Create(
			Button,
			TweenInfo.new(0.12),
			{
				BackgroundColor3 = Original
			}
		):Play()

	end)

end

AddButtonHover(Minimize)
AddButtonHover(Close)

for _, Button in pairs(CategoryButtons) do
	AddButtonHover(Button)
end


--// =========================================
--// FINAL
--// =========================================

print("=================================")
print(" Lunar HVH v2.0")
print(" Combat      : Loaded")
print(" Visuals     : Loaded")
print(" Movement    : Loaded")
print(" Misc        : Loaded")
print("=================================")

--// =========================================
--// TEMP FUNCTION CONTROLLER
--// Добавить в самый конец
--// =========================================

local TempController = Instance.new("Frame")
TempController.Name = "TempController"
TempController.Parent = Gui
TempController.Size = UDim2.fromOffset(210, 360)
TempController.Position = UDim2.new(1, -225, 0.5, -180)
TempController.BackgroundColor3 = Colors.Panel
TempController.BorderSizePixel = 0
TempController.ZIndex = 50

local TempCorner = Instance.new("UICorner")
TempCorner.CornerRadius = UDim.new(0, 12)
TempCorner.Parent = TempController

local TempStroke = Instance.new("UIStroke")
TempStroke.Color = Colors.Purple
TempStroke.Thickness = 1
TempStroke.Transparency = 0.25
TempStroke.Parent = TempController

-- TITLE

local TempTitle = Instance.new("TextLabel")
TempTitle.Parent = TempController
TempTitle.BackgroundTransparency = 1
TempTitle.Size = UDim2.new(1, -20, 0, 35)
TempTitle.Position = UDim2.fromOffset(10, 5)
TempTitle.Text = "TEMP CONTROLLER"
TempTitle.TextColor3 = Colors.Text
TempTitle.TextSize = 14
TempTitle.Font = Enum.Font.GothamBold
TempTitle.TextXAlignment = Enum.TextXAlignment.Left
TempTitle.ZIndex = 51

-- SCROLL

local TempScroll = Instance.new("ScrollingFrame")
TempScroll.Parent = TempController
TempScroll.Position = UDim2.fromOffset(8, 45)
TempScroll.Size = UDim2.new(1, -16, 1, -53)
TempScroll.BackgroundTransparency = 1
TempScroll.BorderSizePixel = 0
TempScroll.ScrollBarThickness = 3
TempScroll.CanvasSize = UDim2.fromOffset(0, 0)
TempScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
TempScroll.ZIndex = 51

local TempLayout = Instance.new("UIListLayout")
TempLayout.Parent = TempScroll
TempLayout.Padding = UDim.new(0, 6)
TempLayout.SortOrder = Enum.SortOrder.LayoutOrder


--// BUTTON CREATOR

local function TempButton(Name, GetState, SetState)

	local Button = Instance.new("TextButton")
	Button.Parent = TempScroll
	Button.Size = UDim2.new(1, -4, 0, 34)
	Button.BackgroundColor3 = Colors.Panel2
	Button.BorderSizePixel = 0
	Button.Text = ""
	Button.AutoButtonColor = false
	Button.ZIndex = 52

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Button

	local Text = Instance.new("TextLabel")
	Text.Parent = Button
	Text.BackgroundTransparency = 1
	Text.Position = UDim2.fromOffset(10, 0)
	Text.Size = UDim2.new(1, -20, 1, 0)
	Text.TextXAlignment = Enum.TextXAlignment.Left
	Text.TextSize = 12
	Text.Font = Enum.Font.GothamMedium
	Text.ZIndex = 53

	local function Update()

		local Enabled = GetState()

		if Enabled then
			Text.Text = Name .. "  [ON]"
			Text.TextColor3 = Colors.Text
			Button.BackgroundColor3 = Colors.Purple
		else
			Text.Text = Name .. "  [OFF]"
			Text.TextColor3 = Colors.SubText
			Button.BackgroundColor3 = Colors.Panel2
		end

	end

	Button.MouseButton1Click:Connect(function()

		SetState(not GetState())
		Update()

	end)

	Button.MouseEnter:Connect(function()

		TweenService:Create(
			Button,
			TweenInfo.new(0.1),
			{
				BackgroundTransparency = 0.15
			}
		):Play()

	end)

	Button.MouseLeave:Connect(function()

		TweenService:Create(
			Button,
			TweenInfo.new(0.1),
			{
				BackgroundTransparency = 0
			}
		):Play()

	end)

	Update()

	return Button

end


--// =========================================
--// COMBAT
--// =========================================

TempButton(
	"Aim Assist",
	function()
		return Config.Combat.AimAssist
	end,
	function(Value)
		Config.Combat.AimAssist = Value
	end
)

TempButton(
	"Triggerbot",
	function()
		return Config.Combat.Triggerbot
	end,
	function(Value)
		Config.Combat.Triggerbot = Value
	end
)

TempButton(
	"Auto Shoot",
	function()
		return Config.Combat.AutoShoot
	end,
	function(Value)
		Config.Combat.AutoShoot = Value
	end
)

TempButton(
	"Recoil Control",
	function()
		return Config.Combat.RecoilControl
	end,
	function(Value)
		Config.Combat.RecoilControl = Value
	end
)


--// =========================================
--// VISUALS
--// =========================================

TempButton(
	"ESP",
	function()
		return Config.Visuals.ESP
	end,
	function(Value)
		Config.Visuals.ESP = Value
	end
)

TempButton(
	"Box ESP",
	function()
		return Config.Visuals.Box
	end,
	function(Value)
		Config.Visuals.Box = Value
	end
)

TempButton(
	"Skeleton",
	function()
		return Config.Visuals.Skeleton
	end,
	function(Value)
		Config.Visuals.Skeleton = Value
	end
)

TempButton(
	"Tracers",
	function()
		return Config.Visuals.Tracers
	end,
	function(Value)
		Config.Visuals.Tracers = Value
	end
)

TempButton(
	"Chams",
	function()
		return Config.Visuals.Chams
	end,
	function(Value)
		Config.Visuals.Chams = Value
	end
)

TempButton(
	"FOV Circle",
	function()
		return Config.Visuals.FOVCircle
	end,
	function(Value)
		Config.Visuals.FOVCircle = Value
	end
)


--// =========================================
--// MOVEMENT
--// =========================================

TempButton(
	"Bunny Hop",
	function()
		return Config.Movement.BunnyHop
	end,
	function(Value)
		Config.Movement.BunnyHop = Value
	end
)

TempButton(
	"Auto Strafe",
	function()
		return Config.Movement.AutoStrafe
	end,
	function(Value)
		Config.Movement.AutoStrafe = Value
	end
)

TempButton(
	"Speed",
	function()
		return Config.Movement.Speed
	end,
	function(Value)
		Config.Movement.Speed = Value
	end
)

TempButton(
	"Air Control",
	function()
		return Config.Movement.AirControl
	end,
	function(Value)
		Config.Movement.AirControl = Value
	end
)

TempButton(
	"Infinite Jump",
	function()
		return Config.Movement.InfiniteJump
	end,
	function(Value)
		Config.Movement.InfiniteJump = Value
	end
)


--// =========================================
--// MISC
--// =========================================

TempButton(
	"FOV Changer",
	function()
		return Config.Misc.FOV
	end,
	function(Value)
		Config.Misc.FOV = Value
	end
)

TempButton(
	"Third Person",
	function()
		return Config.Misc.ThirdPerson
	end,
	function(Value)
		Config.Misc.ThirdPerson = Value
	end
)

TempButton(
	"Hit Marker",
	function()
		return Config.Misc.HitMarker
	end,
	function(Value)
		Config.Misc.HitMarker = Value
	end
)

TempButton(
	"FPS",
	function()
		return Config.Misc.FPS
	end,
	function(Value)
		Config.Misc.FPS = Value
	end
)

TempButton(
	"Ping",
	function()
		return Config.Misc.Ping
	end,
	function(Value)
		Config.Misc.Ping = Value
	end
)


print("TEMP CONTROLLER LOADED")
