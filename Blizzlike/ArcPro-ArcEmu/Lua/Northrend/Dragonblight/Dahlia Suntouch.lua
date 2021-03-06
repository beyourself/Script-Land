--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DahliaSuntouch_OnCombat(Unit, Event)
	Unit:RegisterEvent("DahliaSuntouch_BansheeCurse", 4000, 1)
	Unit:RegisterEvent("DahliaSuntouch_BansheeScreech", 6000, 1)
	Unit:RegisterEvent("DahliaSuntouch_BansheeWail", 7000, 0)
end

function DahliaSuntouch_BansheeCurse(Unit, Event) 
	Unit:FullCastSpellOnTarget(51899, Unit:GetMainTank()) 
end

function DahliaSuntouch_BansheeScreech(Unit, Event) 
	Unit:FullCastSpellOnTarget(51897, Unit:GetMainTank()) 
end

function DahliaSuntouch_BansheeWail(Unit, Event) 
	Unit:FullCastSpellOnTarget(28993, Unit:GetMainTank()) 
end

function DahliaSuntouch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DahliaSuntouch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27680, 1, "DahliaSuntouch_OnCombat")
RegisterUnitEvent(27680, 2, "DahliaSuntouch_OnLeaveCombat")
RegisterUnitEvent(27680, 4, "DahliaSuntouch_OnDied")