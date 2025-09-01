local Deem = script.Parent.Parent.Parent
local Modules = require(Deem.Modules)
local Computed = Modules.Computed
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children
local BaseButton = require(script.Parent.BaseButton)

return function(scope, props, callbacks)
	return BaseButton(scope, {
		Name = props.Name or 'ImageButton',
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