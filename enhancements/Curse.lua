    BLINDSIDE.Blind({
        key = 'curse',
        atlas = 'bld_blindrank',
        pos = {x = 0, y = 10},
        config = {
            extra = {
                value = 30,
                joker_mult = 2,
            }},
        hues = {"Faded"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
            if context.cardarea == G.play and context.main_scoring then
                BLINDSIDE.chipsmodify(card.ability.extra.joker_mult, 0, 0)
                return {
                    message = "+" .. card.ability.extra.joker_mult .. " JMult",
                    colour = G.C.BLACK
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.joker_mult
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
