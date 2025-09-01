local Deem = script.Parent.Parent.Parent
local Modules = require(Deem.Modules)
local Computed = Modules.Computed
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children

return function (scope, props)
	return scope:New 'ImageLabel' {
		Name = props.Name or 'Image',
		Size = UDim2.fromScale(1,1),
		Position = Computed(scope, props.Position or UDim2.fromOffset(0,0)),
		BackgroundTransparency = 1,
		Image = props.Image or 'rbxasset://textures/ui/GuiImagePlaceholder.png',
		ImageColor3 = Computed(scope, props.ImageColor or Color3.fromRGB(255,255,255)),
		ImageRectOffset = props.ImageRectOffset or Vector2.zero,
		ImageRectSize = props.ImageRectSize or Vector2.zero,
		ImageTransparency = Computed(scope, props.ImageTransparency or 0),
		ResampleMode = props.ImageResampleMode or Enum.ResamplerMode.Default,
		ScaleType = props.ImageScaleType or Enum.ScaleType.Fit,
		[Children] = {
			props.Children,
			
			scope:New 'UIListLayout' {
				HorizontalFlex = props.HorizontalFlex or Enum.UIFlexAlignment.Fill,
				VerticalFlex = props.VerticalFlex or Enum.UIFlexAlignment.None,
				ItemLineAlignment = props.ItemLineAlignment or Enum.ItemLineAlignment.Automatic,
				Padding = Computed(scope, props.Gap or UDim.new(0, 0)),
				Wraps = props.Wraps or false,		
				FillDirection = props.FillDirection or Enum.FillDirection.Vertical,
				HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Center,
				VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
			},
			
			if props.SelfFlexEnabled then scope:New 'UIFlexItem' {
				FlexMode = props.SelfFlexMode or Enum.UIFlexMode.None,
				ItemLineAlignment = props.SelfItemLineAlignment or Enum.ItemLineAlignment.Automatic
			} else nil,
			
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

			if props.LockAspectRatio then scope:New 'UIAspectRatioConstraint' {
				AspectRatio = props.AspectRatioTarget or 1	
			} else nil,
		}
	}
end