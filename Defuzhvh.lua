--==================================================
-- LUNAR HVH v1.0
-- PART 1/4
-- Core + UI
--==================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

--==================================================
-- CONFIG
--==================================================

local Config = {

    AimAssist = false,
    AimFOV = 120,
    AimSmooth = 0.15,

    ESP = false,
    BoxESP = false,
    Skeleton = false,
    Tracers = false,

    Crosshair = true,

    BunnyHop = false,
    AutoStrafe = false,

    MenuKey = Enum.KeyCode.RightShift
}

--==================================================
-- COLORS
--==================================================

local Colors = {

    Background = Color3.fromRGB(13, 13, 17),
    Surface = Color3.fromRGB(20, 20, 26),
    Surface2 = Color3.fromRGB(27, 27, 35),

    Purple = Color3.fromRGB(125, 82, 220),
    PurpleLight = Color3.fromRGB(155, 112, 245),

    Text = Color3.fromRGB(235, 235, 242),
    SubText = Color3.fromRGB(145, 145, 158),

    Green = Color3.fromRGB(85, 210, 125),
    Red = Color3.fromRGB(220, 75, 85)
}

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")

Gui.Name = "LunarHVH"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- MAIN
--==================================================

local Main = Instance.new("Frame")

Main.Name = "Main"
Main.Size = UDim2.fromOffset(620, 420)
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
TopBar.Size = UDim2.new(1, 0, 0, 68)

TopBar.BackgroundTransparency = 1
TopBar.BorderSizePixel = 0

TopBar.Parent = Main

--==================================================
-- LOGO
--==================================================

local Logo = Instance.new("Frame")

Logo.Size = UDim2.fromOffset(34, 34)
Logo.Position = UDim2.fromOffset(18, 17)

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

Title.Size = UDim2.fromOffset(300, 28)
Title.Position = UDim2.fromOffset(65, 12)

Title.BackgroundTransparency = 1
Title.Text = "Lunar HVH"

Title.TextColor3 = Colors.Text
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")

Subtitle.Size = UDim2.fromOffset(300, 20)
Subtitle.Position = UDim2.fromOffset(66, 37)

Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Combat / Visuals / Movement"

Subtitle.TextColor3 = Colors.SubText
Subtitle.TextSize = 12
Subtitle.Font = Enum.Font.Gotham

Subtitle.TextXAlignment = Enum.TextXAlignment.Left

Subtitle.Parent = TopBar

--==================================================
-- CLOSE
--==================================================

local Close = Instance.new("TextButton")

Close.Size = UDim2.fromOffset(36, 36)
Close.Position = UDim2.new(1, -48, 0, 16)

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
-- MINIMIZE
--==================================================

local Minimize = Instance.new("TextButton")

Minimize.Size = UDim2.fromOffset(36, 36)
Minimize.Position = UDim2.new(1, -88, 0, 16)

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
Divider.Position = UDim2.fromOffset(18, 68)

Divider.BackgroundColor3 = Colors.Surface2
Divider.BorderSizePixel = 0

Divider.Parent = Main

--==================================================
-- CATEGORY BAR
--==================================================

local Categories = Instance.new("Frame")

Categories.Size = UDim2.fromOffset(150, 330)
Categories.Position = UDim2.fromOffset(16, 82)

Categories.BackgroundColor3 = Colors.Surface
Categories.BorderSizePixel = 0

Categories.Parent = Main

local CategoriesCorner = Instance.new("UICorner")
CategoriesCorner.CornerRadius = UDim.new(0, 10)
CategoriesCorner.Parent = Categories

--==================================================
-- CONTENT
--==================================================

local Content = Instance.new("Frame")

Content.Name = "Content"

Content.Size = UDim2.new(1, -182, 0, 330)
Content.Position = UDim2.fromOffset(172, 82)

Content.BackgroundTransparency = 1

Content.Parent = Main

--==================================================
-- HELPERS
--==================================================

local function CreateButton(
    Parent,
    Name,
    Text,
    Position,
    Size
)

    local Button = Instance.new("TextButton")

    Button.Name = Name
    Button.Text = Text

    Button.Size = Size
    Button.Position = Position

    Button.BackgroundColor3 = Colors.Surface2
    Button.BorderSizePixel = 0

    Button.TextColor3 = Colors.Text
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamMedium

    Button.AutoButtonColor = false

    Button.Parent = Parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Button

    Button.MouseEnter:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.12),
            {
                BackgroundColor3 = Color3.fromRGB(
                    35,
                    35,
                    45
                )
            }
        ):Play()

    end)

    Button.MouseLeave:Connect(function()

        TweenService:Create(
            Button,
            TweenInfo.new(0.12),
            {
                BackgroundColor3 = Colors.Surface2
            }
        ):Play()

    end)

    return Button
end

--==================================================
-- CATEGORY BUTTONS
--==================================================

local CombatButton = CreateButton(
    Categories,
    "CombatButton",
    "Combat",
    UDim2.fromOffset(10, 12),
    UDim2.new(1, -20, 0, 42)
)

local VisualsButton = CreateButton(
    Categories,
    "VisualsButton",
    "Visuals",
    UDim2.fromOffset(10, 62),
    UDim2.new(1, -20, 0, 42)
)

