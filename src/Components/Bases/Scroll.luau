local Deem = script.Parent.Parent.Parent
local Modules = Deem.Modules
local Computed = require(Modules.Computed)
local Fusion = require(Deem.Parent.fusion)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent

return function(scope, props, callbacks)
	return scope:New 'ScrollingFrame' {
		Name = props.Name or 'Scroll',
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		Visible = Computed(scope, props.Visible or true),
		Active = Computed(scope, props.Active or true),
		Size = Computed(scope, props.Size or UDim2.fromOffset(200,200)),
		LayoutOrder = Computed(scope, props.LayoutOrder or 0),
		ZIndex = Computed(scope, props.ZIndex or 1),
		BackgroundTransparency = 1,
		TopImage = props.TopImage or 'rbxasset://textures/ui/Scroll/scroll-top.png',
		MidImage = props.MidImage or 'rbxasset://textures/ui/Scroll/scroll-middle.png',
		BottomImage = props.BottomImage or 'rbxasset://textures/ui/Scroll/scroll-bottom.png',
		ScrollBarImageTransparency = Computed(scope, props.ScrollBarTransparency or 0),
		ScrollBarImageColor3 = Computed(scope, props.ScrollBarColor or Color3.fromRGB(0,0,0)),
		ScrollBarThickness = Computed(scope, props.ScrollBarThickness or 3),
		ScrollingDirection = props.ScrollDirection or Enum.ScrollingDirection.XY,
		ScrollingEnabled = Computed(scope, props.ScrollingEnabled or true),
		CanvasSize = Computed(scope, props.CanvasSize or UDim2.fromScale(0,0)),
		CanvasPosition = Computed(scope, props.CanvasPosition or Vector2.new(0,0)),
		AutomaticCanvasSize = props.AutomaticCanvasSize or Enum.AutomaticSize.Y,
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
			scope:New 'UIPadding' {
				PaddingTop = Computed(scope, props.PaddingTop or UDim.new(0,0)),
				PaddingBottom = Computed(scope, props.PaddingBottom or UDim.new(0,0)),
				PaddingRight = Computed(scope, props.PaddingRight or UDim.new(0,0)),
				PaddingLeft = Computed(scope, props.PaddingLeft or UDim.new(0,0))
			},
			
			scope:New 'UIScale' {
				Scale = Computed(scope, props.Scale or 1)
			},
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