    BLINDSIDE.Blind({
        key = 'wedge',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 3},
        config = {
            extra = {
                value = 14,
            }},
        hues = {"Green"},
        calculate = function(self, card, context) 
            if context.burn_card and context.cardarea == G.play and context.burn_card == card and not card.ability.extra.upgraded then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
            if not card.ability.extra.upgraded then
                info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            end
            return {
                key = card.ability.extra.upgraded and 'm_bld_wedge_upgraded' or 'm_bld_wedge',
                vars = {
                    card.ability.extra.mult
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
            card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