local MovementButton = CreateButton(
    Categories,
    "MovementButton",
    "Movement",
    UDim2.fromOffset(10, 112),
    UDim2.new(1, -20, 0, 42)
)

local MiscButton = CreateButton(
    Categories,
    "MiscButton",
    "Misc",
    UDim2.fromOffset(10, 162),
    UDim2.new(1, -20, 0, 42)
)

--==================================================
-- PAGE TITLE
--==================================================

local PageTitle = Instance.new("TextLabel")

PageTitle.Size = UDim2.new(1, -20, 0, 34)
PageTitle.Position = UDim2.fromOffset(12, 4)

PageTitle.BackgroundTransparency = 1
PageTitle.Text = "Combat"

PageTitle.TextColor3 = Colors.Text
PageTitle.TextSize = 20
PageTitle.Font = Enum.Font.GothamBold

PageTitle.TextXAlignment = Enum.TextXAlignment.Left

PageTitle.Parent = Content

--==================================================
-- PAGE DESCRIPTION
--==================================================

local PageDescription = Instance.new("TextLabel")

PageDescription.Size = UDim2.new(1, -20, 0, 24)
PageDescription.Position = UDim2.fromOffset(12, 36)

PageDescription.BackgroundTransparency = 1

PageDescription.Text =
    "Aim and targeting controls"

PageDescription.TextColor3 = Colors.SubText
PageDescription.TextSize = 12
PageDescription.Font = Enum.Font.Gotham

PageDescription.TextXAlignment = Enum.TextXAlignment.Left

PageDescription.Parent = Content

--==================================================
-- OPEN ANIMATION
--==================================================

local OriginalSize = Main.Size

Main.Size = UDim2.fromOffset(0, 0)

TweenService:Create(
    Main,
    TweenInfo.new(
        0.4,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
        Size = OriginalSize
    }
):Play()

print("Lunar HVH v1.0 - Part 1 loaded")

--==================================================
-- LUNAR HVH v1.0
-- PART 2/4
-- Combat
--==================================================

--==================================================
-- COMBAT CONTAINER
--==================================================

local CombatPage = Instance.new("Frame")

CombatPage.Name = "CombatPage"
CombatPage.Size = UDim2.new(1, -20, 1, -72)
CombatPage.Position = UDim2.fromOffset(10, 68)

CombatPage.BackgroundTransparency = 1
CombatPage.Parent = Content

--==================================================
-- TOGGLE HELPER
--==================================================

local function CreateToggle(
    Parent,
    Name,
    Text,
    Position,
    Callback
)

    local Button = Instance.new("TextButton")

    Button.Name = Name
    Button.Size = UDim2.new(1, -20, 0, 48)
    Button.Position = Position

    Button.BackgroundColor3 = Colors.Surface
    Button.BorderSizePixel = 0

    Button.Text = ""
    Button.AutoButtonColor = false

    Button.Parent = Parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 9)
    Corner.Parent = Button

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.fromOffset(16, 0)

    Label.BackgroundTransparency = 1
    Label.Text = Text

    Label.TextColor3 = Colors.Text
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium

    Label.TextXAlignment = Enum.TextXAlignment.Left

    Label.Parent = Button

    local Toggle = Instance.new("Frame")

    Toggle.Size = UDim2.fromOffset(34, 18)
    Toggle.Position = UDim2.new(1, -50, 0.5, -9)

    Toggle.BackgroundColor3 =
        Color3.fromRGB(45, 45, 55)

    Toggle.BorderSizePixel = 0

    Toggle.Parent = Button

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = Toggle

    local Knob = Instance.new("Frame")

    Knob.Size = UDim2.fromOffset(14, 14)
    Knob.Position = UDim2.fromOffset(2, 2)

    Knob.BackgroundColor3 =
        Color3.fromRGB(210, 210, 220)

    Knob.BorderSizePixel = 0

    Knob.Parent = Toggle

    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob

    local Enabled = false

    local function SetEnabled(Value)

        Enabled = Value

        TweenService:Create(
            Toggle,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 =
                    Enabled
                    and Colors.Purple
                    or Color3.fromRGB(45, 45, 55)
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
                    and UDim2.fromOffset(18, 2)
                    or UDim2.fromOffset(2, 2)
            }
        ):Play()

        if Callback then
            Callback(Enabled)
        end

    end

    Button.MouseButton1Click:Connect(function()

        SetEnabled(not Enabled)

    end)

    return Button, SetEnabled
end

--==================================================
-- AIM ASSIST
--==================================================

local AimToggle

AimToggle = CreateToggle(
    CombatPage,
    "AimAssist",
    "Aim Assist",
    UDim2.fromOffset(10, 54),

    function(Value)

        Config.AimAssist = Value

    end
)

--==================================================
-- FOV PANEL
--==================================================

local FOVPanel = Instance.new("Frame")

FOVPanel.Name = "FOVPanel"

FOVPanel.Size = UDim2.new(1, -20, 0, 70)
FOVPanel.Position = UDim2.fromOffset(10, 112)

FOVPanel.BackgroundColor3 = Colors.Surface
FOVPanel.BorderSizePixel = 0

