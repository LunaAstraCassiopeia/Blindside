    BLINDSIDE.Blind({
        key = 'downer',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 11},
        config = {
            extra = {
                value = 30,
                xmult = 0.5,
                mult = 20,
                retain = true
            }},
        hues = {"Purple"},
        curse = true,
        credit = {
            art = "pangaea47",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                if card.ability.extra.upgraded then
                    return {
                        mult = card.ability.extra.mult,
                        xmult = card.ability.extra.xmult
                    }
                else
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                key = card.ability.extra.upgraded and 'm_bld_downer_upgraded' or 'm_bld_downer',
                vars = {
                    card.ability.extra.xmult
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
