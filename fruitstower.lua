local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("DemonicHUB V2",Color3.fromRGB(41, 1, 1), Enum.KeyCode.RightControl)

local tab = win:Tab("AutoPlay")
local tab2 = win:Tab("Settings")
local tab4 = win:Tab("Credits/Discord")

tab:Label("AutoFarm")

tab:Toggle("AutoUpgrade Units",false, function(t)
getgenv().U = t
while getgenv().U do
task.wait(1.2)
local o = workspace.Units:GetChildren()

for _, v in ipairs(o) do
local args = {
    [1] = v
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeUnit"):FireServer(unpack(args))

end
end
end)

tab:Label("AutoSell")

tab:Textbox("Insert Wave To SellAllUnits",true, function(t)
_G.Ula = tonumber(t)
end)

tab:Toggle("AutoSellAtWave",false, function(t)
getgenv().Wa = t
while getgenv().Wa do
task.wait(0.1)
if workspace.Stats.Wave.Value == _G.Ula then
local o = workspace.Units:GetChildren()

for _, v in ipairs(o) do
local args = {
    [1] = v
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellUnit"):FireServer(unpack(args))

end
end
end
end)

tab:Button("Sell All Units", function()
local o = workspace.Units:GetChildren()

for _, v in ipairs(o) do
local args = {
    [1] = v
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SellUnit"):FireServer(unpack(args))


end
end)

tab2:Toggle("AutoRetry",false, function(t)
getgenv().ele = t
while getgenv().ele do
task.wait(1)
if game:GetService("Players").LocalPlayer.PlayerGui.main.EndGame.PlayAgain.Visible then

firesignal(game:GetService("Players").LocalPlayer.PlayerGui.main.EndGame.PlayAgain.Activated)

end
end
end)

tab2:Toggle("AutoSpinWheel",false, function(t)
getgenv().Ssjs = t
while getgenv().Ssjs do
task.wait(0.2)
local ina = game.Players.LocalPlayer.Data.Spins.Value

for i = 1, ina do
firesignal(game:GetService("Players").LocalPlayer.PlayerGui.main.Spin.Spin.Activated)
end
end
end)

tab3:Label("Credits To:")
tab3:Label("alan11ago#8475")

tab3:Button("Discord Inv Clipboard", function()
setclipboard("https://discord.gg/YWS5PUBYfe")
end)