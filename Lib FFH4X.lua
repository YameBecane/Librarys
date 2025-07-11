local imgui = {}

imgui.Themes = {
    Red = {
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(200, 200, 200),
        Back = Color3.fromRGB(16, 16, 16),
        Primary = Color3.fromRGB(183, 28, 28),
        Secondary = Color3.fromRGB(183, 28, 28),
        Font = Enum.Font.SourceSans,
        TitleSize = 16,
        SubSize = 14,
    },
    Blue = {
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(200, 200, 200),
        Back = Color3.fromRGB(16, 16, 16),
        Primary = Color3.fromRGB(16, 95, 156),
        Secondary = Color3.fromRGB(16, 95, 156),
        Font = Enum.Font.SourceSans,
        TitleSize = 16,
        SubSize = 14,
    },
    Darker = {
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(200, 200, 200),
        Back = Color3.fromRGB(16, 16, 16),
        Primary = Color3.fromRGB(30, 30, 30),
        Secondary = Color3.fromRGB(37, 37, 37),
        Font = Enum.Font.SourceSans,
        TitleSize = 16,
        SubSize = 14,
    }
}

-- Função para obter a configuração do tema
function imgui:GetThemeConfig(themeName)
    return self.Themes[themeName] or self.Themes.Red -- Fallback para tema Red se não encontrado
end

