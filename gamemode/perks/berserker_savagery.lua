PERK.PrintName = "Savagery"
PERK.Description = "25% increased Blunt damage.\n20% increased maximum health."
PERK.Icon = "materials/perks/savagery.png"

PERK.Hooks = {}
PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "berserker_savagery" then
        ply:SetMaxHealth(ply:GetMaxHealth() * 1.2)
        ply:SetHealth(ply:GetMaxHealth())
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "berserker_savagery" then
        ply:SetMaxHealth(ply:GetMaxHealth() / 1.2)
        ply:SetHealth(ply:GetMaxHealth())
    end
end

PERK.Hooks.Horde_ApplyAdditionalDamage = function (ply, npc, bonus, hitgroup, dmgtype)
    if not ply:Horde_GetPerk("berserker_savagery")  then return end
    if dmgtype == DMG_CLUB then
        bonus.increase = bonus.increase + 0.25
    end
end