local AKHUB = {}

local UserInputService = game:GetService("UserInputService")
local players = game:service('Players');
local player = players.LocalPlayer;
local mouse = player:GetMouse();
local run = game:service('RunService');
local stepped = run.Stepped;

function AKHUB:CreateWindow(Window)
	Window.Opacity = Window.Opacity or false
	Window.OptionsStroke = Window.OptionsStroke or false
	Window.TabMinimeze = Window.TabMinimeze or false
	Window.Draggable = Window.Draggable or false
	Window.KeyCode = Window.KeyCode or "K"
	
	local Font1 = Enum.Font.Michroma
	local Font2 = Enum.Font.GothamMedium
	local Back = Enum.EasingDirection.InOut
	local Out = Enum.EasingStyle.Quad
	local Timer = 1
	local p1 = UDim2.new(1, 10, 0, 167)  -- Posição 1 (quando Settings.Visible é true)
	local p2 = UDim2.new(1, 10, 0, 0)   -- Posição 2 (quando Settings.Visible é false)
	local Drop = false
	local holderWASD = false
	local DraggableM = Window.Draggable
	
	local Owners = {
		5860126267,
		4777736527,
		1570907477
	}
	
	local S1 = Instance.new("UIStroke")
	S1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	S1.Thickness = 1
	S1.Color = Color3.fromRGB(255, 255, 255)
	
	local MyLibrary = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	
	_G.FSPF = Instance.new("Frame")
	_G.UICorner = Instance.new("UICorner")
	_G.DropShadowHolder = Instance.new("Frame")
	_G.DropShadow = Instance.new("ImageLabel")
	_G.Camda3 = Instance.new("Frame")
	_G.UICorner_2 = Instance.new("UICorner")
	_G.DropShadowHolder_2 = Instance.new("Frame")
	_G.DropShadow_2 = Instance.new("ImageLabel")
	_G.Fps = Instance.new("TextLabel")
	_G.UIPadding = Instance.new("UIPadding")
	_G.PlayerName = Instance.new("TextLabel")
	_G.UIPadding_2 = Instance.new("UIPadding")
	_G.UserIMG = Instance.new("ImageLabel")
	_G.pp = Instance.new("TextButton")
	_G.UIPadding_3 = Instance.new("UIPadding")

	_G.FSPF.Name = "_G.FSPF"
	_G.FSPF.Parent = Main
	_G.FSPF.BackgroundColor3 = Color3.fromRGB(84, 0, 0)
	_G.FSPF.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_G.FSPF.BorderSizePixel = 0
	_G.FSPF.Visible = false
	_G.FSPF.Position = UDim2.new(0, 0, 1, 10)
	_G.FSPF.Size = UDim2.new(1, 0, 0, 30)

	_G.UICorner.CornerRadius = UDim.new(0, 5)
	_G.UICorner.Parent = _G.FSPF
	_G.DropShadowHolder.Name = "_G.DropShadowHolder"
	_G.DropShadowHolder.Parent = _G.FSPF
	_G.DropShadowHolder.BackgroundTransparency = 1.000
	_G.DropShadowHolder.BorderSizePixel = 0
	_G.DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	_G.DropShadowHolder.ZIndex = 0

	_G.DropShadow.Name = "_G.DropShadow"
	_G.DropShadow.Parent = _G.DropShadowHolder
	_G.DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	_G.DropShadow.BackgroundTransparency = 1.000
	_G.DropShadow.BorderSizePixel = 0
	_G.DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	_G.DropShadow.Size = UDim2.new(1, 37, 1, 37)
	_G.DropShadow.ZIndex = 0
	_G.DropShadow.Image = "rbxassetid://6014261993"
	_G.DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	_G.DropShadow.ImageTransparency = 0.500
	_G.DropShadow.ScaleType = Enum.ScaleType.Slice
	_G.DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	_G.Camda3.Name = "_G.Camda3"
	_G.Camda3.Parent = _G.FSPF
	_G.Camda3.BackgroundColor3 = Color3.fromRGB(84, 0, 0)
	_G.Camda3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_G.Camda3.BorderSizePixel = 0
	_G.Camda3.Size = UDim2.new(1, 0, 1, 0)

	_G.UICorner_2.CornerRadius = UDim.new(0, 5)
	_G.UICorner_2.Parent = _G.Camda3

	_G.DropShadowHolder_2.Name = "_G.DropShadowHolder"
	_G.DropShadowHolder_2.Parent = _G.Camda3
	_G.DropShadowHolder_2.BackgroundTransparency = 1.000
	_G.DropShadowHolder_2.BorderSizePixel = 0
	_G.DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
	_G.DropShadowHolder_2.ZIndex = 0

	_G.DropShadow_2.Name = "_G.DropShadow"
	_G.DropShadow_2.Parent = _G.DropShadowHolder_2
	_G.DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
	_G.DropShadow_2.BackgroundTransparency = 1.000
	_G.DropShadow_2.BorderSizePixel = 0
	_G.DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	_G.DropShadow_2.Size = UDim2.new(1, 40, 1, 37)
	_G.DropShadow_2.ZIndex = 0
	_G.DropShadow_2.Image = "rbxassetid://6014261993"
	_G.DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
	_G.DropShadow_2.ImageTransparency = 0.500
	_G.DropShadow_2.ScaleType = Enum.ScaleType.Slice
	_G.DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

	_G.Fps.Name = "_G.Fps"
	_G.Fps.Parent = _G.Camda3
	_G.Fps.AnchorPoint = Vector2.new(1, 0)
	_G.Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_G.Fps.BackgroundTransparency = 1.000
	_G.Fps.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_G.Fps.BorderSizePixel = 0
	_G.Fps.Position = UDim2.new(1, 0, 0, 0)
	_G.Fps.Size = UDim2.new(0.154661015, 0, 1, 0)
	_G.Fps.Font = Enum.Font.Michroma
	_G.Fps.Text = "Fps: 60"
	_G.Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
	_G.Fps.TextSize = 12.000
	_G.Fps.TextWrapped = true
	_G.Fps.TextXAlignment = Enum.TextXAlignment.Right

	_G.UIPadding.Parent = _G.Fps
	_G.UIPadding.PaddingRight = UDim.new(0, 7)

	_G.PlayerName.Name = "_G.PlayerName"
	_G.PlayerName.Parent = _G.Camda3
	_G.PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_G.PlayerName.BackgroundTransparency = 1.000
	_G.PlayerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_G.PlayerName.BorderSizePixel = 0
	_G.PlayerName.Size = UDim2.new(0, 200, 1, 0)
	_G.PlayerName.Font = Enum.Font.Michroma
	_G.PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	_G.PlayerName.TextSize = 12.000
	_G.PlayerName.TextWrapped = true
	_G.PlayerName.TextXAlignment = Enum.TextXAlignment.Left

	_G.UIPadding_2.Parent = _G.PlayerName
	_G.UIPadding_2.PaddingLeft = UDim.new(0, 37)

	_G.UserIMG.Name = "_G.UserIMG"
	_G.UserIMG.Parent = _G.PlayerName
	_G.UserIMG.AnchorPoint = Vector2.new(0, 0.5)
	_G.UserIMG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_G.UserIMG.BackgroundTransparency = 1.000
	_G.UserIMG.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_G.UserIMG.BorderSizePixel = 0
	_G.UserIMG.Position = UDim2.new(0, -30, 0.5, 0)
	_G.UserIMG.Size = UDim2.new(0, 22, 0, 22)
	_G.UserIMG.Image = "rbxassetid://7743875962"
	_G.UserIMG.ImageColor3 = Color3.fromRGB(222, 222, 222)

	_G.pp.Name = "_G.pp"
	_G.pp.Parent = _G.Camda3
	_G.pp.Active = false
	_G.pp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_G.pp.BackgroundTransparency = 1.000
	_G.pp.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_G.pp.BorderSizePixel = 0
	_G.pp.Position = UDim2.new(1, -200-73, 0, 0)
	_G.pp.Selectable = false
	_G.pp.Size = UDim2.new(1, -200-73, 1, 0)
	_G.pp.AutoButtonColor = false
	_G.pp.Font = Enum.Font.Michroma
	_G.pp.Text = "Position:  -17, 1, -1009"
	_G.pp.TextColor3 = Color3.fromRGB(255, 255, 255)
	_G.pp.TextSize = 12.500
	_G.pp.TextWrapped = true
	_G.pp.TextXAlignment = Enum.TextXAlignment.Left

	_G.UIPadding_3.Parent = _G.pp
	_G.UIPadding_3.PaddingLeft = UDim.new(0, 7)

	_G.isCreator = false
	_G.player = game.Players.LocalPlayer

	for _, creatorId in ipairs(Owners) do
		if player.UserId == creatorId then
			_G.isCreator = true
			break
		end
	end

	if _G.isCreator then
		_G.PlayerName.Text = player.Name.. "  [ Owner ]"
	else
		_G.PlayerName.Text = player.Name.. "  [ Client ]"
	end
	
	local function updatePlayerPosition()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

		-- Conectar ao evento RenderStepped uma única vez
		local connection
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			-- Atualizar a posição a cada frame
			local pos = humanoidRootPart.Position
			_G.pp.Text = string.format("Position:  %.2f, %.2f, %.2f", pos.X, pos.Y, pos.Z)
		end)

		-- Desconectar a função quando o jogador sai ou a conexão não for mais necessária
		player.CharacterRemoving:Connect(function()
			if connection then
				connection:Disconnect()  -- Desconectar a conexão para evitar vazamentos de memória
			end
		end)
	end
	
	-- Função para calcular e exibir o FPS
	local function updateFPS()
		local lastTime = tick()  -- O tempo atual no momento do primeiro cálculo
		local frameCount = 0     -- Contador de frames
		local fps = 0            -- FPS inicial

		-- Conectar ao evento RenderStepped
		game:GetService("RunService").RenderStepped:Connect(function()
			frameCount = frameCount + 1
			local currentTime = tick()
			local deltaTime = currentTime - lastTime

			-- Quando passar 1 segundo, calculamos o FPS
			if deltaTime >= 1 then
				fps = frameCount / deltaTime
				lastTime = currentTime
				frameCount = 0

				-- Atualizar o texto da UI com o valor do FPS
				_G.Fps.Text = string.format("Fps: %d", math.floor(fps))
			end
		end)
	end
	

	_G.pp.MouseButton1Click:Connect(function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		
		local pos = humanoidRootPart.Position
		print(string.format("Position:  %.2f, %.2f, %.2f", pos.X, pos.Y, pos.Z))
	end)

	updateFPS()
	updatePlayerPosition()
	
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local UIGradient = Instance.new("UIGradient")
	local UIGradient = Instance.new("UIGradient")
	local BarName = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Name1 = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local Ghost = Instance.new("ImageLabel")
	local UIListLayout = Instance.new("UIListLayout")
	local UIGradient = Instance.new("UIGradient")
	local Name2 = Instance.new("TextLabel")
	local UIPadding_2 = Instance.new("UIPadding")
	local UICorner_2 = Instance.new("UICorner")
	local Navegation = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")
	local UICorner_3 = Instance.new("UICorner")
	local ScrollTabs = Instance.new("ScrollingFrame")
	local UIPadding_3 = Instance.new("UIPadding")
	local UIListLayout_2 = Instance.new("UIListLayout")
	
	
	
	MyLibrary.Name = "MyLibrary"
	MyLibrary.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	MyLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local MenuOpen = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")

	MenuOpen.Name = "MenuOpen"
	MenuOpen.Parent = MyLibrary
	MenuOpen.BackgroundColor3 = Color3.fromRGB(84, 0, 0)
	MenuOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MenuOpen.BorderSizePixel = 0
	MenuOpen.Position = UDim2.new(0.014317181, 0, 0.012820513, 0)
	MenuOpen.Size = UDim2.new(0, 84, 0, 26)
	MenuOpen.AutoButtonColor = false
	MenuOpen.Font = Font1
	MenuOpen.Text = "Menu"
	MenuOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
	MenuOpen.TextSize = 14.000

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = MenuOpen

	Main.Name = "Main"
	Main.Parent = MyLibrary
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.BackgroundTransparency = Window.Opacity and 0.500 or 0
	Main.Active = true 
	Main.Draggable = Window.Draggable
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.ClipsDescendants = false
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 472, 0, 320)
	Main.ZIndex = math.huge
	
	MenuOpen.MouseButton1Click:Connect(function()
		Main.Visible = not Main.Visible
	end)

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Main
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.Active = true
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
	
	local UIGradientMain = Instance.new("UIGradient")
	UIGradientMain.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradientMain.Name = "UIGradientMain"
	UIGradientMain.Parent = Main
	
	local M = S1:Clone()
	M.Parent = Main
	
	local UIGradientS = Instance.new("UIGradient")
	UIGradientS.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradientS.Rotation = 180
	UIGradientS.Name = "UIGradientS"
	UIGradientS.Parent = M
	

	local Camada2 = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradientCamada2 = Instance.new("UIGradient")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")

	Camada2.Name = "Camada2"
	Camada2.Parent = Main
	Camada2.AnchorPoint = Vector2.new(0.5, 0.5)
	Camada2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Camada2.BackgroundTransparency = 0.500
	Camada2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Camada2.BorderSizePixel = 0
	Camada2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Camada2.Size = UDim2.new(0, 472, 0, 300)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Camada2

	UIGradientCamada2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradientCamada2.Name = "UIGradientCamada2"
	UIGradientCamada2.Parent = Camada2

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Camada2
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.Active = true
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	BarName.Name = "BarName"
	BarName.Parent = Main
	BarName.Active = true
	BarName.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	BarName.BackgroundTransparency = 0.700
	BarName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BarName.BorderSizePixel = 0
	BarName.Position = UDim2.new(0, 7, 0, 7)
	BarName.Size = UDim2.new(0, 134, 0, 40)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = BarName

	Name1.Name = "Name1"
	Name1.Parent = BarName
	Name1.Active = true
	Name1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name1.BackgroundTransparency = 1.000
	Name1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Name1.BorderSizePixel = 0
	Name1.Size = UDim2.new(0.5, 0, 1, 0)
	Name1.Font = Font1
	Name1.Text = "AKAIDO"
	Name1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name1.TextSize = 12.000
	Name1.TextXAlignment = Enum.TextXAlignment.Right

	UIPadding.Parent = Name1
	UIPadding.PaddingRight = UDim.new(0, -15)

	Ghost.Name = "Ghost"
	Ghost.Parent = Name1
	Ghost.AnchorPoint = Vector2.new(0, 0.5)
	Ghost.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Ghost.BackgroundTransparency = 1.000
	Ghost.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Ghost.BorderSizePixel = 0
	Ghost.Position = UDim2.new(0, 5, 0.5, 0)
	Ghost.Size = UDim2.new(0, 22, 0, 22)
	Ghost.Image = "rbxassetid://90991999539475"
	Ghost.ImageRectOffset = Vector2.new(22, 0)
	Ghost.ImageRectSize = Vector2.new(-22, 22)

	UIListLayout.Parent = BarName
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradient.Parent = BarName

	Name2.Name = "Name2"
	Name2.Parent = BarName
	Name2.Active = true
	Name2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name2.BackgroundTransparency = 1.000
	Name2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Name2.BorderSizePixel = 0
	Name2.Size = UDim2.new(0.5, 0, 1, 0)
	Name2.Font = Font1
	Name2.Text = "HUB"
	Name2.TextColor3 = Color3.fromRGB(202, 0, 0)
	Name2.TextSize = 12.000
	Name2.TextXAlignment = Enum.TextXAlignment.Left
	Name2.TextYAlignment = Enum.TextYAlignment.Top

	UIPadding_2.Parent = Name2
	UIPadding_2.PaddingLeft = UDim.new(0, 18)
	UIPadding_2.PaddingTop = UDim.new(0, 9)

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Main

	Navegation.Name = "Navegation"
	Navegation.Parent = Main
	Navegation.Active = true
	Navegation.AnchorPoint = Vector2.new(0, 1)
	Navegation.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Navegation.BackgroundTransparency = 0.700
	Navegation.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Navegation.BorderSizePixel = 0
	Navegation.Position = UDim2.new(0, 7, 1, -7)

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradient_2.Parent = Navegation

	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = Navegation

	ScrollTabs.Name = "ScrollTabs"
	ScrollTabs.Parent = Navegation
	ScrollTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollTabs.BackgroundTransparency = 1.000
	ScrollTabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollTabs.BorderSizePixel = 0
	ScrollTabs.Selectable = false
	ScrollTabs.Size = UDim2.new(1, 0, 1, 0)
	ScrollTabs.ScrollBarThickness = 0
	ScrollTabs.VerticalScrollBarInset = Enum.ScrollBarInset.Always

	UIPadding_3.Parent = ScrollTabs
	UIPadding_3.PaddingBottom = UDim.new(0, 5)
	UIPadding_3.PaddingLeft = UDim.new(0, 5)
	UIPadding_3.PaddingRight = UDim.new(0, 5)
	UIPadding_3.PaddingTop = UDim.new(0, 5)

	UIListLayout_2.Parent = ScrollTabs
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 3)
	
	local TopBar = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local UIGradient_3 = Instance.new("UIGradient")
	local ViewTab = Instance.new("TextLabel")
	local UICorner_7 = Instance.new("UICorner")
	local ListButton = Instance.new("ImageButton")
	local UIGradient_4 = Instance.new("UIGradient")
	
	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.Active = true
	TopBar.AnchorPoint = Vector2.new(1, 0)
	TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TopBar.BackgroundTransparency = 0.700
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(1, -7, 0, 7)
	TopBar.Size = UDim2.new(1, -155, 0, 40)

	UICorner_6.CornerRadius = UDim.new(0, 5)
	UICorner_6.Parent = TopBar

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradient_3.Parent = TopBar

	ListButton.Name = "ListButton"
	ListButton.Parent = TopBar
	ListButton.AnchorPoint = Vector2.new(1, 0.5)
	ListButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListButton.BackgroundTransparency = 1.000
	ListButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListButton.BorderSizePixel = 0
	ListButton.Position = UDim2.new(1, -7, 0.5, 0)
	ListButton.Size = UDim2.new(0, 22, 0, 22)
	ListButton.Image = "rbxassetid://7734053495"
	ListButton.ImageColor3 = Color3.fromRGB(180, 180, 180)
	
	local ContentHolder = Instance.new("Frame")
	local UIGradient_5 = Instance.new("UIGradient")
	local UICorner_8 = Instance.new("UICorner")
	
	ContentHolder.Name = "ContentHolder"
	ContentHolder.Parent = Main
	ContentHolder.AnchorPoint = Vector2.new(1, 1)
	ContentHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ContentHolder.BackgroundTransparency = 0.700
	ContentHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContentHolder.BorderSizePixel = 0
	ContentHolder.ClipsDescendants = true
	ContentHolder.Position = UDim2.new(1, -7, 1, -7)

	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
	UIGradient_5.Parent = ContentHolder

	UICorner_8.CornerRadius = UDim.new(0, 5)
	UICorner_8.Parent = ContentHolder
	
	
	
	local function TabPage()
		local contentSize = UIListLayout_2.AbsoluteContentSize
		ScrollTabs.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
	end
	
	local HolderASWD = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local DropShadowHolderAWSD = Instance.new("Frame")
	local AWSDDROP = Instance.new("ImageLabel")
	local Camada2 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local tbar = Instance.new("Frame")
	local Draggable = Instance.new("ImageLabel")
	local UIPadding = Instance.new("UIPadding")
	local W = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")
	local K = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local Bbar = Instance.new("Frame")
	local UIPadding_2 = Instance.new("UIPadding")
	local S = Instance.new("TextButton")
	local UICorner_5 = Instance.new("UICorner")
	local D = Instance.new("TextButton")
	local UICorner_6 = Instance.new("UICorner")
	local A = Instance.new("TextButton")
	local UICorner_7 = Instance.new("UICorner")

	--Properties:

	HolderASWD.Name = "HolderASWD"
	HolderASWD.Parent = Main
	HolderASWD.BackgroundColor3 = Color3.fromRGB(84, 0, 0)
	HolderASWD.BackgroundTransparency = 0.500
	HolderASWD.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HolderASWD.BorderSizePixel = 0
	HolderASWD.Visible = holderWASD
	HolderASWD.Position = UDim2.new(1.041, -10, 0.734, -10)
	HolderASWD.Size = UDim2.new(0, 160, 0, 89)

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = HolderASWD

	DropShadowHolderAWSD.Name = "DropShadowHolderAWSD"
	DropShadowHolderAWSD.Parent = HolderASWD
	DropShadowHolderAWSD.BackgroundTransparency = 1.000
	DropShadowHolderAWSD.BorderSizePixel = 0
	DropShadowHolderAWSD.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolderAWSD.ZIndex = 0

	AWSDDROP.Name = "AWSDDROP"
	AWSDDROP.Parent = DropShadowHolderAWSD
	AWSDDROP.AnchorPoint = Vector2.new(0.5, 0.5)
	AWSDDROP.BackgroundTransparency = 1.000
	AWSDDROP.BorderSizePixel = 0
	AWSDDROP.Position = UDim2.new(0.5, 0, 0.5, 0)
	AWSDDROP.Size = UDim2.new(1, 47, 1, 47)
	AWSDDROP.ZIndex = 0
	AWSDDROP.Image = "rbxassetid://6014261993"
	AWSDDROP.ImageColor3 = Color3.fromRGB(0, 0, 0)
	AWSDDROP.ImageTransparency = 0.500
	AWSDDROP.ScaleType = Enum.ScaleType.Slice
	AWSDDROP.SliceCenter = Rect.new(49, 49, 450, 450)

	Camada2.Name = "Camada2"
	Camada2.Parent = HolderASWD
	Camada2.BackgroundColor3 = Color3.fromRGB(84, 0, 0)
	Camada2.BackgroundTransparency = 0.500
	Camada2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Camada2.BorderSizePixel = 0
	Camada2.Size = UDim2.new(1, 0, 1, 0)

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Camada2

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Camada2
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	tbar.Name = "TopBar"
	tbar.Parent = HolderASWD
	tbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tbar.BackgroundTransparency = 1.000
	tbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	tbar.BorderSizePixel = 0
	tbar.Size = UDim2.new(1, 0, 0.5, 0)

	Draggable.Name = "Draggable"
	Draggable.Parent = tbar
	Draggable.AnchorPoint = Vector2.new(0, 0.5)
	Draggable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Draggable.BackgroundTransparency = 1.000
	Draggable.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Draggable.BorderSizePixel = 0
	Draggable.Position = UDim2.new(0, 12, 0.5, 0)
	Draggable.Size = UDim2.new(0, 30, 0, 30)
	Draggable.Image = "rbxassetid://90991999539475"
	Draggable.ImageColor3 = Color3.fromRGB(181, 0, 0)
	Draggable.ImageRectOffset = Vector2.new(25, 0)
	Draggable.ImageRectSize = Vector2.new(-25, 25)

	UIPadding.Parent = TopBar
	UIPadding.PaddingLeft = UDim.new(0, 7)

	W.Name = "W"
	W.Parent = tbar
	W.AnchorPoint = Vector2.new(0, 0.5)
	W.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	W.BackgroundTransparency = 0.500
	W.BorderColor3 = Color3.fromRGB(0, 0, 0)
	W.BorderSizePixel = 0
	W.Position = UDim2.new(0.5, -24, 0.5, 0)
	W.Size = UDim2.new(0, 40, 0, 30)
	W.AutoButtonColor = false
	W.Font = Font1
	W.Text = "W"
	W.TextColor3 = Color3.fromRGB(239, 239, 239)
	W.TextSize = 14.000

	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = W

	K.Name = "K"
	K.Parent = tbar
	K.AnchorPoint = Vector2.new(1, 0.5)
	K.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	K.BackgroundTransparency = 0.500
	K.BorderColor3 = Color3.fromRGB(0, 0, 0)
	K.BorderSizePixel = 0
	K.Position = UDim2.new(1, -10, 0.5, 0)
	K.Size = UDim2.new(0, 40, 0, 30)
	K.AutoButtonColor = false
	K.Font = Font1
	K.Text = Window.KeyCode
	K.TextColor3 = Color3.fromRGB(239, 239, 239)
	K.TextSize = 14.000

	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = K

	Bbar.Name = "Bbar"
	Bbar.Parent = HolderASWD
	Bbar.AnchorPoint = Vector2.new(0, 1)
	Bbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bbar.BackgroundTransparency = 1.000
	Bbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bbar.BorderSizePixel = 0
	Bbar.Position = UDim2.new(0, 0, 1, 0)
	Bbar.Size = UDim2.new(1, 0, 0.5, 0)

	UIPadding_2.Parent = Bbar
	UIPadding_2.PaddingLeft = UDim.new(0, 7)

	S.Name = "S"
	S.Parent = Bbar
	S.AnchorPoint = Vector2.new(0, 0.5)
	S.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	S.BackgroundTransparency = 0.500
	S.BorderColor3 = Color3.fromRGB(0, 0, 0)
	S.BorderSizePixel = 0
	S.Position = UDim2.new(0.5, -24, 0.5, 0)
	S.Size = UDim2.new(0, 40, 0, 30)
	S.AutoButtonColor = false
	S.Font = Font1
	S.Text = "S"
	S.TextColor3 = Color3.fromRGB(239, 239, 239)
	S.TextSize = 14.000

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = S

	D.Name = "D"
	D.Parent = Bbar
	D.AnchorPoint = Vector2.new(1, 0.5)
	D.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	D.BackgroundTransparency = 0.500
	D.BorderColor3 = Color3.fromRGB(0, 0, 0)
	D.BorderSizePixel = 0
	D.Position = UDim2.new(1, -10, 0.5, 0)
	D.Size = UDim2.new(0, 40, 0, 30)
	D.AutoButtonColor = false
	D.Font = Font1
	D.Text = "D"
	D.TextColor3 = Color3.fromRGB(239, 239, 239)
	D.TextSize = 14.000

	UICorner_6.CornerRadius = UDim.new(0, 5)
	UICorner_6.Parent = D

	A.Name = "A"
	A.Parent = Bbar
	A.AnchorPoint = Vector2.new(0, 0.5)
	A.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	A.BackgroundTransparency = 0.500
	A.BorderColor3 = Color3.fromRGB(0, 0, 0)
	A.BorderSizePixel = 0
	A.Position = UDim2.new(0, 0, 0.5, 0)
	A.Size = UDim2.new(0, 40, 0, 30)
	A.AutoButtonColor = false
	A.Font = Font1
	A.Text = "A"
	A.TextColor3 = Color3.fromRGB(239, 239, 239)
	A.TextSize = 14.000

	UICorner_7.CornerRadius = UDim.new(0, 5)
	UICorner_7.Parent = A

	local pressedColor = Color3.fromRGB(71, 71, 71)
	local defaultColor = Color3.fromRGB(35, 35, 35)

	-- Evento de quando a tecla é pressionada
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.W then
			if not gameProcessedEvent then
				-- Muda a cor para "pressedColor" quando a tecla W é pressionada
				W.BackgroundColor3 = pressedColor
			end
		end
	end)

	-- Evento de quando a tecla é liberada
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.W then
			-- Muda a cor de volta para "defaultColor" quando a tecla W é liberada
			W.BackgroundColor3 = defaultColor
		end
	end)

	-- Evento de quando a tecla é pressionada
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.A then
			if not gameProcessedEvent then
				-- Muda a cor para "pressedColor" quando a tecla W é pressionada
				A.BackgroundColor3 = pressedColor
			end
		end
	end)

	-- Evento de quando a tecla é liberada
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.A then
			-- Muda a cor de volta para "defaultColor" quando a tecla W é liberada
			A.BackgroundColor3 = defaultColor
		end
	end)

	-- Evento de quando a tecla é pressionada
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.S then
			if not gameProcessedEvent then
				-- Muda a cor para "pressedColor" quando a tecla W é pressionada
				S.BackgroundColor3 = pressedColor
			end
		end
	end)

	-- Evento de quando a tecla é liberada
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.S then
			-- Muda a cor de volta para "defaultColor" quando a tecla W é liberada
			S.BackgroundColor3 = defaultColor
		end
	end)

	-- Evento de quando a tecla é pressionada
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.D then
			if not gameProcessedEvent then
				-- Muda a cor para "pressedColor" quando a tecla W é pressionada
				D.BackgroundColor3 = pressedColor
			end
		end
	end)

	-- Evento de quando a tecla é liberada
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.D then
			-- Muda a cor de volta para "defaultColor" quando a tecla W é liberada
			D.BackgroundColor3 = defaultColor
		end
	end)

	-- Evento de quando a tecla é pressionada
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[Window.KeyCode] then
			if not gameProcessedEvent then
				-- Muda a cor para "pressedColor" quando a tecla W é pressionada
				K.BackgroundColor3 = pressedColor
			end
		end
	end)

	-- Evento de quando a tecla é liberada
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[Window.KeyCode] then
			-- Muda a cor de volta para "defaultColor" quando a tecla W é liberada
			K.BackgroundColor3 = defaultColor
		end
	end)
	
	local GUI = {}
	
	local Settings = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local UICorner = Instance.new("UICorner")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Camada2 = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")
	local UICorner_2 = Instance.new("UICorner")
	local DropShadowHolder_2 = Instance.new("Frame")
	local DropShadow_2 = Instance.new("ImageLabel")
	local TitleBar = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local Title1 = Instance.new("TextLabel")
	local Icon = Instance.new("ImageLabel")
	local UIPadding = Instance.new("UIPadding")
	local Title2 = Instance.new("TextLabel")
	local UIPadding_2 = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")
	local Content = Instance.new("ScrollingFrame")
	local UICorner_4 = Instance.new("UICorner")
	local UIGradient_3 = Instance.new("UIGradient")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UIPadding_3 = Instance.new("UIPadding")
	local Opacity = Instance.new("Frame")
	local UIGradient_4 = Instance.new("UIGradient")
	local UICorner_5 = Instance.new("UICorner")
	local Content_2 = Instance.new("Frame")
	local UIListLayout_3 = Instance.new("UIListLayout")
	local Title = Instance.new("TextLabel")
	local UIPadding_4 = Instance.new("UIPadding")
	local Description = Instance.new("TextLabel")
	local UIPadding_5 = Instance.new("UIPadding")
	local OnClick = Instance.new("TextButton")
	local Holder1 = Instance.new("Frame")
	local UIListLayout_44 = Instance.new("UIListLayout")
	local UIPadding_6 = Instance.new("UIPadding")
	local Boll = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local UICorner_7 = Instance.new("UICorner")
	local Tab = Instance.new("Frame")
	local UIGradient_5 = Instance.new("UIGradient")
	local UICorner_8 = Instance.new("UICorner")
	local Content_3 = Instance.new("Frame")
	local UIListLayout_5 = Instance.new("UIListLayout")
	local Title_2 = Instance.new("TextLabel")
	local UIPadding_7 = Instance.new("UIPadding")
	local Description_2 = Instance.new("TextLabel")
	local UIPadding_8 = Instance.new("UIPadding")
	local OnClick_2 = Instance.new("TextButton")
	local Holder_2 = Instance.new("Frame")
	local UIListLayout_6 = Instance.new("UIListLayout")
	local UIPadding_9 = Instance.new("UIPadding")
	local Boll_2 = Instance.new("Frame")
	local UICorner_9 = Instance.new("UICorner")
	local UICorner_10 = Instance.new("UICorner")
	local Holdewasd = Instance.new("Frame")
	local UIGradient_6 = Instance.new("UIGradient")
	local UICorner_11 = Instance.new("UICorner")
	local Content_4 = Instance.new("Frame")
	local UIListLayout_7 = Instance.new("UIListLayout")
	local Title_3 = Instance.new("TextLabel")
	local UIPadding_10 = Instance.new("UIPadding")
	local Description_3 = Instance.new("TextLabel")
	local UIPadding_11 = Instance.new("UIPadding")
	local OnClick_3 = Instance.new("TextButton")
	local Holder_33 = Instance.new("Frame")
	local UIListLayout_88 = Instance.new("UIListLayout")
	local UIPadding_12 = Instance.new("UIPadding")
	local Boll_3 = Instance.new("Frame")
	local UICorner_12 = Instance.new("UICorner")
	local UICorner_13 = Instance.new("UICorner")
	local DraggableMain = Instance.new("Frame")
	local UIGradient_7 = Instance.new("UIGradient")
	local UICorner_14 = Instance.new("UICorner")
	local Content_5 = Instance.new("Frame")
	local UIListLayout_9 = Instance.new("UIListLayout")
	local Title_4 = Instance.new("TextLabel")
	local UIPadding_13 = Instance.new("UIPadding")
	local Description_4 = Instance.new("TextLabel")
	local UIPadding_14 = Instance.new("UIPadding")
	local OnClick_4 = Instance.new("TextButton")
	local Holder_4 = Instance.new("Frame")
	local UIListLayout_10 = Instance.new("UIListLayout")
	local UIPadding_15 = Instance.new("UIPadding")
	local Boll_4 = Instance.new("Frame")
	local UICorner_15 = Instance.new("UICorner")
	local UICorner_16 = Instance.new("UICorner")
	local Keybind = Instance.new("Frame")
	local UIGradient_8 = Instance.new("UIGradient")
	local UICorner_17 = Instance.new("UICorner")
	local Content_6 = Instance.new("Frame")
	local UIListLayout_11 = Instance.new("UIListLayout")
	local Title_5 = Instance.new("TextLabel")
	local UIPadding_16 = Instance.new("UIPadding")
	local Description_5 = Instance.new("TextLabel")
	local UIPadding_17 = Instance.new("UIPadding")
	local Holder_5 = Instance.new("Frame")
	local UICorner_18 = Instance.new("UICorner")
	local UIGradient_9 = Instance.new("UIGradient")
	local Text = Instance.new("TextBox")
	local UIListLayout_12 = Instance.new("UIListLayout")
	
	
	do
		Settings.Name = "Settings"
		Settings.Parent = Main
		Settings.AnchorPoint = Vector2.new(1, 0)
		Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Settings.BackgroundTransparency = 0.500
		Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Settings.BorderSizePixel = 0
		Settings.Visible = false
		Settings.Position = UDim2.new(0, -10, 0, 0)
		Settings.Size = UDim2.new(0, 160, 0, 170)

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient.Parent = Settings

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = Settings

		DropShadowHolder.Name = "DropShadowHolder"
		DropShadowHolder.Parent = Settings
		DropShadowHolder.BackgroundTransparency = 1.000
		DropShadowHolder.BorderSizePixel = 0
		DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
		DropShadowHolder.ZIndex = 0

		DropShadow.Name = "DropShadow"
		DropShadow.Parent = DropShadowHolder
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundTransparency = 1.000
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Size = UDim2.new(1, 47, 1, 47)
		DropShadow.ZIndex = 0
		DropShadow.Image = "rbxassetid://6014261993"
		DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.ImageTransparency = 0.500
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

		Camada2.Name = "Camada2"
		Camada2.Parent = Settings
		Camada2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Camada2.BackgroundTransparency = 0.500
		Camada2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Camada2.BorderSizePixel = 0
		Camada2.Size = UDim2.new(1, 0, 1, 0)

		UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_2.Parent = Camada2

		UICorner_2.CornerRadius = UDim.new(0, 5)
		UICorner_2.Parent = Camada2

		DropShadowHolder_2.Name = "DropShadowHolder"
		DropShadowHolder_2.Parent = Camada2
		DropShadowHolder_2.BackgroundTransparency = 1.000
		DropShadowHolder_2.BorderSizePixel = 0
		DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
		DropShadowHolder_2.ZIndex = 0

		DropShadow_2.Name = "DropShadow"
		DropShadow_2.Parent = DropShadowHolder_2
		DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow_2.BackgroundTransparency = 1.000
		DropShadow_2.BorderSizePixel = 0
		DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow_2.Size = UDim2.new(1, 47, 1, 47)
		DropShadow_2.ZIndex = 0
		DropShadow_2.Image = "rbxassetid://6014261993"
		DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow_2.ImageTransparency = 0.500
		DropShadow_2.ScaleType = Enum.ScaleType.Slice
		DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

		TitleBar.Name = "TitleBar"
		TitleBar.Parent = Settings
		TitleBar.AnchorPoint = Vector2.new(0.5, 0)
		TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		TitleBar.BackgroundTransparency = 0.500
		TitleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TitleBar.BorderSizePixel = 0
		TitleBar.Position = UDim2.new(0.5, 0, 0, 7)
		TitleBar.Size = UDim2.new(1, -10, 0, 30)

		UICorner_3.CornerRadius = UDim.new(0, 5)
		UICorner_3.Parent = TitleBar

		Title1.Name = "Title1"
		Title1.Parent = TitleBar
		Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title1.BackgroundTransparency = 1.000
		Title1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title1.BorderSizePixel = 0
		Title1.Size = UDim2.new(0.5, 0, 1, 0)
		Title1.Font = Font1
		Title1.Text = "Set"
		Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title1.TextSize = 14.000
		Title1.TextXAlignment = Enum.TextXAlignment.Left

		Icon.Name = "Icon"
		Icon.Parent = Title1
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0, -24, 0.5, 0)
		Icon.Size = UDim2.new(0, 20, 0, 20)
		Icon.Image = "rbxassetid://7734053495"
		Icon.ImageColor3 = Color3.fromRGB(230, 230, 230)

		UIPadding.Parent = Title1
		UIPadding.PaddingLeft = UDim.new(0, 32)

		Title2.Name = "Title2"
		Title2.Parent = TitleBar
		Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title2.BackgroundTransparency = 1.000
		Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title2.BorderSizePixel = 0
		Title2.Size = UDim2.new(0.5, 0, 1, -3)
		Title2.Font = Font1
		Title2.Text = "tings"
		Title2.TextColor3 = Color3.fromRGB(229, 0, 0)
		Title2.TextSize = 16.000
		Title2.TextXAlignment = Enum.TextXAlignment.Left

		UIPadding_2.Parent = Title2
		UIPadding_2.PaddingBottom = UDim.new(0, 5)
		UIPadding_2.PaddingLeft = UDim.new(0, -15)

		UIListLayout.Parent = TitleBar
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

		Content.Name = "Content"
		Content.Parent = Settings
		Content.AnchorPoint = Vector2.new(0, 1)
		Content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Content.BackgroundTransparency = 0.600
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0, 7, 1, -7)
		Content.Selectable = false
		Content.Size = UDim2.new(1, -12, 1, -48)
		Content.ScrollBarThickness = 0

		local function opts()
			local contentSize = UIListLayout_2.AbsoluteContentSize
			Content.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
		end

		UICorner_4.CornerRadius = UDim.new(0, 5)
		UICorner_4.Parent = Content

		UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_3.Parent = Content

		UIListLayout_2.Parent = Content
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		UIPadding_3.Parent = Content
		UIPadding_3.PaddingBottom = UDim.new(0, 3)
		UIPadding_3.PaddingLeft = UDim.new(0, 3)
		UIPadding_3.PaddingRight = UDim.new(0, 3)
		UIPadding_3.PaddingTop = UDim.new(0, 3)

		Opacity.Name = "Opacity"
		Opacity.Parent = Content
		Opacity.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		Opacity.BackgroundTransparency = 0.700
		Opacity.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Opacity.BorderSizePixel = 0
		Opacity.Size = UDim2.new(1, 0, 0, 40)

		UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_4.Rotation = -180
		UIGradient_4.Parent = Opacity
		
		Opacity:GetPropertyChangedSignal("AbsoluteSize"):Connect(opts)
		opts()

		UICorner_5.CornerRadius = UDim.new(0, 5)
		UICorner_5.Parent = Opacity

		Content_2.Name = "Content"
		Content_2.Parent = Opacity
		Content_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content_2.BackgroundTransparency = 1.000
		Content_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content_2.BorderSizePixel = 0
		Content_2.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout_3.Parent = Content_2
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 1)

		Title.Name = "Title"
		Title.Parent = Content_2
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Size = UDim2.new(1, 0, 0, 15)
		Title.Font = Font1
		Title.Text = "Opacity "
		Title.TextColor3 = Color3.fromRGB(240, 240, 240)
		Title.TextSize = 14.000
		Title.TextXAlignment = Enum.TextXAlignment.Left
		Title.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_4.Parent = Title
		UIPadding_4.PaddingLeft = UDim.new(0, 7)
		UIPadding_4.PaddingTop = UDim.new(0, 3)
		
		Holder1.Name = "Holder"
		Holder1.Parent = Opacity
		Holder1.AnchorPoint = Vector2.new(1, 0.5)
		Holder1.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
		Holder1.BackgroundTransparency = 0.600
		Holder1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder1.BorderSizePixel = 0
		Holder1.Position = UDim2.new(1, -3, 0.5, -7)
		Holder1.Size = UDim2.new(0, 35, 0, 18)

		UIListLayout_44.Parent = Holder1
		UIListLayout_44.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_44.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_44.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_44.VerticalAlignment = Enum.VerticalAlignment.Center

		UIPadding_6.Parent = Holder1
		UIPadding_6.PaddingBottom = UDim.new(0, 2)
		UIPadding_6.PaddingLeft = UDim.new(0, 3)
		UIPadding_6.PaddingRight = UDim.new(0, 3)
		UIPadding_6.PaddingTop = UDim.new(0, 2)

		Boll.Name = "Boll"
		Boll.Parent = Holder1
		Boll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Boll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Boll.BorderSizePixel = 0
		Boll.Size = UDim2.new(0, 15, 1, 0)

		

		Description.Name = "Description"
		Description.Parent = Content_2
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Description.BorderSizePixel = 0
		Description.Position = UDim2.new(0, 0, 0.5, 0)
		Description.Size = UDim2.new(1, 0, 1, -16)
		Description.Font = Enum.Font.Ubuntu
		Description.Text = "Opacity menu "
		Description.TextColor3 = Color3.fromRGB(200, 200, 200)
		Description.TextSize = 11.000
		Description.TextWrapped = true
		Description.TextXAlignment = Enum.TextXAlignment.Left
		Description.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_5.Parent = Description
		UIPadding_5.PaddingLeft = UDim.new(0, 7)
		UIPadding_5.PaddingTop = UDim.new(0, 3)

		OnClick.Name = "OnClick"
		OnClick.Parent = Opacity
		OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OnClick.BackgroundTransparency = 1.000
		OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OnClick.BorderSizePixel = 0
		OnClick.Size = UDim2.new(1, 0, 1, 0)
		OnClick.AutoButtonColor = false
		OnClick.Font = Enum.Font.SourceSans
		OnClick.Text = ""
		OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
		OnClick.TextSize = 14.000

		Tab.Name = "Tab"
		Tab.Parent = Content
		Tab.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		Tab.BackgroundTransparency = 0.700
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(1, 0, 0, 40)
		
		Tab:GetPropertyChangedSignal("AbsoluteSize"):Connect(opts)
		opts()

		UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_5.Rotation = -180
		UIGradient_5.Parent = Tab

		UICorner_8.CornerRadius = UDim.new(0, 5)
		UICorner_8.Parent = Tab

		Content_3.Name = "Content"
		Content_3.Parent = Tab
		Content_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content_3.BackgroundTransparency = 1.000
		Content_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content_3.BorderSizePixel = 0
		Content_3.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout_5.Parent = Content_3
		UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_5.Padding = UDim.new(0, 1)

		Title_2.Name = "Title"
		Title_2.Parent = Content_3
		Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_2.BackgroundTransparency = 1.000
		Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_2.BorderSizePixel = 0
		Title_2.Size = UDim2.new(1, 0, 0, 15)
		Title_2.Font = Font1
		Title_2.Text = "Tab Minimize"
		Title_2.TextColor3 = Color3.fromRGB(240, 240, 240)
		Title_2.TextSize = 14.000
		Title_2.TextXAlignment = Enum.TextXAlignment.Left
		Title_2.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_7.Parent = Title_2
		UIPadding_7.PaddingLeft = UDim.new(0, 7)
		UIPadding_7.PaddingTop = UDim.new(0, 3)

		Description_2.Name = "Description"
		Description_2.Parent = Content_3
		Description_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description_2.BackgroundTransparency = 1.000
		Description_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Description_2.BorderSizePixel = 0
		Description_2.Position = UDim2.new(0, 0, 0.5, 0)
		Description_2.Size = UDim2.new(1, 0, 1, -16)
		Description_2.Font = Enum.Font.Ubuntu
		Description_2.Text = "Tab minimize"
		Description_2.TextColor3 = Color3.fromRGB(200, 200, 200)
		Description_2.TextSize = 11.000
		Description_2.TextWrapped = true
		Description_2.TextXAlignment = Enum.TextXAlignment.Left
		Description_2.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_8.Parent = Description_2
		UIPadding_8.PaddingLeft = UDim.new(0, 7)
		UIPadding_8.PaddingTop = UDim.new(0, 3)

		OnClick_2.Name = "OnClick"
		OnClick_2.Parent = Tab
		OnClick_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OnClick_2.BackgroundTransparency = 1.000
		OnClick_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OnClick_2.BorderSizePixel = 0
		OnClick_2.Size = UDim2.new(1, 0, 1, 0)
		OnClick_2.AutoButtonColor = false
		OnClick_2.Font = Enum.Font.SourceSans
		OnClick_2.Text = ""
		OnClick_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		OnClick_2.TextSize = 14.000

		Holder_2.Name = "Holder"
		Holder_2.Parent = Tab
		Holder_2.AnchorPoint = Vector2.new(1, 0.5)
		Holder_2.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
		Holder_2.BackgroundTransparency = 0.600
		Holder_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder_2.BorderSizePixel = 0
		Holder_2.Position = UDim2.new(1, -3, 0.5, -7)
		Holder_2.Size = UDim2.new(0, 35, 0, 18)

		UIListLayout_6.Parent = Holder_2
		UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_6.VerticalAlignment = Enum.VerticalAlignment.Center

		UIPadding_9.Parent = Holder_2
		UIPadding_9.PaddingBottom = UDim.new(0, 2)
		UIPadding_9.PaddingLeft = UDim.new(0, 3)
		UIPadding_9.PaddingRight = UDim.new(0, 3)
		UIPadding_9.PaddingTop = UDim.new(0, 2)

		Boll_2.Name = "Boll"
		Boll_2.Parent = Holder_2
		Boll_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Boll_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Boll_2.BorderSizePixel = 0
		Boll_2.Size = UDim2.new(0, 15, 1, 0)

		UICorner_9.CornerRadius = UDim.new(1, 0)
		UICorner_9.Parent = Boll_2

		UICorner_10.CornerRadius = UDim.new(1, 0)
		UICorner_10.Parent = Holder_2

		Holdewasd.Name = "Holdewasd"
		Holdewasd.Parent = Content
		Holdewasd.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		Holdewasd.BackgroundTransparency = 0.700
		Holdewasd.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holdewasd.BorderSizePixel = 0
		Holdewasd.Size = UDim2.new(1, 0, 0, 40)
		
		Holdewasd:GetPropertyChangedSignal("AbsoluteSize"):Connect(opts)
		opts()

		UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_6.Rotation = -180
		UIGradient_6.Parent = Holdewasd

		UICorner_11.CornerRadius = UDim.new(0, 5)
		UICorner_11.Parent = Holdewasd

		Content_4.Name = "Content"
		Content_4.Parent = Holdewasd
		Content_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content_4.BackgroundTransparency = 1.000
		Content_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content_4.BorderSizePixel = 0
		Content_4.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout_7.Parent = Content_4
		UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_7.Padding = UDim.new(0, 1)

		Title_3.Name = "Title"
		Title_3.Parent = Content_4
		Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_3.BackgroundTransparency = 1.000
		Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_3.BorderSizePixel = 0
		Title_3.Size = UDim2.new(1, 0, 0, 15)
		Title_3.Font = Font1
		Title_3.Text = "Holder"
		Title_3.TextColor3 = Color3.fromRGB(240, 240, 240)
		Title_3.TextSize = 14.000
		Title_3.TextXAlignment = Enum.TextXAlignment.Left
		Title_3.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_10.Parent = Title_3
		UIPadding_10.PaddingLeft = UDim.new(0, 7)
		UIPadding_10.PaddingTop = UDim.new(0, 3)

		Description_3.Name = "Description"
		Description_3.Parent = Content_4
		Description_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description_3.BackgroundTransparency = 1.000
		Description_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Description_3.BorderSizePixel = 0
		Description_3.Position = UDim2.new(0, 0, 0.5, 0)
		Description_3.Size = UDim2.new(1, 0, 1, -16)
		Description_3.Font = Enum.Font.Ubuntu
		Description_3.Text = "AWSD holder"
		Description_3.TextColor3 = Color3.fromRGB(200, 200, 200)
		Description_3.TextSize = 11.000
		Description_3.TextWrapped = true
		Description_3.TextXAlignment = Enum.TextXAlignment.Left
		Description_3.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_11.Parent = Description_3
		UIPadding_11.PaddingLeft = UDim.new(0, 7)
		UIPadding_11.PaddingTop = UDim.new(0, 3)

		OnClick_3.Name = "OnClick"
		OnClick_3.Parent = Holdewasd
		OnClick_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OnClick_3.BackgroundTransparency = 1.000
		OnClick_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OnClick_3.BorderSizePixel = 0
		OnClick_3.Size = UDim2.new(1, 0, 1, 0)
		OnClick_3.AutoButtonColor = false
		OnClick_3.Font = Enum.Font.SourceSans
		OnClick_3.Text = ""
		OnClick_3.TextColor3 = Color3.fromRGB(0, 0, 0)
		OnClick_3.TextSize = 14.000

		Holder_33.Name = "Holder"
		Holder_33.Parent = Holdewasd
		Holder_33.AnchorPoint = Vector2.new(1, 0.5)
		Holder_33.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
		Holder_33.BackgroundTransparency = 0.600
		Holder_33.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder_33.BorderSizePixel = 0
		Holder_33.Position = UDim2.new(1, -3, 0.5, -7)
		Holder_33.Size = UDim2.new(0, 35, 0, 18)

		UIListLayout_88.Parent = Holder_33
		UIListLayout_88.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_88.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_88.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_88.VerticalAlignment = Enum.VerticalAlignment.Center

		UIPadding_12.Parent = Holder_33
		UIPadding_12.PaddingBottom = UDim.new(0, 2)
		UIPadding_12.PaddingLeft = UDim.new(0, 3)
		UIPadding_12.PaddingRight = UDim.new(0, 3)
		UIPadding_12.PaddingTop = UDim.new(0, 2)

		Boll_3.Name = "Boll"
		Boll_3.Parent = Holder_33
		Boll_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Boll_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Boll_3.BorderSizePixel = 0
		Boll_3.Size = UDim2.new(0, 15, 1, 0)

		UICorner_12.CornerRadius = UDim.new(1, 0)
		UICorner_12.Parent = Boll_3

		UICorner_13.CornerRadius = UDim.new(1, 0)
		UICorner_13.Parent = Holder_33

		DraggableMain.Name = "DraggableMain"
		DraggableMain.Parent = Content
		DraggableMain.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		DraggableMain.BackgroundTransparency = 0.700
		DraggableMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DraggableMain.BorderSizePixel = 0
		DraggableMain.Size = UDim2.new(1, 0, 0, 40)

		UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_7.Rotation = -180
		UIGradient_7.Parent = DraggableMain

		UICorner_14.CornerRadius = UDim.new(0, 5)
		UICorner_14.Parent = DraggableMain
		
		DraggableMain:GetPropertyChangedSignal("AbsoluteSize"):Connect(opts)
		opts()

		Content_5.Name = "Content"
		Content_5.Parent = DraggableMain
		Content_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content_5.BackgroundTransparency = 1.000
		Content_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content_5.BorderSizePixel = 0
		Content_5.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout_9.Parent = Content_5
		UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_9.Padding = UDim.new(0, 1)

		Title_4.Name = "Title"
		Title_4.Parent = Content_5
		Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_4.BackgroundTransparency = 1.000
		Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_4.BorderSizePixel = 0
		Title_4.Size = UDim2.new(1, 0, 0, 15)
		Title_4.Font = Font1
		Title_4.Text = "Draggable "
		Title_4.TextColor3 = Color3.fromRGB(240, 240, 240)
		Title_4.TextSize = 14.000
		Title_4.TextXAlignment = Enum.TextXAlignment.Left
		Title_4.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_13.Parent = Title_4
		UIPadding_13.PaddingLeft = UDim.new(0, 7)
		UIPadding_13.PaddingTop = UDim.new(0, 3)

		Description_4.Name = "Description"
		Description_4.Parent = Content_5
		Description_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description_4.BackgroundTransparency = 1.000
		Description_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Description_4.BorderSizePixel = 0
		Description_4.Position = UDim2.new(0, 0, 0.5, 0)
		Description_4.Size = UDim2.new(1, 0, 1, -16)
		Description_4.Font = Enum.Font.Ubuntu
		Description_4.Text = "Active draggable"
		Description_4.TextColor3 = Color3.fromRGB(200, 200, 200)
		Description_4.TextSize = 11.000
		Description_4.TextWrapped = true
		Description_4.TextXAlignment = Enum.TextXAlignment.Left
		Description_4.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_14.Parent = Description_4
		UIPadding_14.PaddingLeft = UDim.new(0, 7)
		UIPadding_14.PaddingTop = UDim.new(0, 3)

		OnClick_4.Name = "OnClick"
		OnClick_4.Parent = DraggableMain
		OnClick_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OnClick_4.BackgroundTransparency = 1.000
		OnClick_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OnClick_4.BorderSizePixel = 0
		OnClick_4.Size = UDim2.new(1, 0, 1, 0)
		OnClick_4.AutoButtonColor = false
		OnClick_4.Font = Enum.Font.SourceSans
		OnClick_4.Text = ""
		OnClick_4.TextColor3 = Color3.fromRGB(0, 0, 0)
		OnClick_4.TextSize = 14.000

		Holder_4.Name = "Holder"
		Holder_4.Parent = DraggableMain
		Holder_4.AnchorPoint = Vector2.new(1, 0.5)
		Holder_4.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
		Holder_4.BackgroundTransparency = 0.600
		Holder_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder_4.BorderSizePixel = 0
		Holder_4.Position = UDim2.new(1, -3, 0.5, -7)
		Holder_4.Size = UDim2.new(0, 35, 0, 18)

		UIListLayout_10.Parent = Holder_4
		UIListLayout_10.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_10.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_10.VerticalAlignment = Enum.VerticalAlignment.Center

		UIPadding_15.Parent = Holder_4
		UIPadding_15.PaddingBottom = UDim.new(0, 2)
		UIPadding_15.PaddingLeft = UDim.new(0, 3)
		UIPadding_15.PaddingRight = UDim.new(0, 3)
		UIPadding_15.PaddingTop = UDim.new(0, 2)

		Boll_4.Name = "Boll"
		Boll_4.Parent = Holder_4
		Boll_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Boll_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Boll_4.BorderSizePixel = 0
		Boll_4.Size = UDim2.new(0, 15, 1, 0)

		UICorner_15.CornerRadius = UDim.new(1, 0)
		UICorner_15.Parent = Boll_4

		UICorner_16.CornerRadius = UDim.new(1, 0)
		UICorner_16.Parent = Holder_4

		Keybind.Name = "Keybind"
		Keybind.Parent = Content
		Keybind.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
		Keybind.BackgroundTransparency = 0.700
		Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind.BorderSizePixel = 0
		Keybind.Size = UDim2.new(1, 0, 0, 40)

		UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_8.Rotation = -180
		UIGradient_8.Parent = Keybind

		UICorner_17.CornerRadius = UDim.new(0, 5)
		UICorner_17.Parent = Keybind
		
		Keybind:GetPropertyChangedSignal("AbsoluteSize"):Connect(opts)
		opts()

		Content_6.Name = "Content"
		Content_6.Parent = Keybind
		Content_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content_6.BackgroundTransparency = 1.000
		Content_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content_6.BorderSizePixel = 0
		Content_6.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout_11.Parent = Content_6
		UIListLayout_11.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_11.Padding = UDim.new(0, 1)

		Title_5.Name = "Title"
		Title_5.Parent = Content_6
		Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title_5.BackgroundTransparency = 1.000
		Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title_5.BorderSizePixel = 0
		Title_5.Size = UDim2.new(1, 0, 0, 15)
		Title_5.Font = Font1
		Title_5.Text = "Keybind Menu"
		Title_5.TextColor3 = Color3.fromRGB(240, 240, 240)
		Title_5.TextSize = 14.000
		Title_5.TextXAlignment = Enum.TextXAlignment.Left
		Title_5.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_16.Parent = Title_5
		UIPadding_16.PaddingLeft = UDim.new(0, 7)
		UIPadding_16.PaddingTop = UDim.new(0, 3)

		Description_5.Name = "Description"
		Description_5.Parent = Content_6
		Description_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description_5.BackgroundTransparency = 1.000
		Description_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Description_5.BorderSizePixel = 0
		Description_5.Position = UDim2.new(0, 0, 0.5, 0)
		Description_5.Size = UDim2.new(1, 0, 1, -16)
		Description_5.Font = Enum.Font.Ubuntu
		Description_5.Text = "Keybind menu "
		Description_5.TextColor3 = Color3.fromRGB(200, 200, 200)
		Description_5.TextSize = 11.000
		Description_5.TextWrapped = true
		Description_5.TextXAlignment = Enum.TextXAlignment.Left
		Description_5.TextYAlignment = Enum.TextYAlignment.Top

		UIPadding_17.Parent = Description_5
		UIPadding_17.PaddingLeft = UDim.new(0, 7)
		UIPadding_17.PaddingTop = UDim.new(0, 3)

		Holder_5.Name = "Holder"
		Holder_5.Parent = Keybind
		Holder_5.AnchorPoint = Vector2.new(1, 0.5)
		Holder_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Holder_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder_5.BorderSizePixel = 0
		Holder_5.Position = UDim2.new(1, -3, 0.5, -8)
		Holder_5.Size = UDim2.new(0, 30, 0, 16)

		UICorner_18.CornerRadius = UDim.new(0, 5)
		UICorner_18.Parent = Holder_5

		UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradient_9.Rotation = -180
		UIGradient_9.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.01, 0.99), NumberSequenceKeypoint.new(1.00, 0.00)}
		UIGradient_9.Parent = Holder_5

		Text.Name = "Text"
		Text.Parent = Holder_5
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Text.BorderSizePixel = 0
		Text.Size = UDim2.new(1, 0, 1, 0)
		Text.Font = Font1
		Text.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		Text.PlaceholderText = "..."
		Text.Text = Window.KeyCode
		Text.TextColor3 = Color3.fromRGB(200, 200, 200)
		Text.TextSize = 14.000
		Text.TextWrapped = true

		UIListLayout_12.Parent = Holder_5
		UIListLayout_12.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_12.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_12.VerticalAlignment = Enum.VerticalAlignment.Center	
	end
	
	local Plus = Instance.new("ImageButton")
	Plus.Name = "Plus"
	Plus.Parent = Title2
	Plus.Active = false
	Plus.AnchorPoint = Vector2.new(1, 0.5)
	Plus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Plus.BackgroundTransparency = 1.000
	Plus.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Plus.BorderSizePixel = 0
	Plus.Position = UDim2.new(1, -7, 0.5, 0)
	Plus.Selectable = false
	Plus.Size = UDim2.new(0, 18, 0, 18)
	Plus.AutoButtonColor = false
	Plus.Image = "rbxassetid://7734000129"
	Plus.ImageColor3 = Color3.fromRGB(230, 230, 230)
	
	local list = false
	local VisibleS = list

	if VisibleS == false then
		Settings.Size = UDim2.new(0, 160, 0, 40)
		Content.Visible = VisibleS
		Plus.Image = "rbxassetid://7734042071"
	end

	Plus.MouseButton1Click:Connect(function()
		VisibleS = not VisibleS
		Settings.Size = UDim2.new(0, 160, 0, 170)
		Content.Visible = VisibleS
		Plus.Image = "rbxassetid://7734000129"
		if VisibleS == false then
			Settings.Size = UDim2.new(0, 160, 0, 40)
			Plus.Image = "rbxassetid://7734042071"
		end
	end)

	local UserInputService = game:GetService("UserInputService")
	local op = false

	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[Window.KeyCode] then
			if not gameProcessedEvent then
				op = not op
				Main:TweenPosition(UDim2.new(0.5, -2000, 0.5, 0), Back, Out, Timer, true)
				if op == false then
					
					Main:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Back, Out, Timer, true)
				end
			end
		end
	end)

	function GUI:AddTab(OptionsTab)
		OptionsTab.Title = OptionsTab.Title or "Preview Tab"
		OptionsTab.Icon = OptionsTab.Icon or "rbxassetid://90991999539475"
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		local TabButtonAC = Instance.new("TextButton")
		local UICorner_5 = Instance.new("UICorner")
		local UIPadding_5 = Instance.new("UIPadding")
		local Icon_2 = Instance.new("ImageLabel")
		local ScrollPages = Instance.new("ScrollingFrame")
	
		ScrollPages.Name = "ScrollPages"
		ScrollPages.Parent = ContentHolder
		ScrollPages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollPages.BackgroundTransparency = 1.000
		ScrollPages.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollPages.BorderSizePixel = 0
		ScrollPages.Selectable = false
		ScrollPages.Visible = false
		ScrollPages.Size = UDim2.new(1, 0, 1, 0)
		ScrollPages.ScrollBarThickness = 0
		ScrollPages.SelectionGroup = false
		ScrollPages.TopImage = "rbxassetid://90991999539475"
		
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")

		UIListLayout.Parent = ScrollPages
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 7)

		UIPadding.Parent = ScrollPages
		UIPadding.PaddingBottom = UDim.new(0, 5)
		UIPadding.PaddingLeft = UDim.new(0, 7)
		UIPadding.PaddingRight = UDim.new(0, 7)
		UIPadding.PaddingTop = UDim.new(0, 5)

		TabButtonAC.Name = "TabButtonAC"
		TabButtonAC.Parent = ScrollTabs
		TabButtonAC.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		TabButtonAC.BackgroundTransparency = 1
		TabButtonAC.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButtonAC.BorderSizePixel = 0
		
		TabButtonAC.AutoButtonColor = false
		TabButtonAC.Font = Font1
		TabButtonAC.Text = OptionsTab.Title
		TabButtonAC.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButtonAC.TextSize = 14.000
		TabButtonAC.TextWrapped = false
		TabButtonAC.ClipsDescendants = true
		TabButtonAC.TextXAlignment = Enum.TextXAlignment.Left

		UICorner_5.CornerRadius = UDim.new(0, 5)
		UICorner_5.Parent = TabButtonAC

		UIPadding_5.Parent = TabButtonAC
		UIPadding_5.PaddingLeft = UDim.new(0, 35)

		Icon_2.Name = "Icon"
		Icon_2.Parent = TabButtonAC
		Icon_2.AnchorPoint = Vector2.new(1, 0.5)
		Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon_2.BackgroundTransparency = 1.000
		Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon_2.BorderSizePixel = 0
		Icon_2.Position = UDim2.new(0, -3, 0.5, 0)
		Icon_2.Size = UDim2.new(0, 25, 0, 25)
		Icon_2.Image = OptionsTab.Icon
		Icon_2.ImageColor3 = Color3.fromRGB(171, 0, 0)
		
		ViewTab.Name = "ViewTab"
		ViewTab.Parent = TopBar
		ViewTab.AnchorPoint = Vector2.new(0, 0.5)
		ViewTab.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
		ViewTab.BackgroundTransparency = 0.600
		ViewTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ViewTab.BorderSizePixel = 0
		ViewTab.Position = UDim2.new(0, 7, 0.5, 0)
		ViewTab.Size = UDim2.new(0, 120, 1, -14)
		ViewTab.Font = Font1
		ViewTab.Text = OptionsTab.Title
		ViewTab.TextColor3 = Color3.fromRGB(208, 0, 0)
		ViewTab.TextSize = 12.000
		ViewTab.Visible = true
		ViewTab.SelectionGroup = false
		ViewTab.TextWrapped = true
		
		UICorner_7.CornerRadius = UDim.new(0, 5)
		UICorner_7.Parent = ViewTab
		
		Icon_2.ImageColor3 = Color3.fromRGB(150, 150, 150)
		TabButtonAC.TextColor3 = Color3.fromRGB(140, 140, 140)
		
		local M = S1:Clone()
		M.Parent = TabButtonAC
		M.Transparency = 1

		local UIGradientS = Instance.new("UIGradient")
		UIGradientS.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
		UIGradientS.Rotation = 0
		UIGradientS.Name = "UIGradientS"
		UIGradientS.Parent = M
		
		UICorner_6.CornerRadius = UDim.new(1, 0)
		UICorner_6.Parent = Boll

		UICorner_7.CornerRadius = UDim.new(1, 0)
		UICorner_7.Parent = Holder1
		
		local function Pages()
			local contentSize = UIListLayout.AbsoluteContentSize
			ScrollPages.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
		end

		TabButtonAC:GetPropertyChangedSignal("AbsoluteSize"):Connect(TabPage)
		TabPage()
		
		local function upd()
			if Drop then
				HolderASWD.Position = p1  -- Se Settings.Visible for true, vai para a posição 1
			else
				HolderASWD.Position = p2  -- Se Settings.Visible for false, vai para a posição 2
			end
		end

		-- Conectar a função de atualização de posição para o evento Heartbeat
		game:GetService("RunService").Heartbeat:Connect(function()
			upd()  -- Verifica constantemente a posição e ajusta conforme Settings.Visible
		end)

		local opa = Window.Opacity
		local tabsM = Window.TabMinimeze
		
		ListButton.MouseButton1Click:Connect(function() 
			list = not list
			Settings.Visible = not Settings.Visible
		end)
		
		if Window.Opacity == true then
			UIListLayout_44.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Holder1.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
		else
			UIListLayout_44.HorizontalAlignment = Enum.HorizontalAlignment.Left
			Holder1.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
		end
		
		if Window.TabMinimeze == true then
			UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Holder_2.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
			Navegation.Size = UDim2.new(0, 45, 1, -61)
			ContentHolder.Size = UDim2.new(1, -66, 1, -61)
			TabButtonAC.Size = UDim2.new(1, 0, 0, 30)
			Icon_2.Position = UDim2.new(0, -5, 0.5, 0)
			TabButtonAC.Text = ""
		else
			UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Left
			Holder_2.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
			Navegation.Size = UDim2.new(0, 133, 1, -61)
			ContentHolder.Size = UDim2.new(1, -154, 1, -61)
			TabButtonAC.Size = UDim2.new(1, 0, 0, 30)
			Icon_2.Position = UDim2.new(0, -5, 0.5, 0)
			TabButtonAC.Text = OptionsTab.Title
		end
		
		if Window.Draggable == true then
			UIListLayout_10.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Holder_4.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
			Main.Draggable = true
		else
			UIListLayout_10.HorizontalAlignment = Enum.HorizontalAlignment.Left
			Holder_4.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
			Main.Draggable = false
		end
		
		if holderWASD == true then
			UIListLayout_88.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Holder_33.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
			HolderASWD.Draggable = true
		else
			UIListLayout_88.HorizontalAlignment = Enum.HorizontalAlignment.Left
			Holder_33.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
			HolderASWD.Draggable = false
		end
		
		OnClick.MouseButton1Click:Connect(function() 
			opa = not opa
			if opa == true then
				UIListLayout_44.HorizontalAlignment = Enum.HorizontalAlignment.Right
				Holder1.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
				Main.BackgroundTransparency = 0.500
				Settings.BackgroundTransparency = 0.500
				Window.Opacity = true
			else
				UIListLayout_44.HorizontalAlignment = Enum.HorizontalAlignment.Left
				Holder1.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
				Main.BackgroundTransparency = 0
				Settings.BackgroundTransparency = 0
				Window.Opacity = false
			end
		end)
		
		
		OnClick_2.MouseButton1Click:Connect(function() 
			tabsM = not tabsM
			if tabsM == true then
				UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Right
				Holder_2.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
				Navegation:TweenSize(UDim2.new(0, 45, 1, -61), Back, Out, Timer, true)
				ContentHolder:TweenSize(UDim2.new(1, -66, 1, -61), Back, Out, Timer, true)
				Icon_2.Position = UDim2.new(0, -5, 0.5, 0)
				wait(0.9)
				TabButtonAC.Text = ""
			end
			if tabsM == false then
				UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Left
				Holder_2.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
				Navegation:TweenSize(UDim2.new(0, 133, 1, -61), Back, Out, Timer, true)
				ContentHolder:TweenSize(UDim2.new(1, -154, 1, -61), Back, Out, Timer, true)
				Icon_2.Position = UDim2.new(0, -5, 0.5, 0)
				TabButtonAC.Text = OptionsTab.Title
			end
		end)
		
		OnClick_3.MouseButton1Click:Connect(function() 
			holderWASD = not holderWASD
			HolderASWD.Visible = not HolderASWD.Visible
			_G.FSPF.Visible = not _G.FSPF.Visible
			UIListLayout_88.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Holder_33.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
			if holderWASD == false then
				UIListLayout_88.HorizontalAlignment = Enum.HorizontalAlignment.Left
				Holder_33.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
			end
		end)
		
		OnClick_4.MouseButton1Click:Connect(function() 
			DraggableM = not DraggableM
			Main.Draggable = not Main.Draggable
			UIListLayout_10.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Holder_4.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
			if DraggableM == false then
				UIListLayout_10.HorizontalAlignment = Enum.HorizontalAlignment.Left
				Holder_4.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
			end
		end)
	
		local lastValue = Text.Text -- Armazena o último valor válido

		Text.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				if Text.Text == "" then
					Text.Text = lastValue -- Restaura o último valor válido
					return
				end

				local input = Text.Text
				local filtered = input:upper() -- Converte para maiúscula

				-- Permite apenas a primeira letra
				if filtered:len() > 1 then
					filtered = filtered:sub(1, 1)
				end

				-- Verifica se é uma letra
				if not filtered:match("%a") then
					filtered = "" -- Limpa o texto se não for uma letra
				end

				-- Atualiza o TextBox se necessário
				if Text.Text ~= filtered then
					Text.Text = filtered -- Atualiza o TextBox
					Text.CursorPosition = Text.Text:len() -- Move o cursor para o final
				end

				-- Chama o callback apenas se o valor mudou
				if lastValue ~= filtered then
					lastValue = filtered
					Window.KeyCode = filtered
					K.Text = filtered
				end
			end
		end)

		-- Adiciona um evento para o input em tempo real
		Text:GetPropertyChangedSignal("Text"):Connect(function()
			local input = Text.Text
			local filtered = input:upper():sub(1, 1) -- Permite apenas a primeira letra

			-- Verifica se é uma letra
			if not filtered:match("%a") then
				filtered = "" -- Limpa o texto se não for uma letra
			end

			-- Atualiza o TextBox se necessário
			if Text.Text ~= filtered then
				Text.Text = filtered -- Atualiza o TextBox
				Text.CursorPosition = Text.Text:len() -- Move o cursor para o final
			end
		end)
		
		-- Eventos de hover
		TabButtonAC.MouseEnter:Connect(function()
			Tab.Hover = true
			if not Tab.Active then
				TabButtonAC.BackgroundTransparency = 0.7
			end
		end)

		TabButtonAC.MouseLeave:Connect(function()
			Tab.Hover = false
			if not Tab.Active then
				TabButtonAC.BackgroundTransparency = 1.000
			end
		end)

		-- Detectar clique com InputBegan
		TabButtonAC.MouseButton1Click:Connect(function()
			if Tab.Hover then
				Tab:Activate()
			end
		end)

		-- Funções para ativar e desativar abas
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				Tab.Active = true
				TabButtonAC.BackgroundTransparency = 0.7
				Icon_2.ImageColor3 = Color3.fromRGB(171, 0, 0)
				TabButtonAC.TextColor3 = Color3.fromRGB(255, 255, 255)
				M.Transparency = 0
				ScrollPages.Visible = true
				ViewTab.Text = OptionsTab.Title
				ViewTab.Visible = true
				GUI.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				TabButtonAC.BackgroundTransparency = 1.000
				Icon_2.ImageColor3 = Color3.fromRGB(150, 150, 150)
				TabButtonAC.TextColor3 = Color3.fromRGB(140, 140, 140)
				M.Transparency = 1
				ScrollPages.Visible = false
				ViewTab.Text = OptionsTab.Title
				ViewTab.Visible = false
			end
		end

		local TweenService = game:GetService("TweenService")
		local function a()
			local tweenInfo = TweenInfo.new(
				3,  -- Duração de 1 segundo
				Enum.EasingStyle.Linear,  -- Tipo de interpolação
				Enum.EasingDirection.InOut,  -- Direção da animação
				-1,  -- Número de repetições (-1 significa infinita, ou seja, sem repetir)
				false  -- Se deve reverter a animação (animar ida e volta)
			)
			local goal = {Rotation = 360}  -- A rotação final será 180
			local tween = TweenService:Create(UIGradientS, tweenInfo, goal)
			tween:Play()
		end

		a()

		-- Ativar a primeira aba ao ser criada
		if GUI.CurrentTab == nil then
			GUI.CurrentTab = Tab
			Tab:Activate()
		end
		
		function Tab:AddPlayerList(PlayerList)
			PlayerList.Animation = PlayerList.Animation or false
			PlayerList.Callback = PlayerList.Callback or function() end

			local Players = game:GetService("Players")
			local Teams = game:GetService("Teams")
			local TweenService = game:GetService("TweenService")
			local player = game.Players.LocalPlayer
			local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local pl = {}
			local lastSelectedPlayer = nil
			local Buttons = {}

			local ListTeleport = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Sc = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local UIGradient_2 = Instance.new("UIGradient")
			local BarTitle = Instance.new("Frame")
			local Title = Instance.new("TextButton")
			local UIPadding_4 = Instance.new("UIPadding")
			local Plus = Instance.new("ImageLabel")

			ListTeleport.Name = "ListTeleport"
			ListTeleport.Parent = ScrollPages
			ListTeleport.BackgroundColor3 = Color3.fromRGB(54, 0, 0)
			ListTeleport.BackgroundTransparency = 0.600
			ListTeleport.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ListTeleport.BorderSizePixel = 0
			ListTeleport.Position = UDim2.new(0.00328947371, 0, 0.0480349362, 0)
			ListTeleport.Size = UDim2.new(0.5, -4, 0, 30)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = ListTeleport

			Sc.Name = "Sc"
			Sc.Parent = ListTeleport
			Sc.AnchorPoint = Vector2.new(0, 1)
			Sc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sc.BackgroundTransparency = 1.000
			Sc.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Sc.BorderSizePixel = 0
			Sc.Position = UDim2.new(0, 0, 1, 0)
			Sc.Selectable = false
			Sc.Size = UDim2.new(1, 0, 1, -30)
			Sc.ScrollBarThickness = 0

			UIListLayout.Parent = Sc
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			UIPadding.Parent = Sc
			UIPadding.PaddingBottom = UDim.new(0, 3)
			UIPadding.PaddingLeft = UDim.new(0, 6)
			UIPadding.PaddingRight = UDim.new(0, 6)
			UIPadding.PaddingTop = UDim.new(0, 3)

			local function ListP()
				local contentSize = UIListLayout.AbsoluteContentSize
				Sc.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
			end

			local function createPlayerButton(player)
				if Buttons[player.UserId] then
					return  -- Se já existe um botão para esse jogador, não cria outro
				end

				local Button = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner_2 = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout_2 = Instance.new("UIListLayout")
				local NamePLayer = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local Cordenadas = Instance.new("TextLabel")
				local UIPadding_3 = Instance.new("UIPadding")
				local OnClick = Instance.new("TextButton")
				local UserIMG = Instance.new("ImageLabel")
				local UICorner_3 = Instance.new("UICorner")
				local LIneTime = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")

				Button.Name = "Button"
				Button.Parent = Sc
				Button.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Button.BackgroundTransparency = 0.700
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 0, 35)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Button

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Button

				Content.Name = "Content"
				Content.Parent = Button
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout_2.Parent = Content
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.Padding = UDim.new(0, 1)

				NamePLayer.Name = "NamePLayer"
				NamePLayer.Parent = Content
				NamePLayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NamePLayer.BackgroundTransparency = 1.000
				NamePLayer.BorderColor3 = Color3.fromRGB(0, 0, 0)
				NamePLayer.BorderSizePixel = 0
				NamePLayer.Size = UDim2.new(0.779411793, 0, 0, 15)
				NamePLayer.Font = Font1
				NamePLayer.Text = player.Name
				NamePLayer.TextColor3 = Color3.fromRGB(240, 240, 240)
				NamePLayer.TextSize = 12.000
				NamePLayer.TextWrapped = true
				NamePLayer.TextXAlignment = Enum.TextXAlignment.Left
				NamePLayer.TextYAlignment = Enum.TextYAlignment.Bottom

				UIPadding_2.Parent = NamePLayer
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				Cordenadas.Name = "Cordenadas"
				Cordenadas.Parent = Content
				Cordenadas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Cordenadas.BackgroundTransparency = 1.000
				Cordenadas.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Cordenadas.BorderSizePixel = 0
				Cordenadas.Position = UDim2.new(0, 0, 0.400000006, 0)
				Cordenadas.Size = UDim2.new(0.779411793, 0, 1, -16)
				Cordenadas.Font = Enum.Font.Ubuntu
				Cordenadas.Text = "Position: " .. tostring(player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or "Unknown")
				Cordenadas.TextColor3 = Color3.fromRGB(200, 200, 200)
				Cordenadas.TextSize = 11.000
				Cordenadas.TextWrapped = true
				Cordenadas.TextXAlignment = Enum.TextXAlignment.Left
				Cordenadas.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_3.Parent = Cordenadas
				UIPadding_3.PaddingLeft = UDim.new(0, 7)
				UIPadding_3.PaddingTop = UDim.new(0, 3)

				OnClick.Name = "OnClick"
				OnClick.Parent = Button
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000

				UserIMG.Name = "UserIMG"
				UserIMG.Parent = Button
				UserIMG.AnchorPoint = Vector2.new(1, 0.5)
				UserIMG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				UserIMG.BackgroundTransparency = 1.000
				UserIMG.BorderColor3 = Color3.fromRGB(0, 0, 0)
				UserIMG.BorderSizePixel = 0
				UserIMG.Position = UDim2.new(1, -3, 0.5, 0)
			
				UICorner_3.CornerRadius = UDim.new(1, 0)
				UICorner_3.Parent = UserIMG

				LIneTime.Name = "LIneTime"
				LIneTime.Parent = Button
				LIneTime.AnchorPoint = Vector2.new(0, 0.5)
				LIneTime.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				LIneTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
				LIneTime.BorderSizePixel = 0
				LIneTime.Position = UDim2.new(0, 3, 0.5, 0)
				LIneTime.Size = UDim2.new(0, 1, 1, -17)

				UICorner_4.CornerRadius = UDim.new(1, 0)
				UICorner_4.Parent = LIneTime

				local playerTeam = player.Team
				if playerTeam then
					NamePLayer.TextColor3 = playerTeam.TeamColor.Color  -- Cor do time
				else
					NamePLayer.TextColor3 = Color3.fromRGB(240, 240, 240)  -- Cor branca caso não tenha time
				end

				local bt = false

				OnClick.MouseButton1Click:Connect(function()
					bt = not bt
					LIneTime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					if bt == false then
						LIneTime.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					end
					if PlayerList.Callback then
						PlayerList.Callback(player)
					end
				end)

				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Button
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end

				game:GetService("RunService").Heartbeat:Connect(function()
					if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
						local position = player.Character.HumanoidRootPart.Position
						-- Atualizar a coordenada de cada jogador na lista
						if Buttons[player.UserId] then
							local button = Buttons[player.UserId]
							local cordenadasLabel = button:FindFirstChild("Content"):FindFirstChild("Cordenadas")
							if cordenadasLabel then
								cordenadasLabel.Text = string.format("Position: %d, %d, %d", math.floor(position.X), math.floor(position.Y), math.floor(position.Z))
							end
						end
					end
				end)
				
				local Players = game:GetService("Players")

				local PLACEHOLDER_IMAGE = "rbxassetid://7743875962" -- replace with placeholder image

				-- fetch the thumbnail
				local userId = player.UserId
				local thumbType = Enum.ThumbnailType.HeadShot
				local thumbSize = Enum.ThumbnailSize.Size420x420
				local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

				-- set the ImageLabel's content to the user thumbnail
				local imageLabel = UserIMG
				imageLabel.Image = (isReady and content) or PLACEHOLDER_IMAGE
				imageLabel.Size = UDim2.new(0, 25, 0, 25)
				
				-- Armazenando o botão para controle
				Buttons[player.UserId] = Button
			end

			ListP()	

			for _, plr in pairs(Players:GetPlayers()) do
				createPlayerButton(plr)
			end

			-- Conectar para adicionar um botão sempre que um novo jogador entra
			Players.PlayerAdded:Connect(function(player)
				createPlayerButton(player)
			end)

			-- Conectar para remover um botão quando o jogador sair
			Players.PlayerRemoving:Connect(function(player)
				-- Se o botão do jogador existir, remova da interface
				if Buttons[player.UserId] then
					local button = Buttons[player.UserId]
					button:Destroy()  -- Remove o botão da UI
					Buttons[player.UserId] = nil  -- Limpa a referência
				end
			end) 


			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
			UIGradient_2.Parent = ListTeleport

			BarTitle.Name = "BarTitle"
			BarTitle.Parent = ListTeleport
			BarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BarTitle.BackgroundTransparency = 1.000
			BarTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BarTitle.BorderSizePixel = 0
			BarTitle.Size = UDim2.new(1, 0, 0, 30)

			Title.Name = "Title"
			Title.Parent = BarTitle
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(1, 0, 1, 0)
			Title.Font = Font1
			Title.Text = "Player List"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 12.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_4.Parent = Title
			UIPadding_4.PaddingLeft = UDim.new(0, 7)

			Plus.Name = "Plus"
			Plus.Parent = Title
			Plus.AnchorPoint = Vector2.new(1, 0.5)
			Plus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Plus.BackgroundTransparency = 1.000
			Plus.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Plus.BorderSizePixel = 0
			Plus.Position = UDim2.new(1, -7, 0.5, 0)
			Plus.Size = UDim2.new(0, 18, 0, 18)
			Plus.Image = "rbxassetid://7734042071"
			Plus.ImageColor3 = Color3.fromRGB(230, 230, 230)

			local on = false

			Title.MouseButton1Click:Connect(function()
				on = not on
				if PlayerList.MaxSize == true then
					ListTeleport:TweenSize(UDim2.new(1, 0, 1, 0), Back, Out, Timer, true)
				else
					ListTeleport:TweenSize(UDim2.new(0.5, -4, 0, 260), Back, Out, Timer, true)
				end
				Plus.Image = "rbxassetid://7734000129"
				ListTeleport:GetPropertyChangedSignal("AbsoluteSize"):Connect(Pages)
				Pages()
				if on == false then
					if PlayerList.MaxSize == true then
						ListTeleport:TweenSize(UDim2.new(1, 0, 0, 30), Back, Out, Timer, true)
					else
						ListTeleport:TweenSize(UDim2.new(0.5, -4, 0, 30), Back, Out, Timer, true)
					end
					Plus.Image = "rbxassetid://7734042071"
					ListTeleport:GetPropertyChangedSignal("AbsoluteSize"):Connect(Pages)
					Pages()
				end
			end)

			ListTeleport:GetPropertyChangedSignal("AbsoluteSize"):Connect(Pages)
			Pages()

			local M = S1:Clone()
			M.Parent = ListTeleport
			M.Transparency = 1

			local UIGradientS = Instance.new("UIGradient")
			UIGradientS.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
			UIGradientS.Rotation = 0
			UIGradientS.Name = "UIGradientS"
			UIGradientS.Parent = M

			local TweenService = game:GetService("TweenService")
			local function an()
				local tweenInfo = TweenInfo.new(
					3,  -- Duração de 1 segundo
					Enum.EasingStyle.Linear,  -- Tipo de interpolação
					Enum.EasingDirection.InOut,  -- Direção da animação
					-1,  -- Número de repetições (-1 significa infinita, ou seja, sem repetir)
					false  -- Se deve reverter a animação (animar ida e volta)
				)
				local goal = {Rotation = 360}  -- A rotação final será 180
				local tween = TweenService:Create(UIGradientS, tweenInfo, goal)
				tween:Play()
			end

			if PlayerList.Animation == true then
				M.Transparency = 0
				an()
			end

			return pl
		end	
	
		function Tab:AddPage(OptionsPage)
			OptionsPage.Title = OptionsPage.Title or "Page Preview"
			OptionsPage.Animation = OptionsPage.Animation or false
			OptionsPage.MaxSize = OptionsPage.MaxSize or false
			
			local Sections = {}
			
			local on = false
			
			local Section = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")
			local Sc = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local BarTitle = Instance.new("Frame")
			local Title = Instance.new("TextButton")
			local UIPadding_2 = Instance.new("UIPadding")

			Section.Name = "Section"
			Section.Parent = ScrollPages
			Section.BackgroundColor3 = Color3.fromRGB(54, 0, 0)
			Section.BackgroundTransparency = 0.600
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Section

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
			UIGradient.Parent = Section

			Sc.Name = "Sc"
			Sc.Parent = Section
			Sc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sc.BackgroundTransparency = 1.000
			Sc.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Sc.BorderSizePixel = 0
			Sc.AnchorPoint = Vector2.new(0, 1)
			Sc.ClipsDescendants = true
			Sc.ScrollingDirection = Enum.ScrollingDirection.Y
			Sc.Position = UDim2.new(0, 0, 1, 0)
			Sc.Selectable = false
			Sc.Size = UDim2.new(1, 0, 1, -30)
			Sc.ScrollBarThickness = 0

			UIListLayout.Parent = Sc
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)

			UIPadding.Parent = Sc
			UIPadding.PaddingBottom = UDim.new(0, 3)
			UIPadding.PaddingLeft = UDim.new(0, 3)
			UIPadding.PaddingRight = UDim.new(0, 3)
			UIPadding.PaddingTop = UDim.new(0, 3)

			BarTitle.Name = "BarTitle"
			BarTitle.Parent = Section
			BarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BarTitle.BackgroundTransparency = 1.000
			BarTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BarTitle.BorderSizePixel = 0
			BarTitle.Size = UDim2.new(1, 0, 0, 30)

			Title.Name = "Title"
			Title.Parent = BarTitle
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(1, 0, 1, 0)
			Title.Font = Font1
			Title.Text = OptionsPage.Title
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 12.000
			Title.TextXAlignment = Enum.TextXAlignment.Left

			UIPadding_2.Parent = Title
			UIPadding_2.PaddingLeft = UDim.new(0, 7)
			
			local Plus = Instance.new("ImageLabel")
			Plus.Name = "Plus"
			Plus.Parent = Title
			Plus.AnchorPoint = Vector2.new(1, 0.5)
			Plus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Plus.BackgroundTransparency = 1.000
			Plus.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Plus.BorderSizePixel = 0
			Plus.Position = UDim2.new(1, -7, 0.5, 0)
			Plus.Size = UDim2.new(0, 18, 0, 18)
			Plus.Image = "rbxassetid://7734042071"
			Plus.ImageColor3 = Color3.fromRGB(230, 230, 230)
			
			local function Sectioon()
				local contentSize = UIListLayout.AbsoluteContentSize
				Sc.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
			end
			
			if OptionsPage.MaxSize == true then
				Section.Size = UDim2.new(1, -4, 0, 30)
			else
				Section.Size = UDim2.new(0.5, -4, 0, 30)
			end
			
			Title.MouseButton1Click:Connect(function()
				on = not on
				if OptionsPage.MaxSize == true then
					Section:TweenSize(UDim2.new(1, 0, 1, 0), Back, Out, Timer, true)
				else
					Section:TweenSize(UDim2.new(0.5, -4, 0, 260), Back, Out, Timer, true)
				end
				Plus.Image = "rbxassetid://7734000129"
				Section:GetPropertyChangedSignal("AbsoluteSize"):Connect(Pages)
				Pages()
				if on == false then
					if OptionsPage.MaxSize == true then
						Section:TweenSize(UDim2.new(1, 0, 0, 30), Back, Out, Timer, true)
					else
						Section:TweenSize(UDim2.new(0.5, -4, 0, 30), Back, Out, Timer, true)
					end
					Plus.Image = "rbxassetid://7734042071"
					Section:GetPropertyChangedSignal("AbsoluteSize"):Connect(Pages)
					Pages()
				end
			end)

			Section:GetPropertyChangedSignal("AbsoluteSize"):Connect(Pages)
			Pages()
			
			local M = S1:Clone()
			M.Parent = Section
			M.Transparency = 1

			local UIGradientS = Instance.new("UIGradient")
			UIGradientS.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
			UIGradientS.Rotation = 0
			UIGradientS.Name = "UIGradientS"
			UIGradientS.Parent = M
			
			local TweenService = game:GetService("TweenService")
			local function an()
				local tweenInfo = TweenInfo.new(
					3,  -- Duração de 1 segundo
					Enum.EasingStyle.Linear,  -- Tipo de interpolação
					Enum.EasingDirection.InOut,  -- Direção da animação
					-1,  -- Número de repetições (-1 significa infinita, ou seja, sem repetir)
					false  -- Se deve reverter a animação (animar ida e volta)
				)
				local goal = {Rotation = 360}  -- A rotação final será 180
				local tween = TweenService:Create(UIGradientS, tweenInfo, goal)
				tween:Play()
			end

			if OptionsPage.Animation == true then
				M.Transparency = 0
				an()
			end
			
			function Sections:AddButton(OptionsButton)
				OptionsButton.Title = OptionsButton.Title or "Button"
				OptionsButton.Description = OptionsButton.Description or "Descriptions button"
				OptionsButton.CallBack = OptionsButton.CallBack or function() end
				
				local Buttons = {}

				local Button = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local UIListLayout = Instance.new("UIListLayout")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")

				Button.Name = "Button"
				Button.Parent = Sc
				Button.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Button.BackgroundTransparency = 0.700
				Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Button.BorderSizePixel = 0
				Button.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Parent = Button

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Button

				Content.Name = "Content"
				Content.Parent = Button
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsButton.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0.102941178, 0, 0.375, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsButton.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)
				
				local OnClick = Instance.new("TextButton")
				OnClick.Name = "OnClick"
				OnClick.Parent = Button
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000
				
				local icon1 = Instance.new("ImageLabel")
				local UIGradient = Instance.new("UIGradient")

				icon1.Name = "icon"
				icon1.Parent = Button
				icon1.AnchorPoint = Vector2.new(1, 0.5)
				icon1.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
				icon1.BackgroundTransparency = 1
				icon1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				icon1.BorderSizePixel = 0
				icon1.Position = UDim2.new(1, -3, 0.5, -6)
				icon1.Size = UDim2.new(0, 23, 0, 23)
				icon1.Image = "rbxassetid://3944703587"
				icon1.ImageColor3 = Color3.fromRGB(152, 0, 0)
				
				Button:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()

				OnClick.MouseButton1Click:Connect(function()
					OptionsButton.CallBack()
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Button
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end
				
				if Title.Text == "" then
					Title.Text = "Button"
				end
				
				if Description.Text == "" then
					Description.Text = "Description"
				end
				
				return Buttons
			end
			
			function Sections:AddToggle(OptionsToggle)
				OptionsToggle.Title = OptionsToggle.Title or "Toggle"
				OptionsToggle.Description = OptionsToggle.Description or "Description"
				OptionsToggle.Default = OptionsToggle.Default or false
				OptionsToggle.Callback = OptionsToggle.Callback or function() end

				local Toggles = {}
				local on = OptionsToggle.Default
				OptionsToggle.Callback(OptionsToggle.Default)

				local Toggle = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local OnClick = Instance.new("TextButton")
				local Holder = Instance.new("Frame")
				local UIListLayout_2 = Instance.new("UIListLayout")
				local UIPadding_3 = Instance.new("UIPadding")
				local Boll = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")

				Toggle.Name = "Toggle"
				Toggle.Parent = Sc
				Toggle.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Toggle.BackgroundTransparency = 0.700
				Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.BorderSizePixel = 0
				Toggle.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Toggle

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Toggle

				Content.Name = "Content"
				Content.Parent = Toggle
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsToggle.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsToggle.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				OnClick.Name = "OnClick"
				OnClick.Parent = Toggle
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000

				Holder.Name = "Holder"
				Holder.Parent = Toggle
				Holder.AnchorPoint = Vector2.new(1, 0.5)
				Holder.BackgroundTransparency = 0.600
				Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Holder.BorderSizePixel = 0
				Holder.Position = UDim2.new(1, -3, 0.5, -7)
				Holder.Size = UDim2.new(0, 35, 0, 18)

				UIListLayout_2.Parent = Holder
				UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

				UIPadding_3.Parent = Holder
				UIPadding_3.PaddingBottom = UDim.new(0, 2)
				UIPadding_3.PaddingLeft = UDim.new(0, 3)
				UIPadding_3.PaddingRight = UDim.new(0, 3)
				UIPadding_3.PaddingTop = UDim.new(0, 2)

				Boll.Name = "Boll"
				Boll.Parent = Holder
				Boll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Boll.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Boll.BorderSizePixel = 0
				Boll.Size = UDim2.new(0, 15, 1, 0)

				UICorner_2.CornerRadius = UDim.new(1, 0)
				UICorner_2.Parent = Boll

				UICorner_3.CornerRadius = UDim.new(1, 0)
				UICorner_3.Parent = Holder
				
				Toggle:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()

				if OptionsToggle.Default == true then
					UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
					Holder.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
				else
					UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Left
					Holder.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
				end

				OnClick.MouseButton1Click:Connect(function()
					on = not on
					UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
					Holder.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
					OptionsToggle.Callback(on)
					if on == false then
						UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Left
						Holder.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
					end
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Toggle
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end
				
				if Title.Text == "" then
					Title.Text = "Toggle"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end

				return Toggles
			end
			
			function Sections:AddCheckbox(OptionsCheck)
				OptionsCheck.Title = OptionsCheck.Title or "Checkbox"
				OptionsCheck.Description = OptionsCheck.Description or "Description"
				OptionsCheck.Default = OptionsCheck.Default or false
				OptionsCheck.Callback = OptionsCheck.Callback or function() end

				local Checkboxs = {}
				local on = OptionsCheck.Default
				OptionsCheck.Callback(OptionsCheck.Default)

				local Checkbox = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local OnClick = Instance.new("TextButton")
				local Holder = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UIGradient_2 = Instance.new("UIGradient")
				local icon = Instance.new("ImageLabel")

				Checkbox.Name = "Checkbox"
				Checkbox.Parent = Sc
				Checkbox.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Checkbox.BackgroundTransparency = 0.700
				Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Checkbox.BorderSizePixel = 0
				Checkbox.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Checkbox

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Checkbox

				Content.Name = "Content"
				Content.Parent = Checkbox
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsCheck.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsCheck.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				OnClick.Name = "OnClick"
				OnClick.Parent = Checkbox
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000

				Holder.Name = "Holder"
				Holder.Parent = Checkbox
				Holder.AnchorPoint = Vector2.new(1, 0.5)
				Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Holder.BackgroundTransparency = 0.600
				Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Holder.BorderSizePixel = 0
				Holder.Position = UDim2.new(1, -3, 0.5, -7)
				Holder.Size = UDim2.new(0, 20, 0, 20)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Holder

				icon.Name = "icon"
				icon.Parent = Holder
				icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				icon.BackgroundTransparency = 1.000
				icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				icon.BorderSizePixel = 0
				icon.Size = UDim2.new(1, 0, 1, 0)
				
				icon.ImageColor3 = Color3.fromRGB(200, 200, 200)
				icon.TileSize = UDim2.new(1, 1, 1, 0)
				
				Checkbox:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()
				
				if OptionsCheck.Default == true then
					icon.Image = "rbxassetid://7733715400"
					Holder.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
				else
					icon.Image = ""
					Holder.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
				end

				OnClick.MouseButton1Click:Connect(function()
					on = not on
					icon.Image = "rbxassetid://7733715400"
					OptionsCheck.Callback(on)
					Holder.BackgroundColor3 = Color3.fromRGB(152, 0, 0)
					if on == false then
						icon.Image = ""
						Holder.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
					end
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Checkbox
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end
				
				if Title.Text == "" then
					Title.Text = "Checkbox"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end

				return Checkboxs
			end
			
			function Sections:Addinput(OptionsInput)
				OptionsInput.Title = OptionsInput.Title or "Input"
				OptionsInput.Description = OptionsInput.Description or "Description"
				OptionsInput.Default = OptionsInput.Default or 10
				OptionsInput.Callback = OptionsInput.Callback or function() end

				local inputs = {}
				OptionsInput.Callback(OptionsInput.Default)

				local Input = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local Holder = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UIGradient_2 = Instance.new("UIGradient")
				local Text = Instance.new("TextBox")
				local UIListLayout_2 = Instance.new("UIListLayout")

				Input.Name = "Input"
				Input.Parent = Sc
				Input.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Input.BackgroundTransparency = 0.700
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Input

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Input

				Content.Name = "Content"
				Content.Parent = Input
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsInput.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsInput.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				Holder.Name = "Holder"
				Holder.Parent = Input
				Holder.AnchorPoint = Vector2.new(1, 0.5)
				Holder.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
				Holder.BackgroundTransparency = 0.600
				Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Holder.BorderSizePixel = 0
				Holder.Position = UDim2.new(1, -3, 0.5, -8)
				Holder.Size = UDim2.new(0, 30, 0, 16)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Holder

				Text.Name = "Text"
				Text.Parent = Holder
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Size = UDim2.new(1, 0, 1, 0)
				Text.Font = Font1
				Text.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				Text.PlaceholderText = "..."
				Text.Text = OptionsInput.Default
				Text.TextColor3 = Color3.fromRGB(200, 200, 200)
				Text.TextSize = 14.000
				Text.TextWrapped = true

				UIListLayout_2.Parent = Holder
				UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
				
				Input:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()

				local lastNumber = OptionsInput.Default -- Guarda o último número

				Text.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local text = Text.Text
						if text == "" then
							Text.Text = tostring(lastNumber) -- Preenche com o último número se estiver vazio
						elseif not text:match("^%d*$") then
							Text.Text = tostring(lastNumber) -- Restaura o último número se não for válido
						else
							lastNumber = tonumber(text) -- Atualiza o último número se válido
						end
						OptionsInput.Callback(lastNumber) -- Chama o callback com o último número
					end
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Input
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end
				
				if Title.Text == "" then
					Title.Text = "Input"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end

				return inputs
			end
			
			function Sections:AddKeybind(OptionsKeyBind)
				OptionsKeyBind.Title = OptionsKeyBind.Title or "Keybind"
				OptionsKeyBind.Description = OptionsKeyBind.Description or "Description"
				OptionsKeyBind.Default = OptionsKeyBind.Default or "K"
				OptionsKeyBind.Callback = OptionsKeyBind.Callback or function() end

				local keybinds = {}
				OptionsKeyBind.Callback(OptionsKeyBind.Default)

				local Keybind = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local Holder = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UIGradient_2 = Instance.new("UIGradient")
				local Text = Instance.new("TextBox")
				local UIListLayout_2 = Instance.new("UIListLayout")

				Keybind.Name = "Keybind"
				Keybind.Parent = Sc
				Keybind.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Keybind.BackgroundTransparency = 0.700
				Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Keybind.BorderSizePixel = 0
				Keybind.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Keybind

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Keybind

				Content.Name = "Content"
				Content.Parent = Keybind
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsKeyBind.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsKeyBind.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				Holder.Name = "Holder"
				Holder.Parent = Keybind
				Holder.AnchorPoint = Vector2.new(1, 0.5)
				Holder.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
				Holder.BackgroundTransparency = 0.600
				Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Holder.BorderSizePixel = 0
				Holder.Position = UDim2.new(1, -3, 0.5, -8)
				Holder.Size = UDim2.new(0, 30, 0, 16)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Holder

				Text.Name = "Text"
				Text.Parent = Holder
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Size = UDim2.new(1, 0, 1, 0)
				Text.Font = Font1
				Text.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				Text.PlaceholderText = "..."
				Text.Text = OptionsKeyBind.Default
				Text.TextColor3 = Color3.fromRGB(200, 200, 200)
				Text.TextSize = 14.000
				Text.TextWrapped = true

				UIListLayout_2.Parent = Holder
				UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
				
				Keybind:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()
				
				local lastValue = Text.Text -- Armazena o último valor válido

				Text.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						if Text.Text == "" then
							Text.Text = lastValue -- Restaura o último valor válido
							return
						end

						local input = Text.Text
						local filtered = input:upper() -- Converte para maiúscula

						-- Permite apenas a primeira letra
						if filtered:len() > 1 then
							filtered = filtered:sub(1, 1)
						end

						-- Verifica se é uma letra
						if not filtered:match("%a") then
							filtered = "" -- Limpa o texto se não for uma letra
						end

						-- Atualiza o TextBox se necessário
						if Text.Text ~= filtered then
							Text.Text = filtered -- Atualiza o TextBox
							Text.CursorPosition = Text.Text:len() -- Move o cursor para o final
						end

						-- Chama o callback apenas se o valor mudou
						if lastValue ~= filtered then
							lastValue = filtered
							OptionsKeyBind.Callback(filtered)
						end
					end
				end)

				-- Adiciona um evento para o input em tempo real
				Text:GetPropertyChangedSignal("Text"):Connect(function()
					local input = Text.Text
					local filtered = input:upper():sub(1, 1) -- Permite apenas a primeira letra

					-- Verifica se é uma letra
					if not filtered:match("%a") then
						filtered = "" -- Limpa o texto se não for uma letra
					end

					-- Atualiza o TextBox se necessário
					if Text.Text ~= filtered then
						Text.Text = filtered -- Atualiza o TextBox
						Text.CursorPosition = Text.Text:len() -- Move o cursor para o final
					end
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Keybind
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end
				
				if Title.Text == "" then
					Title.Text = "Keybind"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end
				
				return keybinds
			end
			
			function Sections:AddDropdown(OptionsDropdown)
				OptionsDropdown.Title = OptionsDropdown.Title or "Dropdown"
				OptionsDropdown.Description = OptionsDropdown.Description or "Description"
				OptionsDropdown.Values = OptionsDropdown.Values or {"Option 1", "Options 2"}
				OptionsDropdown.Callback = OptionsDropdown.Callback or function() end
				
				local Dropdowns = {}

				local Dropdown = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local OnClick = Instance.new("TextButton")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Sc
				Dropdown.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Dropdown.BackgroundTransparency = 0.700
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Dropdown.BorderSizePixel = 0
				Dropdown.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Dropdown

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Dropdown

				Content.Name = "Content"
				Content.Parent = Dropdown
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsDropdown.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsDropdown.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				OnClick.Name = "OnClick"
				OnClick.Parent = Dropdown
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000
				
				Dropdown:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()
				
				local FrameDrop = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local DropShadowHolder = Instance.new("Frame")
				local DropShadow = Instance.new("ImageLabel")
				local Camada2 = Instance.new("Frame")
				local UIGradient_2 = Instance.new("UIGradient")
				local UICorner_2 = Instance.new("UICorner")
				local DropShadowHolder_2 = Instance.new("Frame")
				local DropShadow_2 = Instance.new("ImageLabel")
				local TitleBar = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local Title1 = Instance.new("TextLabel")
				local Icon = Instance.new("ImageLabel")
				local UIPadding = Instance.new("UIPadding")
				local Title2 = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local UIListLayout = Instance.new("UIListLayout")
				local Content = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")
				local UIGradient_3 = Instance.new("UIGradient")
				local Srolll = Instance.new("ScrollingFrame")
				local UIPadding_3 = Instance.new("UIPadding")
				local UIListLayout_2 = Instance.new("UIListLayout")

				FrameDrop.Name = "FrameDrop"
				FrameDrop.Parent = Main
				FrameDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				FrameDrop.BackgroundTransparency = Window.Opacity and 0.500 or 0
				FrameDrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
				FrameDrop.BorderSizePixel = 0
				FrameDrop.Visible = false
				FrameDrop.Position = UDim2.new(1, 10, 0, 0)
				FrameDrop.Size = UDim2.new(0, 160, 0, 157)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Parent = FrameDrop

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = FrameDrop

				DropShadowHolder.Name = "DropShadowHolder"
				DropShadowHolder.Parent = FrameDrop
				DropShadowHolder.BackgroundTransparency = 1.000
				DropShadowHolder.BorderSizePixel = 0
				DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
				DropShadowHolder.ZIndex = 0

				DropShadow.Name = "DropShadow"
				DropShadow.Parent = DropShadowHolder
				DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
				DropShadow.BackgroundTransparency = 1.000
				DropShadow.BorderSizePixel = 0
				DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropShadow.Size = UDim2.new(1, 47, 1, 47)
				DropShadow.ZIndex = 0
				DropShadow.Image = "rbxassetid://6014261993"
				DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
				DropShadow.ImageTransparency = 0.500
				DropShadow.ScaleType = Enum.ScaleType.Slice
				DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

				Camada2.Name = "Camada2"
				Camada2.Parent = FrameDrop
				Camada2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Camada2.BackgroundTransparency = 0.500
				Camada2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Camada2.BorderSizePixel = 0
				Camada2.Size = UDim2.new(1, 0, 1, 0)

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient_2.Parent = Camada2

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Camada2

				TitleBar.Name = "TitleBar"
				TitleBar.Parent = FrameDrop
				TitleBar.AnchorPoint = Vector2.new(0.5, 0)
				TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				TitleBar.BackgroundTransparency = 0.500
				TitleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TitleBar.BorderSizePixel = 0
				TitleBar.Position = UDim2.new(0.5, 0, 0, 7)
				TitleBar.Size = UDim2.new(1, -10, 0, 30)

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = TitleBar

				Title1.Name = "Title1"
				Title1.Parent = TitleBar
				Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title1.BackgroundTransparency = 1.000
				Title1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title1.BorderSizePixel = 0
				Title1.Size = UDim2.new(0.5, 0, 1, 0)
				Title1.Font = Font1
				Title1.Text = "Drop"
				Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title1.TextSize = 14.000
				Title1.TextXAlignment = Enum.TextXAlignment.Left

				Icon.Name = "Icon"
				Icon.Parent = Title1
				Icon.AnchorPoint = Vector2.new(0, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(0, -24, 0.5, 0)
				Icon.Size = UDim2.new(0, 20, 0, 20)
				Icon.Image = "rbxassetid://7733970442"
				Icon.ImageColor3 = Color3.fromRGB(230, 230, 230)

				UIPadding.Parent = Title1
				UIPadding.PaddingLeft = UDim.new(0, 32)

				Title2.Name = "Title2"
				Title2.Parent = TitleBar
				Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title2.BackgroundTransparency = 1.000
				Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title2.BorderSizePixel = 0
				Title2.Size = UDim2.new(0.5, 0, 1, -3)
				Title2.Font = Font1
				Title2.Text = "down"
				Title2.TextColor3 = Color3.fromRGB(229, 0, 0)
				Title2.TextSize = 16.000
				Title2.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_2.Parent = Title2
				UIPadding_2.PaddingBottom = UDim.new(0, 5)
				UIPadding_2.PaddingLeft = UDim.new(0, -9)

				UIListLayout.Parent = TitleBar
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

				Content.Name = "Content"
				Content.Parent = FrameDrop
				Content.AnchorPoint = Vector2.new(0, 1)
				Content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				Content.BackgroundTransparency = 0.600
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Position = UDim2.new(0, 7, 1, -7)
				Content.Size = UDim2.new(1, -12, 1, -48)

				UICorner_4.CornerRadius = UDim.new(0, 5)
				UICorner_4.Parent = Content

				UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient_3.Parent = Content

				Srolll.Name = "Srolll"
				Srolll.Parent = Content
				Srolll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Srolll.BackgroundTransparency = 1.000
				Srolll.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Srolll.BorderSizePixel = 0
				Srolll.Selectable = false
				Srolll.Size = UDim2.new(1, 0, 1, 0)
				Srolll.ScrollBarThickness = 0

				UIPadding_3.Parent = Srolll
				UIPadding_3.PaddingBottom = UDim.new(0, 3)
				UIPadding_3.PaddingLeft = UDim.new(0, 3)
				UIPadding_3.PaddingRight = UDim.new(0, 3)
				UIPadding_3.PaddingTop = UDim.new(0, 3)

				UIListLayout_2.Parent = Srolll
				UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.Padding = UDim.new(0, 5)
				
				local function Drops()
					local contentSize = UIListLayout_2.AbsoluteContentSize
					Srolll.CanvasSize = UDim2.new(0, contentSize.X, 0, contentSize.Y + 10)
				end

				-- Exibe as opções
				for _, value in ipairs(OptionsDropdown.Values) do
					local Option = Instance.new("TextButton")
					Option.Name = "Option"
					Option.Parent = Srolll -- A ScrollingFrame onde as opções são exibidas
					Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Option.BackgroundTransparency = 0.500
					Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Option.BorderSizePixel = 0
					Option.Size = UDim2.new(1, 0, 0, 30)
					Option.AutoButtonColor = false
					Option.Font = Enum.Font.SourceSans
					Option.Text = ""
					Option.TextColor3 = Color3.fromRGB(255, 255, 255)
					Option.TextSize = 14.000

					-- Adiciona cantos arredondados à opção
					local UICorner_Option = Instance.new("UICorner")
					UICorner_Option.CornerRadius = UDim.new(0, 5)
					UICorner_Option.Parent = Option

					-- Adiciona o gradiente à opção
					local UIGradient_Option = Instance.new("UIGradient")
					UIGradient_Option.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))
					}
					UIGradient_Option.Parent = Option
					
					local Titlee = Instance.new("TextLabel")
					Titlee.Name = "Titlee"
					Titlee.Parent = Option
					Titlee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Titlee.BackgroundTransparency = 1.000
					Titlee.BorderColor3 = Color3.fromRGB(0, 0, 0)
					Titlee.BorderSizePixel = 0
					Titlee.Size = UDim2.new(1, 0, 1, 0)
					Titlee.Font = Font1
					Titlee.Text = value
					Titlee.TextColor3 = Color3.fromRGB(255, 255, 255)
					Titlee.TextSize = 14.000

					-- Evento de clique
					Option.MouseButton1Click:Connect(function()
						OptionsDropdown.Callback(value)
						Title.Text = value
						FrameDrop.Visible = false
						Drop = false
					end)
					
					Option:GetPropertyChangedSignal("AbsoluteSize"):Connect(Drops)
					Drops()
				end
				
				OnClick.MouseButton1Click:Connect(function()
					Drop = not Drop
					FrameDrop.Visible = Drop
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Dropdown
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end
				
				if Title.Text == "" then
					Title.Text = "Dropdown"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end
				
				return Dropdowns
			end
			
			function Sections:AddSlide(OptionsSlide)
				OptionsSlide.Title = OptionsSlide.Title or "Slider"
				OptionsSlide.Min = OptionsSlide.Min or 0
				OptionsSlide.Max = OptionsSlide.Max or 100
				OptionsSlide.Default = OptionsSlide.Default or 50
				OptionsSlide.Gradient = OptionsSlide.Gradient or false
				OptionsSlide.Callback = OptionsSlide.Callback or function() end
				
				local Sliders = {}
				
				local Slider = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Value = Instance.new("TextBox")
				local UIPadding_2 = Instance.new("UIPadding")
				local Black = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Draggable = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local UIGradient_2 = Instance.new("UIGradient")

				Slider.Name = "Slider"
				Slider.Parent = Sc
				Slider.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Slider.BackgroundTransparency = 0.700
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0.463917524, 0)
				Slider.Size = UDim2.new(1, 0, -0.0463917516, 80)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Slider

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Slider

				Content.Name = "Content"
				Content.Parent = Slider
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsSlide.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Value.Name = "Value"
				Value.Parent = Title
				Value.AnchorPoint = Vector2.new(1, 0.5)
				Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Value.BackgroundTransparency = 1.000
				Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Value.BorderSizePixel = 0
				Value.Position = UDim2.new(1, -3, 0.5, 0)
				Value.Size = UDim2.new(0, 90, 0, 15)
				Value.Font = Font1
				Value.PlaceholderText = "..."
				Value.PlaceholderColor3 = Color3.fromRGB(240, 240, 240)
				Value.Text = OptionsSlide.Default
				Value.TextWrapped = true
				Value.TextColor3 = Color3.fromRGB(240, 240, 240)
				Value.TextSize = 14.000
				Value.TextXAlignment = Enum.TextXAlignment.Right

				UIPadding_2.Parent = Value
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				Black.Name = "Black"
				Black.Parent = Slider
				Black.AnchorPoint = Vector2.new(0.5, 1)
				Black.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
				Black.BackgroundTransparency = 0.500
				Black.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Black.BorderSizePixel = 0
				Black.Position = UDim2.new(0.5, 0, 1, -7)
				Black.Size = UDim2.new(1, -10, 0, 28)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Black

				Draggable.Name = "Draggable"
				Draggable.Parent = Black
				Draggable.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
				Draggable.BackgroundTransparency = 0.550
				Draggable.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Draggable.BorderSizePixel = 0
				Draggable.Size = UDim2.new(0.5, 0, 1, 0)

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = Draggable
				
				Slider:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()
				
				if OptionsSlide.Gradient == true then
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(84, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
					UIGradient_2.Rotation = -180
					UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
					UIGradient_2.Parent = Draggable
				end
				
				-- Função para atualizar o valor do Slider
				local lastValue = nil

				local function UpdateSliderValue()
					-- Calcula o valor do slider com base no tamanho do Draggable
					local sliderValue = math.clamp(Draggable.Size.X.Scale * (OptionsSlide.Max - OptionsSlide.Min) + OptionsSlide.Min, OptionsSlide.Min, OptionsSlide.Max)
					local roundedValue = math.floor(sliderValue)

					-- Verifica se o valor arredondado mudou e atualiza
					if roundedValue ~= lastValue then
						lastValue = roundedValue
						Value.Text = tostring(roundedValue)  -- Atualiza o texto com o valor
						OptionsSlide.Callback(roundedValue)  -- Chama o callback com o novo valor
					end
				end

				-- Função para ajustar o tamanho do "Draggable" baseado no novo valor
				local function SetSliderSize(newSize)
					-- Garante que o tamanho esteja dentro dos limites (0 a 1)
					local clampedSize = math.clamp(newSize, 0, 1)
					Draggable.Size = UDim2.new(clampedSize, 0, 1, 0)
					UpdateSliderValue()  -- Atualiza o valor do slider após ajustar o tamanho
				end

				-- Variáveis para controle de arrasto
				local dragging = false
				local startDragPosition = 0

				-- Função que lida com o início do arrasto (Clique ou Toque)
				local function startDragging(input)
					dragging = true
					Main.Draggable = false
					startDragPosition = input.Position.X  -- Salva a posição inicial do arrasto
				end

				-- Função que lida com o movimento do arrasto
				local function updateDragging(input)
					if dragging then
						local delta = input.Position.X - startDragPosition  -- Calcula o movimento horizontal
						local newSize = Draggable.Size.X.Scale + (delta / Black.AbsoluteSize.X)  -- Ajusta o tamanho proporcionalmente
						SetSliderSize(newSize)  -- Atualiza o tamanho do slider
						startDragPosition = input.Position.X  -- Atualiza a posição inicial para o próximo movimento
					end
				end

				-- Função que lida com o fim do arrasto
				local function stopDragging()
					if dragging then
						dragging = false
						Main.Draggable = Window.Draggable
					end
				end

				-- Conexões para eventos de entrada (mouse e toque)
				Black.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						startDragging(input)  -- Inicia o arrasto
					end
				end)

				-- Atualiza a posição durante o arrasto (mouse ou toque)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						updateDragging(input)  -- Atualiza o movimento do arrasto
					end
				end)

				-- Finaliza o arrasto quando o botão do mouse ou o toque é liberado
				game:GetService("UserInputService").InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						stopDragging()  -- Para o arrasto
					end
				end)

				-- Função para validar e atualizar o valor do campo de texto
				local function validateValue(inputText)
					local newText = inputText:gsub("[^%d]", "")  -- Remove qualquer caractere não numérico
					local numberValue = tonumber(newText) or OptionsSlide.Min  -- Converte para número ou usa o valor mínimo

					-- Garante que o valor esteja dentro dos limites
					if numberValue < OptionsSlide.Min then
						numberValue = OptionsSlide.Min
					elseif numberValue > OptionsSlide.Max then
						numberValue = OptionsSlide.Max
					end

					return numberValue
				end

				-- Função que é chamada quando o valor do TextBox é alterado
				Value.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						-- Valida o valor quando o campo perde o foco
						local numberValue = validateValue(Value.Text)

						-- Atualiza o campo de texto com o valor validado
						Value.Text = tostring(numberValue)

						-- Ajusta o tamanho do slider baseado no valor validado
						local newSize = (numberValue - OptionsSlide.Min) / (OptionsSlide.Max - OptionsSlide.Min)
						SetSliderSize(newSize)
						UpdateSliderValue()  -- Atualiza o valor do slider
					end
				end)

				-- Função de inicialização do slider
				local function initializeSlider()
					local initialSize = (OptionsSlide.Default - OptionsSlide.Min) / (OptionsSlide.Max - OptionsSlide.Min)
					SetSliderSize(initialSize)  -- Ajusta o tamanho inicial do slider
					UpdateSliderValue()  -- Atualiza o valor inicial
				end

				-- Chama a função de inicialização
				initializeSlider()
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Slider
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end

				if Title.Text == "" then
					Title.Text = "Slider"
				end

				return Sliders
			end
			
			function Sections:AddColorpicker(OptionsColorpicker)
				OptionsColorpicker.Title = OptionsColorpicker.Title or "Colorpicker"
				OptionsColorpicker.Description = OptionsColorpicker.Description or "Description"
				OptionsColorpicker.Type = OptionsColorpicker.Type or "Rainbow"
				OptionsColorpicker.Default = OptionsColorpicker.Default or Color3.fromRGB(255, 0, 0)
				OptionsColorpicker.Callback = OptionsColorpicker.Callback or function() end
				
				-- Definindo variáveis e objetos necessários
				local UserInputService = game:GetService("UserInputService")
				local RunService = game:GetService("RunService")
				local mouse = game.Players.LocalPlayer:GetMouse()
				local Settings = { Visible = true }
				
				local Colorpickers = {}
				
				local Colorpicker = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local OnClick = Instance.new("TextButton")
				local View = Instance.new("ImageLabel")
				local UICorner = Instance.new("UICorner")
				local UICorner_2 = Instance.new("UICorner")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = Sc
				Colorpicker.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Colorpicker.BackgroundTransparency = 0.700
				Colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Colorpicker.BorderSizePixel = 0
				Colorpicker.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Colorpicker

				Content.Name = "Content"
				Content.Parent = Colorpicker
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsColorpicker.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsColorpicker.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				OnClick.Name = "OnClick"
				OnClick.Parent = Colorpicker
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000

				View.Name = "View"
				View.Parent = Colorpicker
				View.AnchorPoint = Vector2.new(1, 0.5)
				View.BackgroundColor3 = OptionsColorpicker.Default
				View.BorderColor3 = Color3.fromRGB(0, 0, 0)
				View.BorderSizePixel = 0
				View.Position = UDim2.new(1, -5, 0.5, -7)
				View.Size = UDim2.new(0, 20, 0, 20)
				View.ImageColor3 = Color3.fromRGB(255, 0, 4)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = View

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Colorpicker
				
				Colorpicker:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()
				
				local FColorpicker = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local DropShadowHolder = Instance.new("Frame")
				local DropShadow = Instance.new("ImageLabel")
				local UIPadding = Instance.new("UIPadding")
				local Camada2 = Instance.new("Frame")
				local UIGradient_2 = Instance.new("UIGradient")
				local UICorner_2 = Instance.new("UICorner")
				local DropShadowHolder_2 = Instance.new("Frame")
				local DropShadow_2 = Instance.new("ImageLabel")
				local TitleBar = Instance.new("Frame")
				local UICorner_3 = Instance.new("UICorner")
				local Title1 = Instance.new("TextLabel")
				local Icon = Instance.new("ImageLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local Title2 = Instance.new("TextLabel")
				local UIPadding_3 = Instance.new("UIPadding")
				local UIListLayout = Instance.new("UIListLayout")
				local Content = Instance.new("Frame")
				local UIGradient_3 = Instance.new("UIGradient")
				local Canvas = Instance.new("Frame")
				local UIGradient_4 = Instance.new("UIGradient")
				local UICorner_4 = Instance.new("UICorner")
				local BlackOverlay = Instance.new("ImageLabel")
				local UICorner_5 = Instance.new("UICorner")
				local Cursor = Instance.new("ImageLabel")
				local UIPadding_4 = Instance.new("UIPadding")
				local UICorner_6 = Instance.new("UICorner")
				local Color = Instance.new("Frame")
				local UICorner_7 = Instance.new("UICorner")
				local UIGradient_5 = Instance.new("UIGradient")
				local ColorSlider = Instance.new("Frame")
				local Ic = Instance.new("ImageLabel")

				FColorpicker.Name = "FColorpicker"
				FColorpicker.Parent = Main
				FColorpicker.AnchorPoint = Vector2.new(1, 0)
				FColorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				FColorpicker.BackgroundTransparency = 0.500
				FColorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
				FColorpicker.BorderSizePixel = 0
				FColorpicker.Visible = false
				FColorpicker.Position = UDim2.new(0, -10, 0, 0)
				FColorpicker.Size = UDim2.new(0, 160, 0, 140)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Parent = FColorpicker

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = FColorpicker

				DropShadowHolder.Name = "DropShadowHolder"
				DropShadowHolder.Parent = FColorpicker
				DropShadowHolder.BackgroundTransparency = 1.000
				DropShadowHolder.BorderSizePixel = 0
				DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
				DropShadowHolder.ZIndex = 0

				DropShadow.Name = "DropShadow"
				DropShadow.Parent = DropShadowHolder
				DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
				DropShadow.BackgroundTransparency = 1.000
				DropShadow.BorderSizePixel = 0
				DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropShadow.Size = UDim2.new(1, 47, 1, 47)
				DropShadow.ZIndex = 0
				DropShadow.Image = "rbxassetid://6014261993"
				DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
				DropShadow.ImageTransparency = 0.500
				DropShadow.ScaleType = Enum.ScaleType.Slice
				DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

				UIPadding.Parent = DropShadowHolder
				UIPadding.PaddingBottom = UDim.new(0, 3)
				UIPadding.PaddingLeft = UDim.new(0, 3)
				UIPadding.PaddingRight = UDim.new(0, 3)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Camada2.Name = "Camada2"
				Camada2.Parent = FColorpicker
				Camada2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Camada2.BackgroundTransparency = 0.500
				Camada2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Camada2.BorderSizePixel = 0
				Camada2.Size = UDim2.new(1, 0, 1, 0)

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient_2.Parent = Camada2

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Camada2

				DropShadowHolder_2.Name = "DropShadowHolder"
				DropShadowHolder_2.Parent = Camada2
				DropShadowHolder_2.BackgroundTransparency = 1.000
				DropShadowHolder_2.BorderSizePixel = 0
				DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
				DropShadowHolder_2.ZIndex = 0

				DropShadow_2.Name = "DropShadow"
				DropShadow_2.Parent = DropShadowHolder_2
				DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
				DropShadow_2.BackgroundTransparency = 1.000
				DropShadow_2.BorderSizePixel = 0
				DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropShadow_2.Size = UDim2.new(1, 47, 1, 47)
				DropShadow_2.ZIndex = 0
				DropShadow_2.Image = "rbxassetid://6014261993"
				DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
				DropShadow_2.ImageTransparency = 0.500
				DropShadow_2.ScaleType = Enum.ScaleType.Slice
				DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

				TitleBar.Name = "TitleBar"
				TitleBar.Parent = FColorpicker
				TitleBar.AnchorPoint = Vector2.new(0.5, 0)
				TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				TitleBar.BackgroundTransparency = 0.500
				TitleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TitleBar.BorderSizePixel = 0
				TitleBar.Position = UDim2.new(0.5, 0, 0, 7)
				TitleBar.Size = UDim2.new(1, -10, 0, 30)

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = TitleBar

				Title1.Name = "Title1"
				Title1.Parent = TitleBar
				Title1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title1.BackgroundTransparency = 1.000
				Title1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title1.BorderSizePixel = 0
				Title1.Size = UDim2.new(0.5, 0, 1, 0)
				Title1.Font = Font1
				Title1.Text = "Color"
				Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title1.TextSize = 14.000
				Title1.TextXAlignment = Enum.TextXAlignment.Left

				Icon.Name = "Icon"
				Icon.Parent = Title1
				Icon.AnchorPoint = Vector2.new(0, 0.5)
				Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Icon.BackgroundTransparency = 1.000
				Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Icon.BorderSizePixel = 0
				Icon.Position = UDim2.new(0, -24, 0.5, 0)
				Icon.Size = UDim2.new(0, 20, 0, 20)
				Icon.Image = "http://www.roblox.com/asset/?id=123252750759101"
				Icon.ImageColor3 = Color3.fromRGB(230, 230, 230)

				UIPadding_2.Parent = Title1
				UIPadding_2.PaddingLeft = UDim.new(0, 32)

				Title2.Name = "Title2"
				Title2.Parent = TitleBar
				Title2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title2.BackgroundTransparency = 1.000
				Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title2.BorderSizePixel = 0
				Title2.Size = UDim2.new(0.5, 0, 1, -3)
				Title2.Font = Font1
				Title2.Text = "picker"
				Title2.TextColor3 = Color3.fromRGB(229, 0, 0)
				Title2.TextSize = 16.000
				Title2.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding_3.Parent = Title2
				UIPadding_3.PaddingBottom = UDim.new(0, 5)
				UIPadding_3.PaddingLeft = UDim.new(0, -6)

				UIListLayout.Parent = TitleBar
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

				Content.Name = "Content"
				Content.Parent = FColorpicker
				Content.AnchorPoint = Vector2.new(0, 1)
				Content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				Content.BackgroundTransparency = 0.600
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Position = UDim2.new(0, 7, 1, -7)
				Content.Size = UDim2.new(1, -12, 1, -48)

				UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient_3.Parent = Content

				Canvas.Name = "Canvas"
				Canvas.Parent = Content
				Canvas.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Canvas.BorderSizePixel = 0
				Canvas.Size = UDim2.new(1, -3, -0.405, 100)

				UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
				UIGradient_4.Rotation = 0
				UIGradient_4.Parent = Canvas

				UICorner_4.CornerRadius = UDim.new(0, 5)
				UICorner_4.Parent = Canvas

				BlackOverlay.Name = "BlackOverlay"
				BlackOverlay.Parent = Canvas
				BlackOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BlackOverlay.BackgroundTransparency = 1.000
				BlackOverlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BlackOverlay.BorderSizePixel = 0
				BlackOverlay.Size = UDim2.new(1, 0, 1, 0)
				BlackOverlay.ZIndex = 1
				BlackOverlay.Image = "rbxassetid://5107152095"
				BlackOverlay.ImageColor3 = Color3.fromRGB(255, 0, 4)

				UICorner_5.CornerRadius = UDim.new(0, 5)
				UICorner_5.Parent = BlackOverlay

				Cursor.Name = "Cursor"
				Cursor.Parent = Canvas
				Cursor.AnchorPoint = Vector2.new(0, 0)
				Cursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Cursor.BackgroundTransparency = 1.000
				Cursor.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Cursor.BorderSizePixel = 0
				Cursor.Position = UDim2.new(0.5, 0, 0.5, 0)
				Cursor.Size = UDim2.new(0, 8, 0, 8)
				Cursor.ZIndex = 2
				Cursor.Image = "rbxassetid://5100115962"

				UIPadding_4.Parent = Content
				UIPadding_4.PaddingLeft = UDim.new(0, 3)
				UIPadding_4.PaddingRight = UDim.new(0, 3)
				UIPadding_4.PaddingTop = UDim.new(0, 3)

				UICorner_6.CornerRadius = UDim.new(0, 5)
				UICorner_6.Parent = Content

				Color.Name = "Color"
				Color.Parent = Content
				Color.AnchorPoint = Vector2.new(0, 1)
				Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Color.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Color.BorderSizePixel = 0
				Color.Position = UDim2.new(0, 0, 1, -7)
				Color.Size = UDim2.new(1, -3, 0, 18)

				UICorner_7.CornerRadius = UDim.new(0, 5)
				UICorner_7.Parent = Color
				
				UIGradient_5.Parent = Color

				ColorSlider.Name = "ColorSlider"
				ColorSlider.Parent = Color
				ColorSlider.AnchorPoint = Vector2.new(0, 0.5)
				ColorSlider.BackgroundColor3 = Color3.fromRGB(245, 246, 250)
				ColorSlider.BackgroundTransparency = 1.000
				ColorSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ColorSlider.BorderSizePixel = 0
				ColorSlider.Position = UDim2.new(0, 0, 0.5, 0)
				ColorSlider.Size = UDim2.new(0, 5, 0, 14)

				Ic.Name = "Ic"
				Ic.Parent = ColorSlider
				Ic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Ic.BackgroundTransparency = 1.000
				Ic.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Ic.BorderSizePixel = 0
				Ic.Position = UDim2.new(0, -5, 1, 1)
				Ic.Size = UDim2.new(0, 15, 0, 15)
				Ic.Image = "rbxassetid://7733919605"
				
				if OptionsColorpicker.Type == "Rainbow" then
					UIGradient_5.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
						ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 4)),
						ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 0, 255)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
					}
				elseif OptionsColorpicker.Type == "RGB" then
					UIGradient_5.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 255))
					}
				elseif OptionsColorpicker.Type == "SkinColors" then
					UIGradient_5.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
						ColorSequenceKeypoint.new(0.22, Color3.fromRGB(233, 145, 85)),
						ColorSequenceKeypoint.new(0.32, Color3.fromRGB(232, 140, 78)),
						ColorSequenceKeypoint.new(0.43, Color3.fromRGB(229, 120, 47)),
						ColorSequenceKeypoint.new(0.60, Color3.fromRGB(94, 52, 28)),
						ColorSequenceKeypoint.new(0.74, Color3.fromRGB(65, 38, 24)), 
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(27, 19, 19))
					}
				end
				
				local draggingColor = false
				local draggingCanvas = false
				local hue = 0
				local sat = 1
				local brightness = 1
				local color3 = Color3.fromHSV(hue, sat, brightness)
				local mouse = player:GetMouse()
				local stepped = RunService.Stepped
				local con
				
				OptionsColorpicker.Callback(OptionsColorpicker.Default)
				Icon.ImageColor3 = OptionsColorpicker.Default
				
				-- Função para garantir que o valor esteja dentro dos limites antes de clamped
				local function safeClamp(value, min, max)
					if min > max then
						min, max = max, min
					end
					return math.clamp(value, min, max)
				end

				-- Função para atualizar a cor do Canvas (arrasto do Canvas)
				local function updateCanvasColor(mouseX, mouseY)
					if Canvas and Canvas.AbsolutePosition and Canvas.AbsoluteSize then
						local canvasPosition = Canvas.AbsolutePosition
						local canvasSize = Canvas.AbsoluteSize

						-- Garantindo que o mouse X/Y esteja dentro dos limites do canvas
						if mouseX >= canvasPosition.X and mouseY >= canvasPosition.Y then
							sat = 1 - safeClamp((mouseX - canvasPosition.X) / canvasSize.X, 0, 1)
							brightness = 1 - safeClamp((mouseY - canvasPosition.Y) / canvasSize.Y, 0, 1)
							color3 = Color3.fromHSV(hue, sat, brightness)
							View.BackgroundColor3 = color3
							Icon.ImageColor3 = color3
							OptionsColorpicker.Callback(color3)
						end
					end
				end

				-- Função para atualizar o slider de cor
				local function updateColorSlider(mouseX)
					-- Verifique se o "Color" e "ColorSlider" estão definidos
					if Color and Color.AbsolutePosition and Color.AbsoluteSize then
						local colorPosition = Color.AbsolutePosition
						local colorSize = Color.AbsoluteSize

						-- Garantindo que o mouse X esteja dentro dos limites do slider
						hue = safeClamp((mouseX - colorPosition.X) / colorSize.X, 0, 1)

						-- Atualiza o gradiente do slider de cor com base no valor de hue
						UIGradient_4.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromHSV(hue, 1, 1)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
						}

						-- Atualiza a posição do ColorSlider apenas na horizontal
						local xOffset = safeClamp(mouseX - colorPosition.X, 0, colorSize.X - 3)
						ColorSlider.Position = UDim2.new(0, xOffset, 0.5, 0)

						-- Atualiza a cor do fundo e chama a função de callback
						color3 = Color3.fromHSV(hue, sat, brightness)
						View.BackgroundColor3 = color3
						Icon.ImageColor3 = color3
						OptionsColorpicker.Callback(color3)
					end
				end

				-- Evento de Input no Canvas (arrasto)
				Canvas.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						draggingCanvas = true
					end
				end)

				-- Finaliza o arrasto
				Canvas.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						draggingCanvas = false
					end
				end)

				-- Atualiza a posição do cursor e as cores durante o arrasto
				RunService.Heartbeat:Connect(function()
					if draggingCanvas then
						-- Verifique se o mouse está dentro da área válida
						local mouseX, mouseY = mouse.X, mouse.Y

						if Canvas and Canvas.AbsolutePosition and Canvas.AbsoluteSize then
							local canvasPosition = Canvas.AbsolutePosition
							local canvasSize = Canvas.AbsoluteSize

							-- Calcular as posições X e Y dentro dos limites do Canvas
							local canvasX = safeClamp(mouseX - canvasPosition.X, 2, canvasSize.X - 2)
							local canvasY = safeClamp(mouseY - canvasPosition.Y, 2, canvasSize.Y - 2)

							-- Atualiza a posição do cursor
							if Cursor then
								Cursor.Position = UDim2.fromOffset(canvasX - 4, canvasY - 4)
							end

							-- Atualiza a cor do Canvas
							updateCanvasColor(mouseX, mouseY)
						end
					end
				end)

				-- Evento de Input no ColorSlider (arrasto)
				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						draggingColor = true
					end
				end)

				-- Finaliza o arrasto do ColorSlider
				Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						draggingColor = false
					end
				end)

				-- Atualiza a posição do ColorSlider baseado no movimento do mouse
				RunService.Heartbeat:Connect(function()
					if draggingColor then
						-- Pega a posição X do mouse, mas apenas dentro dos limites horizontais do Color
						local mouseX = safeClamp(mouse.X, Color.AbsolutePosition.X, Color.AbsolutePosition.X + Color.AbsoluteSize.X)

						-- Atualiza o ColorSlider
						updateColorSlider(mouseX)
					end
				end)

				-- Quando o mouse for clicado dentro do Color (gradiente), o ColorSlider se move para a posição do clique
				Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local mouseX = safeClamp(mouse.X, Color.AbsolutePosition.X, Color.AbsolutePosition.X + Color.AbsoluteSize.X)

						-- Atualiza a posição do ColorSlider com base no clique
						updateColorSlider(mouseX)
					end
				end)
				
				-- Posições e tamanhos para FColorpicker e Canvas com base no estado de visibilidade
				local positionVisible = UDim2.new(0, -10, 0, 180)  -- Posição quando VisibleS é true
				local positionHidden = UDim2.new(0, -10, 0, 50)    -- Posição quando VisibleS é false
				local ph = UDim2.new(0, -10, 0, 0)
				local sizeVisible = UDim2.new(0, 160, 0, 140)      -- Tamanho quando VisibleS é true
				local sizeHidden = UDim2.new(0, 160, 0, 177)       -- Tamanho quando VisibleS é false
				local canvasSizeVisible = UDim2.new(1, -3, -0.504, 100)  -- Canvas size quando VisibleS é true
				local canvasSizeHidden = UDim2.new(1, -3, -0.047, 100)   -- Canvas size quando VisibleS é false

				-- Função para atualizar a posição e tamanho do FColorpicker e Canvas com base na visibilidade
				local function updatePosition(visible)
					if list == true and VisibleS == false then
						FColorpicker.Position = positionHidden
						FColorpicker.Size = sizeHidden
						Canvas.Size = canvasSizeHidden
					elseif list == false and VisibleS == true then
						FColorpicker.Position = positionVisible
						FColorpicker.Size = sizeVisible
						Canvas.Size = canvasSizeHidden
					elseif list == true and VisibleS == true then
						FColorpicker.Position = positionVisible
						FColorpicker.Size = sizeVisible
						Canvas.Size = canvasSizeVisible
					elseif list == false and VisibleS == false then
						FColorpicker.Position = ph
						FColorpicker.Size = sizeHidden
						Canvas.Size = canvasSizeHidden
					end
				end

				-- Conectar a função ao Heartbeat para atualizar a posição sempre que necessário
				game:GetService("RunService").Heartbeat:Connect(function()
					local visibleState = Settings.Visible or VisibleS  -- Usar a variável de visibilidade que estiver ativa

					-- Verifica e atualiza a posição e tamanho do FColorpicker com base na visibilidade
					updatePosition(visibleState)
				end)


				-- Evento de clique do botão (quando o usuário abre ou fecha o Settings)
				OnClick.MouseButton1Click:Connect(function()
					FColorpicker.Visible = not FColorpicker.Visible  -- Alterna o estado de Settings.Visible
				end)

				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Colorpicker
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end

				if Title.Text == "" then
					Title.Text = "Colorpicker"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end
				
				return Colorpickers
			end
			
			function Sections:AddTeleport(OptionsTeleport)
				OptionsTeleport.Title = OptionsTeleport.Title or "Teleport"
				OptionsTeleport.Description = OptionsTeleport.Description or "Description"
				
				local Teleports = {}
				local X, Y, Z = "0,", "2,", "0"
				
				local Teleport = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UICorner = Instance.new("UICorner")
				local Content = Instance.new("Frame")
				local UIListLayout = Instance.new("UIListLayout")
				local Title = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Description = Instance.new("TextLabel")
				local UIPadding_2 = Instance.new("UIPadding")
				local OnClick = Instance.new("TextButton")
				local Holder = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local UIGradient_2 = Instance.new("UIGradient")
				local Text = Instance.new("TextBox")
				local UIListLayout_2 = Instance.new("UIListLayout")

				Teleport.Name = "Teleport"
				Teleport.Parent = Sc
				Teleport.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
				Teleport.BackgroundTransparency = 0.700
				Teleport.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Teleport.BorderSizePixel = 0
				Teleport.Size = UDim2.new(1, 0, 0, 40)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient.Rotation = -180
				UIGradient.Parent = Teleport

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Teleport

				Content.Name = "Content"
				Content.Parent = Teleport
				Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Content.BackgroundTransparency = 1.000
				Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Content.BorderSizePixel = 0
				Content.Size = UDim2.new(1, 0, 1, 0)

				UIListLayout.Parent = Content
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				Title.Name = "Title"
				Title.Parent = Content
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(1, 0, 0, 15)
				Title.Font = Font1
				Title.Text = OptionsTeleport.Title
				Title.TextColor3 = Color3.fromRGB(240, 240, 240)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding.Parent = Title
				UIPadding.PaddingLeft = UDim.new(0, 7)
				UIPadding.PaddingTop = UDim.new(0, 3)

				Description.Name = "Description"
				Description.Parent = Content
				Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Description.BackgroundTransparency = 1.000
				Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Description.BorderSizePixel = 0
				Description.Position = UDim2.new(0, 0, 0.5, 0)
				Description.Size = UDim2.new(1, 0, 1, -16)
				Description.Font = Enum.Font.Ubuntu
				Description.Text = OptionsTeleport.Description
				Description.TextColor3 = Color3.fromRGB(200, 200, 200)
				Description.TextSize = 11.000
				Description.TextWrapped = true
				Description.TextXAlignment = Enum.TextXAlignment.Left
				Description.TextYAlignment = Enum.TextYAlignment.Top

				UIPadding_2.Parent = Description
				UIPadding_2.PaddingLeft = UDim.new(0, 7)
				UIPadding_2.PaddingTop = UDim.new(0, 3)

				OnClick.Name = "OnClick"
				OnClick.Parent = Teleport
				OnClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OnClick.BackgroundTransparency = 1.000
				OnClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.BorderSizePixel = 0
				OnClick.Size = UDim2.new(1, 0, 1, 0)
				OnClick.AutoButtonColor = false
				OnClick.Font = Enum.Font.SourceSans
				OnClick.Text = ""
				OnClick.TextColor3 = Color3.fromRGB(0, 0, 0)
				OnClick.TextSize = 14.000

				Holder.Name = "Holder"
				Holder.Parent = OnClick
				Holder.AnchorPoint = Vector2.new(1, 0.5)
				Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Holder.BorderSizePixel = 0
				Holder.Position = UDim2.new(1, -3, 0.5, -8)
				Holder.Size = UDim2.new(0, 60, 0, 16)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Holder

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(84, 0, 0))}
				UIGradient_2.Rotation = -180
				UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.01, 0.99), NumberSequenceKeypoint.new(1.00, 0.00)}
				UIGradient_2.Parent = Holder

				Text.Name = "Text"
				Text.Parent = Holder
				Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Text.BackgroundTransparency = 1.000
				Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Text.BorderSizePixel = 0
				Text.Size = UDim2.new(1, 0, 1, 0)
				Text.Font = Font1
				Text.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
				Text.PlaceholderText = "..."
				Text.Text = ""
				Text.TextColor3 = Color3.fromRGB(200, 200, 200)
				Text.TextSize = 14.000
				Text.TextWrapped = true

				UIListLayout_2.Parent = Holder
				UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
				
				Teleport:GetPropertyChangedSignal("AbsoluteSize"):Connect(Sectioon)
				Sectioon()
				
				local lastCoordinates = {X, Y, Z}
				
				if Text.Text == "" then
					Text.Text = X.. " ".. Y.. " ".. Z
				end

				-- Função para garantir que apenas números, "-", "+", ",", e "." sejam inseridos
				Text:GetPropertyChangedSignal("Text"):Connect(function()
					local validText = Text.Text:gsub("[^0-9%-%+%,%.]", "")  -- Substitui qualquer caractere não permitido
					if Text.Text ~= validText then
						Text.Text = validText
					end
				end)

				-- Teletransporte quando o botão for clicado
				OnClick.MouseButton1Click:Connect(function()
					local coords = Text.Text
					-- Processar a string de coordenadas, esperando o formato X,Y,Z
					local X, Y, Z = coords:match("(-?%d+%.?%d*),%s*(-?%d+%.?%d*),%s*(-?%d+%.?%d*)")

					if X and Y and Z then
						-- Realizar o teletransporte
						game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(tonumber(X), tonumber(Y), tonumber(Z)))
					else
						print("Coordenadas inválidas!")
					end
				end)
				
				Text.FocusLost:Connect(function(enterPressed)
					if enterPressed and Text.Text == "" then
						-- Preenche com as últimas coordenadas
						Text.Text = lastCoordinates[1] .. lastCoordinates[2] .. lastCoordinates[3]
					end
				end)
				
				if Window.OptionsStroke == true then
					local M = S1:Clone()
					M.Parent = Teleport
					M.Color = Color3.fromRGB(54, 0, 0)
					M.Transparency = 0
				end

				if Title.Text == "" then
					Title.Text = "Teleport"
				end

				if Description.Text == "" then
					Description.Text = "Description"
				end
				
				return Teleports
			end

			return Sections
		end
		
		return Tab
	end

	return GUI
end


return AKHUB
