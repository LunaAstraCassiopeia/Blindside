    BLINDSIDE.Blind({
        key = 'downer',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 11},
        config = {
            extra = {
                value = 30,
                xchips = 0.5,
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
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue+1] = {key = 'bld_retain', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.xchips
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
