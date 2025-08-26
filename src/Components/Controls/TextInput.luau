local Fusion = require(script.Parent.Parent.Parent.Parent.fusion)
local Computed = require(script.Parent.Parent.Parent.Modules.Computed)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange

return function(scope, props, callbacks)
	return scope:New 'TextBox' {
		Name = props.Name or 'TextInput',
		LayoutOrder = Computed(scope, props.LayoutOrder or 0),
		Active = Computed(scope, props.Active or true),
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		AutomaticSize = props.AutomaticSize or Enum.AutomaticSize.None,
		Visible = Computed(scope, props.Visible or true),
		ZIndex = Computed(scope, props.ZIndex or 1),
		BackgroundColor3 = Computed(scope, props.BackgroundColor or Color3.fromRGB(255,255,255)),
		BackgroundTransparency = Computed(scope, props.BackgroundTransparency or 0),
		ClipsDescendants = props.ClipsDescendants or true,
		Size = Computed(scope, props.Size or UDim2.fromOffset(200,200)),
		Position = Computed(scope, props.Position or UDim2.fromScale(.5,.5)),
		Rotation = Computed(scope, props.Rotation or 0),
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
		ClearTextOnFocus = Computed(scope, props.ClearTextOnFocus or false),
		CursorPosition = Computed(scope, props.CursorPosition or 0),
		MultiLine = props.MultiLine or false,
		PlaceholderColor3 = Computed(scope, props.PlaceholderColor or Color3.fromRGB(130, 130, 130)),
		PlaceholderText = Computed(scope, props.PlaceholderText or 'Click here to start typing..'),
		RichText = Computed(scope, props.RichTextEnabled or false),
		SelectionStart = Computed(scope, props.SelectionStart or 0),
		ShowNativeInput = Computed(scope, props.ShowNativeInput or true),
		TextEditable = Computed(scope, props.TextEditable or true),
		
		
		[Children] = {
			scope:New 'UIPadding' {
				PaddingTop = Computed(scope, props.PaddingTop or UDim.new(0,0)),
				PaddingBottom = Computed(scope, props.PaddingBottom or UDim.new(0,0)),
				PaddingRight = Computed(scope, props.PaddingRight or UDim.new(0,0)),
				PaddingLeft = Computed(scope, props.PaddingLeft or UDim.new(0,0))
			},

			scope:New 'UITextSizeConstraint' {
				MinTextSize = props.MinTextSize or 1,
				MaxTextSize = props.MaxTextSize or 99,
			},
			
			scope:New 'UICorner' {
				CornerRadius = Computed(scope, props.BorderRadius or UDim.new(0, 0))
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