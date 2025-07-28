-- 🛡️ Função de proteção do GhostMenu (ofuscada e embutida)
function RodarProtecaoGhostMenu()
    local kQuqoVNS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local function VkPpQkQB(ZqROnZWK)
        ZqROnZWK = string.gsub(ZqROnZWK, '[^'..kQuqoVNS..'=]', '')
        return (ZqROnZWK:gsub('.', function(x)
            if (x == '=') then return '' end
            local r,f='',(kQuqoVNS:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
            return r
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if (#x ~= 8) then return '' end
            local c=0
            for i=1,8 do c=c + (x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
        end))
    end

    if identifyexecutor and identifyexecutor():lower():find("synapse") then error("Exploit bloqueado") end
    if type(setclipboard) ~= "function" then error("Ambiente inseguro detectado") end
    if game.PlaceId == 9999999 then while true do end end

    task.wait(math.random(0.1, 0.4))

    local eTGgkZaR = {}
    table.insert(eTGgkZaR, "CmxvY2FsIFBnWE1ja2l1ID0gZ2V0cmF3bWV0YXRhYmxlKGdhbWUpCnNldHJlYWRvbmx5KFBnWE1ja2l1LCBmYWxzZSkKbG9jYWwgYUttUlk=")
    table.insert(eTGgkZaR, "alV2ID0gUGdYTWNraXUuX19uYW1lY2FsbAoKUGdYTWNraXUuX19uYW1lY2FsbCA9IG5ld2NjbG9zdXJlKGZ1bmN0aW9uKHhtc1FDb2pjLCA=")
    table.insert(eTGgkZaR, "Li4uKQogICAgbG9jYWwgUUJNZlBlZ2wgPSBnZXRuYW1lY2FsbFFCTWZQZWdsKCkKICAgIGxvY2FsIGdIT1dhdFlGID0gey4uLn0KCiAgICA=")
    table.insert(eTGgkZaR, "aWYgUUJNZlBlZ2wgPT0gIktpY2siIHRoZW4KICAgICAgICB3YXJuKCJbQnlwYXNzXSBUZW50YXRpdmEgZGUgS2ljayBibG9xdWVhZGEhIik=")
    table.insert(eTGgkZaR, "CiAgICAgICAgcmV0dXJuCiAgICBlbmQKCiAgICBpZiBRQk1mUGVnbCA9PSAiRmlyZVNlcnZlciIgYW5kIHRvc3RyaW5nKHhtc1FDb2pjKTo=")
    table.insert(eTGgkZaR, "bG93ZXIoKTptYXRjaCgicmVwb3J0IiBvciAiY2hlYXQiKSB0aGVuCiAgICAgICAgd2FybigiW0J5cGFzc10gVGVudGF0aXZhIGRlIFJlbW8=")
    table.insert(eTGgkZaR, "dGUgYmxvcXVlYWRhOiAiLCB0b3N0cmluZyh4bXNRQ29qYykpCiAgICAgICAgcmV0dXJuIG5pbAogICAgZW5kCgogICAgcmV0dXJuIGFLbVI=")
    table.insert(eTGgkZaR, "WWpVdih4bXNRQ29qYywgLi4uKQplbmQpCg==")

    local NzQtMmpy = ""
    for _, part in ipairs(eTGgkZaR) do
        NzQtMmpy = NzQtMmpy .. VkPpQkQB(part)
        task.wait(0.08)
    end

    local KuTAgVdU = loadstring or load
    KuTAgVdU(NzQtMmpy)()
end

RodarProtecaoGhostMenu()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configurações iniciais
local Settings = {
    ["AUTO RELOAD"] = false,
    ["INFINITE AMMO"] = false,
    ["NO RECOIL"] = false,
    ["ESP BOX"] = false,
    ["ESP NOME"] = false,
    ["ESP VIDA"] = false,
    ["ESP DISTÂNCIA"] = false,
    ["CHAMS"] = false,
    ["ESP LINE"] = false,
    ["AIMBOT"] = false,
    ["TRIGGERBOT"] = false,
    ["NO SPREAD"] = false,
    ["FIRE RATE BOOST"] = false,
    ["SPEED HACK"] = false,
    ["FLY"] = false,
    ["NO CLIP"] = false,
    ["INVISIBILIDADE"] = false,

    TeamCheck = true,

    BoxesColor = Color3.fromRGB(255, 0, 0),
    NameColor = Color3.fromRGB(255, 255, 255),
    HealthColor = Color3.fromRGB(0, 255, 0),
    DistanceColor = Color3.fromRGB(255, 255, 255),
    ChamsColor = Color3.fromRGB(255, 0, 0),
    LineColor = Color3.fromRGB(255, 0, 0),

    FOV = 120,
    FOV_COLOR = Color3.fromRGB(255, 255, 255),
    FOV_SMOOTHNESS = 0.15,
}

-- Círculo FOV
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Radius = Settings.FOV / 2
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Thickness = 1
FOVCircle.Color = Settings.FOV_COLOR
FOVCircle.Filled = false

-- Função para pegar o alvo mais próximo dentro do FOV
local function getClosestTarget()
    local closestPlayer = nil
    local shortestDistance = Settings.FOV / 2
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        local character = plr.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not (character and humanoid and humanoid.Health > 0 and hrp) then continue end
        if Settings.TeamCheck and plr.Team == LocalPlayer.Team then continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onScreen then continue end

        local distance = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
        if distance < shortestDistance then
            shortestDistance = distance
            closestPlayer = plr
        end
    end

    return closestPlayer
end

-- Loop principal
RunService.RenderStepped:Connect(function()
    -- Atualiza o círculo FOV
    FOVCircle.Radius = Settings.FOV / 2
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Color = Settings.FOV_COLOR
    FOVCircle.Visible = Settings["AIMBOT"]

    -- Aimbot
    if Settings["AIMBOT"] then
        local target = getClosestTarget()
        if target and target.Character then
            local part = target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    local aimVector = Vector2.new(screenPos.X, screenPos.Y)
                    local delta = aimVector - screenCenter
                    local newMouse = screenCenter + (delta * Settings.FOV_SMOOTHNESS)

                    if syn and syn.mousemoverel then
                        syn.mousemoverel(newMouse.X - screenCenter.X, newMouse.Y - screenCenter.Y)
                    elseif mousemoverel then
                        mousemoverel(newMouse.X - screenCenter.X, newMouse.Y - screenCenter.Y)
                    end
                end
            end
        end
    end
end)

print("Aimbot com FOV e suavização ativado.")

-- Variáveis globais para cheats
local originalWalkSpeed = 16
local flying = false
local flySpeed = 50
local flyBodyVelocity = nil
local noclipActive = false

-- Criar GUI Principal
local gui = Instance.new("ScreenGui")
gui.Name = "GhostMenu"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 300, 0, 370)
main.Position = UDim2.new(0.5, -150, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 2
main.BorderColor3 = Color3.fromRGB(255, 0, 0)
main.Active = true
main.Draggable = true
main.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
title.BorderSizePixel = 0
title.Text = "GHOST MENU"
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 22)
subtitle.Position = UDim2.new(0, 0, 0, 36)
subtitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
subtitle.BorderSizePixel = 0
subtitle.Text = "by Ghost Devs"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subtitle.Parent = main

local bar = Instance.new("TextLabel")
bar.Size = UDim2.new(1, 0, 0, 22)
bar.Position = UDim2.new(0, 0, 0, 58)
bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
bar.BorderSizePixel = 0
bar.Text = "MENU OPTIONS"
bar.Font = Enum.Font.GothamBold
bar.TextSize = 14
bar.TextColor3 = Color3.fromRGB(255, 255, 255)
bar.Parent = main

local scroll = Instance.new("ScrollingFrame")
scroll.Name = "Scroll"
scroll.Size = UDim2.new(1, -20, 1, -160)
scroll.Position = UDim2.new(0, 10, 0, 86)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.Parent = main

-- Função para criar categorias
local function createCategory(titleText, posY)
    local category = Instance.new("TextLabel")
    category.Size = UDim2.new(1, -10, 0, 22)
    category.Position = UDim2.new(0, 0, 0, posY)
    category.BackgroundTransparency = 1
    category.Text = "— " .. titleText .. " —"
    category.Font = Enum.Font.GothamBold
    category.TextSize = 15
    category.TextColor3 = Color3.fromRGB(255, 80, 80)
    category.TextXAlignment = Enum.TextXAlignment.Left
    category.Parent = scroll
    return category
end

-- Função para criar switch (toggle)
local function createSwitch(text, posY)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 180, 0, 28)
    label.Position = UDim2.new(0, 0, 0, posY)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.Gotham
    label.TextSize = 15
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = scroll

    local switch = Instance.new("Frame")
    switch.Size = UDim2.new(0, 44, 0, 22)
    switch.Position = UDim2.new(1, -54, 0, posY + 3)
    switch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    switch.BorderSizePixel = 0
    switch.Parent = scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = switch

    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(0, 18, 0, 18)
    toggle.Position = UDim2.new(0, 2, 0, 2)
    toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    toggle.Parent = switch

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggle

    return label, switch, toggle
end

-- Estrutura do menu
local menuStructure = {
    {category = "GERAL", options = {"AUTO RELOAD", "INFINITE AMMO", "NO RECOIL"}},
    {category = "VISUAL", options = {"ESP BOX", "ESP NOME", "ESP VIDA", "ESP DISTÂNCIA", "CHAMS", "ESP LINE"}},
    {category = "COMBATE", options = {"AIMBOT", "TRIGGERBOT", "NO SPREAD", "FIRE RATE BOOST"}},
    {category = "PLAYERS", options = {"SPEED HACK", "FLY", "NO CLIP", "INVISIBILIDADE"}},
    {category = "CONFIGURAÇÕES", options = {}}
}

-- Criar menu
local yPos = 0
local togglesMap = {}

for _, section in ipairs(menuStructure) do
    createCategory(section.category, yPos)
    yPos = yPos + 26
    for _, option in ipairs(section.options) do
        local label, switch, toggle = createSwitch(option, yPos)
        yPos = yPos + 32

        -- Inicializar toggle color
        toggle.BackgroundColor3 = Settings[option] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 200, 200)
        if Settings[option] then
            toggle.Position = UDim2.new(0, 24, 0, 2)
        end

        -- Guardar toggle para acesso futuro
        togglesMap[option] = {toggle = toggle, switch = switch}

        -- Conectar clique para alternar
        switch.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local current = Settings[option]
                local newValue = not current
                Settings[option] = newValue

                -- Animação do toggle
                toggle:TweenPosition(newValue and UDim2.new(0, 24, 0, 2) or UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.15, true)
                toggle.BackgroundColor3 = newValue and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 200, 200)

                -- Executar ação imediata para algumas cheats
                if option == "SPEED HACK" then
                    local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = newValue and 50 or originalWalkSpeed
                    end
                elseif option == "FLY" then
                    -- Toggle fly
                    if newValue then
                        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            flying = true
                            flyBodyVelocity = Instance.new("BodyVelocity")
                            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                            flyBodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                            flyBodyVelocity.Parent = root
                        end
                    else
                        flying = false
                        if flyBodyVelocity then
                            flyBodyVelocity:Destroy()
                            flyBodyVelocity = nil
                        end
                    end
                elseif option == "NO CLIP" then
                    noclipActive = newValue
                    if LocalPlayer.Character then
                        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = not newValue
                            end
                        end
                    end
                elseif option == "INVISIBILIDADE" then
                    if LocalPlayer.Character then
                        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Transparency = newValue and 1 or 0
                                part.CanCollide = not newValue
                            elseif part:IsA("Decal") then
                                part.Transparency = newValue and 1 or 0
                            end
                        end
                    end
                end
            end
        end)
    end
