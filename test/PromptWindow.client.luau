local ProximityPromptService = game:GetService("ProximityPromptService")
local Fusion = require(game.ReplicatedStorage.Packages.fusion)
local scope = Fusion.scoped(Fusion)

local Deem = require(game.ReplicatedStorage.Packages.deem)
local Container = Deem.Components.Bases.Container
local Scroll = Deem.Components.Bases.Scroll
local TextButton = Deem.Components.Controls.TextButton
local ImageButton = Deem.Components.Controls.ImageButton
local ImageTextButton = Deem.Components.Controls.ImageTextButton
local TextInput = Deem.Components.Controls.TextInput
local Image = Deem.Components.Labels.Image
local Text = Deem.Components.Labels.Text

local defaultFontFamily = 'rbxassetid://11702779517'

type CustomProps = {scope: {}, callbacks: {}}

function button1(_customProps: CustomProps)
	return TextButton(_customProps.scope, {
		Text = _customProps.text or 'Sample',
		TextSize = 16,
		TextColor = _customProps.textColor or Color3.fromRGB(220,220,220),
		FontFamily = defaultFontFamily,
		FontWeight = Enum.FontWeight.Medium,
		BackgroundColor = _customProps.backgroundColor or Color3.fromRGB(35,35,35),
		Position = UDim2.fromScale(.5,.5),
		Size = UDim2.fromOffset(150,45),
		BorderRadius = UDim.new(0,900),
		StrokeEnabled = true,
		StrokeColor = Color3.fromRGB(255,255,255),
		StrokeThickness = 1.5,
		StrokeGradientEnabled = true,
		StrokeGradientRotation = 80,
		StrokeGradientColor = _customProps.strokeColor or ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(55,55,55)),
			ColorSequenceKeypoint.new(.2, Color3.fromRGB(36,36,36)),
			ColorSequenceKeypoint.new(.8, Color3.fromRGB(36,36,36)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(55,55,55)),
		}),
		HoverIncrement = .07,
		HoldIncrement = 0.1
	}, _customProps.callbacks)
end

function defaultContainer(_customProps: CustomProps)
	return Container(_customProps.scope, {
		Name = _customProps.name or 'Sample',
		Size = _customProps.Size or UDim2.fromOffset(550,330),
		Position = _customProps.Position or UDim2.fromScale(.5,.5),
		BackgroundColor = _customProps.backgroundColor or Color3.fromRGB(25,25,25),
		BackgroundTransparency = _customProps.backgroundTransparency or 0.2,
		BorderRadius = UDim.new(0,35),
		VerticalFlex = Enum.UIFlexAlignment.Fill,
		Gap = UDim.new(0,10),
		PaddingTop = UDim.new(0,30),
		PaddingBottom = UDim.new(0,25),
		PaddingRight = UDim.new(0,35),
		PaddingLeft = UDim.new(0,35),
		StrokeEnabled = true,
		StrokeColor = Color3.fromRGB(255,255,255),
		StrokeThickness = 1.5,
		StrokeGradientEnabled = true,
		StrokeGradientRotation = 55,
		StrokeGradientColor = _customProps.strokeColor or ColorSequence.new {
			ColorSequenceKeypoint.new(0, Color3.fromRGB(45,45,45)),
			ColorSequenceKeypoint.new(0.3, Color3.fromRGB(20,20,20)),
			ColorSequenceKeypoint.new(0.7, Color3.fromRGB(35,35,35)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(45,45,45)),
		},
		Children = {
			if _customProps.topBarChildren then Container(scope, {
				Name = "TopBar",
				LayoutOrder = 0,
				-- BackgroundTransparency = .9,
				SelfFlexEnabled = true,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalFlex = Enum.UIFlexAlignment.Fill,
				Size = UDim2.new(1,0,0,60),
				Children = _customProps.topBarChildren
			}, {}) else nil,
			
			Container(scope, {
				Name = 'Content',
				LayoutOrder = 1,
				VerticalFlex = Enum.UIFlexAlignment.Fill,
				Children = _customProps.contentChildren,
			}, {}),

			if _customProps.bottomBarChildren then Container(scope, {
				Name = "BottomBar",
				LayoutOrder = 2,
				Size = UDim2.new(1,0,0,60),
				-- BackgroundTransparency = .9,
				SelfFlexEnabled = true,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				Gap = UDim.new(0,20),
				PaddingTop = UDim.new(0,3),
				PaddingBottom = UDim.new(0,3),
				PaddingRight = UDim.new(0,3),
				PaddingLeft = UDim.new(0,3),
				Children = _customProps.bottomBarChildren
			}, {}) else nil,
		}
	}, _customProps.callbacks)
