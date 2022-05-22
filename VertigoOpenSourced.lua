local NotifLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
local Notify = NotifLib.Notify

getgenv().MainModule = {
    Functions = {
        HttpGet = function(Link)
            return loadstring(game:HttpGet(Link))()   
        end,

        --- [>> Kill Aura Function <<]

        KillAuraFunction = function(Range,DrawLines)
            function addLine(myHrp, theirHrp)
                if not theirHrp.Parent.Torso:FindFirstChild("Beam") then
                    if DrawLines == true then
                    local beam = Instance.new("Beam", theirHrp.Parent.Torso)
                    local att0 = Instance.new("Attachment", theirHrp.Parent.Torso)
                    local att1 = Instance.new("Attachment", myHrp)
        
                    beam.Attachment0 = att0
                    beam.Attachment1 = att1
        
                    beam.Width0 = 0.2
                    beam.Width1 = 0.2
        
                    beam.LightEmission = 1
                    beam.LightInfluence = 0
        
                    beam.FaceCamera = true
        
                    if theirHrp.Parent.Humanoid.Health <= 15 then
                        beam.Color = ColorSequence.new(Color3.fromRGB(255,0,0),Color3.fromRGB(255,0,0))
                    else if theirHrp.Parent.Humanoid.Health >= 16 and theirHrp.Parent.Humanoid.Health <= 50 then
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 170, 0),Color3.fromRGB(255, 170, 0))
                        else
                            beam.Color = ColorSequence.new(Color3.fromRGB(59, 255, 0),Color3.fromRGB(59, 255, 0))
                        end
                    end
                end
            end
        end
        
        function remLine(theirHrp)
            if theirHrp.Parent:FindFirstChild("Torso") then
                if theirHrp.Parent.Torso:FindFirstChild("Beam") then
                    theirHrp.Parent.Torso:FindFirstChild("Beam"):Destroy()
                end
            end
        end
        
        
        
        function getClosestHrp()
            local closestCurrent = nil
            local currentMagnitude = 10000
        
            local myHrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if not v:IsA("Folder") then
                        if v.Humanoid.Health ~= 0 then
                            local theirHrp = v.HumanoidRootPart
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - theirHrp.Position).Magnitude < currentMagnitude then
                                if (myHrp.Position - theirHrp.Position).Magnitude <= Range and theirHrp.Parent.Humanoid.Health ~= 0 then
                                    currentMagnitude = (myHrp.Position - theirHrp.Position).Magnitude
                                    closestCurrent = theirHrp
                                    addLine(myHrp, theirHrp)
                                else
                                    remLine(theirHrp)
                                    end
                                end
                            end
                            end
                        end
                    end
                end
        
                return closestCurrent
            end
            
            
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name ~= "Chargin' Targe" or game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name ~= "Chargin'  Targe" then
                if getClosestHrp() ~= nil then
                    if getClosestHrp().Parent:FindFirstChild("Head") then
                        local Players = game:GetService("Players")
                             local args = {
                                       [1] = getClosestHrp().Parent,
                                       [2] = "Handle"
                        }
                        
                                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Events.Attack_Server:FireServer(unpack(args))
                        
                        local args = {
                            [1] = CFrame.new(Vector3.new(getClosestHrp().Parent.Head.Position.X,getClosestHrp().Parent.Head.Position.Y,getClosestHrp().Parent.Head.Position.Z),Vector3.new(0.14072436094284058, -0.3838658630847931, -0.9126026630401611))
                                   }
                        
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Events.Initiate_Server:FireServer(unpack(args))
                    end
                end
            end
        end
    end,

    CharacterFunction = function(WalkSpeed,JumpPower)
        local Humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        Humanoid.WalkSpeed = WalkSpeed
        Humanoid.JumpPower = JumpPower
    end
    }
}

getgenv().Settings = {
    KillAuraSettings = {
        Range = 50,
        Toggle = false,
        DrawLines = false
    },
    CharacterSettings = {
        Toggle = false,
        WalkSpeed = 16,
        JumpPower = 50,
    }
}


local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()

Inviter.Prompt(
    {name = "comms / alt gen with no cooldown.",
    invite = "https://discord.com/invite/rbxgen"}
)

wait(2)

local GUILibrary = getgenv().MainModule.Functions.HttpGet("https://raw.githubusercontent.com/CatzCode/cattoware/main/libraries/ui.lua") -- # Credits To "CatzCode" On GitHub!