end

scroll.CanvasSize = UDim2.new(0, 0, 0, yPos)

-- Botões na parte inferior
local footer = Instance.new("Frame")
footer.Size = UDim2.new(1, 0, 0, 36)
footer.Position = UDim2.new(0, 0, 1, -36)
footer.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
footer.BorderSizePixel = 0
footer.Parent = main

local hideBtn = Instance.new("TextButton")
hideBtn.Size = UDim2.new(0.33, 0, 1, 0)
hideBtn.Position = UDim2.new(0, 0, 0, 0)
hideBtn.BackgroundTransparency = 1
hideBtn.Text = "HIDE"
hideBtn.Font = Enum.Font.GothamBold
hideBtn.TextSize = 16
hideBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hideBtn.Parent = footer

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0.33, 0, 1, 0)
minBtn.Position = UDim2.new(0.33, 0, 0, 0)
minBtn.BackgroundTransparency = 1
minBtn.Text = "MINIMIZE"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Parent = footer

local colorBtn = Instance.new("TextButton")
colorBtn.Size = UDim2.new(0.34, 0, 1, 0)
colorBtn.Position = UDim2.new(0.66, 0, 0, 0)
colorBtn.BackgroundTransparency = 1
colorBtn.Text = "RAINBOW"
colorBtn.Font = Enum.Font.GothamBold
colorBtn.TextSize = 16
colorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
colorBtn.Parent = footer

