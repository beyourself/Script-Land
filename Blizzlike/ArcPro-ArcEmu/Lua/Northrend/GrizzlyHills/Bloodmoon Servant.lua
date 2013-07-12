--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodmoonServant_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodmoonServant_Enrage", 10000, 0)
end

function BloodmoonServant_Enrage(Unit, Event) 
	Unit:CastSpell(32714) 
end

function BloodmoonServant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodmoonServant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(29082, 1, "BloodmoonServant_OnCombat")
RegisterUnitEvent(29082, 2, "BloodmoonServant_OnLeaveCombat")
RegisterUnitEvent(29082, 4, "BloodmoonServant_OnDied")