GUILibrary.theme.topheight = 50
GUILibrary.theme.accentcolor = Color3.fromRGB(219, 213, 22)
GUILibrary.theme.accentcolor2 = Color3.fromRGB(128, 23, 90)
GUILibrary.theme.fontsize = 15
GUILibrary.theme.titlesize = 17

Notify({
    Title = "epic script",
    Description = "thank for using our epic script!!!!",
    Duration = 3
})

GUILibrary:CreateWatermark("vertigo gaming!!1??? | {fps} | {game}")

local Window = GUILibrary:CreateWindow("very pro vertigo skript!!", Vector2.new(492, 598), Enum.KeyCode.RightShift)
local Main = Window:CreateTab("main yez!")
local KillAuraSection = Main:CreateSector("Kill-Aura","left")
local godSection = Main:CreateSector("god section","left")
local Character = Main:CreateSector("Character Stuff","left")

local KillAuraToggle = KillAuraSection:AddToggle('Enabled', false, function(State)
    Notify({
        Title = "very pro notif!!!",
        Description = "Succesfully Toggled Kill-Aura",
        Duration = 3
    })
    getgenv().Settings.KillAuraSettings.Toggle = State
end)

local KillAuraToggle = KillAuraSection:AddToggle('Draw-Lines', false, function(State)
    Notify({
        Title = "very pro notif!!!",
        Description = "Succesfully Toggled Draw-Lines",
        Duration = 3
    })
    getgenv().Settings.KillAuraSettings.DrawLines = State
end)

local KillAuraRange = KillAuraSection:AddSlider("Range", 1, 50, 120, 1, function(Value)
    getgenv().Settings.KillAuraSettings.Range = Value
end)

godSection:AddLabel("must equip weapon")
godSection:AddLabel("doesnt work with fists")

local ButtonElCharge = godSection:AddButton("kill all",function(yesaction)
    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
        for i = 0,120 do
            for _,v in pairs(game.Players:GetPlayers()) do
             local args = {
                       [1] = v.Character,
                       [2] = "Handle"
        }
        
                  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Events.Attack_Server:FireServer(unpack(args))
        
        local args = {
            [1] = CFrame.new(Vector3.new(v.Character.Head.Position.X,v.Character.Head.Position.Y,v.Character.Head.Position.Z),Vector3.new(0.14072436094284058, -0.3838658630847931, -0.9126026630401611))
                   }
        
                   game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Events.Initiate_Server:FireServer(unpack(args))
            end
        end
        else
            Notify({
                Title = "very pro notif!!!",
                Description = "u need to equip a weapon for this to work....",
                Duration = 3
            })
    end
end)

local charToggleMain = Character:AddToggle('Enabled', false, function(State)
    Notify({
        Title = "very pro notif!!!",
        Description = "Character stuff is now enabled.",
        Duration = 3
    })
    getgenv().Settings.CharacterSettings.Toggle = State
end)

local WSSlider = Character:AddSlider("WalkSpeed", 1, 16, 200, 1, function(Value)
    getgenv().Settings.CharacterSettings.WalkSpeed = Value
end)

local JPSlider = Character:AddSlider("JumpPower", 1, 50, 200, 1, function(Value)
    getgenv().Settings.CharacterSettings.JumpPower = Value
end)

local BypasAnticheatEZ = Character:AddButton("Bypass Anticheat",function(ass)
local mt = getrawmetatable(game)

setreadonly(mt, false)
local old = mt.__index

mt.__index = function(o, k)
 if tostring(o) == "Humanoid" and tostring(k) == "WalkSpeed" then
   print("okokokok")
     return 16 --default walkspeed
   end

 return old(o, k)


end
local mt = getrawmetatable(game)

setreadonly(mt, false)
local old = mt.__index

mt.__index = function(o, k)
 if tostring(o) == "Humanoid" and tostring(k) == "JumpPower" then
   print("okokokok")
     return 50 --default walkspeed
   end

 return old(o, k)


end
end)

while wait(.1) do
    if getgenv().Settings.KillAuraSettings.Toggle == true then
        getgenv().MainModule.Functions.KillAuraFunction(getgenv().Settings.KillAuraSettings.Range,getgenv().Settings.KillAuraSettings.DrawLines)
    end
    if getgenv().Settings.CharacterSettings.Toggle == true then
        getgenv().MainModule.Functions.CharacterFunction(getgenv().Settings.CharacterSettings.WalkSpeed,getgenv().Settings.CharacterSettings.JumpPower)
    end
end
