    BLINDSIDE.Blind({
        key = 'tax',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 11},
        config = {
            extra = {
                value = 30,
                stubborn = true,
            }},
        hues = {"Yellow"},
        curse = true,
        credit = {
            art = "Gud",
            code = "base4",
            concept = "base4"
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = -math.floor(math.max(G.GAME.dollars - 20, 0)/2)
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_stubborn', set = 'Other'}
            return {
                vars = {
                    math.floor(math.max(G.GAME.dollars - 20, 0)/2)
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
