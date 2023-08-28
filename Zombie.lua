local Animate = game:GetObjects('rbxassetid://3924238625')[1];
game:GetService('Players').LocalPlayer.Character:FindFirstChild('Animate'):ClearAllChildren();
for _, v in pairs(Animate:FindFirstChild('Animate'):GetChildren()) do
    v.Parent = game:GetService('Players').LocalPlayer.Character:FindFirstChild('Animate');
end;
Animate:Destroy();