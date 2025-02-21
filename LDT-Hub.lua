repeat wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")

-- Auto Farm Quái
function AutoFarm()
    while wait(0.5) do
        local args = {
            [1] = "Combat",
            [2] = "Attack"
        }
        rs.Remotes:InvokeServer(unpack(args))
    end
end

-- ESP Player (Nhìn thấy người chơi)
function ESP()
    for _, v in pairs(game.Players:GetChildren()) do
        if v.Character and v ~= player then
            local esp = Instance.new("Highlight")
            esp.Parent = v.Character
            esp.FillColor = Color3.new(1, 0, 0)
            esp.FillTransparency = 0.5
            esp.OutlineColor = Color3.new(1, 1, 1)
            esp.OutlineTransparency = 0
        end
    end
end

-- Teleport đến đảo
function Teleport(x, y, z)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
end

-- Auto Raid (Tự đánh boss trong Raid)
function AutoRaid()
    while wait(1) do
        local args = {
            [1] = "Raid",
            [2] = "Start"
        }
        rs.Remotes:InvokeServer(unpack(args))
    end
end

-- Auto Mua Trái Ác Quỷ
function BuyFruit()
    local args = {
        [1] = "Shop",
        [2] = "Buy",
        [3] = "Random" -- Hoặc thay bằng tên trái cần mua
    }
    rs.Remotes:InvokeServer(unpack(args))
end

-- Kill Aura (Tự đánh người chơi gần đó)
function KillAura()
    while wait(0.2) do
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                local args = {
                    [1] = "Combat",
                    [2] = "Attack"
                }
                rs.Remotes:InvokeServer(unpack(args))
            end
        end
    end
end

-- Auto Nhặt Rương
function AutoChest()
    while wait(1) do
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v.Name == "Chest" then
                player.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
                wait(0.5)
            end
        end
    end
end

-- Chạy các chức năng
print("LDT Hub X Loaded!")
AutoFarm()
ESP()
Teleport(1000, 50, -500)
AutoRaid()
BuyFruit()
KillAura()
AutoChest()
