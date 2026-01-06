    BLINDSIDE.Blind({
        key = 'sick',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 10},
        config = {
            extra = {
                value = 30,
                jokerxchips = 1.5,
                odds = 2
            }},
        hues = {"Green"},
        curse = true,
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
            if context.cardarea == G.play and context.main_scoring then
                if SMODS.pseudorandom_probability(card, pseudoseed('bld_sick'), 1, card.ability.extra.odds, 'bld_sick') then
                    BLINDSIDE.chipsmodify(0, 0, 0, card.ability.extra.jokerxchips)
                    return {
                        message = "X" .. card.ability.extra.jokerxchips .. " JChips",
                        colour = G.C.L_BLACK
                    }
                else
                    return {
                        message = localize('k_nope_ex')
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            local n,d = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            return {
                vars = {
                    card.ability.extra.jokerxchips,
                    n,
                    d
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
