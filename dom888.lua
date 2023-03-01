local Config = {
    WindowName = "DOM888 JUBJUB",
	Color = Color3.fromRGB(0,255,0),
	Keybind = Enum.KeyCode.RightControl
}
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local Name = "Anime-Dimensions-Simulator.txt"

Des = {}
if makefolder then
    makefolder("V.G Hub")
end

local Settings

if
    not pcall(
        function()
            readfile("V.G Hub//" .. Name)
        end
    )
 then
    writefile("V.G Hub//" .. Name, game:service "HttpService":JSONEncode(Des))
end

Settings = game:service "HttpService":JSONDecode(readfile("V.G Hub//" .. Name))

local function Save()
    writefile("V.G Hub//" .. Name, game:service "HttpService":JSONEncode(Settings))
end


local function getNearestMobs()
    local TargetDistance = math.huge
    local Target
    for i, v in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health ~= 0 then
            local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChildOfClass("Part").Position).Magnitude
            if Mag < TargetDistance then
                TargetDistance = Mag
                Target = v
            end
        end
    end
    return Target
end;
pcall(function()
Raids = {}
for i, v in pairs(
    game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayFrame.Frame.PlayRoomFrame.MapSelectionScrollingFrame:GetDescendants(

    )
) do
    if v:FindFirstChild("Create") then
        table.insert(Raids, v.Name)
    end
end
Difficulty = {"Easy","Hard","Nightmare"}
end)


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Anime Dimensions Simulator")
local Tab2 = Window:CreateTab("ตั้งค่า")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Toggle1 = Section1:CreateToggle("AutoFarm", Settings.Start, function(State)
Settings.Start = State
spawn(function()
while wait() and Settings.Start do 
game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
    "CreateRoom",
    {
        ["Difficulty"] = Settings.Difficulty,
        ["FriendsOnly"] = true,
        ["MapName"] = Settings.Raids,
        ["Hardcore"] = false
    }
)
game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportPlayers")
end
end)
end)
pcall(function()
local Dropdown1 = Section1:CreateDropdown("Difficulty", Difficulty, function(String)
	Settings.Difficulty = String
end)

local Dropdown1 = Section1:CreateDropdown("Raids", Raids, function(String)
	Settings.Raids = String
end)


local Toggle1 = Section1:CreateToggle("Auto Punch", Settings.JJ, function(State)
Settings.JJ = State
spawn(function()
while wait(0.7) and Settings.JJ do
    pcall(
        function()
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0,0,0, true, game, 1)
        end
    )
end
end)
end)

speed = 50
local Toggle1 = Section1:CreateToggle("AutoFarm", Settings.AutoFarm, function(State)
Settings.AutoFarm = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.AutoFarm then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
spawn(function()
while wait() and Settings.AutoFarm do
    pcall(
        function()
            local Time =
                (getNearestMobs().HumanoidRootPart.CFrame.p + Vector3.new(0, 5, 0) -
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude / speed
            local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
            local Tween =
                game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character.HumanoidRootPart,
                Info,
                {CFrame = CFrame.new(getNearestMobs().HumanoidRootPart.CFrame.p + Vector3.new(0, 5, 0))}
            )
            Tween:Play()
        end
    )
end
end)
spawn(
    function()
        while Settings.AutoFarm do
            wait(1)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 49, false, uwu)
            wait(0.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 50, false, uwu)
            wait(0.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 51, false, uwu)
            wait(0.5)
            game:GetService("VirtualInputManager"):SendKeyEvent(true, 52, false, uwu)
            wait(0.5)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, 101, false, uwu)
            wait(0.5)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, 114, false, uwu)
            wait(0.5)
        end
    end
)

end)
end)
local Button1 = Section2:CreateButton("Anti Lag", function()
for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end)
local Button1 = Section2:CreateButton("ServerHop", function()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end)
local Button1 = Section2:CreateButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) end)





local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("กูเป็นพระเจ้า ละเป็นพ่อมึงด้วย")
local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)


spawn(function()
while wait() do
Save()
end end)
