    BLINDSIDE.Blind({
        key = 'flint',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 2},
        config = {
            h_mult = 5,
            p_dollars = 2,
            extra = {
                value = 13,
                mult_gain = 5,
                dollar_gain = 2,
            }},
        hues = {"Yellow"},
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.h_mult, card.ability.p_dollars
                }
            }
        end,
        upgrade = function(card) 
            if not card.ability.extra.upgraded then
            card.ability.p_dollars = card.ability.p_dollars + card.ability.extra.dollar_gain
            card.ability.h_mult = card.ability.h_mult + card.ability.extra.mult_gain
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