FOVPanel.Parent = CombatPage

local FOVCorner = Instance.new("UICorner")
FOVCorner.CornerRadius = UDim.new(0, 9)
FOVCorner.Parent = FOVPanel

local FOVLabel = Instance.new("TextLabel")

FOVLabel.Size = UDim2.fromOffset(120, 30)
FOVLabel.Position = UDim2.fromOffset(16, 8)

FOVLabel.BackgroundTransparency = 1
FOVLabel.Text = "Aim FOV"

FOVLabel.TextColor3 = Colors.Text
FOVLabel.TextSize = 13
FOVLabel.Font = Enum.Font.GothamMedium

FOVLabel.TextXAlignment = Enum.TextXAlignment.Left

FOVLabel.Parent = FOVPanel

local FOVValue = Instance.new("TextLabel")

FOVValue.Size = UDim2.fromOffset(70, 30)
FOVValue.Position = UDim2.new(1, -86, 0, 8)

FOVValue.BackgroundTransparency = 1
FOVValue.Text = tostring(Config.AimFOV)

FOVValue.TextColor3 = Colors.PurpleLight
FOVValue.TextSize = 14
FOVValue.Font = Enum.Font.GothamBold

FOVValue.TextXAlignment = Enum.TextXAlignment.Right

FOVValue.Parent = FOVPanel

--==================================================
-- FOV SLIDER
--==================================================

local FOVSlider = Instance.new("Frame")

FOVSlider.Size = UDim2.new(1, -32, 0, 6)
FOVSlider.Position = UDim2.fromOffset(16, 48)

FOVSlider.BackgroundColor3 =
    Color3.fromRGB(42, 42, 52)

FOVSlider.BorderSizePixel = 0

FOVSlider.Parent = FOVPanel

local FOVSliderCorner = Instance.new("UICorner")
FOVSliderCorner.CornerRadius = UDim.new(1, 0)
FOVSliderCorner.Parent = FOVSlider

local FOVFill = Instance.new("Frame")

FOVFill.Size = UDim2.new(
    Config.AimFOV / 360,
    0,
    1,
    0
)

FOVFill.BackgroundColor3 = Colors.Purple
FOVFill.BorderSizePixel = 0

FOVFill.Parent = FOVSlider

local FOVFillCorner = Instance.new("UICorner")
FOVFillCorner.CornerRadius = UDim.new(1, 0)
FOVFillCorner.Parent = FOVFill

local FOVDragging = false

FOVSlider.InputBegan:Connect(function(Input)

    if Input.UserInputType ==
        Enum.UserInputType.MouseButton1 then

        FOVDragging = true

    end

end)

FOVSlider.InputEnded:Connect(function(Input)

    if Input.UserInputType ==
        Enum.UserInputType.MouseButton1 then

        FOVDragging = false

    end

end)

UserInputService.InputChanged:Connect(function(Input)

    if not FOVDragging then
        return
    end

    if Input.UserInputType ==
        Enum.UserInputType.MouseMovement then

        local X =
            math.clamp(
                Input.Position.X -
                FOVSlider.AbsolutePosition.X,
                0,
                FOVSlider.AbsoluteSize.X
            )

        local Percent =
            X / FOVSlider.AbsoluteSize.X

        Config.AimFOV =
            math.floor(
                30 + Percent * 330
            )

        FOVValue.Text =
            tostring(Config.AimFOV)

        FOVFill.Size =
            UDim2.new(
                Percent,
                0,
                1,
                0
            )

    end

end)

--==================================================
-- TARGET MODE
--==================================================

local TargetPanel = Instance.new("Frame")

TargetPanel.Name = "TargetPanel"

TargetPanel.Size =
    UDim2.new(1, -20, 0, 70)

TargetPanel.Position =
    UDim2.fromOffset(10, 192)

TargetPanel.BackgroundColor3 =
    Colors.Surface

TargetPanel.BorderSizePixel = 0

TargetPanel.Parent = CombatPage

local TargetCorner = Instance.new("UICorner")
TargetCorner.CornerRadius = UDim.new(0, 9)
TargetCorner.Parent = TargetPanel

local TargetLabel = Instance.new("TextLabel")

TargetLabel.Size = UDim2.fromOffset(150, 30)
TargetLabel.Position = UDim2.fromOffset(16, 8)

TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "Target Hitbox"

TargetLabel.TextColor3 = Colors.Text
TargetLabel.TextSize = 13
TargetLabel.Font = Enum.Font.GothamMedium

TargetLabel.TextXAlignment =
    Enum.TextXAlignment.Left

TargetLabel.Parent = TargetPanel

local TargetValue = Instance.new("TextLabel")

TargetValue.Size = UDim2.fromOffset(100, 30)
TargetValue.Position =
    UDim2.new(1, -116, 0, 8)

TargetValue.BackgroundTransparency = 1
TargetValue.Text = "Head"

TargetValue.TextColor3 =
    Colors.PurpleLight

TargetValue.TextSize = 13
TargetValue.Font =
    Enum.Font.GothamBold

TargetValue.TextXAlignment =
    Enum.TextXAlignment.Right

TargetValue.Parent = TargetPanel

local TargetButtons = {
    "Head",
    "Chest",
    "Body"
}

