local EspLib = {}

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local GPSs = {}

function EspLib:CreateEsp(Active, Part, Text, Color)
	local GPS = Part:FindFirstChild("ObjectGPS")
	if Active then
		if not GPS then
			GPS = Instance.new("BillboardGui", Part)
			GPS.AlwaysOnTop = true
			GPS.Size = UDim2.fromOffset(200, 50)
			GPS.Name = "ObjectGPS"

			local TL = Instance.new("TextLabel", GPS)
			TL.BackgroundTransparency = 1
			TL.Size = UDim2.fromScale(1, .5)
			TL.Font = Enum.Font.Oswald
			TL.Text = Text
			TL.TextColor3 = Color
			TL.TextScaled = true
			TL.TextStrokeTransparency = .8

			local DL = Instance.new("TextLabel", GPS)
			DL.BackgroundTransparency = 1
			DL.Position = UDim2.fromScale(0, .5)
			DL.Size = UDim2.fromScale(1, .5)
			DL.Font = Enum.Font.Oswald
			DL.TextColor3 = Color
			DL.TextScaled = true
			DL.TextStrokeTransparency = .8

			RunService.RenderStepped:Connect(function()
				local Character = Player.Character
				if Character then
					local Root: BasePart = Character:FindFirstChild("HumanoidRootPart")
					if Root then
						DL.Text = math.round((Part.Position - Root.Position).Magnitude) .. "s"
						return
					end
				end
				DL.Text = "???"
			end)

			table.insert(GPSs, GPS)
		end
	else
		if GPS then
			GPS:Destroy()
		end
	end
end

function EspLib:ClearEsps()
	for i, v in pairs(GPSs) do
		if v then
			v:Destroy()
		end
	end
end

return EspLib
