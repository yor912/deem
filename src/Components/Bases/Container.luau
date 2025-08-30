local Deem = script.Parent.Parent.Parent
local Modules = Deem.Modules
local Computed = require(Modules.Computed)
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

return function(scope, props, callbacks)
	return scope:New 'Frame' {
		Name = props.Name or 'Container',
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
		BackgroundColor3 = Computed(scope, props.BackgroundColor or Color3.fromRGB(255,255,255)),
		BackgroundTransparency = Computed(scope, props.BackgroundTransparency or 1),
		[Children] = {
			props.Children,
			if not props.AbsolutePositionEnabled then scope:New 'UIListLayout' {
				HorizontalFlex = props.HorizontalFlex or Enum.UIFlexAlignment.Fill,
				VerticalFlex = props.VerticalFlex or Enum.UIFlexAlignment.None,
				ItemLineAlignment = props.ItemLineAlignment or Enum.ItemLineAlignment.Automatic,
				Padding = Computed(scope, props.Gap or UDim.new(0, 0)),
				Wraps = props.Wraps or false,		
				FillDirection = props.FillDirection or Enum.FillDirection.Vertical,
				HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Center,
				VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder,
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
			
			scope:New 'UISizeConstraint' {
				MaxSize = props.MaxSize or Vector2.new('inf','inf'),
				MinSize = props.MinSize or Vector2.new(0,0)
			}
		},
		
		[OnEvent 'InputBegan'] = function(inp)
			if callbacks.InputBegan then
				callbacks.InputBegan(inp)
			end
		end,
		
		[OnEvent 'InputChanged'] = function(inp)
			if callbacks.InputChanged then
				callbacks.InputChanged(inp)
			end
		end,
		
		[OnEvent 'InputEnded'] = function(inp)
			if callbacks.InputEnded then
				callbacks.InputEnded(inp)
			end
		end,
		
		[OnEvent 'MouseEnter'] = function(x, y)
			if callbacks.MouseEnter then
				callbacks.MouseEnter(x, y)
			end
		end,
		
		[OnEvent 'MouseLeave'] = function(x, y)
			if callbacks.MouseLeave then
				callbacks.MouseLeave(x, y)
			end
		end,
		
		[OnEvent 'MouseMoved'] = function(x, y)
			if callbacks.MouseMoved then
				callbacks.MouseMoved(x, y)
			end
		end,
		
		[OnEvent 'MouseWheelForward'] = function(x, y)
			if callbacks.MouseWheelForward then
				callbacks.MouseWheelForward(x, y)
			end
		end,
		
		[OnEvent 'MouseWheelBackward'] = function(x, y)
			if callbacks.MouseWheelBackward then
				callbacks.MouseWheelBackward(x, y)
			end
		end,
	}
end