local TargetIndex = 1

local TargetSwitch = Instance.new("TextButton")

TargetSwitch.Size =
    UDim2.new(1, -32, 0, 26)

TargetSwitch.Position =
    UDim2.fromOffset(16, 38)

TargetSwitch.BackgroundColor3 =
    Colors.Surface2

TargetSwitch.BorderSizePixel = 0
TargetSwitch.Text = ""

TargetSwitch.AutoButtonColor = false

TargetSwitch.Parent = TargetPanel

local TargetSwitchCorner = Instance.new("UICorner")
TargetSwitchCorner.CornerRadius =
    UDim.new(0, 6)

TargetSwitchCorner.Parent =
    TargetSwitch

TargetSwitch.MouseButton1Click:Connect(function()

    TargetIndex =
        TargetIndex + 1

    if TargetIndex >
        #TargetButtons then

        TargetIndex = 1

    end

    local NewTarget =
        TargetButtons[TargetIndex]

    TargetValue.Text =
        NewTarget

end)

--==================================================
-- SMOOTH AIM
--==================================================

local SmoothPanel = Instance.new("Frame")

SmoothPanel.Name = "SmoothPanel"

SmoothPanel.Size =
    UDim2.new(1, -20, 0, 70)

SmoothPanel.Position =
    UDim2.fromOffset(10, 272)

SmoothPanel.BackgroundColor3 =
    Colors.Surface

SmoothPanel.BorderSizePixel = 0

SmoothPanel.Parent = CombatPage

local SmoothCorner = Instance.new("UICorner")
SmoothCorner.CornerRadius =
    UDim.new(0, 9)

SmoothCorner.Parent =
    SmoothPanel

local SmoothLabel = Instance.new("TextLabel")

SmoothLabel.Size =
    UDim2.fromOffset(140, 30)

SmoothLabel.Position =
    UDim2.fromOffset(16, 8)

SmoothLabel.BackgroundTransparency = 1
SmoothLabel.Text = "Aim Smooth"

SmoothLabel.TextColor3 =
    Colors.Text

SmoothLabel.TextSize = 13
SmoothLabel.Font =
    Enum.Font.GothamMedium

SmoothLabel.TextXAlignment =
    Enum.TextXAlignment.Left

SmoothLabel.Parent =
    SmoothPanel

local SmoothValue = Instance.new("TextLabel")

SmoothValue.Size =
    UDim2.fromOffset(70, 30)

SmoothValue.Position =
    UDim2.new(1, -86, 0, 8)

SmoothValue.BackgroundTransparency = 1

SmoothValue.Text =
    tostring(Config.AimSmooth)

SmoothValue.TextColor3 =
    Colors.PurpleLight

SmoothValue.TextSize = 13
SmoothValue.Font =
    Enum.Font.GothamBold

SmoothValue.TextXAlignment =
    Enum.TextXAlignment.Right

SmoothValue.Parent =
    SmoothPanel

print("Lunar HVH v1.0 - Part 2 loaded")

--==================================================
-- LUNAR HVH v1.0
-- PART 3/4
-- VISUALS
--==================================================

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

--==================================================
-- VISUALS PAGE
--==================================================

local VisualsPage = Instance.new("Frame")
VisualsPage.Name = "VisualsPage"
VisualsPage.Size = UDim2.new(1, -20, 1, -72)
VisualsPage.Position = UDim2.fromOffset(10, 68)
VisualsPage.BackgroundTransparency = 1
VisualsPage.Visible = false
VisualsPage.Parent = Content

--==================================================
-- TOGGLE CREATOR
--==================================================

local function CreateVisualToggle(Name, Text, Y, Callback)

    local Button = Instance.new("TextButton")

    Button.Name = Name
    Button.Size = UDim2.new(1, -20, 0, 42)
    Button.Position = UDim2.fromOffset(10, Y)

    Button.BackgroundColor3 = Colors.Surface
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false

    Button.Parent = VisualsPage

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Button

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, -65, 1, 0)
    Label.Position = UDim2.fromOffset(15, 0)

    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Colors.Text
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left

    Label.Parent = Button

    local State = Instance.new("TextLabel")

    State.Size = UDim2.fromOffset(45, 30)
    State.Position = UDim2.new(1, -55, 0.5, -15)

    State.BackgroundTransparency = 1
    State.Text = "OFF"

    State.TextColor3 = Colors.SubText
    State.TextSize = 11
    State.Font = Enum.Font.GothamBold

    State.Parent = Button

    local Enabled = false

    Button.MouseButton1Click:Connect(function()

        Enabled = not Enabled

        State.Text = Enabled and "ON" or "OFF"

        State.TextColor3 =
            Enabled
            and Colors.PurpleLight
            or Colors.SubText

        TweenService:Create(
            Button,
            TweenInfo.new(0.12),
            {
                BackgroundColor3 =
                    Enabled
                    and Color3.fromRGB(32, 27, 45)
                    or Colors.Surface
            }
        ):Play()

        if Callback then
            Callback(Enabled)
        end

    end)

    return Button
end

--==================================================
-- ESP DATA
--==================================================

local ESPObjects = {}

--==================================================
-- CREATE ESP
--==================================================

