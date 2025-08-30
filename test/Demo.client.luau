local Fusion = require(game.ReplicatedStorage.Packages.fusion)
local scope = Fusion.scoped(Fusion)

local Deem = require(game.ReplicatedStorage.Packages.deem)
local Container = Deem.Components.Bases.Container
local Scroll = Deem.Components.Bases.Scroll
local TextButton = Deem.Components.Controls.TextButton
local ImageButton = Deem.Components.Controls.ImageButton
local ImageTextButton = Deem.Components.Controls.ImageTextButton
local TextInput = Deem.Components.Controls.TextInput
local Image = Deem.Components.Labels.Image
local Text = Deem.Components.Labels.Text

local defaultFontFamily = 'rbxassetid://11702779517'

scope:New 'ScreenGui' {
	Parent = game.Players.LocalPlayer.PlayerGui,
	IgnoreGuiInset = true,
	[Fusion.Children] = {
		
	}
}