local Fusion = require(script.Parent.Parent.Parent.Parent.fusion)
local Computed = require(script.Parent.Parent.Parent.Modules.Computed)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local BaseButton = require(script.Parent.BaseButton)

return function(scope, props, callbacks)
	return BaseButton(scope, {
		Name = props.Name or 'ImageButton',
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
			scope:New 'ImageLabel' {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1,1),
				Image = props.Image or 'rbxasset://textures/ui/GuiImagePlaceholder.png',
				ImageColor3 = Computed(scope, props.ImageColor or Color3.fromRGB(255,255,255)),
				ImageRectOffset = props.ImageRectOffset or Vector2.zero,
				ImageRectSize = props.ImageRectSize or Vector2.zero,
				ImageTransparency = Computed(scope, props.ImageTransparency or 0),
				ResampleMode = props.ImageResampleMode or Enum.ResamplerMode.Default,
				ScaleType = props.ImageScaleType or Enum.ScaleType.Fit,
				[Children] = {
					if props.LockImageAspectRatio then scope:New 'UIAspectRatioConstraint' {
						AspectRatio = props.ImageAspectRatio or 1	
					} else nil
				}
			}
		}
	}, callbacks)
end