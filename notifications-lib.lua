local NotificationsLib = {}

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local AchievementsHolder = Player.PlayerGui:WaitForChild("MainUI"):WaitForChild("AchievementsHolder")
local AchievementTemplate = AchievementsHolder:WaitForChild("Achievement"):Clone()

function NotificationsLib:MakeNotification(Color: Color3, Top: string, Icon: string, Title: string, Desc: string, Reason: string)
	local Notification: Frame = AchievementTemplate:Clone()
	Notification.Parent = AchievementsHolder
	Notification.Visible = true
	
	Notification.Frame.Position = UDim2.fromScale(1.5, 0)
	
	Notification.Frame.UIStroke.Color = Color
	
	Notification.Frame.Glow.ImageColor3 = Color
	
	Notification.Frame.TextLabel.Text = Top
	Notification.Frame.TextLabel.TextColor3 = Color
	
	Notification.Frame.ImageLabel.Image = Icon
	
	Notification.Frame.Details.Title.Text = Title
	Notification.Frame.Details.Title.TextColor3 = Color
	
	Notification.Frame.Details.Desc.Text = Desc
	Notification.Frame.Details.Desc.TextColor3 = Color
	
	Notification.Frame.Details.Reason.Text = Reason
	Notification.Frame.Details.Reason.TextColor3 = Color
	
	TweenService:Create(Notification.Frame, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {Position = UDim2.fromScale(0, 0)}):Play()
	TweenService:Create(Notification.Frame.Glow, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
	Notification.Sound:Play()
	task.wait(6)
	TweenService:Create(Notification.Frame, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {Position = UDim2.fromScale(1.5, 0)}):Play()
	task.wait(1)
	Notification:Destroy()
end

return NotificationsLib
