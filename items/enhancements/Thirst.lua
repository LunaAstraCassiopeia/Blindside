    BLINDSIDE.Blind({
        key = 'thirst',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 10},
        config = {
            extra = {
                value = 30,
                xchips = 0.25,
                xchipsup = 1.5,
                stubborn = true
            }},
        hues = {"Blue"},
        curse = true,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_stubborn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.xchips
                }
            }
        end,
        upgrade = function(card)
            if not card.ability.extra.upgraded then
                card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchipsup
                card.ability.extra.upgraded = true
            end
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
