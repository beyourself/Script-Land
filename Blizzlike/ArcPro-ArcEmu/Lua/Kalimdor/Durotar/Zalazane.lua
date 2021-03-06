--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Zalazane_OnCombat(Unit, Event)
	Unit:RegisterEvent("Zalazane_Shrink", 6000, 0)
	Unit:RegisterEvent("Zalazane_HealingWave", 12000, 0)
end

function Zalazane_Shrink(Unit, Event) 
	Unit:FullCastSpellOnTarget(7289, Unit:GetMainTank()) 
end

function Zalazane_HealingWave(Unit, Event) 
	Unit:CastSpell(332) 
end

function Zalazane_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Zalazane_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3205, 1, "Zalazane_OnCombat")
RegisterUnitEvent(3205, 2, "Zalazane_OnLeaveCombat")
RegisterUnitEvent(3205, 4, "Zalazane_OnDied")