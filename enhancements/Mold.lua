    BLINDSIDE.Blind({
        key = 'mold',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 10},
        config = {
            extra = {
                value = 30,
                jokermult = 2,
                odds = 2,
                retain = true
            }},
        hues = {"Green"},
        curse = true,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.hand and context.main_scoring then
                if SMODS.pseudorandom_probability(card, pseudoseed('bld_sick'), 1, card.ability.extra.odds, 'bld_sick') then
                    BLINDSIDE.chipsmodify(card.ability.extra.jokermult, 0, 0)
                    return {
                        message = "+" .. card.ability.extra.jokermult .. " JMult",
                        colour = G.C.BLACK
                    }
                else
                    return {
                        message = localize('k_nope_ex')
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                vars = {
                    card.ability.extra.jokermult,
                    n,
                    d,
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
