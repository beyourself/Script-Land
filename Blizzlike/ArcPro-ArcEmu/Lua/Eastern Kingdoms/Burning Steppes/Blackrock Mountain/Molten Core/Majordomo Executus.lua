--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: LUA++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

math.randomseed(os.time());

function Executus_OnCombat(Unit,event, pMisc)
	setvars(Unit,{Executus = Unit, Executus_Guards = {},DeadGuardCount = 0})
	local door = Unit:GetGameObjectNearestCoords(735.972412,-1177.861572,-119.109833,177000)
	if(door ~= nil) then
		door:SetUInt32Value(GAMEOBJECT_STATE, 0)
		door:SetUInt32Value(GAMEOBJECT_FLAGS,33)
	end
	local tbl = Unit:GetInRangeFriends()
	local args = getvars(Unit)
	for k,v in pairs(tbl) do
		if((v:GetEntry() == 11663) or (v:GetEntry() == 11664)) then
			table.insert(args.Executus_Guards,v)
			v:AttackReaction(pMisc,1,0)
		end
	end
	Unit:RegisterEvent("Executus_AoR", 30000, 1)
	Unit:RegisterEvent("Executus_Teleport", 15000, 1)
	Unit:RegisterEvent("Executus_BlastWave", 10000, 1)
	Unit:RegisterEvent("Executus_Shields", 15000, 1)
	Unit:RegsiterEvent("Executus_SubmitCheck", 5000, 1)
end

function Executus_SubmitCheck(Unit,event)
	local args = getvars(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if(args.DeadGuardCount == 9) then
		Unit:SendChatMessage(16, 0, "Majordomo Executus submits.")
		Unit:SetFaction(plr:GetFaction())
		Unit:Root()
		Unit:SetCombatCapable(1)
		Unit:WipeThreatList()
		Unit:SpawnGameObject(179703,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),18000)
		Unit:Despawn(10000, 0)
	else
		Unit:RegisterEvent("Executus_SubmitCheck", 5000, 1)
	end
end
			
function Executus_OnWipe(Unit)
	Unit:RemoveEvents()
end

function Executus_OnDied(Unit)
	Unit:RemoveEvents()
end

function Executus_AoR(Unit,event)
	Unit:FullCastSpell(20620)
	Unit:RegisterEvent("Executus_AoR",30000, 1)
end

function  Executus_Teleport(Unit,event)
	local plr  = Unit:GetRandomPlayer(0)
	if((plr ~= nil) and (plr:IsAlive() == true)) then
		Unit:FullCastSpellOnTarget(20534,plr)
		plr:Teleport(Unit:GetMapId(),735.972412,-1177.861572,-119.109833)
	end
	Unit:RegisterEvent("Executus_Teleport",15000, 1)
end

function Executus_BlastWave(Unit,event)
	if(Unit:GetInRangePlayersCount() ~= nil) then
		Unit:FullCastSpell(20229)
	end
	Unit:RegisterEvent("Executus_BlastWave", 10000, 1)
end

function Executus_Shields(Unit,event)
	local args = getvars(Unit)
	if(math.random(0,1) > 0.5) then
		for k,v in pairs(args.Executus_Guards) do
			Unit:FullCastSpellOnTarget(20619, v)
		end
	else
		for k,v in pairs(args.Executus_Guards)  do
			v:FullCastSpellOnTarget(21075, v)
		end
	end
	Unit:RegisterEvent("Executus_Shields", 16000, 1)
end

RegisterUnitEvent(12018, 1, "Executus_OnCombat")
RegisterUnitEvent(12018, 2, "Executus_OnWipe")
RegisterUnitEvent(12018, 4, "Executus_OnDied")
RegisterUnitEvent(12018, 21, "Executus_SubmitCheck")

function FlameHealer_OnCombat(Unit,event)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
			Unit:RegisterEvent("FlameHealer_ShadowBolt", math.random(7000, 8000), 1)
			Unit:RegisterEvent("FlameHealer_GreaterHeal", math.random(10000, 12000), 1)
			break
		end
	end
end

function FlameHealer_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function FlameHealer_OnDied(Unit,event)
	local changed = false;
	Unit:RemoveEvents()
	local args = getvars(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
		for k,v in pairs(args.Executus_Guards) do
				if (v == Unit) then
					table.remove(args.Executus_Guards, k)
					changed = true;
				end
			end
		end
	end
	if(changed == true) then 
		setvars(Unit,args); 
	end
end

function FlameHealer_ShadowBolt(Unit,event)
	if(Unit:GetRandomPlayer(0) ~= nil) and (Unit:GetRandomPlayer(0):IsAlive() == true) then
		Unit:StopMovement(500)
		Unit:FullCastSpellOnTarget(21077, Unit:GetRandomPlayer(0))
	end
	Unit:RegisterEvent("FlameHealer_ShadowBolt",  math.random(7000, 8000), 1)
end

function FlameHealer_GreaterHeal(Unit,event)
	local args = getvars(Unit)
	if(args.Executus_Guards ~= nil) then
		local tblend = table.getn(args.Executus_Guards)
		Unit:StopMovement(2500)
		Unit:FullCastSpellOnTarget(29564, args.Executus_Guards[math.random(1, tblend)])
	end
	Unit:RegisterEvent("FlameHealer_GreaterHeal", math.random(10000, 12000), 1)
end

RegisterUnitEvent(11663, 1, "FlameHealer_OnCombat")
RegisterUnitEvent(11663, 2, "FlameHealer_OnWipe")
RegisterUnitEvent(11663, 4, "FlameHealer_OnDied")

function FlameElite_OnCombat(Unit,event)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
			Unit:RegisterEvent("ExecutusFlameElite_Spells", 10000, 0)
			break
		end
	end
end

function FlameElite_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function FlameElite_OnDead(Unit,event)
	local changed = false;
	Unit:RemoveEvents()
	local args = getvars(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
			for k,v in pairs(args.Executus_Guards) do
				if(v == Unit) then
					table.remove(args.Executus_Guards,k)
					changed = true;
				end
			end
		end
	end
	if(changed == true) then 
		setvars(Unit,args); 
	end
end

function ExecutusFlameElite_Spells(Unit,event)
	if((Unit:GetRandomPlayer(0) ~= nil) and (Unit:GetRandomPlayer(0):IsAlive() == true)) then
		if(math.random(0,1) > 0.5) then
			Unit:FullCastSpellOnTarget(20623, Unit:GetRandomPlayer(0))
		else
			Unit:FullCastSpell(20229)
		end
	end
end

RegisterUnitEvent(11664, 1, "FlameElite_OnCombat")
RegisterUnitEvent(11664, 2, "FlameElite_OnWipe")
RegisterUnitEvent(11664, 4, "FlameElite_OnDead")