local Fusion = require(script.Parent.Parent.Parent.Parent.fusion)
local Computed = require(script.Parent.Parent.Parent.Modules.Computed)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local BaseButton = require(script.Parent.BaseButton)

return function(scope, props, callbacks)
	return BaseButton(scope, {
		Name = props.Name or 'TextButton',		
		Size = props.Size,
		LayoutOrder = props.LayoutOrder or 0,
		Active = props.Active or true,
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		Visible = props.Visible or true,
		ZIndex = props.ZIndex or 1,
		BackgroundColor = props.BackgroundColor or Color3.fromRGB(0,0,0),
		BackgroundTransparency = props.BackgroundTransparency or 0,
		BorderRadius = props.BorderRadius,
		StrokeMode = props.StrokeMode,
		StrokeColor = props.StrokeColor,
		StrokeEnabled = props.StrokeEnabled,
		StrokeLineMode = props.StrokeLineMode,
		StrokeThickness = props.StrokeThickness,
		StrokeTransparency = props.StrokeTransparency,
		PaddingTop = props.PaddingTop,
		PaddingBottom = props.PaddingBottom,
		PaddingRight = props.PaddingRight,
		PaddingLeft = props.PaddingLeft,
		HoldIncrement = props.HoldIncrement,
		HoverIncrement = props.HoverIncrement,
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