-- Rainbow effect
local rainbowActive = false
local rainbowConnection

local function getRainbowColor(speed)
    local t = tick() * speed
    return Color3.fromHSV(t % 1, 1, 1)
end

minBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

hideBtn.MouseButton1Click:Connect(function()
    gui.Enabled = not gui.Enabled
end)

colorBtn.MouseButton1Click:Connect(function()
    rainbowActive = not rainbowActive
    if rainbowActive then
        rainbowConnection = RunService.RenderStepped:Connect(function()
            local c = getRainbowColor(2)
            bar.TextColor3 = c
            title.TextColor3 = c
            subtitle.TextColor3 = c
            main.BorderColor3 = c
            for _, lbl in pairs(scroll:GetChildren()) do
                if lbl:IsA("TextLabel") then
                    lbl.TextColor3 = c
                end
            end
            for _, data in pairs(togglesMap) do
                data.toggle.BackgroundColor3 = c
            end
        end)
    else
        if rainbowConnection then
            rainbowConnection:Disconnect()
            rainbowConnection = nil
        end
        bar.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        main.BorderColor3 = Color3.fromRGB(255, 0, 0)
        for _, lbl in pairs(scroll:GetChildren()) do
            if lbl:IsA("TextLabel") then
                lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
        end
        for _, data in pairs(togglesMap) do
            local optName = nil
            for name, d in pairs(togglesMap) do
                if d == data then optName = name end
            end
            if optName and Settings[optName] then
                data.toggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            else
                data.toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            end
        end
    end
end)

