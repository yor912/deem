local Deem = script.Parent.Parent.Parent
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children
local BaseButton = require(script.Parent.BaseButton)

return function(scope, props, callbacks)
	return BaseButton(scope, {
		Name = props.Name or 'TextButton',		
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		Visible = props.Visible or true,
		Active = props.Active or true,
		Size = props.Size,
		Position = props.Position,
		Scale = props.Scale,
		LayoutOrder = props.LayoutOrder or 0,
		ZIndex = props.ZIndex or 1,
		BackgroundTransparency = props.BackgroundTransparency or 0,
		BackgroundColor = props.BackgroundColor or Color3.fromRGB(0,0,0),
		BorderRadius = props.BorderRadius,
		PaddingTop = props.PaddingTop,
		PaddingBottom = props.PaddingBottom,
		PaddingRight = props.PaddingRight,
		PaddingLeft = props.PaddingLeft,
		StrokeMode = props.StrokeMode,
		StrokeColor = props.StrokeColor,
		StrokeEnabled = props.StrokeEnabled,
		StrokeLineMode = props.StrokeLineMode,
		StrokeThickness = props.StrokeThickness,
		StrokeTransparency = props.StrokeTransparency,
		StrokeGradientEnabled = props.StrokeGradientEnabled,
		StrokeGradientColor = props.StrokeGradientColor,
		StrokeGradientOffset = props.StrokeGradientOffset,
		StrokeGradientRotation = props.StrokeGradientRotation,
		StrokeGradientTransparency = props.StrokeGradientTransparency,
		GradientEnabled = props.GradientEnabled,
		GradientColor = props.GradientColor,
		GradientOffset = props.GradientOffset,
		GradientRotation = props.GradientRotation,
		GradientTransparency = props.GradientTransparency,
		HoldIncrement = props.HoldIncrement,
		HoverIncrement = props.HoverIncrement,
		RightMouseEffect = props.RightMouseEffect,
		LeftMouseEffect = props.LeftMouseEffect,
		Children = {
			scope:New 'TextLabel' {
				Text = props.Text or 'Hello World',
				Size = UDim2.fromScale(1,1),
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				FontFace = Font.new(props.FontFamily or 'rbxassetid://12187365364', props.FontWeight or Enum.FontWeight.Regular, props.FontStyle or Enum.FontStyle.Normal),
				TextColor3 = props.TextColor or Color3.fromRGB(255,255,255),
				TextDirection = props.TextDirection or Enum.TextDirection.Auto,
				TextScaled = props.TextScaled or false,
				TextSize = props.TextSize or 12,
				TextTransparency = props.TextTransparency or 0,
				TextTruncate = props.TextTruncate or Enum.TextTruncate.None,
				TextWrapped = props.TextWrapped or true,
				TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center,
				TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center,
				[Children] = {
					scope:New 'UITextSizeConstraint' {
						MinTextSize = props.MinTextSize or 1,
						MaxTextSize = props.MaxTextSize or 99,
					}
				}
			}
		}
	}, callbacks)
end