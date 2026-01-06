    BLINDSIDE.Blind({
        key = 'famous',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 11},
        config = {
            forced_selection = true,
            extra = {
                value = 30,
            }},
        hues = {"Blue"},
        curse = true,
        credit = {
            art = "pangaea47",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if tableContains(card, G.hand.cards) and not tableContains(card, G.hand.highlighted) and #G.hand.highlighted < 5 and G.STATE ~= G.STATES.SMODS_BOOSTER_OPENED then
                card.ability.forced_selection = true
                G.hand:add_to_highlighted(card, true)
            end
        end,
        loc_vars = function(self, info_queue, card)

        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