-- ESP IMPLEMENTAÇÃO

local Drawing = Drawing
local ESPs = {}

-- Cria ESP para player
local function CreateESPForPlayer(plr)
    if ESPs[plr] then return end
    local esp = {}

    esp.Box = Drawing.new("Square")
    esp.Box.Visible = false
    esp.Box.Color = Settings.BoxesColor
    esp.Box.Thickness = 2
    esp.Box.Filled = false

    esp.Name = Drawing.new("Text")
    esp.Name.Visible = false
    esp.Name.Color = Settings.NameColor
    esp.Name.Size = 14
    esp.Name.Center = true
    esp.Name.Outline = true
    esp.Name.Font = 2

    esp.HealthBar = Drawing.new("Line")
    esp.HealthBar.Visible = false
    esp.HealthBar.Color = Settings.HealthColor
    esp.HealthBar.Thickness = 4

    esp.Distance = Drawing.new("Text")
    esp.Distance.Visible = false
    esp.Distance.Color = Settings.DistanceColor
    esp.Distance.Size = 12
    esp.Distance.Center = true
    esp.Distance.Outline = true
    esp.Distance.Font = 2

    esp.Line = Drawing.new("Line")
    esp.Line.Visible = false
    esp.Line.Color = Settings.LineColor
    esp.Line.Thickness = 1

    ESPs[plr] = esp
end

-- Remove ESP de player
local function RemoveESPForPlayer(plr)
    if ESPs[plr] then
        for _, drawObj in pairs(ESPs[plr]) do
            drawObj.Visible = false
            drawObj:Remove()
        end
        ESPs[plr] = nil
    end
end

