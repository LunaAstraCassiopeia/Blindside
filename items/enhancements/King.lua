    BLINDSIDE.Blind({
        key = 'king',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 9},
        config = {
            extra = {
                value = 30,
                jokerxmult = 1.5,
            }},
        hues = {"Faded"},
        curse = true,
        hidden = true,
        calculate = function(self, card, context)
            if context.cardarea == G.hand and context.main_scoring then
                BLINDSIDE.chipsmodify(0, 0, card.ability.extra.jokerxmult)
                return {
                    message = "X" .. card.ability.extra.jokerxmult .. " JMult",
                    colour = G.C.BLACK
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.jokerxmult,
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
