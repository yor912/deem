local Fusion = require(script.Parent.Parent.Parent.Parent.fusion)
local Computed = require(script.Parent.Parent.Parent.Modules.Computed)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

return function (scope, props)
	return scope:New 'ImageLabel' {
		Name = props.Name or 'Image',
		Size = UDim2.fromScale(1,1),
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
			if props.LockAspectRatio then scope:New 'UIAspectRatioConstraint' {
				AspectRatio = props.AspectRatioTarget or 1	
			} else nil,

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
			
			scope:New 'UIPadding' {
				PaddingTop = Computed(scope, props.PaddingTop or UDim.new(0,0)),
				PaddingBottom = Computed(scope, props.PaddingBottom or UDim.new(0,0)),
				PaddingRight = Computed(scope, props.PaddingRight or UDim.new(0,0)),
				PaddingLeft = Computed(scope, props.PaddingLeft or UDim.new(0,0))
			},
		}
	}
end