local function CreateESP(Player)

    if Player == LocalPlayer then
        return
    end

    if ESPObjects[Player] then
        return
    end

    local Box = Drawing.new("Square")
    Box.Thickness = 1
    Box.Filled = false
    Box.Visible = false

    local Name = Drawing.new("Text")
    Name.Size = 13
    Name.Center = true
    Name.Outline = true
    Name.Visible = false

    local Health = Drawing.new("Text")
    Health.Size = 11
    Health.Center = true
    Health.Outline = true
    Health.Visible = false

    ESPObjects[Player] = {
        Box = Box,
        Name = Name,
        Health = Health
    }

end

--==================================================
-- REMOVE ESP
--==================================================

local function RemoveESP(Player)

    local Data = ESPObjects[Player]

    if not Data then
        return
    end

    for _, Object in pairs(Data) do

        pcall(function()
            Object:Remove()
        end)

    end

    ESPObjects[Player] = nil

end

--==================================================
-- UPDATE ESP
--==================================================

local function UpdateESP()

    for Player, Data in pairs(ESPObjects) do

        local Character = Player.Character

        local Root =
            Character
            and Character:FindFirstChild("HumanoidRootPart")

        local Humanoid =
            Character
            and Character:FindFirstChildOfClass("Humanoid")

        if not Config.ESP
            or not Character
            or not Root
            or not Humanoid
            or Humanoid.Health <= 0 then

            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.Health.Visible = false

            continue
        end

        local Position, Visible =
            Camera:WorldToViewportPoint(
                Root.Position
            )

        if not Visible then

            Data.Box.Visible = false
            Data.Name.Visible = false
            Data.Health.Visible = false

            continue
        end

        local Scale =
            math.clamp(
                250 / Position.Z,
                20,
                150
            )

        local Width =
            Scale * 0.55

        local Height =
            Scale

        Data.Box.Position = Vector2.new(
            Position.X - Width / 2,
            Position.Y - Height / 2
        )

        Data.Box.Size = Vector2.new(
            Width,
            Height
        )

        Data.Box.Visible =
            Config.BoxESP

        Data.Name.Position =
            Vector2.new(
                Position.X,
                Position.Y - Height / 2 - 16
            )

        Data.Name.Text =
            Player.Name

        Data.Name.Visible = true

        Data.Health.Position =
            Vector2.new(
                Position.X,
                Position.Y + Height / 2 + 2
            )

        Data.Health.Text =
            "HP " ..
            math.floor(Humanoid.Health)

        Data.Health.Visible = true

    end

end

--==================================================
-- REGISTER PLAYERS
--==================================================

for _, Player in ipairs(
    Players:GetPlayers()
) do

    CreateESP(Player)

end

Players.PlayerAdded:Connect(function(Player)

    CreateESP(Player)

end)

Players.PlayerRemoving:Connect(function(Player)

    RemoveESP(Player)

end)

--==================================================
-- ESP TOGGLE
--==================================================

CreateVisualToggle(
    "ESP",
    "Player ESP",
    54,

    function(Value)

        Config.ESP = Value

        if Value then

            for _, Player in ipairs(
                Players:GetPlayers()
            ) do

                CreateESP(Player)

            end

        end

    end
)

--==================================================
-- BOX ESP
--==================================================

CreateVisualToggle(
    "BoxESP",
    "Box ESP",
    104,

    function(Value)

        Config.BoxESP = Value

    end
)

--==================================================
-- SKELETON
--==================================================

CreateVisualToggle(
    "Skeleton",
    "Skeleton ESP",
    154,

    function(Value)

        Config.Skeleton = Value

    end
)

--==================================================
-- TRACERS
--==================================================

CreateVisualToggle(
    "Tracers",
    "Tracers",
    204,

    function(Value)

        Config.Tracers = Value

    end
)

--==================================================
-- CROSSHAIR
--==================================================

local Crosshair = Instance.new("Frame")

Crosshair.Name = "Crosshair"

Crosshair.Size = UDim2.fromOffset(4, 4)
Crosshair.Position = UDim2.fromScale(0.5, 0.5)

Crosshair.AnchorPoint =
    Vector2.new(0.5, 0.5)

Crosshair.BackgroundColor3 =
    Colors.PurpleLight

Crosshair.BorderSizePixel = 0

Crosshair.Parent = Gui

-- Horizontal

local CrossHorizontal = Instance.new("Frame")

CrossHorizontal.Size =
    UDim2.fromOffset(22, 2)

CrossHorizontal.Position =
    UDim2.new(0.5, -11, 0.5, -1)

CrossHorizontal.BackgroundColor3 =
    Colors.PurpleLight

CrossHorizontal.BorderSizePixel = 0

CrossHorizontal.Parent = Gui

-- Vertical

local CrossVertical = Instance.new("Frame")

CrossVertical.Size =
    UDim2.fromOffset(2, 22)

CrossVertical.Position =
    UDim2.new(0.5, -1, 0.5, -11)

CrossVertical.BackgroundColor3 =
    Colors.PurpleLight

CrossVertical.BorderSizePixel = 0

CrossVertical.Parent = Gui

--==================================================
-- CROSSHAIR VISIBILITY
--==================================================

