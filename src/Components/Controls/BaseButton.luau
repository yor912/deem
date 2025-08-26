local Fusion = require(script.Parent.Parent.Parent.Parent.fusion)
local Computed = require(script.Parent.Parent.Parent.Modules.Computed)
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local peek = Fusion.peek

function fx(final, val, operation, args)
	local a,b,c = args.h,args.s,args.v
	final:set(Color3.fromHSV(a,b,if operation == 1 then math.clamp(c-val,0,1) else math.clamp(c+val,0,1)))
end

function reset(final, origin)
	final:set(peek(origin))
end
	
return function(scope, props, callbacks)
	local holdIncrement = scope:Value(props.HoldIncrement or -.20) 
	local hoverIncrement = scope:Value(props.HoverIncrement or -.10) 
	local isHolding = scope:Value(false) 
	local isHovering = scope:Value(false) 
	local originColor = Computed(scope, props.BackgroundColor or Color3.fromRGB(141, 75, 75))
	local tempH, tempS, tempV = peek(originColor):ToHSV()
	local h,s,v = scope:Value(tempH), scope:Value(tempS), scope:Value(tempV) 
	local final = scope:Value(peek(originColor)) 
	local leftMouseEffect = scope:Value(props.LeftMouseEffect or true) 
	local rightMouseEffect = scope:Value(props.RightMouseEffect or false) 
	
	return scope:New 'ImageButton' {
		Name = props.Name or 'BaseButton',
		LayoutOrder = Computed(scope, props.LayoutOrder or 0),
		Active = Computed(scope, props.Active or true),
		AnchorPoint = props.AnchorPoint or Vector2.new(.5,.5),
		Visible = Computed(scope, props.Visible or true),
		ZIndex = Computed(scope, props.ZIndex or 1),
		BackgroundColor3 = scope:Tween(Computed(scope, final), TweenInfo.new(.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)),
		BackgroundTransparency = Computed(scope, props.BackgroundTransparency or 0),
		Size = props.Size or UDim2.fromScale(1,1),
		[Children] = {
			props.Children,
			scope:New 'UIListLayout' {
				HorizontalFlex = props.HorizontalFlex or Enum.UIFlexAlignment.Fill,
				VerticalFlex = props.VerticalFlex or Enum.UIFlexAlignment.Fill,
				ItemLineAlignment = props.ItemLineAlignment or Enum.ItemLineAlignment.Center,
				Padding = Computed(scope, props.Gap or UDim.new(0, 0)),
				Wraps = props.Wraps or false,		
				FillDirection = props.FillDirection or Enum.FillDirection.Vertical,
				HorizontalAlignment = props.HorizontalAlignment or Enum.HorizontalAlignment.Center,
				VerticalAlignment = props.VerticalAlignment or Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			},

			scope:New 'UICorner' {
				CornerRadius = Computed(scope, props.BorderRadius or UDim.new(0, 0))
			},

			scope:New 'UIStroke' {
				ApplyStrokeMode = props.StrokeMode or Enum.ApplyStrokeMode.Border,
				Color = Computed(scope, props.StrokeColor or Color3.fromRGB(0,0,0)),
				Enabled = props.StrokeEnabled or true,
				LineJoinMode = props.StrokeLineMode or Enum.LineJoinMode.Round,
				Thickness = Computed(scope, props.StrokeThickness or 1),
				Transparency = Computed(scope, props.StrokeTransparency or 1),
			},

			scope:New 'UIScale' {
				Scale = Computed(scope, props.Scale or 1)
			},

			scope:New 'UIPadding' {
				PaddingTop = Computed(scope, props.PaddingTop or UDim.new(0,0)),
				PaddingBottom = Computed(scope, props.PaddingBottom or UDim.new(0,0)),
				PaddingRight = Computed(scope, props.PaddingRight or UDim.new(0,0)),
				PaddingLeft = Computed(scope, props.PaddingLeft or UDim.new(0,0))
			},
		},
		[OnEvent 'Activated'] = function(inp, clickCount)
			if callbacks.Activated then
				callbacks.Activated(inp, clickCount)
			end
		end,
		[OnEvent 'MouseButton1Click'] = function(x, y)
			if callbacks.MouseButton1Click then
				callbacks.MouseButton1Click(x, y)
			end
		end,
		[OnEvent 'MouseButton2Click'] = function(x, y)
			if callbacks.MouseButton2Click then
				callbacks.MouseButton2Click(x, y)
			end
		end,
		[OnEvent 'MouseButton1Down'] = function(x, y)
			if callbacks.MouseButton1Down then
				callbacks.MouseButton1Down(x, y)
			end
			if peek(leftMouseEffect) then
				isHolding:set(true)
				fx(final, peek(holdIncrement), 2, {h = peek(h), s = peek(s), v = peek(v)})
			end
		end,
		[OnEvent 'MouseButton2Down'] = function(x, y)
			if callbacks.MouseButton2Down then
				callbacks.MouseButton2Down(x, y)
			end
			if peek(rightMouseEffect) then
				isHolding:set(true)
				fx(final, peek(holdIncrement), 2, {h = peek(h), s = peek(s), v = peek(v)})
			end
		end,
		[OnEvent 'MouseButton1Up'] = function(x, y)
			if callbacks.MouseButton1Down then
				callbacks.MouseButton1Down(x, y)
			end
			isHolding:set(false)
			reset(final, originColor)
		end,
		[OnEvent 'MouseButton2Up'] = function(x, y)
			if callbacks.MouseButton2Up then
				callbacks.MouseButton2Up(x, y)
			end
			isHolding:set(false)
			reset(final, originColor)
		end,
		[OnEvent 'MouseEnter'] = function(x, y)
			if callbacks.MouseEnter then
				callbacks.MouseEnter(x, y)
			end
			isHovering:set(true)
			fx(final, peek(hoverIncrement), 2, {h = peek(h), s = peek(s), v = peek(v)})
		end,
		[OnEvent 'MouseLeave'] = function(x, y)
			if callbacks.MouseLeave then
				callbacks.MouseEnter(x, y)
			end
			isHovering:set(false)
			reset(final, originColor)
		end,
	}
end