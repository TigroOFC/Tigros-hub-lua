-- Criar GUI principal
local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TigrosHub"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Barra vermelha
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(0, 300, 0, 30)
TopBar.Position = UDim2.new(0.5, -150, 0.1, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
TopBar.Parent = ScreenGui

-- Texto Tigro's Hub
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "Tigro's Hub"
Title.Font = Enum.Font.SourceSansBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Parent = TopBar

-- Botão minimizar
local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0, 30, 1, 0)
MinButton.Position = UDim2.new(1, -60, 0, 0)
MinButton.Text = "-"
MinButton.Font = Enum.Font.SourceSansBold
MinButton.TextSize = 20
MinButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
MinButton.TextColor3 = Color3.new(1, 1, 1)
MinButton.Parent = TopBar

-- Botão fechar
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 20
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Parent = TopBar

-- Botão Inf Jump
local InfJumpButton = Instance.new("TextButton")
InfJumpButton.Size = UDim2.new(0, 280, 0, 40)
InfJumpButton.Position = UDim2.new(0.5, -140, 0.1, 40)
InfJumpButton.Text = "Inf Jump: OFF"
InfJumpButton.Font = Enum.Font.SourceSans
InfJumpButton.TextSize = 18
InfJumpButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
InfJumpButton.TextColor3 = Color3.new(1, 1, 1)
InfJumpButton.Parent = ScreenGui

-- Botão Invencibilidade Absoluta
local GodModeButton = Instance.new("TextButton")
GodModeButton.Size = UDim2.new(0, 280, 0, 40)
GodModeButton.Position = UDim2.new(0.5, -140, 0.1, 90)
GodModeButton.Text = "Invencibilidade: OFF"
GodModeButton.Font = Enum.Font.SourceSans
GodModeButton.TextSize = 18
GodModeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GodModeButton.TextColor3 = Color3.new(1, 1, 1)
GodModeButton.Parent = ScreenGui

-- Ícone para reabrir
local OpenIcon = Instance.new("ImageButton")
OpenIcon.Size = UDim2.new(0, 50, 0, 50)
OpenIcon.Position = UDim2.new(0, 10, 0.9, 0)
OpenIcon.Image = "rbxassetid://3926305904" -- ícone redondo padrão Roblox
OpenIcon.ImageRectOffset = Vector2.new(4, 4)
OpenIcon.ImageRectSize = Vector2.new(36, 36)
OpenIcon.Visible = false
OpenIcon.BackgroundTransparency = 1
OpenIcon.Parent = ScreenGui

-- Variáveis de controle
local UIS = game:GetService("UserInputService")
local infJump = false
local godMode = false

-- Função Inf Jump
InfJumpButton.MouseButton1Click:Connect(function()
    infJump = not infJump
    InfJumpButton.Text = infJump and "Inf Jump: ON" or "Inf Jump: OFF"
end)

UIS.JumpRequest:Connect(function()
    if infJump then
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Invencibilidade Absoluta
GodModeButton.MouseButton1Click:Connect(function()
    godMode = not godMode
    GodModeButton.Text = godMode and "Invencibilidade: ON" or "Invencibilidade: OFF"

    if godMode then
        task.spawn(function()
            while godMode do
                local char = player.Character or player.CharacterAdded:Wait()
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.Health = hum.MaxHealth
                    hum.MaxHealth = math.huge
                    hum.Health = math.huge
                    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                end
                task.wait(0.05)
            end
        end)
    end
end)

-- Minimizar GUI
MinButton.MouseButton1Click:Connect(function()
    TopBar.Visible = false
    InfJumpButton.Visible = false
    GodModeButton.Visible = false
    OpenIcon.Visible = true
end)

-- Reabrir GUI
OpenIcon.MouseButton1Click:Connect(function()
    TopBar.Visible = true
    InfJumpButton.Visible = true
    GodModeButton.Visible = true
    OpenIcon.Visible = false
end)

-- Fechar GUI e ícone
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