-- Correção: usando . em vez de : para definir a função
function imgui:CreateWindow(Window)
    Window.Title = Window.Title or "Imgui Menu Example"
    Window.Opacity = Window.Opacity or false
    Window.Bind = Window.Bind or Enum.KeyCode.Q
    Window.Theme = Window.Theme or "Red"
    
    local Config = self:GetThemeConfig(Window.Theme)
    
    if screenGui then
        screenGui:Destroy()
    end
    
    local UserInputService = game:GetService("UserInputService")
    
    -- Cria um ScreenGui dentro do CoreGui
    local coreGui = game:GetService("CoreGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ImguiMenu"  -- Corrigido: era screenTabs
    screenGui.Parent = coreGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling -- Melhor controle de ZIndex
    
    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = screenGui
    Main.Active = true 
    Main.Draggable = true
    Main.ClipsDescendants = false
    Main.BackgroundColor3 = Config.Back
    Main.BackgroundTransparency = Window.Opacity and 0.080 or Window.Opacity and 0
    Main.BorderSizePixel = 0
    Main.AnchorPoint = Vector2.new(0.5, 0.5) 
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 400, 0, 250)
    Main.ZIndex = 9999
    
    local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	
	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Main
	DropShadowHolder.ClipsDescendants = false
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.Active = false
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
    
    local UiShadow = Instance.new("UICorner")
    UiShadow.CornerRadius = UDim.new(0, 18)
    UiShadow.Parent = DropShadowHolder
    
    local UiMain = Instance.new("UICorner")
    UiMain.CornerRadius = UDim.new(0, 20)
    UiMain.Parent = Main
    
    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.ClipsDescendants = false
    Top.BackgroundColor3 = Config.Primary
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0, 0, 0, 0)
    Top.Size = UDim2.new(1, 0, 0, 30)
    Top.ZIndex = Main.ZIndex + 1 -- Garante que fique acima
    
    local UiTop = Instance.new("UICorner")
    UiTop.CornerRadius = UDim.new(0, 18)
    UiTop.Parent = Top
    
    local HideT = Instance.new("Frame")
    HideT.Name = "HTop"
    HideT.Parent = Top
    HideT.ClipsDescendants = false
    HideT.BackgroundColor3 = Config.Primary
    HideT.BorderSizePixel = 0
    HideT.AnchorPoint = Vector2.new(0, 1) 
    HideT.Position = UDim2.new(0, 0, 1, 0)
    HideT.Size = UDim2.new(1, 0, 0, 12)
    HideT.ZIndex = Top.ZIndex
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.AnchorPoint = Vector2.new(0.5, 0.5)
    Title.Position = UDim2.new(0.5, 0, 0.5, 0)
    Title.BackgroundTransparency = 1
    Title.Text = Window.Title
    Title.TextColor3 = Config.Text
    Title.TextSize = Config.TitleSize
    Title.Font = Config.Font
    Title.Parent = Top
    Title.ZIndex = Top.ZIndex + 1
    
    local Close = Instance.new("TextButton")
	Close.Name = "Close"
	Close.Parent = Top
	Close.BackgroundTransparency = 1.000
	Close.BorderSizePixel = 0
	Close.AnchorPoint = Vector2.new(0, 0.5)
	Close.Size = UDim2.new(0, 30, 0, 30)
	Close.Position = UDim2.new(0, 0, 0.5, 0)
	Close.AutoButtonColor = false
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.Text = "▼"
	Close.TextSize = 15
	Close.ZIndex = Top.ZIndex + 1

    -- DESIGN TABS E CONTAINER ↓
    local HolderTabs = Instance.new("Frame")
    HolderTabs.Name = "HolderTabs"
    HolderTabs.Parent = Main
    HolderTabs.ClipsDescendants = true
    HolderTabs.BackgroundTransparency = 1
    HolderTabs.BorderSizePixel = 0
    HolderTabs.AnchorPoint = Vector2.new(0, 1) 
    HolderTabs.Position = UDim2.new(0, 0, 1, 0)
    HolderTabs.Size = UDim2.new(0, 68, 1, -35)
    HolderTabs.ZIndex = Main.ZIndex
    
    local ScrollTabs = Instance.new("ScrollingFrame")
    ScrollTabs.Name = "ScrollTabs"
    ScrollTabs.Parent = HolderTabs
    ScrollTabs.Size = UDim2.new(1, 0, 1, 0) 
    ScrollTabs.BackgroundTransparency = 1
    ScrollTabs.ClipsDescendants = false
    ScrollTabs.BorderSizePixel = 0
    ScrollTabs.ScrollBarThickness = 0
    ScrollTabs.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScrollTabs.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTabs.ZIndex = HolderTabs.ZIndex
    
    local UiListTabs = Instance.new("UIListLayout")
    UiListTabs.Parent = ScrollTabs
    UiListTabs.Padding = UDim.new(0, 5)
    UiListTabs.SortOrder = Enum.SortOrder.LayoutOrder
    
    local UiPagScroll = Instance.new("UIPadding")
    UiPagScroll.Parent = ScrollTabs
    UiPagScroll.PaddingLeft = UDim.new(0, 5) 
    UiPagScroll.PaddingRight = UDim.new(0, 5) 
    UiPagScroll.PaddingTop = UDim.new(0, 5)
    UiPagScroll.PaddingBottom = UDim.new(0, 5)
        
    UiListTabs:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollTabs.CanvasSize = UDim2.new(0, 0, 0, UiListTabs.AbsoluteContentSize.Y + 20)
    end)
    
    local Conteiner = Instance.new("Frame")
    Conteiner.Name = "Conteiner"
    Conteiner.Parent = Main
    Conteiner.ClipsDescendants = true
    Conteiner.BackgroundTransparency = 1
    Conteiner.BorderSizePixel = 0
    Conteiner.AnchorPoint = Vector2.new(1, 1) 
    Conteiner.Position = UDim2.new(1, - 10, 1, - 10)
    Conteiner.Size = UDim2.new(1, -88, 1, -50)
    Conteiner.ZIndex = Main.ZIndex
    
    local iconButton = Instance.new("TextButton")
    iconButton.Name = "ToggleButton"
    iconButton.Text = "Menu" -- Ícone de menu
    iconButton.Size = UDim2.new(0, 60, 0, 38)
    iconButton.Position = UDim2.new(0, 5, 0, 0) -- Posição ao lado do chat
    iconButton.AnchorPoint = Vector2.new(0, 0)
    iconButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    iconButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconButton.TextSize = 15
    iconButton.AutoButtonColor = false
    iconButton.Font = Enum.Font.SourceSansBold
    iconButton.Parent = screenGui
        
    local UiTop = Instance.new("UICorner")
    UiTop.CornerRadius = UDim.new(0, 12)
    UiTop.Parent = iconButton
        
    iconButton.MouseButton1Click:Connect(function()
            -- Alterna a visibilidade do frame
        Main.Visible = not Main.Visible
    end)
    
    Close.MouseButton1Click:Connect(function()
            -- Alterna a visibilidade do frame
        Main.Visible = not Main.Visible
        for _, child in ipairs(ConteinerFun:GetDescendants()) do
            if child.Name == "OptionsContainer" and child:IsA("Frame") then
                child.Visible = false
            end
        end
    end)
    
    local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        -- Verifica se a tecla Q foi pressionada e se o jogo não está processando o input
        if input.KeyCode == Window.Bind and not gameProcessed then
            Main.Visible = not Main.Visible
            for _, child in ipairs(ConteinerFun:GetDescendants()) do
                if child.Name == "OptionsContainer" and child:IsA("Frame") then
                    child.Visible = false
                end
            end
        end
    end)
    
    function imgui:CreateWindow(Window)
        -- ... (código anterior permanece o mesmo até a criação dos elementos) ...
    
        -- Adicionando as funções de modificação
        local windowAPI = {
            SetTitle = function(newTitle)
                Window.Title = newTitle
                if Title then
                    Title.Text = newTitle
                end
            end,
            
            SetTheme = function(newTheme)
                Window.Theme = newTheme
                local newConfig = self:GetThemeConfig(newTheme)
                
                -- Atualizar cores dos elementos
                Main.BackgroundColor3 = newConfig.Back
                Main.BackgroundTransparency = Window.Opacity and 0.080 or 0
                Top.BackgroundColor3 = newConfig.Primary
                HideT.BackgroundColor3 = newConfig.Primary
                Title.TextColor3 = newConfig.Text
                Title.Font = newConfig.Font
                Title.TextSize = newConfig.TitleSize
                -- Adicione mais atualizações de elementos conforme necessário
            end,
            
            SetOpacity = function(newOpacity)
                Window.Opacity = newOpacity
                Main.BackgroundTransparency = newOpacity and 0.080 or 0
            end
        }
    
        -- ... (restante do código original) ...
    
        -- Retornando tanto Tabs quanto a API de modificação
        return setmetatable(Tabs, {__index = windowAPI})
    end

    local Tabs = {
        CurrentTab = nil
    }
    
    function Tabs:AddTab(Tab)
        Tab.Icon = Tab.Icon or "rbxassetid://90991999539475"
        
        local TabV = {
            Hover = false,
            Active = false
        }
        
        local TabF = Instance.new("Frame")
        TabF.Name = "TabF"
        TabF.Parent = ScrollTabs
        TabF.ClipsDescendants = false
        TabF.BackgroundColor3 = Config.Primary
        TabF.BorderSizePixel = 0
        TabF.Size = UDim2.new(1, 0, 0, 55)
        TabF.ZIndex = ScrollTabs.ZIndex
        
        local UiTab = Instance.new("UICorner")
        UiTab.CornerRadius = UDim.new(0, 15)
        UiTab.Parent = TabF
        
        local Icon = Instance.new("ImageLabel")
        Icon.Name = "Icon"
        Icon.Parent = TabF  -- Corrigido: era TabButtonAC
        Icon.AnchorPoint = Vector2.new(0.5, 0.5)
        Icon.BackgroundTransparency = 1
        Icon.BorderSizePixel = 0
        Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
        Icon.Size = UDim2.new(0, 25, 0, 25)
        Icon.Image = Tab.Icon
        Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        Icon.ZIndex = TabF.ZIndex
        
        local ConteinerFun = Instance.new("Frame")
        ConteinerFun.Name = "ConteinerFun"
        ConteinerFun.Parent = Conteiner
        ConteinerFun.ClipsDescendants = false
        ConteinerFun.Visible = false
        ConteinerFun.Selectable = true
        ConteinerFun.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
        ConteinerFun.BackgroundTransparency = 1
        ConteinerFun.BorderSizePixel = 0
        ConteinerFun.Size = UDim2.new(1, 0, 1, 0)  -- Corrigido o tamanho
        ConteinerFun.ZIndex = Conteiner.ZIndex
        
        local Scroll = Instance.new("ScrollingFrame")
        Scroll.Name = "Scroll"
        Scroll.Parent = ConteinerFun
        Scroll.Size = UDim2.new(1, 0, 1, 0) 
        Scroll.BackgroundTransparency = 1
        Scroll.ClipsDescendants = false
        Scroll.BorderSizePixel = 0
        Scroll.ScrollBarThickness = 0
        Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        Scroll.CanvasSize = UDim2.new(0, 0, 0, 40)
        Scroll.ZIndex = ConteinerFun.ZIndex
        
        local UiListFuns = Instance.new("UIListLayout")
        UiListFuns.Parent = Scroll
        UiListFuns.Padding = UDim.new(0, 5)
        UiListFuns.SortOrder = Enum.SortOrder.LayoutOrder
        
        local UiPag = Instance.new("UIPadding")
        UiPag.Parent = Scroll
        UiPag.PaddingLeft = UDim.new(0, 5) 
        UiPag.PaddingRight = UDim.new(0, 5) 
        UiPag.PaddingTop = UDim.new(0, 0)
        UiPag.PaddingBottom = UDim.new(0, 0)
            
        local function TabUpd()
		    local contentSize = UiListFuns.AbsoluteContentSize
			Scroll.CanvasSize = UDim2.new(0, 0, 0, contentSize.Y + 15)
		end
        
        TabF.MouseEnter:Connect(function()
            TabV.Hover = true
        end)
        
        TabF.MouseLeave:Connect(function()
            TabV.Hover = false
        end)
        
        TabF.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                TabV:Activate()
            end
        end)
        
        function TabV:Activate()
            if not TabV.Active then
                if Tabs.CurrentTab and Tabs.CurrentTab ~= TabV then
                    Tabs.CurrentTab:Deactivate()
                end
                TabV.Active = true
                ConteinerFun.Visible = true
                Tabs.CurrentTab = TabV
            end
        end

        -- Substitua a função Deactivate existente por esta:
        function TabV:Deactivate()
            if TabV.Active then
                TabV.Active = false
                TabV.Hover = false
                ConteinerFun.Visible = false
                -- Fecha qualquer dropdown aberto nesta tab
                for _, child in ipairs(ConteinerFun:GetDescendants()) do
                    if child.Name == "OptionsContainer" and child:IsA("Frame") then
                        child.Visible = false
                    end
                end
            end
        end

        if Tabs.CurrentTab == nil then
			Tabs.CurrentTab = TabV
			TabV:Activate()
		end
	
        if not Tabs.CurrentTab then
            Tabs.CurrentTab = TabV
            TabV:Activate()
        end
            
        function TabV:AddSection(Section)
            Section.Title = Section.Title or "--=Example=--"
            
            local Sections = {}
            
            local Title = Instance.new("TextLabel")
            Title.Name = "Label"
            Title.Size = UDim2.new(1, - 10, 0, 25)
            Title.BackgroundTransparency = 1
            Title.Text = Section.Title
            Title.TextColor3 = Config.SubText
            Title.TextSize = Config.SubSize
            Title.Font = Config.Font
            Title.TextXAlignment = Enum.TextXAlignment.Center
            Title.Parent = Scroll
            
            Title:GetPropertyChangedSignal("AbsoluteSize"):Connect(TabUpd)
            TabUpd()
            
            return Sections
        end
        
        function TabV:AddCheckbox(Check)
            Check.Title = Check.Title or "Checkbox"
            Check.Default = Check.Default or false
            Check.Callback = Check.Callback or function() end
            
            local CheckBoxs = {}
            
            local FCheck = Instance.new("Frame")
            FCheck.Name = "FCheck"
            FCheck.Parent = Scroll
            FCheck.ClipsDescendants = true
            FCheck.BackgroundTransparency = 1
            FCheck.BorderSizePixel = 0
            FCheck.Size = UDim2.new(1, - 10, 0, 30)
            
            local CheckHolder = Instance.new("Frame")
            CheckHolder.Name = "CheckHolder"
            CheckHolder.Parent = FCheck
            CheckHolder.ClipsDescendants = true
            CheckHolder.BackgroundColor3 = Config.Primary
            CheckHolder.BackgroundTransparency = 0.5
            CheckHolder.AnchorPoint = Vector2.new(0, 0.5) 
            CheckHolder.Position = UDim2.new(0, 5, 0.5, 0)
            CheckHolder.BorderSizePixel = 0
            CheckHolder.Size = UDim2.new(0, 25, 0, 25)
            
            local UiCheck = Instance.new("UICorner")
            UiCheck.CornerRadius = UDim.new(0, 7)
            UiCheck.Parent = CheckHolder
            
            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Size = UDim2.new(1, - 50, 0, 25)
            Title.BackgroundTransparency = 1
            Title.Text = Check.Title
            Title.TextColor3 = Config.Text
            Title.AnchorPoint = Vector2.new(0, 0.5) 
            Title.Position = UDim2.new(0, 40, 0.5, 0)
            Title.TextSize = Config.SubSize
            Title.Font = Config.Font
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = FCheck
                        
            local icon = Instance.new("ImageLabel")
            icon.Name = "icon"
			icon.Parent = CheckHolder
			icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			icon.BackgroundTransparency = 1.000
			icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			icon.BorderSizePixel = 0
			icon.AnchorPoint = Vector2.new(0.5, 0.5) 
            icon.Position = UDim2.new(0.5, 0, 0.5, 0)
			icon.Size = UDim2.new(1, - 12, 1, - 12)
			
			local OnClick = Instance.new("TextButton")
			OnClick.Name = "OnClick"
			OnClick.Parent = FCheck
			OnClick.BackgroundTransparency = 1.000
			OnClick.BorderSizePixel = 0
			OnClick.Size = UDim2.new(1, 0, 1, 0)
			OnClick.AutoButtonColor = false
			OnClick.Text = ""
			OnClick.TextSize = 0.000
				
            local Value = Check.Default
            Check.Callback(Check.Default)
            
            FCheck:GetPropertyChangedSignal("AbsoluteSize"):Connect(TabUpd)
            TabUpd()
            
            if Check.Default then
                icon.Image = "rbxassetid://7733715400"
                CheckHolder.BackgroundTransparency = 0.1
            else
                icon.Image = ""
                CheckHolder.BackgroundTransparency = 0.5
            end
            
            OnClick.MouseButton1Click:Connect(function()
                Value = not Value
                Check.Callback(Value)
                if Value then
                    icon.Image = "rbxassetid://7733715400"
                    CheckHolder.BackgroundTransparency = 0.1
                else
                    icon.Image = ""
                    CheckHolder.BackgroundTransparency = 0.5
                end
            end)
            
            -- Dentro de TabV:AddCheckBox
            local checkboxAPI = {
                SetValue = function(newValue)
                    Value = newValue
                    Check.Callback(Value)
                    if Value then
                        icon.Image = "rbxassetid://7733715400"
                        CheckHolder.BackgroundTransparency = 0.1
                    else
                        icon.Image = ""
                        CheckHolder.BackgroundTransparency = 0.5
                    end
                end,
                GetValue = function()
                    return Value
                end,
                Update = function(newOptions)
                    if newOptions.title then
                        Title.Text = newOptions.title
                    end
                    if newOptions.default ~= nil then
                        checkboxAPI.SetValue(newOptions.default)
                    end
                end
            }
            
            return setmetatable(CheckBoxs, {__index = checkboxAPI})
            
        end

        function TabV:AddToggle(Toggle)
            Toggle.Title = Toggle.Title or "Toggle"
            Toggle.Default = Toggle.Default or false
            Toggle.Callback = Toggle.Callback or function() end
            
            local Toggles = {}
            local Value = Toggle.Default
            Toggle.Callback(Toggle.Default)
            
            local FToggle = Instance.new("Frame")
            FToggle.Name = "FToggle"
            FToggle.Parent = Scroll
            FToggle.ClipsDescendants = false
            FToggle.BackgroundTransparency = 1
            FToggle.BorderSizePixel = 0
            FToggle.Size = UDim2.new(1, - 10, 0, 35)
            
            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Size = UDim2.new(1, - 150, 0, 25)
            Title.BackgroundTransparency = 1
            Title.Text = Toggle.Title
            Title.TextColor3 = Config.Text
            Title.AnchorPoint = Vector2.new(0, 0.5) 
            Title.Position = UDim2.new(0, 5, 0.5, 0)
            Title.TextSize = Config.SubSize
            Title.Font = Config.Font
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = FToggle
            
            local Content = Instance.new("Frame")
            Content.Name = "Content"
            Content.Parent = FToggle
            Content.ClipsDescendants = false
            Content.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Content.BackgroundTransparency = 0
            Content.BorderSizePixel = 0
            Content.AnchorPoint = Vector2.new(1, 0.5) 
            Content.Position = UDim2.new(1, -5, 0.5, 0)
            Content.Size = UDim2.new(0, 45, 0, 20)
            
            local UiContent = Instance.new("UICorner")
            UiContent.CornerRadius = UDim.new(0, 50)
            UiContent.Parent = Content
           
			local Ball = Instance.new("Frame")
            Ball.Name = "Ball"
            Ball.Parent = Content
            Ball.ClipsDescendants = false
            Ball.BackgroundColor3 = Config.Secondary
            Ball.BackgroundTransparency = 0.5
            Ball.AnchorPoint = Vector2.new(0, 0.5) 
            Ball.BorderSizePixel = 0
            Ball.Size = UDim2.new(0, 20, 0, 20)
            
            local UiBall = Instance.new("UICorner")
            UiBall.CornerRadius = UDim.new(0, 100)
            UiBall.Parent = Ball
            
            local OnClick = Instance.new("TextButton")
			OnClick.Name = "OnClick"
			OnClick.Parent = FToggle
			OnClick.BackgroundTransparency = 1.000
			OnClick.BorderSizePixel = 0
			OnClick.Size = UDim2.new(1, 0, 1, 0)
			OnClick.AutoButtonColor = false
			OnClick.Text = ""
			OnClick.TextSize = 0.000
            
            FToggle:GetPropertyChangedSignal("AbsoluteSize"):Connect(TabUpd)
            TabUpd()

            local animationSpeed = 0.15
        
            -- Configuração inicial
            Ball.Position = Toggle.Default and UDim2.new(1, -20, 0.5, 0) or UDim2.new(0, 0, 0.5, 0)
            Ball.BackgroundTransparency = Toggle.Default and 0.1 or 0.5
        
            OnClick.MouseButton1Click:Connect(function()
                Value = not Value
                Toggle.Callback(Value)
                    
                if Value then
                    Ball.BackgroundTransparency = 0.1
                else
                    Ball.BackgroundTransparency = 0.5
                end
                    
                -- Correção: usar UDim2 para a posição final
                local targetPosition = Value and UDim2.new(1, -20, 0.5, 0) or UDim2.new(0, 0, 0.5, 0)
                    
                local ballTween = game:GetService("TweenService"):Create(
                    Ball,
                    TweenInfo.new(animationSpeed, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    { Position = targetPosition }  -- Correção: tabela com propriedade Position
                )
                    
                ballTween:Play()
            end)
            
            -- Dentro de TabV:AddToggle
            local toggleAPI = {
                SetValue = function(newValue)
                    Value = newValue
                    Toggle.Callback(Value)
                    
                    local targetPosition = Value and UDim2.new(1, -20, 0.5, 0) or UDim2.new(0, 0, 0.5, 0)
                    Ball.Position = targetPosition
                    Ball.BackgroundTransparency = Value and 0.1 or 0.5
                end,
                GetValue = function()
                    return Value
                end,
                Update = function(newOptions)
                    if newOptions.title then
                        Title.Text = newOptions.title
                    end
                    if newOptions.default ~= nil then
                        toggleAPI.SetValue(newOptions.default)
                    end
                end
            }
            
            return setmetatable(Toggles, {__index = toggleAPI})
        end
    
        function TabV:AddSlider(Slide)
            Slide.Title = Slide.Title or "Slide"
            Slide.Default = Slide.Default or 50
            Slide.Max = Slide.Max or 100
            Slide.Min = Slide.Min or 0
            Slide.Callback = Slide.Callback or function() end
            
            local Sliders = {}
            Slide.Callback(Slide.Default)
            
            local FSlider = Instance.new("Frame")
            FSlider.Name = "FSlider"
            FSlider.Parent = Scroll
            FSlider.ClipsDescendants = false
            FSlider.BackgroundTransparency = 1
            FSlider.BorderSizePixel = 0
            FSlider.Size = UDim2.new(1, - 10, 0, 35)
            
            local UIListLayout = Instance.new("UIListLayout")
            UIListLayout.Parent = FSlider
            UIListLayout.FillDirection = Enum.FillDirection.Horizontal  
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left  
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center  
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder  
            UIListLayout.Padding = UDim.new(0, 5)
                        
            local UiPagS = Instance.new("UIPadding")
            UiPagS.Parent = FSlider
            UiPagS.PaddingLeft = UDim.new(0, 5) 
            UiPagS.PaddingRight = UDim.new(0, 5) 
            UiPagS.PaddingTop = UDim.new(0, 0)
            UiPagS.PaddingBottom = UDim.new(0, 0)
            
            local CSlider = Instance.new("Frame")
            CSlider.Name = "CSlider"
            CSlider.Parent = FSlider
            CSlider.ClipsDescendants = false
            CSlider.BackgroundTransparency = 0
            CSlider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            CSlider.BorderSizePixel = 0
            CSlider.Size = UDim2.new(0, 190, 0, 30)
            
            local UiSlider = Instance.new("UICorner")
            UiSlider.CornerRadius = UDim.new(0, 12)
            UiSlider.Parent = CSlider
            
            local UiPag = Instance.new("UIPadding")
            UiPag.Parent = CSlider
            UiPag.PaddingLeft = UDim.new(0, 5) 
            UiPag.PaddingRight = UDim.new(0, 0) 
            UiPag.PaddingTop = UDim.new(0, 3)
            UiPag.PaddingBottom = UDim.new(0, 3)
            
            local OnClick = Instance.new("TextButton")
            OnClick.Name = "OnClick"
            OnClick.Parent = CSlider
            OnClick.BackgroundTransparency = 0.1
            OnClick.BackgroundColor3 = Config.Secondary
            OnClick.BorderSizePixel = 0
            OnClick.AutoButtonColor = false
            OnClick.AnchorPoint = Vector2.new(0, 0.5)
            OnClick.Position = UDim2.new(0, 0, 0.5, 0)
			OnClick.Text = ""
			OnClick.TextSize = 0.000
            OnClick.Size = UDim2.new(0, 15, 1, - 5)
            
            local UiOnSlider = Instance.new("UICorner")
            UiOnSlider.CornerRadius = UDim.new(0, 5)
            UiOnSlider.Parent = OnClick
            
            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Size = UDim2.new(1, - 5, 0, 25)
            Title.BackgroundTransparency = 1
            Title.Text = Slide.Title
            Title.TextColor3 = Config.Text
            Title.AnchorPoint = Vector2.new(0, 0.5) 
            Title.TextSize = Config.SubSize
            Title.Font = Config.Font
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = FSlider
            
            local Value = Instance.new("TextLabel")
            Value.Name = "Value"
            Value.Size = UDim2.new(1, 0, 0, 25)
            Value.Position = UDim2.new(0.5, 0, 0.5, 0)
            Value.BackgroundTransparency = 1
            Value.Text = Slide.Default
            Value.TextColor3 = Config.Text
            Value.AnchorPoint = Vector2.new(0.5, 0.5) 
            Value.TextSize = Config.SubSize - 1
            Value.Font = Config.Font
            Value.TextXAlignment = Enum.TextXAlignment.Center
            Value.Parent = CSlider
            Value.ZIndex = OnClick.ZIndex + 1 
            
            FSlider:GetPropertyChangedSignal("AbsoluteSize"):Connect(TabUpd)
            TabUpd()

            local dragging = false
            local startDragX = 0
            local startClickX = 0
            
            -- Configurações de margem (agora separadas)
            local MARGIN_LEFT = 8  -- 5 pixels na esquerda
            local MARGIN_RIGHT = 3 -- 5 pixels na direita
            local BUTTON_WIDTH = OnClick.AbsoluteSize.X
            
            -- Área útil do slider (descontando margens e largura do botão)
            local sliderMinX = MARGIN_LEFT
            local sliderMaxX = CSlider.AbsoluteSize.X - MARGIN_RIGHT - BUTTON_WIDTH
            local sliderWidth = CSlider.AbsoluteSize.X - MARGIN_LEFT - MARGIN_RIGHT - BUTTON_WIDTH
            
            -- Posição inicial proporcional ao valor Default
            local initialScale = (Slide.Default - Slide.Min) / (Slide.Max - Slide.Min)
            local initialPos = sliderMinX + (initialScale * sliderWidth)
            OnClick.Position = UDim2.new(0, initialPos, 0.5, 0)
            OnClick.AnchorPoint = Vector2.new(0.5, 0.5)
            Value.Text = tostring(math.floor(Slide.Default))
            
            -- Função para atualizar o slider
            local function UpdateSlider()
                local currentPos = OnClick.Position.X.Offset - MARGIN_LEFT
                local scale = math.clamp(currentPos / sliderWidth, 0, 1)
                local value = math.floor(Slide.Min + (Slide.Max - Slide.Min) * scale)
                Value.Text = tostring(value)
                Slide.Callback(value)
            end
            
            -- Início do arrasto
            OnClick.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    startDragX = input.Position.X
                    startClickX = OnClick.Position.X.Offset
                end
            end)
            
            -- Durante o arrasto
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local deltaX = input.Position.X - startDragX
                    local newPos = startClickX + deltaX
                    
                    -- Limites com margens específicas para cada lado
                    newPos = math.clamp(newPos, MARGIN_LEFT, CSlider.AbsoluteSize.X - MARGIN_RIGHT - BUTTON_WIDTH)
                    
                    OnClick.Position = UDim2.new(0, newPos, 0.5, 0)
                    UpdateSlider()
                end
            end)
            
            -- Fim do arrasto
            game:GetService("UserInputService").InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            
            -- Dentro de TabV:AddSlider
            local sliderAPI = {
                SetValue = function(newValue)
                    newValue = math.clamp(newValue, Slide.Min, Slide.Max)
                    local scale = (newValue - Slide.Min) / (Slide.Max - Slide.Min)
                    local newPos = sliderMinX + (scale * sliderWidth)
                    OnClick.Position = UDim2.new(0, newPos, 0.5, 0)
                    Value.Text = tostring(math.floor(newValue))
                    Slide.Callback(newValue)
                end,
                GetValue = function()
                    return tonumber(Value.Text)
                end,
                Update = function(newOptions)
                    if newOptions.min then Slide.Min = newOptions.min end
                    if newOptions.max then Slide.Max = newOptions.max end
                    if newOptions.default then
                        sliderAPI.SetValue(newOptions.default)
                    end
                end
            }
            
            return setmetatable(Sliders, {__index = sliderAPI})
        end
        
        function TabV:AddColorpicker(ColorPicker)
            ColorPicker.Title = ColorPicker.Title or "ColorPicker"
            ColorPicker.Default = ColorPicker.Default or Color3.fromRGB(128, 28, 28)
            ColorPicker.Callback = ColorPicker.Callback or function() end
            
            local ColorPickers = {}
            ColorPicker.Callback(ColorPicker.Default)
            
            local FColor = Instance.new("Frame")
            FColor.Name = "FColor"
            FColor.Parent = Scroll
            FColor.ClipsDescendants = false
            FColor.BackgroundTransparency = 1
            FColor.BorderSizePixel = 0
            FColor.Size = UDim2.new(1, - 10, 0, 35)
            
            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Size = UDim2.new(1, - 5, 0, 25)
            Title.BackgroundTransparency = 1
            Title.Text = ColorPicker.Title
            Title.TextColor3 = Config.Text
            Title.AnchorPoint = Vector2.new(0, 0.5) 
            Title.Position = UDim2.new(0, 5, 0.5, 0)
            Title.TextSize = Config.SubSize
            Title.Font = Config.Font
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = FColor
            
            local View = Instance.new("Frame")
            View.Name = "View"
            View.Parent = FColor
            View.ClipsDescendants = false
            View.AnchorPoint = Vector2.new(1, 0.5) 
            View.BackgroundTransparency = 0
            View.BackgroundColor3 = ColorPicker.Default
            View.BorderSizePixel = 0
            View.Position = UDim2.new(1, -5, 0.5, 0)
            View.Size = UDim2.new(0, 28, 0, 28)
            
            local UiView = Instance.new("UICorner")
            UiView.CornerRadius = UDim.new(0, 7)
            UiView.Parent = View
            
            local OnClick = Instance.new("TextButton")
            OnClick.Name = "OnClick"
            OnClick.Parent = FColor
            OnClick.BackgroundTransparency = 1
            OnClick.BorderSizePixel = 0
            OnClick.AutoButtonColor = false
			OnClick.Text = ""
			OnClick.TextSize = 0.000
            OnClick.Size = UDim2.new(1, 0, 1, 0)
            
            -- CODIGO DESIGN COLOR PICKER 
            
            local FMainColor = Instance.new("Frame")
            FMainColor.Name = "FMainColor"
            FMainColor.Parent = screenGui
            FMainColor.ClipsDescendants = true
            FMainColor.Visible = false
            FMainColor.Active = true 
            FMainColor.Draggable = true
            FMainColor.BackgroundTransparency = 0
            FMainColor.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
            FMainColor.BorderSizePixel = 0
            FMainColor.Size = UDim2.new(0, 250, 0, 140 + 16 + 23)
            FMainColor.AnchorPoint = Vector2.new(0.5, 0.5) 
            FMainColor.Position = UDim2.new(0.5, 0, 0.5, 0)
            FMainColor.ZIndex = Scroll.ZIndex + 3
            
            local DropShadowHolder = Instance.new("Frame")
        	local DropShadow = Instance.new("ImageLabel")
        	
        	DropShadowHolder.Name = "DropShadowHolder"
        	DropShadowHolder.Parent = FMainColor
        	DropShadowHolder.ClipsDescendants = false
        	DropShadowHolder.BackgroundTransparency = 1.000
        	DropShadowHolder.BorderSizePixel = 0
        	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
        	DropShadowHolder.ZIndex = 0
        
        	DropShadow.Name = "DropShadow"
        	DropShadow.Parent = DropShadowHolder
        	DropShadow.Active = false
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
            
            local UiMainColor = Instance.new("UICorner")
            UiMainColor.CornerRadius = UDim.new(0, 18)
            UiMainColor.Parent = FMainColor
            
            local TopColor = Instance.new("Frame")
            TopColor.Name = "TopColor"
            TopColor.Parent = FMainColor
            TopColor.ClipsDescendants = 0
            TopColor.BackgroundTransparency = 1
            TopColor.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TopColor.BorderSizePixel = 0
            TopColor.Size = UDim2.new(1, 0, 0, 30)
            TopColor.AnchorPoint = Vector2.new(0, 0) 
            TopColor.Position = UDim2.new(0, 0, 0, 5)
            
            local TLine = Instance.new("Frame")
            TLine.Name = "TLine"
            TLine.Parent = TopColor
            TLine.BackgroundTransparency = 0
            TLine.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TLine.BorderSizePixel = 0
            TLine.Size = UDim2.new(1, 0, 0, 1)
            TLine.AnchorPoint = Vector2.new(0, 1) 
            TLine.Position = UDim2.new(0, 0, 1, 4)
            
            local NewView = Instance.new("Frame")
            NewView.Name = "NewView"
            NewView.Parent = TopColor
            NewView.ClipsDescendants = true
            NewView.BackgroundTransparency = 0
            NewView.BackgroundColor3 = ColorPicker.Default
            NewView.BorderSizePixel = 0
            NewView.Size = UDim2.new(0, 70, 0, 25)
            NewView.AnchorPoint = Vector2.new(0, 0.5) 
            NewView.Position = UDim2.new(0, 8, 0.5, 0)
            
            local UiView2 = Instance.new("UICorner")
            UiView2.CornerRadius = UDim.new(0, 10)
            UiView2.Parent = NewView
            
            local LastColor = Instance.new("Frame")
            LastColor.Name = "LastColor"
            LastColor.Parent = TopColor
            LastColor.ClipsDescendants = true
            LastColor.BackgroundTransparency = 0
            LastColor.BackgroundColor3 = ColorPicker.Default
            LastColor.BorderSizePixel = 0
            LastColor.Size = UDim2.new(0, 60, 0, 25)
            LastColor.AnchorPoint = Vector2.new(0, 0.5) 
            LastColor.Position = UDim2.new(0, 16 + 70, 0.5, 0)
            
            local UiLastColor = Instance.new("UICorner")
            UiLastColor.CornerRadius = UDim.new(0, 10)
            UiLastColor.Parent = LastColor
            
            local CConteiner = Instance.new("Frame")
            CConteiner.Name = "CConteiner"
            CConteiner.Parent = FMainColor
            CConteiner.ClipsDescendants = true
            CConteiner.BackgroundTransparency = 0
            CConteiner.BorderSizePixel = 0
            CConteiner.Size = UDim2.new(1, -10, 0, 100)
            CConteiner.AnchorPoint = Vector2.new(0.5, 0) 
            CConteiner.Position = UDim2.new(0.5, 0, 0, 40)
            
            local UiCConteiner = Instance.new("UICorner")
            UiCConteiner.CornerRadius = UDim.new(0, 15)
            UiCConteiner.Parent = CConteiner
            
            local UIGradient = Instance.new("UIGradient")
            UIGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
                ColorSequenceKeypoint.new(1.00, ColorPicker.Default)
            }
			UIGradient.Rotation = 0
			UIGradient.Parent = CConteiner

            local BlackOverlay = Instance.new("ImageLabel")
			local UICorner_5 = Instance.new("UICorner")
			local Cursor = Instance.new("ImageLabel")
			local CSlider = Instance.new("ImageLabel")
			local UIGradient_5 = Instance.new("UIGradient")
			
			BlackOverlay.Name = "BlackOverlay"
			BlackOverlay.Parent = CConteiner
			BlackOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BlackOverlay.BackgroundTransparency = 1.000
			BlackOverlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BlackOverlay.BorderSizePixel = 0
			BlackOverlay.Size = UDim2.new(1, 0, 1, 0)
			BlackOverlay.ZIndex = 1
			BlackOverlay.Image = "rbxassetid://5107152095"
			BlackOverlay.ImageColor3 = Color3.fromRGB(255, 0, 4)

			UICorner_5.CornerRadius = UDim.new(0, 15)
			UICorner_5.Parent = BlackOverlay

			Cursor.Name = "Cursor"
			Cursor.Parent = CConteiner
			Cursor.AnchorPoint = Vector2.new(0, 0)
			Cursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Cursor.BackgroundTransparency = 1.000
			Cursor.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Cursor.BorderSizePixel = 0
			Cursor.Position = UDim2.new(0.5, 0, 0.5, 0)
			Cursor.Size = UDim2.new(0, 8, 0, 8)
			Cursor.ZIndex = 2
			Cursor.Image = "rbxassetid://5100115962"
			
			local ColorSlider = Instance.new("Frame")
			ColorSlider.Name = "ColorSlider"
			ColorSlider.Parent = FMainColor
			ColorSlider.AnchorPoint = Vector2.new(0.5, 0)
			ColorSlider.BackgroundColor3 = Color3.fromRGB(245, 246, 250)
			ColorSlider.BackgroundTransparency = 0
			ColorSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ColorSlider.BorderSizePixel = 0
			ColorSlider.Position = UDim2.new(0.5, 0, 0, 140 + 8)
			ColorSlider.Size = UDim2.new(1, - 10, 0, 18)
				
			CSlider.Name = "CSlider"
			CSlider.Parent = ColorSlider
			CSlider.AnchorPoint = Vector2.new(0, 0.5)
			CSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CSlider.BackgroundTransparency = 1.000
			CSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			CSlider.BorderSizePixel = 0
			CSlider.Position = UDim2.new(0.5, 0, 0.5, 0)
			CSlider.Size = UDim2.new(0, 10, 0, 10)
			CSlider.ImageColor3 = Color3.fromRGB(0, 0, 0)
			CSlider.ZIndex = 2
			CSlider.Image = "rbxassetid://5100115962"
				
			local UiCSlider = Instance.new("UICorner")
            UiCSlider.CornerRadius = UDim.new(0, 8)
            UiCSlider.Parent = ColorSlider
			
			UIGradient_5.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
				ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 4)),
				ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
				ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 0, 255)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
			}
			UIGradient_5.Parent = ColorSlider
			
            -- FIM
            
            -- INICIO CODIGO COLOR PICKER
            
            local players = game:service('Players');
            local player = players.LocalPlayer;
            local RunService = game:service('RunService');
            local UserInputService = game:GetService("UserInputService")
            
            local draggingColor = false
			local draggingCConteiner = false
			local hue = 0
			local sat = 1
			local brightness = 1
			local color3 = Color3.fromHSV(hue, sat, brightness)
			local mouse = player:GetMouse()
			local stepped = RunService.Stepped
			local con
            
            local function safeClamp(value, min, max)
				if min > max then
					min, max = max, min
				end
				return math.clamp(value, min, max)
			end

				-- Função para atualizar a cor do CConteiner (arrasto do CConteiner)
			local function updateCConteinerColor(mouseX, mouseY)
                if CConteiner and CConteiner.AbsolutePosition and CConteiner.AbsoluteSize then
                    local CConteinerPosition = CConteiner.AbsolutePosition
                    local CConteinerSize = CConteiner.AbsoluteSize
            
                    -- Garantindo que o mouse X/Y esteja dentro dos limites do CConteiner
                    if mouseX >= CConteinerPosition.X and mouseY >= CConteinerPosition.Y then
                        -- Apenas invertemos a direção horizontal (sat) mantendo a vertical (brightness)
                        sat = safeClamp((mouseX - CConteinerPosition.X) / CConteinerSize.X, 0, 1)
                        brightness = 1 - safeClamp((mouseY - CConteinerPosition.Y) / CConteinerSize.Y, 0, 1)
                        
                        color3 = Color3.fromHSV(hue, sat, brightness)
                        View.BackgroundColor3 = color3
                        NewView.BackgroundColor3 = color3
                        ColorPicker.Callback(color3)
                        
                        -- Atualiza a posição do cursor corretamente
                        local CConteinerX = safeClamp(mouseX - CConteinerPosition.X, 2, CConteinerSize.X - 2)
                        local CConteinerY = safeClamp(mouseY - CConteinerPosition.Y, 2, CConteinerSize.Y - 2)
                        Cursor.Position = UDim2.fromOffset(CConteinerX - 4, CConteinerY - 4)
                    end
                end
            end
            
            local function updateColorSlider(mouseX)
				-- Verifique se o "Color" e "ColorSlider" estão definidos
				if ColorSlider and ColorSlider.AbsolutePosition and ColorSlider.AbsoluteSize then
					local colorPosition = ColorSlider.AbsolutePosition
					local colorSize = ColorSlider.AbsoluteSize

					-- Garantindo que o mouse X esteja dentro dos limites do slider
					hue = safeClamp((mouseX - colorPosition.X) / colorSize.X, 0, 1)

					-- Atualiza o gradiente do slider de cor com base no valor de hue
					UIGradient.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)),
						ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 1))
					}

					-- Atualiza a posição do ColorSlider apenas na horizontal
					local xOffset = safeClamp(mouseX - colorPosition.X, 0, colorSize.X - 3)
					CSlider.Position = UDim2.new(0, xOffset, 0.5, 0)

						-- Atualiza a cor do fundo e chama a função de callback
					color3 = Color3.fromHSV(hue, sat, brightness)
					View.BackgroundColor3 = color3
					NewView.BackgroundColor3 = color3
					ColorPicker.Callback(color3)
				end
			end

			-- Evento de Input no CConteiner (arrasto)
			CConteiner.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					draggingCConteiner = true
					FMainColor.Draggable = false
				end
			end)

			-- Finaliza o arrasto
			CConteiner.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					draggingCConteiner = false
					FMainColor.Draggable = true
				end
			end)
			
			RunService.Heartbeat:Connect(function()
				if draggingCConteiner then
					-- Verifique se o mouse está dentro da área válida
					local mouseX, mouseY = mouse.X, mouse.Y

					if CConteiner and CConteiner.AbsolutePosition and CConteiner.AbsoluteSize then
						local CConteinerPosition = CConteiner.AbsolutePosition
						local CConteinerSize = CConteiner.AbsoluteSize

						-- Calcular as posições X e Y dentro dos limites do CConteiner
						local CConteinerX = safeClamp(mouseX - CConteinerPosition.X, 2, CConteinerSize.X - 2)
						local CConteinerY = safeClamp(mouseY - CConteinerPosition.Y, 2, CConteinerSize.Y - 2)

						-- Atualiza a posição do cursor
						if Cursor then
							Cursor.Position = UDim2.fromOffset(CConteinerX - 4, CConteinerY - 4)
						end
						-- Atualiza a cor do CConteiner
						updateCConteinerColor(mouseX, mouseY)
					end
				end
			end)
	
			-- Evento de Input no ColorSlider (arrasto)
			ColorSlider.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					draggingColor = true
					FMainColor.Draggable = false
				end
			end)

				-- Finaliza o arrasto do ColorSlider
			ColorSlider.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					draggingColor = false
					FMainColor.Draggable = true
				end
			end)

				-- Atualiza a posição do ColorSlider baseado no movimento do mouse
			RunService.Heartbeat:Connect(function()
				if draggingColor then
						-- Pega a posição X do mouse, mas apenas dentro dos limites horizontais do Color
					local mouseX = safeClamp(mouse.X, ColorSlider.AbsolutePosition.X, ColorSlider.AbsolutePosition.X + ColorSlider.AbsoluteSize.X)

						-- Atualiza o ColorSlider
					updateColorSlider(mouseX)
				end
			end)

				-- Quando o mouse for clicado dentro do Color (gradiente), o ColorSlider se move para a posição do clique
			ColorSlider.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local mouseX = safeClamp(mouse.X, ColorSlider.AbsolutePosition.X, ColorSlider.AbsolutePosition.X + ColorSlider.AbsoluteSize.X)

						-- Atualiza a posição do ColorSlider com base no clique
					updateColorSlider(mouseX)
				end
			end)
		
            local UiOpen = false
            
            OnClick.MouseButton1Click:Connect(function()
                UiOpen = not UiOpen
                FMainColor.Visible = UiOpen
            end)
            
            -- Dentro de TabV:AddColorpicker
                local colorpickerAPI = {
                    RainbowMode = false,
                    RainbowSpeed = 1,
                    StartRainbow = function(speed)
                        rainbowAPI.RainbowMode = true
                        rainbowAPI.RainbowSpeed = speed or 1
                        
                        local hue = 0
                        while rainbowAPI.RainbowMode and View do
                            hue = (hue + 0.01 * rainbowAPI.RainbowSpeed) % 1
                            color3 = Color3.fromHSV(hue, sat, brightness)
                            View.BackgroundColor3 = color3
                            NewView.BackgroundColor3 = color3
                            ColorPicker.Callback(color3)
                            
                            UIGradient.Color = ColorSequence.new{
                                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
                                ColorSequenceKeypoint.new(1.00, Color3.fromHSV(hue, 1, 1))
                            }
                            
                            wait(0.05)
                        end
                    end,
                    StopRainbow = function()
                        rainbowAPI.RainbowMode = false
                    end,
                    SetColor = function(color)
                        if typeof(color) == "Color3" then
                            View.BackgroundColor3 = color
                        NewView.BackgroundColor3 = color
                        ColorPicker.Callback(color)
                        
                        UIGradient.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
                            ColorSequenceKeypoint.new(1.00, color)
                        }
                    end
                end,
                GetValue = function()
                    return View.BackgroundColor3
                end,
                Update = function(newOptions)
                    if newOptions.title then
                        Title.Text = newOptions.title
                    end
                    if newOptions.default then
                        colorpickerAPI.SetColor(newOptions.default)
                    end
                end
            }
            
            return setmetatable(ColorPickers, {__index = colorpickerAPI})
        end
        
        function TabV:AddDropdown(Dropdown)
                Dropdown.Title = Dropdown.Title or "Dropdown"
                Dropdown.Default = Dropdown.Default or "Select an option"
                Dropdown.Options = Dropdown.Options or {"Option 1", "Option 2"}
                Dropdown.Callback = Dropdown.Callback or function() end
            
                local Drops = {}
                
                local FDrop = Instance.new("Frame")
                FDrop.Name = "FDrop"
                FDrop.Parent = Scroll
                FDrop.ClipsDescendants = false
                FDrop.BackgroundTransparency = 1
                FDrop.BorderSizePixel = 0
                FDrop.Size = UDim2.new(1, -10, 0, 35)
                
                local Title = Instance.new("TextLabel")
                Title.Name = "Title"
                Title.Size = UDim2.new(1, -5, 0, 25)
                Title.BackgroundTransparency = 1
                Title.Text = Dropdown.Title
                Title.TextColor3 = Config.Text
                Title.AnchorPoint = Vector2.new(0, 0.5) 
                Title.Position = UDim2.new(0, 5, 0.5, 0)
                Title.TextSize = Config.SubSize
                Title.Font = Config.Font
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.Parent = FDrop
                
                local DContent = Instance.new("Frame")
                DContent.Name = "DContent"
                DContent.Parent = FDrop
                DContent.ClipsDescendants = false
                DContent.BackgroundTransparency = 0
                DContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                DContent.BorderSizePixel = 0
                DContent.AnchorPoint = Vector2.new(1, 0.5) 
                DContent.Position = UDim2.new(1, 0, 0.5, 0)
                DContent.Size = UDim2.new(0, 190, 0, 30)
                
                local UiContent = Instance.new("UICorner")
                UiContent.CornerRadius = UDim.new(0, 10)
                UiContent.Parent = DContent
                
                local HideC = Instance.new("Frame")
                HideC.Name = "HideC"
                HideC.Parent = DContent
                HideC.ClipsDescendants = false
                HideC.Visible = false
                HideC.BackgroundTransparency = 0
                HideC.BackgroundColor3 = DContent.BackgroundColor3
                HideC.BorderSizePixel = 0
                HideC.AnchorPoint = Vector2.new(0, 1) 
                HideC.Position = UDim2.new(0, 0, 1, 0)
                HideC.Size = UDim2.new(1, 0, 0, 8)
                
                local HolderIcon = Instance.new("Frame")
                HolderIcon.Name = "HolderIcon"
                HolderIcon.Parent = DContent
                HolderIcon.ClipsDescendants = false
                HolderIcon.BackgroundTransparency = 0
                HolderIcon.BackgroundColor3 = Config.Secondary
                HolderIcon.BorderSizePixel = 0
                HolderIcon.AnchorPoint = Vector2.new(1, 0.5) 
                HolderIcon.Position = UDim2.new(1, 0, 0.5, 0)
                HolderIcon.Size = UDim2.new(0, 30, 0, 30)
                
                local UiIcon = Instance.new("UICorner")
                UiIcon.CornerRadius = UDim.new(0, 10)
                UiIcon.Parent = HolderIcon
                
                local IHide1 = Instance.new("Frame")
                IHide1.Name = "IHide1"
                IHide1.Parent = HolderIcon
                IHide1.ClipsDescendants = false
                IHide1.BackgroundTransparency = 0
                IHide1.BackgroundColor3 = Config.Secondary
                IHide1.BorderSizePixel = 0
                IHide1.AnchorPoint = Vector2.new(0, 0.5) 
                IHide1.Position = UDim2.new(0, 0, 0.5, 0)
                IHide1.Size = UDim2.new(0, 8, 1, 0)
                
                local IHide2 = Instance.new("Frame")
                IHide2.Name = "IHide2"
                IHide2.Parent = HolderIcon
                IHide2.ClipsDescendants = false
                IHide2.Visible = false
                IHide2.BackgroundTransparency = 0
                IHide2.BackgroundColor3 = Config.Secondary
                IHide2.BorderSizePixel = 0
                IHide2.AnchorPoint = Vector2.new(0, 1) 
                IHide2.Position = UDim2.new(0, 0, 1, 0)
                IHide2.Size = UDim2.new(1, 0, 0, 8)
                
                local Icon = Instance.new("TextLabel")
                Icon.Name = "Icon"
                Icon.Parent = HolderIcon
                Icon.BackgroundTransparency = 1
                Icon.BorderSizePixel = 0
                Icon.AnchorPoint = Vector2.new(0.5, 0.5)
                Icon.Size = UDim2.new(1, -10, 1, -10)
                Icon.Position = UDim2.new(0.5, -2, 0.5, 0)
                Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
                Icon.Text = "▼"
                Icon.TextSize = 12
                Icon.ZIndex = IHide1.ZIndex + 1
                
                local DValue = Instance.new("TextLabel")
                DValue.Name = "DValue"
                DValue.Size = UDim2.new(1, -5, 0, 25)
                DValue.BackgroundTransparency = 1
                DValue.Text = Dropdown.Default
                DValue.TextColor3 = Config.Text
                DValue.AnchorPoint = Vector2.new(0, 0.5) 
                DValue.Position = UDim2.new(0, 5, 0.5, 0)
                DValue.TextSize = Config.SubSize
                DValue.Font = Config.Font
                DValue.TextXAlignment = Enum.TextXAlignment.Left
                DValue.Parent = DContent
                
                -- Cria o container de opções (parenteado ao ScreenGui)
                local OptionsContainer = Instance.new("Frame")
                OptionsContainer.Name = "DropdownOptionsContainer"
                OptionsContainer.Parent = screenGui
                OptionsContainer.ClipsDescendants = true
                OptionsContainer.BackgroundTransparency = 0
                OptionsContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                OptionsContainer.BorderSizePixel = 0
                OptionsContainer.Size = UDim2.new(0, DContent.AbsoluteSize.X, 0, 0)
                OptionsContainer.Visible = false
                OptionsContainer.ZIndex = Main.ZIndex + 5 -- Garante que fique acima de tudo
                
                local UiCB = Instance.new("UICorner")
                UiCB.CornerRadius = UDim.new(0, 15)
                UiCB.Parent = OptionsContainer
                
                local HideOC = Instance.new("Frame")
                HideOC.Name = "DropdownHideOC"
                HideOC.Parent = OptionsContainer
                HideOC.ClipsDescendants = true
                HideOC.BackgroundTransparency = 0
                HideOC.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                HideOC.BorderSizePixel = 0
                HideOC.Size = UDim2.new(1, 0, 0, 10)
                
                local DLine = Instance.new("Frame")
                DLine.Name = "DropdownDLine"
                DLine.Parent = HideOC
                DLine.ClipsDescendants = true
                DLine.BackgroundTransparency = 0
                DLine.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
                DLine.BorderSizePixel = 0
                DLine.Size = UDim2.new(1, 0, 0, 1)
                
                local OptionsList = Instance.new("ScrollingFrame")
                OptionsList.Name = "OptionsList"
                OptionsList.Parent = OptionsContainer
                OptionsList.BackgroundTransparency = 1
                OptionsList.BorderSizePixel = 0
                OptionsList.Size = UDim2.new(1, 0, 1, 0)
                OptionsList.ScrollBarThickness = 0
                OptionsList.ScrollBarImageColor3 = Config.Primary
                OptionsList.AutomaticCanvasSize = Enum.AutomaticSize.Y
                OptionsList.CanvasSize = UDim2.new(0, 0, 0, 0)
                OptionsList.ZIndex = OptionsContainer.ZIndex + 2
                
                local UIListLayout = Instance.new("UIListLayout")
                UIListLayout.Parent = OptionsList
                UIListLayout.Padding = UDim.new(0, 3)
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                
                local UIPadding = Instance.new("UIPadding")
                UIPadding.Parent = OptionsList
                UIPadding.PaddingLeft = UDim.new(0, 5)
                UIPadding.PaddingRight = UDim.new(0, 5)
                UIPadding.PaddingTop = UDim.new(0, 5)
                UIPadding.PaddingBottom = UDim.new(0, 5)
                
                -- Substitua a função updateContainerPosition por esta:
                local function updateContainerPosition()
                    local absolutePosition = DContent.AbsolutePosition
                    local absoluteSize = DContent.AbsoluteSize
                    
                    -- Ajuste para ficar exatamente encostado (removendo o +5 do espaçamento)
                    OptionsContainer.Position = UDim2.new(
                        0, absolutePosition.X,
                        0, absolutePosition.Y + absoluteSize.Y
                    )
                    
                    -- Garantir que a largura seja igual ao DContent
                    OptionsContainer.Size = UDim2.new(0, DContent.AbsoluteSize.X, 0, OptionsContainer.Size.Y.Offset)
                end
                
                -- Função para criar os botões de opção
                local function createOptions()
                    for _, option in ipairs(Dropdown.Options) do
                    local optionButton = Instance.new("TextButton")
                    optionButton.Name = "OptionButton"
                    optionButton.Parent = OptionsList
                    optionButton.BackgroundTransparency = 1
                    optionButton.BorderSizePixel = 0
                    optionButton.Size = UDim2.new(1, -10, 0, 25)
                    optionButton.Text = option
                    optionButton.TextColor3 = Config.Text
                    optionButton.TextSize = Config.SubSize
                    optionButton.Font = Config.Font
                    optionButton.TextXAlignment = Enum.TextXAlignment.Left
                    optionButton.AutoButtonColor = false
                    
                    local hoverFrame = Instance.new("Frame")
                    hoverFrame.Name = "HoverFrame"
                    hoverFrame.Parent = optionButton
                    hoverFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    hoverFrame.BackgroundTransparency = 0.9
                    hoverFrame.BorderSizePixel = 0
                    hoverFrame.Size = UDim2.new(1, 0, 1, 0)
                    hoverFrame.ZIndex = -1
                    
                    local UICorner = Instance.new("UICorner")
                    UICorner.CornerRadius = UDim.new(0, 5)
                    UICorner.Parent = hoverFrame
                    
                    optionButton.MouseEnter:Connect(function()
                        hoverFrame.BackgroundTransparency = 0.7
                    end)
                    
                    optionButton.MouseLeave:Connect(function()
                        hoverFrame.BackgroundTransparency = 0.9
                    end)
                    
                    optionButton.MouseButton1Click:Connect(function()
                        DValue.Text = option
                        Dropdown.Callback(option)
                        OptionsContainer.Visible = false
                        HideC.Visible = false
                        IHide2.Visible = false
                        Icon.Text = "▼"
                    end)
                end
            end
            
            -- Criar as opções iniciais
            createOptions()
            
            -- Atualizar o tamanho do container baseado no número de opções
            local function updateContainerSize()
                local optionCount = #Dropdown.Options
                local maxHeight = 150 -- Altura máxima antes de ativar o scroll
                local optionHeight = 30 -- Altura de cada opção
                local padding = 10 -- Padding total (top + bottom)
                
                local totalHeight = math.min(optionCount * optionHeight + padding, maxHeight)
                OptionsContainer.Size = UDim2.new(0, DContent.AbsoluteSize.X, 0, 60)
            end
            
            -- Toggle do dropdown
            local function toggleDropdown()
                OptionsContainer.Visible = not OptionsContainer.Visible
                IHide2.Visible = OptionsContainer.Visible
                HideC.Visible = OptionsContainer.Visible
                if OptionsContainer.Visible then
                    Icon.Text = "▲"
                    updateContainerPosition()
                    updateContainerSize()
                else
                    Icon.Text = "▼"
                end
            end
            
            -- Conectar eventos de clique
            local dropdownButton = Instance.new("TextButton")
            dropdownButton.Name = "DropdownButton"
            dropdownButton.Parent = DContent
            dropdownButton.BackgroundTransparency = 1
            dropdownButton.BorderSizePixel = 0
            dropdownButton.Size = UDim2.new(1, 0, 1, 0)
            dropdownButton.Text = ""
            dropdownButton.ZIndex = 10
            
            dropdownButton.MouseButton1Click:Connect(toggleDropdown)
            
            -- Fechar dropdown quando clicar fora
            local function closeDropdown(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local mousePos = input.Position
                    local isOverContainer = OptionsContainer.Visible and 
                                           mousePos.X >= OptionsContainer.AbsolutePosition.X and 
                                           mousePos.X <= OptionsContainer.AbsolutePosition.X + OptionsContainer.AbsoluteSize.X and
                                           mousePos.Y >= OptionsContainer.AbsolutePosition.Y and 
                                           mousePos.Y <= OptionsContainer.AbsolutePosition.Y + OptionsContainer.AbsoluteSize.Y
                                           
                    local isOverButton = mousePos.X >= DContent.AbsolutePosition.X and 
                                       mousePos.X <= DContent.AbsolutePosition.X + DContent.AbsoluteSize.X and
                                       mousePos.Y >= DContent.AbsolutePosition.Y and 
                                       mousePos.Y <= DContent.AbsolutePosition.Y + DContent.AbsoluteSize.Y
                                       
                    if not isOverContainer and not isOverButton and OptionsContainer.Visible then
                        OptionsContainer.Visible = false
                        Icon.Text = "▼"
                    end
                end
            end
            
            game:GetService("UserInputService").InputBegan:Connect(closeDropdown)
            
            -- Atualizar posição quando a janela for movida
            Main:GetPropertyChangedSignal("Position"):Connect(function()
                if OptionsContainer.Visible then
                    updateContainerPosition()
                end
            end)
            
            -- Atualizar posição quando a tela for redimensionada
            game:GetService("RunService").RenderStepped:Connect(function()
                if OptionsContainer.Visible then
                    updateContainerPosition()
                end
            end)
            
            local dropdownAPI = {
                SetOptions = function(newOptions)
                    Dropdown.Options = newOptions
                    createOptions()
                    updateContainerSize()
                end,
                SetValue = function(newValue)
                    if table.find(Dropdown.Options, newValue) then
                        DValue.Text = newValue
                        Dropdown.Callback(newValue)
                    end
                end,
                GetValue = function()
                    return DValue.Text
                end,
                Update = function(newOptions)
                    if newOptions.title then
                        Title.Text = newOptions.title
                    end
                    if newOptions.options then
                        dropdownAPI.SetOptions(newOptions.options)
                    end
                    if newOptions.default then
                        dropdownAPI.SetValue(newOptions.default)
                    end
                end
            }
            
            return setmetatable(Drops, {__index = dropdownAPI})
        end
        return TabV
    end
    return Tabs
end
return imgui