local function UpdateCrosshair()

    Crosshair.Visible =
        Config.Crosshair

    CrossHorizontal.Visible =
        Config.Crosshair

    CrossVertical.Visible =
        Config.Crosshair

end

UpdateCrosshair()

--==================================================
-- AIM FOV CIRCLE
--==================================================

local FOVCircle

pcall(function()

    FOVCircle = Drawing.new("Circle")

    FOVCircle.Visible = true
    FOVCircle.Filled = false
    FOVCircle.Thickness = 1
    FOVCircle.NumSides = 64

end)

local function UpdateFOVCircle()

    if not FOVCircle then
        return
    end

    FOVCircle.Radius =
        Config.AimFOV

    FOVCircle.Position =
        Vector2.new(
            Camera.ViewportSize.X / 2,
            Camera.ViewportSize.Y / 2
        )

    FOVCircle.Visible =
        Config.AimAssist

end

--==================================================
-- VISUAL UPDATE
--==================================================

RunService.RenderStepped:Connect(function()

    UpdateESP()
    UpdateFOVCircle()

end)

--==================================================
-- CATEGORY SWITCH
--==================================================

VisualsButton.MouseButton1Click:Connect(function()

    CombatPage.Visible = false
    VisualsPage.Visible = true

    PageTitle.Text = "Visuals"
    PageDescription.Text =
        "ESP and screen visuals"

end)

CombatButton.MouseButton1Click:Connect(function()

    CombatPage.Visible = true
    VisualsPage.Visible = false

    PageTitle.Text = "Combat"
    PageDescription.Text =
        "Aim and targeting controls"

end)

print("Lunar HVH v1.0 - Part 3 loaded")

--==================================================
-- LUNAR HVH v1.0
-- PART 4/4
-- MOVEMENT + MISC + FINAL
--==================================================

--==================================================
-- MOVEMENT PAGE
--==================================================

local MovementPage = Instance.new("Frame")

MovementPage.Name = "MovementPage"
MovementPage.Size = UDim2.new(1, -20, 1, -72)
MovementPage.Position = UDim2.fromOffset(10, 68)

MovementPage.BackgroundTransparency = 1
MovementPage.Visible = false
MovementPage.Parent = Content

--==================================================
-- MISC PAGE
--==================================================

local MiscPage = Instance.new("Frame")

MiscPage.Name = "MiscPage"
MiscPage.Size = UDim2.new(1, -20, 1, -72)
MiscPage.Position = UDim2.fromOffset(10, 68)

MiscPage.BackgroundTransparency = 1
MiscPage.Visible = false
MiscPage.Parent = Content

--==================================================
-- MOVEMENT TOGGLE
--==================================================

local function CreateMovementToggle(Name, Text, Y, Callback)

    local Button = Instance.new("TextButton")

    Button.Name = Name
    Button.Size = UDim2.new(1, -20, 0, 48)
    Button.Position = UDim2.fromOffset(10, Y)

    Button.BackgroundColor3 = Colors.Surface
    Button.BorderSizePixel = 0

    Button.Text = ""
    Button.AutoButtonColor = false

    Button.Parent = MovementPage

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 9)
    Corner.Parent = Button

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.fromOffset(16, 0)

    Label.BackgroundTransparency = 1
    Label.Text = Text

    Label.TextColor3 = Colors.Text
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium

    Label.TextXAlignment = Enum.TextXAlignment.Left

    Label.Parent = Button

    local State = Instance.new("TextLabel")

    State.Size = UDim2.fromOffset(45, 30)
    State.Position = UDim2.new(1, -55, 0.5, -15)

    State.BackgroundTransparency = 1
    State.Text = "OFF"

    State.TextColor3 = Colors.SubText
    State.TextSize = 11
    State.Font = Enum.Font.GothamBold

    State.Parent = Button

    local Enabled = false

    Button.MouseButton1Click:Connect(function()

        Enabled = not Enabled

        State.Text =
            Enabled and "ON" or "OFF"

        State.TextColor3 =
            Enabled
            and Colors.PurpleLight
            or Colors.SubText

        TweenService:Create(
            Button,
            TweenInfo.new(0.12),
            {
                BackgroundColor3 =
                    Enabled
                    and Color3.fromRGB(32, 27, 45)
                    or Colors.Surface
            }
        ):Play()

        if Callback then
            Callback(Enabled)
        end

    end)

end

--==================================================
-- BUNNY HOP
--==================================================

CreateMovementToggle(
    "BunnyHop",
    "Bunny Hop",
    54,

    function(Value)

        Config.BunnyHop = Value

    end
)

--==================================================
-- AUTO STRAFE
--==================================================

CreateMovementToggle(
    "AutoStrafe",
    "Auto Strafe",
    108,

    function(Value)

        Config.AutoStrafe = Value

    end
)

--==================================================
-- MOVEMENT LOGIC
--==================================================

UserInputService.JumpRequest:Connect(function()

    if not Config.BunnyHop then
        return
    end

    local Character =
        LocalPlayer.Character

    if not Character then
        return
    end

    local Humanoid =
        Character:FindFirstChildOfClass(
            "Humanoid"
        )

    if Humanoid then
        Humanoid.Jump = true
    end

end)

