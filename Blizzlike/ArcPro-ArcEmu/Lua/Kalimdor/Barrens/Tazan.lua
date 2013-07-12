--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tazan_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tazan_Backhand", 8000, 0)
end

function Tazan_Backhand(Unit, Event) 
	Unit:FullCastSpellOnTarget(6253, Unit:GetMainTank()) 
end

function Tazan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tazan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6494, 1, "Tazan_OnCombat")
RegisterUnitEvent(6494, 2, "Tazan_OnLeaveCombat")
RegisterUnitEvent(6494, 4, "Tazan_OnDied")