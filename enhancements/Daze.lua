    BLINDSIDE.Blind({
        key = 'daze',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 10},
        config = {
            extra = {
                value = 30,
                jokerxchips = 1.2,
                stubborn = true,
            }},
        hues = {"Purple"},
        curse = true,
        credit = {
            art = "Gappie",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                BLINDSIDE.chipsmodify(0, 0, 0, card.ability.extra.jokerxchips)
                return {
                    message = "X" .. card.ability.extra.jokerxchips .. " JChips",
                    colour = G.C.L_BLACK
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_stubborn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.jokerxchips
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