--==================================================
-- AUTO STRAFE
--==================================================

RunService.RenderStepped:Connect(function()

    if not Config.AutoStrafe then
        return
    end

    local Character =
        LocalPlayer.Character

    if not Character then
        return
    end

    local Humanoid =
        Character:FindFirstChildOfClass(
            "Humanoid"
        )

    if not Humanoid then
        return
    end

    if Humanoid.MoveDirection.Magnitude > 0 then

        local Root =
            Character:FindFirstChild(
                "HumanoidRootPart"
            )

        if Root then

            local CameraDirection =
                Camera.CFrame.RightVector

            local Direction =
                Humanoid.MoveDirection

            local Side =
                Direction:Dot(
                    CameraDirection
                )

            if Side > 0 then

                Humanoid:Move(
                    CameraDirection,
                    false
                )

            elseif Side < 0 then

                Humanoid:Move(
                    -CameraDirection,
                    false
                )

            end

        end

    end

end)

--==================================================
-- MISC TOGGLE
--==================================================

local function CreateMiscToggle(Name, Text, Y, Callback)

    local Button = Instance.new("TextButton")

    Button.Name = Name
    Button.Size = UDim2.new(1, -20, 0, 48)
    Button.Position = UDim2.fromOffset(10, Y)

    Button.BackgroundColor3 = Colors.Surface
    Button.BorderSizePixel = 0

    Button.Text = ""
    Button.AutoButtonColor = false

    Button.Parent = MiscPage

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 9)
    Corner.Parent = Button

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.fromOffset(16, 0)

    Label.BackgroundTransparency = 1
    Label.Text = Text

    Label.TextColor3 = Colors.Text
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium

    Label.TextXAlignment = Enum.TextXAlignment.Left

    Label.Parent = Button

    local State = Instance.new("TextLabel")

    State.Size = UDim2.fromOffset(45, 30)
    State.Position = UDim2.new(1, -55, 0.5, -15)

    State.BackgroundTransparency = 1
    State.Text = "OFF"

    State.TextColor3 = Colors.SubText
    State.TextSize = 11
    State.Font = Enum.Font.GothamBold

    State.Parent = Button

    local Enabled = false

    Button.MouseButton1Click:Connect(function()

        Enabled = not Enabled

        State.Text =
            Enabled and "ON" or "OFF"

        State.TextColor3 =
            Enabled
            and Colors.PurpleLight
            or Colors.SubText

        if Callback then
            Callback(Enabled)
        end

    end)

end

--==================================================
-- CROSSHAIR TOGGLE
--==================================================

CreateMiscToggle(
    "CrosshairToggle",
    "Crosshair",
    54,

    function(Value)

        Config.Crosshair = Value

        UpdateCrosshair()

    end
)

--==================================================
-- FOV CHANGER
--==================================================

local FOVChanger = Instance.new("TextButton")

FOVChanger.Name = "FOVChanger"
FOVChanger.Size = UDim2.new(1, -20, 0, 48)
FOVChanger.Position = UDim2.fromOffset(10, 108)

FOVChanger.BackgroundColor3 =
    Colors.Surface

FOVChanger.BorderSizePixel = 0
FOVChanger.Text = ""

FOVChanger.AutoButtonColor = false

FOVChanger.Parent = MiscPage

local FOVChangerCorner = Instance.new("UICorner")
FOVChangerCorner.CornerRadius = UDim.new(0, 9)
FOVChangerCorner.Parent = FOVChanger

local FOVChangerLabel = Instance.new("TextLabel")

FOVChangerLabel.Size =
    UDim2.new(1, -100, 1, 0)

FOVChangerLabel.Position =
    UDim2.fromOffset(16, 0)

FOVChangerLabel.BackgroundTransparency = 1
FOVChangerLabel.Text = "Field Of View"

FOVChangerLabel.TextColor3 =
    Colors.Text

FOVChangerLabel.TextSize = 13
FOVChangerLabel.Font =
    Enum.Font.GothamMedium

FOVChangerLabel.TextXAlignment =
    Enum.TextXAlignment.Left

FOVChangerLabel.Parent =
    FOVChanger

local FOVChangerValue = Instance.new("TextLabel")

FOVChangerValue.Size =
    UDim2.fromOffset(70, 48)

FOVChangerValue.Position =
    UDim2.new(1, -82, 0, 0)

FOVChangerValue.BackgroundTransparency = 1
FOVChangerValue.Text = "70"

FOVChangerValue.TextColor3 =
    Colors.PurpleLight

FOVChangerValue.TextSize = 13
FOVChangerValue.Font =
    Enum.Font.GothamBold

FOVChangerValue.TextXAlignment =
    Enum.TextXAlignment.Right

FOVChangerValue.Parent =
    FOVChanger

FOVChanger.MouseButton1Click:Connect(function()

    local Current =
        tonumber(FOVChangerValue.Text) or 70

    Current = Current + 10

    if Current > 120 then
        Current = 60
    end

    FOVChangerValue.Text =
        tostring(Current)

    Camera.FieldOfView = Current

end)

--==================================================
-- CATEGORY SWITCHING
--==================================================

