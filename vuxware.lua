local Humanoid = game.Players.LocalPlayer.Character.Humanoid
game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/vuxware" then
      local Animate = game.Players.LocalPlayer.Character.Animate
      Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
      Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
      Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
      Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
      Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
      Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
      Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
      game.Players.LocalPlayer.Character.Humanoid.Jump = false
                game.Players.LocalPlayer.Character.Head.Transparency = 1
                game.Players.LocalPlayer.Character.Head.Transparency = 1
                for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
                if (v:IsA("Decal")) then
                v.Transparency = 1
                end
                end
                end
            local ply = game.Players.LocalPlayer
            local chr = ply.Character
            chr.RightLowerLeg.MeshId = "902942093"
            chr.RightLowerLeg.Transparency = "1"
            chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
            chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
            chr.RightFoot.MeshId = "902942089"
            chr.RightFoot.Transparency = "1"
            local ant = false
            end
        )
local ant = false
 
function onKeyPress(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.H and gameProcessedEvent == false then
     if ant == false then
         game.Players.LocalPlayer.Character.Humanoid.HipHeight = 1.8
       ant = true
 
     elseif ant == true then
               game.Players.LocalPlayer.Character.Humanoid.HipHeight = 1.9999995231628
       ant = false
     end
   end
end
 
game:GetService("UserInputService").InputBegan:connect(onKeyPress)
game.RunService.RenderStepped:connect(function()
    if ant == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-0.3,0)
        

         game.Players.LocalPlayer.Character.Humanoid:ChangeState("RunningNoPhysics")
else
             game.Players.LocalPlayer.Character.Humanoid:ChangeState(nil)

    end
 
end)