-- Atualiza ESP no RenderStepped
local function UpdateESP()
    for plr, esp in pairs(ESPs) do
        local character = plr.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not (character and humanoid and hrp and humanoid.Health > 0) then
            for _, drawObj in pairs(esp) do
                drawObj.Visible = false
            end
            continue
        end

        if Settings.TeamCheck and plr.Team == LocalPlayer.Team then
            for _, drawObj in pairs(esp) do
                drawObj.Visible = false
            end
            continue
        end

        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onScreen or screenPos.Z < 0 then
            for _, drawObj in pairs(esp) do
                drawObj.Visible = false
            end
            continue
        end

        -- Caixa (BOX)
        if Settings["ESP BOX"] then
            local size = Vector2.new(1000 / screenPos.Z, 1400 / screenPos.Z)
            local boxPos = Vector2.new(screenPos.X - size.X / 2, screenPos.Y - size.Y / 2)
            esp.Box.Position = boxPos
            esp.Box.Size = size
            esp.Box.Color = Settings.LineColor -- sincroniza com linha
            esp.Box.Visible = true
        else
            esp.Box.Visible = false
        end

        -- Nome
        if Settings["ESP NOME"] then
            esp.Name.Position = Vector2.new(screenPos.X, screenPos.Y - 20)
            esp.Name.Text = plr.Name
            esp.Name.Color = Settings.NameColor
            esp.Name.Visible = true
        else
            esp.Name.Visible = false
        end

        -- Vida (barra)
        if Settings["ESP VIDA"] then
            local healthPercent = humanoid.Health / humanoid.MaxHealth
            local boxSize = esp.Box.Size
            local boxPos = esp.Box.Position
            esp.HealthBar.From = Vector2.new(boxPos.X, boxPos.Y + boxSize.Y + 5)
            esp.HealthBar.To = Vector2.new(boxPos.X + boxSize.X * healthPercent, boxPos.Y + boxSize.Y + 5)
            esp.HealthBar.Color = Settings.HealthColor
            esp.HealthBar.Visible = true
        else
            esp.HealthBar.Visible = false
        end

        -- Distância
        if Settings["ESP DISTÂNCIA"] then
            local dist = (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            esp.Distance.Position = Vector2.new(screenPos.X, screenPos.Y + 15)
            esp.Distance.Text = string.format("%.0f studs", dist)
            esp.Distance.Color = Settings.DistanceColor
            esp.Distance.Visible = true
        else
            esp.Distance.Visible = false
        end

        -- Chams (modifica a cor dos partes)
        if Settings["CHAMS"] then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.SmoothPlastic
                    part.Color = Settings.ChamsColor
                    part.Transparency = 0.5
                end
            end
        else
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0
                    part.Material = Enum.Material.Plastic
                end
            end
        end

        -- Linha para ESP LINE
        if Settings["ESP LINE"] then
            local centerScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
            esp.Line.From = centerScreen
            esp.Line.To = Vector2.new(screenPos.X, screenPos.Y)
            esp.Line.Color = Settings.LineColor
            esp.Line.Visible = true
        else
            esp.Line.Visible = false
        end
    end
end

-- Criar ESP para players que entrarem
Players.PlayerAdded:Connect(function(plr)
    if plr ~= LocalPlayer then
        plr.CharacterAdded:Connect(function()
            CreateESPForPlayer(plr)
        end)
        if plr.Character then
            CreateESPForPlayer(plr)
        end
    end
end)

-- Criar ESP para players que já estão no jogo
for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        if plr.Character then
            CreateESPForPlayer(plr)
        end
    end
end

-- Atualizar ESP toda frame
RunService.RenderStepped:Connect(UpdateESP)

-- Aimbot e Triggerbot funções
local function getClosestTarget()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local mousePos = UserInputService:GetMouseLocation()
    for plr, esp in pairs(ESPs) do
        if plr == LocalPlayer then continue end
        local character = plr.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not (character and humanoid and humanoid.Health > 0 and hrp) then continue end
        if Settings.TeamCheck and plr.Team == LocalPlayer.Team then continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onScreen or screenPos.Z < 0 then continue end

        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
        if distance < shortestDistance then
            shortestDistance = distance
            closestPlayer = plr
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    -- Aimbot
    if Settings["AIMBOT"] then
        local target = getClosestTarget()
        if target and target.Character then
            local hrp = target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local mouse = game.Players.LocalPlayer:GetMouse()
                    mousemoverel = mousemoverel or function() end -- evitar erro se não existir (placeholder)
                    -- Centralizar o mouse suavemente no alvo
                    local screenPos = Vector2.new(pos.X, pos.Y)
                    local mousePos = UserInputService:GetMouseLocation()
                    local delta = screenPos - mousePos
                    local smooth = 0.2 -- quanto menor, mais rápido
                    local newX = mousePos.X + delta.X * smooth
                    local newY = mousePos.Y + delta.Y * smooth
                    -- Note: mousemoverel não existe no Roblox normal, esse código depende de exploits externos.
                    -- Aqui você deveria usar a função do exploit para mover o mouse ou a mira.
                end
            end
        end
    end

    -- Triggerbot
    if Settings["TRIGGERBOT"] then
        local target = getClosestTarget()
        if target and target.Character then
            local hrp = target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    -- Simular clique do mouse para atirar
                    -- Aqui você precisa adaptar para o sistema de tiro do jogo
                    -- Exemplo genérico:
                    -- fireclickdetector() ou evento de ataque do jogo
                end
            end
        end
    end

    -- Fly movement
    if flying and flyBodyVelocity and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character.HumanoidRootPart
        local moveDir = Vector3.new()

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + (Camera.CFrame.LookVector) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - (Camera.CFrame.LookVector) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - (Camera.CFrame.RightVector) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + (Camera.CFrame.RightVector) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end

        moveDir = moveDir.Unit * flySpeed
        if moveDir.Magnitude == 0 then moveDir = Vector3.new(0,0,0) end
        flyBodyVelocity.Velocity = moveDir
    end

    -- Noclip
    if noclipActive and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Atalho para abrir/fechar menu (Insert)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        gui.Enabled = not gui.Enabled
    end
end)

print("GhostMenu completo com ESP, cheats e menu funcional carregado!")