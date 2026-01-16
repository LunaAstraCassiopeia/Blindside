    BLINDSIDE.Blind({
        key = 'hunger',
        atlas = 'bld_blindrank',
        pos = {x = 1, y = 9},
        config = {
            extra = {
                value = 30,
                mult = -8,
                multup = 20,
                stubborn = true,
            }},
        hues = {"Red"},
        curse = true,
        credit = {
            art = "AnneBean",
            code = "base4",
            concept = "AnneBean"
        },
        calculate = function(self, card, context)
            if (context.hand_discard or context.hand_retain) and context.other_card == card then
                return { burn = true }
            end
            if context.cardarea == G.hand and context.main_scoring then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            info_queue[#info_queue+1] = {key = 'bld_stubborn', set = 'Other'}
            return {
                vars = {
                    (card.ability.extra.mult > 0 and "+" or "") .. card.ability.extra.mult
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