end

function promptWindow(_customProps: CustomProps)
	return defaultContainer {
			scope = scope,
			callbacks = {},
			name = `{_customProps.prefix}_Start`,
			topBarChildren = {
				Container(scope, {
					Name = "LEFT",
					Gap = UDim.new(0,5),
					Children = {
						Text(scope, {
							Text = _customProps.title,
							TextSize = 18,
							TextColor = Color3.fromRGB(220,220,220),
							FontFamily = defaultFontFamily,
							FontWeight = Enum.FontWeight.Bold,
							TextXAlignment = Enum.TextXAlignment.Left
						}, {}),
						Text(scope, {
							Text = _customProps.subtitle,
							TextSize = 15,
							TextColor = Color3.fromRGB(220,220,220),
							FontFamily = defaultFontFamily,
							FontWeight = Enum.FontWeight.Light,
							TextXAlignment = Enum.TextXAlignment.Left
						}, {}),
					}
				}, {}),
				Container(scope, {
					Name = "RIGHT",
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalFlex = Enum.UIFlexAlignment.Fill,
					HorizontalFlex = Enum.UIFlexAlignment.None,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					PaddingBottom = UDim.new(0,20),
					PaddingRight = UDim.new(0,-5),
					ClipsDescendants = false,
					Children = {
						ImageButton(scope, {
							Image = 'rbxassetid://11293981586',
							ImageColor = Color3.fromRGB(220,220,220),
							BackgroundTransparency = 1,
							LockImageAspectRatio = true,
							Size = UDim2.new(0,40,1,0),
							PaddingTop = UDim.new(0,10),
							PaddingBottom = UDim.new(0,10),
							PaddingRight = UDim.new(0,10),
							PaddingLeft = UDim.new(0,10),
						}, {})
					}
				}, {}),
			},

			bottomBarChildren = {
				if _customProps.buttons then _customProps.scope:ForValues(_customProps.buttons, function(_, _, v)
					return button1 {
						scope = scope,
						callbacks = v.callbacks,
						text = v.text
					}
				end) else nil
			},

			contentChildren = {
				Scroll(scope, {
					PaddingBottom = UDim.new(0,50),
					Children = _customProps.contentChildren
				}, {}),
			}
		}
end
 
function PromptTask(_scope, _customProps)
	local temporaryScope = _scope:innerScope(_scope)
	promptWindow {
		scope = temporaryScope,
		callbacks = _customProps.callbacks,
		title = _customProps.title,
		subtitle = _customProps.subtitle,
		contentChildren = _customProps.contentChildren,
	}
end

scope:New 'ScreenGui' {
	Parent = game.Players.LocalPlayer.PlayerGui,
	IgnoreGuiInset = true,
	[Fusion.Children] = {
		Container(scope, {
			Name = 'Base',
			Size = UDim2.fromScale(1,1),
			BackgroundTransparency = 0,
			BackgroundColor = Color3.fromRGB(255,255,255),
			GradientEnabled = true,
			GradientColor = ColorSequence.new {
				ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 10, 17)),
				ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(0.7, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 10, 17)),
			},
			GradientRotation = 77,
			PaddingLeft = UDim.new(0,65),
			PaddingRight = UDim.new(0,65),
			AbsolutePositionEnabled = true,
			Children = {
				promptWindow {
					scope = scope,
					callbacks = {},
					title = 'Settings',
					subtitle = 'Tweak your game',
					buttons = {
						{
							text = 'Submit',
							callbacks = {
								Activated = function()
									scope:doCleanup()
								end
							},
						},
						{
							text = 'Close',
							callbacks = {
								Activated = function()
									scope:doCleanup()
								end
							},
						},
					}
				}
			}
		}, {})
	}
}