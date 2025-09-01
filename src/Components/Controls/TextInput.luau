local Deem = script.Parent.Parent.Parent
local Modules = require(Deem.Modules)
local Computed = Modules.Computed
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange

return function(scope, props, callbacks)
	return scope:New 'TextBox' {
		Name = props.Name or 'TextInput',
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		Visible = Computed(scope, props.Visible or true),
		Active = Computed(scope, props.Active or true),
		Size = Computed(scope, props.Size or UDim2.fromOffset(200,200)),
		AutomaticSize = props.AutomaticSize or Enum.AutomaticSize.None,
		Position = Computed(scope, props.Position or UDim2.fromScale(.5,.5)),
		Rotation = Computed(scope, props.Rotation or 0),
		LayoutOrder = Computed(scope, props.LayoutOrder or 0),
		ZIndex = Computed(scope, props.ZIndex or 1),
		ClipsDescendants = props.ClipsDescendants or true,
		BackgroundTransparency = Computed(scope, props.BackgroundTransparency or 0),
		BackgroundColor3 = Computed(scope, props.BackgroundColor or Color3.fromRGB(255,255,255)),
		FontFace = Font.new(props.FontFamily or 'rbxassetid://12187365364', props.FontWeight or Enum.FontWeight.Regular, props.FontStyle or Enum.FontStyle.Normal),
		Text = Computed(scope, props.Text or ''),
		TextColor3 = Computed(scope, props.TextColor or Color3.fromRGB(255,255,255)),
		TextDirection = props.TextDirection or Enum.TextDirection.Auto,
		TextScaled = props.TextScaled or false,
		TextSize = Computed(scope, props.TextSize or 12),
		TextTransparency = Computed(scope, props.TextTransparency or 0),
		TextTruncate = props.TextTruncate or Enum.TextTruncate.None,
		TextWrapped = props.TextWrapped or true,
		TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center,
		TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center,
		TextEditable = Computed(scope, props.TextEditable or true),
		CursorPosition = Computed(scope, props.CursorPosition or 0),
		MultiLine = props.MultiLine or false,
		PlaceholderText = Computed(scope, props.PlaceholderText or 'Click here to start typing..'),
		PlaceholderColor3 = Computed(scope, props.PlaceholderColor or Color3.fromRGB(130, 130, 130)),
		RichText = Computed(scope, props.RichTextEnabled or false),
		SelectionStart = Computed(scope, props.SelectionStart or 0),
		ClearTextOnFocus = Computed(scope, props.ClearTextOnFocus or false),
		ShowNativeInput = Computed(scope, props.ShowNativeInput or true),		
		[Children] = {
			scope:New 'UIPadding' {
				PaddingTop = Computed(scope, props.PaddingTop or UDim.new(0,0)),
				PaddingBottom = Computed(scope, props.PaddingBottom or UDim.new(0,0)),
				PaddingRight = Computed(scope, props.PaddingRight or UDim.new(0,0)),
				PaddingLeft = Computed(scope, props.PaddingLeft or UDim.new(0,0))
			},
			
			scope:New 'UICorner' {
				CornerRadius = Computed(scope, props.BorderRadius or UDim.new(0, 0))
			},

			if props.GradientEnabled then scope:New 'UIGradient' {
				Color = Computed(scope, props.GradientColor or ColorSequence.new(Color3.fromRGB(255,255,255))),
				Offset = Computed(scope, props.GradientOffset or Vector2.new(0,0)),
				Rotation = Computed(scope, props.GradientRotation or 0),
				Transparency = Computed(scope, props.GradientTransparency or NumberSequence.new(0))
			} else nil,

			if props.StrokeEnabled then scope:New 'UIStroke' {
				ApplyStrokeMode = props.StrokeMode or Enum.ApplyStrokeMode.Border,
				Color = Computed(scope, props.StrokeColor or Color3.fromRGB(0,0,0)),
				LineJoinMode = props.StrokeLineMode or Enum.LineJoinMode.Round,
				Thickness = Computed(scope, props.StrokeThickness or 1),
				Transparency = Computed(scope, props.StrokeTransparency or 0),
				[Children] = {
					if props.StrokeGradientEnabled then scope:New 'UIGradient' {
						Color = Computed(scope, props.StrokeGradientColor or ColorSequence.new(Color3.fromRGB(255,255,255))),
						Offset = Computed(scope, props.StrokeGradientOffset or Vector2.new(0,0)),
						Rotation = Computed(scope, props.StrokeGradientRotation or 0),
						Transparency = Computed(scope, props.StrokeGradientTransparency or NumberSequence.new(0))
					} else nil
				}
			} else nil,

			scope:New 'UIScale' {
				Scale = Computed(scope, props.Scale or 1)
			},

			scope:New 'UITextSizeConstraint' {
				MinTextSize = props.MinTextSize or 1,
				MaxTextSize = props.MaxTextSize or 99,
			},
		},
		
		[OnEvent 'FocusLost'] = function(enterPressed, inputThatCausedFocusLoss)
			if callbacks.FocusLost then
				callbacks.FocusLost(enterPressed, inputThatCausedFocusLoss)
			end
		end,
		
		[OnEvent 'Focused'] = function()
			if callbacks.Focused then
				callbacks.Focused()
			end
		end,
		
		[OnEvent 'ReturnPressedFromOnScreenKeyboard'] = function()
			if callbacks.ReturnPressedFromOnScreenKeyboard then
				callbacks.ReturnPressedFromOnScreenKeyboard()
			end
		end,
		
		[OnChange 'Text'] = function(text)
			if callbacks.TextChanged then
				callbacks.TextChanged(text)
			end
		end,
	}
end