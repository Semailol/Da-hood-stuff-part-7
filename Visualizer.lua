local OriginalKeyUpValue = 0;

function StopAudio()
	game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND'):Stop();
end;

function Stop(i, v)
	local w = coroutine.wrap(function()
		wait(game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').TimeLength-0.1)
		if game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').SoundId == 'rbxassetid://'..i and OriginalKeyUpValue == v then
			StopAudio();
		end;
	end);
	w();
end;

function Play(i, v, w)
	if game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack'):FindFirstChild('[Boombox]') then
		local Tool = nil;
		if game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool') and w == true then
			Tool = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool')
			game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Tool').Parent = game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack');
		end;
		game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack'):FindFirstChild('[Boombox]').Parent = game:GetService('Players').LocalPlayer.Character;
		game:GetService('ReplicatedStorage'):FindFirstChild('MainEvent'):FireServer('Boombox', i);
		game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]').RequiresHandle = false;
		if game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]'):FindFirstChild('Handle') then
			game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]'):FindFirstChild('Handle'):Destroy();
		end
		game:GetService('Players').LocalPlayer.Character:FindFirstChild('[Boombox]').Parent = game:GetService('Players').LocalPlayer:FindFirstChildOfClass('Backpack')
		if game:GetService('Players').LocalPlayer:FindFirstChildOfClass('PlayerGui'):FindFirstChild('MainScreenGui'):FindFirstChild('BoomboxFrame') then
			game:GetService('Players').LocalPlayer:FindFirstChildOfClass('PlayerGui'):FindFirstChild('MainScreenGui'):FindFirstChild('BoomboxFrame').Visible = false;
		end;
		if Tool ~= true then
			if Tool then
				Tool.Parent = game:GetService('Players').LocalPlayer.Character
			end;
		end;
		if v == true then
			game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):WaitForChild('BOOMBOXSOUND');
			local x = coroutine.wrap(function()
				repeat wait() until game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').SoundId == 'rbxassetid://'..i and game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').TimeLength > 0.01
				OriginalKeyUpValue = OriginalKeyUpValue + 1;
				Stop(i, OriginalKeyUpValue);
			end);
			x();
		end;
	end;
end;

local Flossing = Instance.new('Animation', game:GetService('ReplicatedStorage'):WaitForChild('ClientAnimations'))
Flossing.AnimationId = 'rbxassetid://3361276673';
Flossing.Name = 'Flossing';
game:GetService('Players').LocalPlayer.Chatted:Connect(function(v)
	if v:sub(1, 5) == ':play' then
		Play(v:sub(6), false, true);
		if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Animate'):FindFirstChild('idle'):FindFirstChild('Animation2') then
			game:GetService('Players').LocalPlayer.Character:FindFirstChild('Animate'):FindFirstChild('idle'):FindFirstChild('Animation2'):Destroy();
		end;
		game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Anchored = true;
		Floss = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Flossing);
		Floss.Looped = true;
		Floss.Priority = Enum.AnimationPriority.Action;
		Floss:Play();
		Floss:AdjustSpeed(0);
	elseif v == ':stop' then
		StopAudio();
		for _, v in pairs(game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):GetPlayingAnimationTracks()) do
			if (v.Animation.AnimationId:match('rbxassetid://3361276673')) then
				v:Stop();
			end;
		end;
		game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Anchored = false;
	end
end);

game:GetService('RunService').Heartbeat:Connect(function()
	pcall(function()
		game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):WaitForChild('BOOMBOXSOUND');
		Floss:AdjustSpeed(game:GetService('Players').LocalPlayer.Character:FindFirstChild('LowerTorso'):FindFirstChild('BOOMBOXSOUND').PlaybackLoudness / 100);
	end);
end);