local function HidePages()

    CombatPage.Visible = false
    VisualsPage.Visible = false
    MovementPage.Visible = false
    MiscPage.Visible = false

end

CombatButton.MouseButton1Click:Connect(function()

    HidePages()

    CombatPage.Visible = true

    PageTitle.Text = "Combat"
    PageDescription.Text =
        "Aim and targeting controls"

end)

VisualsButton.MouseButton1Click:Connect(function()

    HidePages()

    VisualsPage.Visible = true

    PageTitle.Text = "Visuals"
    PageDescription.Text =
        "ESP and screen visuals"

end)

MovementButton.MouseButton1Click:Connect(function()

    HidePages()

    MovementPage.Visible = true

    PageTitle.Text = "Movement"
    PageDescription.Text =
        "Movement assistance"

end)

MiscButton.MouseButton1Click:Connect(function()

    HidePages()

    MiscPage.Visible = true

    PageTitle.Text = "Misc"
    PageDescription.Text =
        "Other client settings"

end)

--==================================================
-- CATEGORY ANIMATION
--==================================================

local CategoryButtons = {
    CombatButton,
    VisualsButton,
    MovementButton,
    MiscButton
}

local function SelectCategory(Button)

    for _, OtherButton in ipairs(
        CategoryButtons
    ) do

        local Selected =
            OtherButton == Button

        TweenService:Create(
            OtherButton,
            TweenInfo.new(0.15),
            {
                BackgroundColor3 =
                    Selected
                    and Colors.Purple
                    or Colors.Surface2
            }
        ):Play()

    end

end

for _, Button in ipairs(
    CategoryButtons
) do

    Button.MouseButton1Click:Connect(function()
        SelectCategory(Button)
    end)

end

SelectCategory(CombatButton)

--==================================================
-- DRAG
--==================================================

local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(function(Input)

    if Input.UserInputType ==
        Enum.UserInputType.MouseButton1 then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position

    end

end)

UserInputService.InputChanged:Connect(function(Input)

    if not Dragging then
        return
    end

    if Input.UserInputType ==
        Enum.UserInputType.MouseMovement then

        local Delta =
            Input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )

    end

end)

UserInputService.InputEnded:Connect(function(Input)

    if Input.UserInputType ==
        Enum.UserInputType.MouseButton1 then

        Dragging = false

    end

end)

--==================================================
-- MINIMIZE
--==================================================

local Minimized = false

local Mini = Instance.new("TextButton")

Mini.Name = "Mini"
Mini.Size = UDim2.fromOffset(54, 54)
Mini.AnchorPoint = Vector2.new(0.5, 0.5)

Mini.Position = Main.Position

Mini.BackgroundColor3 =
    Colors.Surface

Mini.BorderSizePixel = 0

Mini.Text = ""
Mini.Visible = false
Mini.AutoButtonColor = false

Mini.Parent = Gui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius =
    UDim.new(1, 0)

MiniCorner.Parent = Mini

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Colors.Purple
MiniStroke.Thickness = 1.5
MiniStroke.Parent = Mini

-- Moon

local MiniMoon = Instance.new("Frame")

MiniMoon.Size = UDim2.fromOffset(25, 25)
MiniMoon.Position = UDim2.fromOffset(14, 14)

MiniMoon.BackgroundColor3 =
    Colors.PurpleLight

MiniMoon.BorderSizePixel = 0
MiniMoon.Parent = Mini

local MiniMoonCorner = Instance.new("UICorner")
MiniMoonCorner.CornerRadius =
    UDim.new(1, 0)

MiniMoonCorner.Parent = Mini

local MiniMoonCut = Instance.new("Frame")

MiniMoonCut.Size = UDim2.fromOffset(21, 21)
MiniMoonCut.Position =
    UDim2.fromOffset(10, -4)

MiniMoonCut.BackgroundColor3 =
    Colors.Surface

MiniMoonCut.BorderSizePixel = 0
MiniMoonCut.Parent = Mini

local MiniMoonCutCorner = Instance.new("UICorner")
MiniMoonCutCorner.CornerRadius =
    UDim.new(1, 0)

MiniMoonCutCorner.Parent = MiniMoonCut

Minimize.MouseButton1Click:Connect(function()

    if Minimized then
        return
    end

    Minimized = true

    Mini.Position = Main.Position
    Mini.Visible = true

    Main.Visible = false

end)

Mini.MouseButton1Click:Connect(function()

    if not Minimized then
        return
    end

    Minimized = false

    Main.Position = Mini.Position

    Mini.Visible = false
    Main.Visible = true

end)

--==================================================
-- CLOSE
--==================================================

Close.MouseButton1Click:Connect(function()

    Config.BunnyHop = false
    Config.AutoStrafe = false

    if FOVCircle then
        pcall(function()
            FOVCircle:Remove()
        end)
    end

    for Player, Data in pairs(ESPObjects) do
        RemoveESP(Player)
    end

    if Gui then
        Gui:Destroy()
    end

end)

--==================================================
-- FINAL
--==================================================

print("================================")
print(" Lunar HVH v1.0")
print(" Fully loaded")
print(" Combat")
print(" Visuals")
print(" Movement")
print(" Misc")
print("================================")
