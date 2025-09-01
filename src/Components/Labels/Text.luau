local Deem = script.Parent.Parent.Parent
local Modules = require(Deem.Modules)
local Computed = Modules.Computed
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children

return function(scope, props)
	return scope:New 'TextLabel' {
		Name = props.Name or 'Text',
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		Visible = props.Visible or true,
		Size = props.Size or UDim2.fromOffset(0,0),
		AutomaticSize = props.AutomaticSize or Enum.AutomaticSize.XY,
		Position = Computed(scope, props.Position or UDim2.fromOffset(0,0)),
		LayoutOrder = props.LayoutOrder or 0,
		ZIndex = props.ZIndex or 1,
		BackgroundTransparency = 1,
		FontFace = Font.new(props.FontFamily or 'rbxassetid://12187365364', props.FontWeight or Enum.FontWeight.Regular, props.FontStyle or Enum.FontStyle.Normal),
		Text = props.Text or 'Hello World',
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

			scope:New 'UIScale' {
				Scale = Computed(scope, props.Scale or 1)
			},
		}
	}
end